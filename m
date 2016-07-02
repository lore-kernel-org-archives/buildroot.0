From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Jul 2016 19:08:04 +0200
Subject: [Buildroot] [PATCH 2/4 v3] support/download/git: do not use git
	archive, handle it manually
In-Reply-To: <dabe52d4bc6a665abc37b40cfd2585ba759d0e45.1467363623.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 1 Jul 2016 11:01:17 +0200")
References: <cover.1467363623.git.yann.morin.1998@free.fr>
 <dabe52d4bc6a665abc37b40cfd2585ba759d0e45.1467363623.git.yann.morin.1998@free.fr>
Message-ID: <878txk55or.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We currently use git-archive to generate the tarball. This is all handy
 > and dandy, but git-archive does not support submodules. In the follow-up
 > patch, we're going to handle submodules, so we would not be able to use
 > git-archive.

 > Instead, we manually generate the archive:
 >   - extract the tree to the requested cset,
 >   - get the date of the commit to store in the archive,
 >   - store only numeric owners,
 >   - store owner and group as 0 (zero, although any arbitrary value would
 >     have been fine, as long as it's a constant),
 >   - sort the files to store in the archive.

 > We also get rid of the .git directory, because there is no reason to
 > keep it in the context of Buildroot. Some people would love to keep it
 > so as to speed up later downloads when updating a package, but that is
 > not really doable. For example:
 >   - use current Buildroot
 >   - it would need foo-12345, so do a clone and keep the .git in the
 >     generated tarball
 >   - update Buildroot
 >   - it would need foo-98765
 > For that second clone, how could we know we would have to first extract
 > foo-12345 ? So, the .git in the archive is pretty much useless for
 > Buildroot.

I've wondered if it wouldn't have been simpler to keep git archive and
then just append the git-archive output of the individual submodules
(like we do for the generated documentation in make release) with git
submodule foreach, E.G:

https://ttboj.wordpress.com/2015/07/23/git-archive-with-submodules-and-tar-magic/

Something like:

git archive --prefix=foo/ ... > $TAR
git submodule foreach --recursive \
    'git archive --prefix=foo/$path/ $sha1 > $TAR.tmp && tar Af $TAR $TAR.tmp'
rm $TAR.tmp

But we can do that later if needed.

-- 
Bye, Peter Korsgaard
