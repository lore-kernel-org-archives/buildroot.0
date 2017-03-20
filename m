From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 19 Mar 2017 23:27:16 -0300
Subject: [Buildroot] [PATCH v2 1/4] support/download/git: do not use git
 clone
References: <a52a04a3-2290-ea7c-1194-c863f03926e8@mind.be>
Message-ID: <58cf3e0413a93_50f13ff1769d7b30298e1@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, Feb 07, 2017 at 02:48 PM, Arnout Vandecappelle wrote:

> On 02-12-16 16:21, Ricardo Martincoski wrote:
[snip]
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  I tested getting hashes from a few different hard-to-reach branches, and it
> works very well (with the full series applied), using shallow clones wherever
> possible and falling back on full mirror when necessary.
> 
> [snip]
>> +if [ ${git_done} -eq 0 ]; then
>> +    printf "Doing mirror fetch\n"
>> +    # Fetch all refs, including special refs. The same as git clone --mirror.
>> +    _git fetch -u ${verbose} "${@}" ${unshallow} "'${repo}'" "'+refs/*:refs/*'"
>> +    _git checkout -q "'${cset}'"
>>  fi
> 
>  This bit is the only one which is still a little bit controversial. It really
> should never be needed for any sane situation. Still, it feels safer to have
> such a fallback so I'd keep it. The only disadvantage is that in case that a ref
> really can't be fetched, it will take a long time before we discover that.

The only cases (that I think of) that fallback to this code are corner cases
with special refs: partial sha1, ref changed after ls-remote, ...
So I will remove it and resend, and I will mark the series as Change Requested.

While at it I will make 2 more changes:
1) merge the DEVELOPERS entry into this patch;
2) fix the support to submodules that use relative path;

I am developing the automated tests for git download using the test infra.
I noticed that downloading submodules from repos that do not use absolute url
inside .gitmodules fails.
The package sunxi-mali uses absolute url inside .gitmodules, so it downloads
fine.

Since a change in this patch is only needed when using submodules I want to use
this diff:
(a)
 # There might be submodules, so fetch them.
 if [ ${recurse} -eq 1 ]; then
+    # When .gitmodules contains relative paths, git submodule needs a remote
+    # named origin to generate the correct urls
+    _git remote add origin "'${repo}'"
     _git submodule update --init --recursive
 fi
Yes, I tested and it seems to need to be named origin.

But there are other solutions:

(b) register the remote using the same command from (a) just after git init, as
Brandon suggested in http://patchwork.ozlabs.org/patch/681841/ . All other
"'${repo}'" can be changed to origin.

(c) use something like 'git config' to manually set the url for the submodules.
I did not yet researched enough about this option.

What do you think about item 2?

Also, since I am unsure, let me ask: should I carry or remove you acked-by on
this patch?

Thank you,
Ricardo
