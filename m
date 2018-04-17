From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 17 Apr 2018 01:38:41 -0300
Subject: [Buildroot] [PATCH] autobuild-run: remove only tarballs from
 download dir
References: <20180416180925.464f3435@windsurf.numericable.fr>
Message-ID: <5ad57a51cb61f_2e472aff481fbc845706f@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Apr 16, 2018 at 01:09 PM, Thomas Petazzoni wrote:

>>      def find_files(root):
>>          for r, d, f in os.walk(root):
>> +            if '.git' in d:
>> +                d[:] = list()
> 
> Python question: is there any advantage in doing d[:] = list() instead
> of just d = list() ?

os.walk returns a mutable object, so d acts similar to a pointer in C language.
See this:
>>> a=[1,2]
>>> b=a
>>> a=list()
>>> a.append(3)
>>> print(a,b)
([3], [1, 2])
>>> a=[1,2]
>>> b=a
>>> a[:]=list()
>>> a.append(3)
>>> print(a,b)
([3], [3])
If we do just d = list() we are not changing the pointer that os.walk will use
in the next iteration. In the end, nothing is excluded from the search.

> Also, do we need to actually set d to the empty list ? We're anyway
> doing a continue, and skipping over to the next iteration, where a new
> value of d will be returned by os.walk(). Am I missing something ?

Yes, we need to set it to an empty list. When we detect there is a subdir .git,
os.walk is already iterating inside the dl/<package>/git directory. d contains
the list of all immediate subdirs: .git and any subdir that is checked out in
the git worktree. The next iteration of os.walk will pick up the list of subdirs
and continue. So in the end, just using 'continue' would exclude only the files
immediately inside the dl/<package>/git but not subdirs and their files nor the
.git tree. When we set the list of subdirs to empty is the same as removing all
elements one by one, but we don't have 'd.remove(all)'.
The closest valid syntax is:
del d[:]

Rethinking now, this use with 'del' is the most correct one.
d[:] = list() creates a new object of the type list and makes the pointer that
os.walk uses as subdirs to point to this new object. The old object is dangling,
nothing points to it anymore and it will hopefully be removed at some point by
the interpreter (I don't know the internals of the garbage collector).
del d[:] does not create a new object, but actually removes all elements from
the list object that already exists.

> 
> I think I'm also missing how this will prevent from iterating in
> sub-directories, like git/<something>/foo/. I guess I need to read
> again how os.walk() is working exactly.

Me too! Notice it mentions 'using del'.
"When topdown is True, the caller can modify the dirnames list in-place (perhaps
using del or slice assignment), and walk() will only recurse into the
subdirectories whose names remain in dirnames; this can be used to prune the
search"

So I will resend after changing to 'del' and adding a comment to the code or
commit log to clarify why we check for '.git' instead of 'git'.

Regards,
Ricardo
