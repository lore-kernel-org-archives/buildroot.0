From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Jul 2016 18:42:19 +0200
Subject: [Buildroot] [PATCH 1/4 v3] support/download/git: do not use
	bare clones
In-Reply-To: <da17e97529b50cc248af7cebae706909eac19532.1467363623.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 1 Jul 2016 11:01:16 +0200")
References: <cover.1467363623.git.yann.morin.1998@free.fr>
 <da17e97529b50cc248af7cebae706909eac19532.1467363623.git.yann.morin.1998@free.fr>
Message-ID: <87d1mw56vo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, we are using bare clones, so as to minimise the disk usage,
 > most notably for largeish repositories such as the one for the Linux
 > kernel, which can go beyond the 1GiB barrier.

 > However, this precludes updating (and thus using) the submodules, if
 > any, of the repositories, as a working copy is required to use
 > submodules (becaue we need to know the list of submodules, where to find
 > them, where to clone them, what cset to checkout, and all those is
 > dependent upon the checked out cset of the father repository).

 > Switch to using /plain/ clones with a working copy.

 > This means that the extra refs used by some forges (like pull-requests
 > for Github, or changes for gerrit...) are no longer fetched as part of
 > the clone, because git does not offer to do a mirror clone when there is
 > a working copy.

 > Instead, we have to fetch those special refs by hand. Since there is no
 > easy solution to know whether the cset the user asked for is such a
 > special ref or not, we just try to always fetch the cset requested by
 > the user; if this fails, we assume that this is not a special ref (most
 > probably, it is a sha1) and we defer the check to the archive creation,
 > which would fail if the requested cset is missing anyway.

FYI, I did a try with:

git clone -c remote.origin.fetch='+refs/*:refs/*' <url> to be able to do
this in one go, but it doesn't work. git clone still only fetches
refs/heads and you need to run a git pull afterwards, so it doesn't
really buy us much.

We could in theory do git init + git fetch instead of git clone, but
that doesn't look any simpler than what you propose here.

As sub modules are quite rare and we know when they are requested (using
foo_GIT_SUBMODULES), we COULD keep the existing code path around for
"normal" repos, but that would mean we would need separate code paths
for the clone/archive steps for the two variants, so that is probably
not worth it.

Committed, thanks.

-- 
Bye, Peter Korsgaard
