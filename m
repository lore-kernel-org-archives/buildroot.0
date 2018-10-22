From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Oct 2018 23:11:59 +0100
Subject: [Buildroot] [PATCH 2/5] download/git: re-run the backend with a
 lock to the git tree
In-Reply-To: <20181022211231.GA3164@scaer>
References: <cover.1534972250.git.yann.morin.1998@free.fr>
 <b5a3123305e1d4cef3cbdb17985e73161d13f407.1534972250.git.yann.morin.1998@free.fr>
 <20180910225228.56cdb555@windsurf> <20181014125415.GG31509@scaer>
 <a1e6c685-bd6d-0de0-faaf-523b2f650ce7@mind.be> <20181022211231.GA3164@scaer>
Message-ID: <20ee9f59-5ce3-f2be-e2fc-91b6f24ddede@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/22/18 10:12 PM, Yann E. MORIN wrote:
> On 2018-10-20 23:11 +0100, Arnout Vandecappelle spake thusly:
> [--SNIP--]
>>  So, my proposal would be:
> 
> As we discussed IRL, this is a good suggestion, but now that it has had
> time to bounce a bit between my two still-working neurons, here are my
> comments on it...
> 
>> 1. Remove the redundant temporary files from the download infra.
> 
>> 2. Replace the flock on the per-package download dir with a flock of a temporary
>> file named ${filename}.lock. That way, we serialize just what needs to be
>> serialized.
> 
> And who would be responsible to remove those lock files?

 Nobody. You don't remove it. It's just one extra inode. It gets cleaned up when
you remove the package download directory, same way that you would clean up old
tarballs.

> When the download runs OK, I can see it pretty easy, even though it is
> not nice... But when the download gets interrupted (think Ctrl-C or
> SIGTERM/SIGKILL from a CI...)?
> 
> I'm afraid we could end up with dozens stale such lock files cluttering
> the (per-package) directory... Locking the per-package directory itself
> was nice and dandy because it was expected to live on and stay.
> 
> I could see an alternative, which would be to lock the final file,
> directly. After all, those lock are just advisory locks; they don't
> actually prevent another process to write in the locked files at all.
> 
> However, that does not work, because then it would be an empty file, so
> would not match its hashes, and the download wrapper would remove it,
> thus freeing a competing build into creating that lock file again while
> the first one is still trying to download it...
> 
> So we need to lock a file other than the destination file, and back to
> square one...
> 
>> 3. Add a git-specific "global" lock, but do it directly from the dl-wrapper to
>> keep the code simple.
> 
> And then, what should be locked?

 Hm, good point. I thought "the git directory of course", but that only gets
created by the git download script and it would be weird to create it in the
dl-wrapper...

> If we lock a (say) 'git.lock' file in the per-package directory, but the

 So yeah, git.lock I guess.

 On second thought, though, I don't find the re-exec-under-lock construct that
ugly. It's a pretty standard way of doing things, similar to e.g.
re-exec-under-sudo. Then we can simply put the lock on the git dir.

 Oh, but then the lock is taken after mkdir -p, which is racy by itself... Not a
big deal, a race will just result in an error message, not exit because the git
download helper doesn't do 'set -e'. Hm, it does 'set -E' instead, is that
really the intention? You changed it from -e to -E in b7efb43e8, but -E is
(AFAIK) meaningless without -e - perhaps you meant to enable both -E and -e?

 But I digress...

 Oh, but now I realize you also need that whole complexity of not removing the
git/ directory but instead removing all files in it, so you actually do keep the
lock on the directory... That bit is actually pretty horrible. So then, a
separate git.lock file would in fact be a whole lot better.

> download is interrupted, the lock file would linger around. Since it is
> only ever the only git-related lock file, that is not too bad. Even if
> we had more per-backend locks, that is still just a few of them, and we
> could make them hidden files (.git.lock).
> 
> If we rely on the fact that the backend would create a directory named
> after itself (e.g. the git backend creates a directory named 'git'),
> then the dl-wrapper could create that directory and handle it over to
> the backend. But then, the backend should never ever remove that
> directory (which we currently do in case the git tree is borked)), or a
> competing download could grab the lock while the first would still be
> attempting the download.>
> So, I am not fond of all those new lock files, which have the potential
> to eventually clutter the download difrectory... :-(

 Bollocks. What about the clutter of all those stamp files we create in the
build directories?

 You probably indeed don't want to see those files, indeed, so put a . in front
of them.

 What I find a *lot* more annoying is that my download directory is cluttered
with files which have been downloaded ages ago and whose version has been bumped
so they never get used anymore. Maybe I should add a tiny script to utils/ that
does the correct 'find -atime +$1 -delete' command. But I really want only files
for which a newer version exists to be deleted. Oh well, different story.


 Regards,
 Arnout


> (Note: I am not saying that the mere presence of lock files would
> prevent future downloads; not at all, as we use flock(2) on them. I'm
> just saying that stale lock files are ugly...)
> 
>> (in terms of patch order, obviously 2 and 3 have to be swapped).
> 
> Regards,
> Yann E. MORIN.
> 
