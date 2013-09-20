From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 20 Sep 2013 22:09:48 +0200
Subject: [Buildroot] Mercurial and patch submission.
In-Reply-To: <20130920075715.GB3423@trismegisto.universo>
References: <20130920075715.GB3423@trismegisto.universo>
Message-ID: <CAAXf6LVDTOr4hPkw72ipaec2aCqAWhx85MC_eTv5irwBNVJw2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(Adding the buildroot mailing list: maybe this info is useful for others)

Hi Ra?l,

On Fri, Sep 20, 2013 at 9:57 AM, Ra?l S?nchez <rasasi78@gmail.com> wrote:
> Hello thomas:
>
> My name is Ra?l, and I'm subscribed to the buildroot mailing list, which I
> follow and is a project I'm interested in.

Great to hear!

>
> I happen to see that you were sending patches using mercurial-patchbomb
> extension. I'm a heavy mercurial user and reluctant to use git. I'm
simply more
> comfortable with mercurial. For git repositories I use hg-git extension.
>
> Provided that mail agent of yours I wonder if you were actually
interacting
> with git-repositoried-projects using mercurial. If my assumptions are
correct
> and you don't mind I dare to explain my current approach and ask you some
> doubts. If I'm wrong feel free to skip the rest of the email and please
accept
> my apologies for the confussion.

You are correct, I am using Mercurial for my developments, even for those
projects where git is used upstream.

>
> My hg-git approach:
>
> I enable the hg-git extension, then I clone the git repository. I use
hg-git
> intree setting in case I want to use git. Without an explicit git working
copy,
> git has some limitations, but still, intree is a "just in case" measure.
>
> I only use mercurial to explore, analyze or eventually commit in the
> repository. When I want to submit a patch, here comes the fun. I commit
using
> mercurial, but then I have to gexport so git is aware of the change. I
then use
> git format-patch with some arguments which I can share with you if you are
> interested.

Here is what I do: I clone the upstream repository with git, for example in
repo 'buildroot'. I then clone that git repo to a mercurial repo using
hg-git: hg clone buildroot buildroot-hg. In neither of these repositories I
do actual development. If I am going to work on some feature or
improvement, I clone buildroot-hg to a new repo, say buildroot-foo and make
changes there.
Instead of actual commits, I am using the Mercurial MQ extension to keep a
stack of patches, similar to git quilt.

When I want to rebase my changes to a newer upstream version, I do:
in buildroot: git pull
in buildroot-hg: hg pull (from buildroot)
in buildroot-foo: hg qpop -a (to pop all patches) and then hg pull -u (from
buildroot-hg), then hg qpush -a (push all patches back).

The advantage of an untouched buildroot-hg repository is that the
conversion from git to hg only happens once. I noticed that this can be
quite slow, especially if you start from scratch, so this is why I do not
clone my development repos directly from the git one (buildroot).

I am not using intree (I hadn't heard of it before), but I don't think I
need it with the above approach.

>
> I did some tests with patchbomb extension but they were not satisfying
enough.
> The main problem was creating (automatically) the Signed-off-By line. Do
you
> have a solution or tip for this?

As you noticed from the mail headers, I'm indeed using patchbomb. My basic
command line (example: v2 of patches) is:

hg email --plain -o --flag v2 -t buildroot at busybox.net -c "some people in
CC" -s "subject"

(o=outgoing, compared to buildroot-hg)

Before I send patches, I manually make sure to add the Signed-off-by line,
I don't know a better way. This means that the signed-off-by is actually
part of my commit message. The same for the diffstat, which is normally
added by git. I know that 'hg email' has a --diffstat option, but the last
time I checked it did not format it the same way as git does. Instead, I
generate it manually using 'hg diff --stat -c .'

I'm using vim as editor, and I have the following shortcuts for adding
signed-off-by and the diffstat:
- For signed-off-by, I'm using the 'xptemplate' plugin. It allows to define
some templates: you type a short token, and with one keystroke it expands
to the full defined one, kind of like a macro. For example the token 'once'
expands into the standard stuff you put in a C header file (#ifndef FOO\
#define FOO ... #endif). In a similar way, I created a simple template that
expands the token 'sob' in my Signed-off-by line. This means I just type
'sob' in the commit message, followed by Ctrl-\ and it's done :)

- For diffstat, there is a nice feature in vim where you can execute shell
commands, capture the output, and directly put it in the document (you can
also use contents of the document and pipe it into shell commands, using
'write'). For example, to get the diffstat, I do (vim command line)
:r! hg diff --stat -c .
(r is short for read)

I also use this same thing to get the last commit message or last e-mail
sometimes:
:r! cat .hg/last-email.txt

>
> I would also be happy to hear about your workflow. If you gained some
> shortcuts with experience or found some good feature you think it's
worthwhile
> to share I'm all eyes. ;)

I think I mentioned most things above.
One other thing I find useful: to review patches of others, I directly
import these patches from patchwork into an MQ patch, using
hg qimport http://patchwork.ozlabs.org/patch/276237/mbox/

maybe 'hg import' allows the same if you do not want to use MQ.

I also recently described my workflow in general, here:
http://lists.busybox.net/pipermail/buildroot/2013-September/078038.html
It may be useful to you too.

Hope this helps,

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130920/632f7025/attachment.html>
