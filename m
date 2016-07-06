From: Ben Boeckel <mathstuf@gmail.com>
Date: Wed, 6 Jul 2016 01:04:28 +0000 (UTC)
Subject: [Buildroot] [PATCH 2/4 v3] support/download/git: do not use git
 archive, handle it manually
References: <cover.1467363623.git.yann.morin.1998@free.fr>
 <dabe52d4bc6a665abc37b40cfd2585ba759d0e45.1467363623.git.yann.morin.1998@free.fr>
 <878txk55or.fsf@dell.be.48ers.dk>
Message-ID: <nlhleq$thi$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 02 Jul, 2016 at 17:08:04 GMT, Peter Korsgaard wrote:
> I've wondered if it wouldn't have been simpler to keep git archive and
> then just append the git-archive output of the individual submodules
> (like we do for the generated documentation in make release) with git
> submodule foreach, E.G:
>
> https://ttboj.wordpress.com/2015/07/23/git-archive-with-submodules-and-tar-magic/
>
> Something like:
>
> git archive --prefix=foo/ ... > $TAR
> git submodule foreach --recursive \
>     'git archive --prefix=foo/$path/ $sha1 > $TAR.tmp && tar Af $TAR $TAR.tmp'
> rm $TAR.tmp
>
> But we can do that later if needed.

Here's another approach:

    https://gitlab.kitware.com/paraview/paraview/blob/master/Utilities/Maintenance/create_tarballs.bash#L176

You set up a custom index file and then use `read-tree -i` to read in
the submodules. IMO, using `git archive` should be a requirement because
of export-subst attributes which cause `$Format:$` bits to be replaced
in the archived files.

--Ben
