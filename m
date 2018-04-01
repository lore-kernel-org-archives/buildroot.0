From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 07:49:41 +0200
Subject: [Buildroot] Buildroot hackathon day 1 highlights
Message-ID: <20180401074941.7a36ab0a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Our first day of the hackathon yesterday was very productive, with
good progress made on a number of topics. The main highlights are:

 - Maxime Hadjinlian revived his series implementing caching for Git
   downloads, which avoids the need to constantly re-clone from
   scratch Git repositories. His original series from July 2017 had
   already seen a respin by Peter Seiderer, and Maxime has now another
   iteration (version 3). His series starts at
   http://lists.busybox.net/pipermail/buildroot/2018-March/217144.html,
   but unfortunately doesn't have a cover letter.

 - Peter Korsgaard reviewed, tweaked and applied the patch series from
   Yann E. Morin that reworks how the filesystem images are generated.

   Previously, all filesystem images were directly generated from the
   contents of output/target, by running under a fakeroot session some
   finalization steps (fixing permissions and ownerships, creating
   users, etc.) and the tool actually creating the filesystem
   image. This logic had two drawbacks: it was not compatible with
   parallel creation of filesystem images (parallel in the sense of
   top-level parallel build) and it re-ran the finalization steps for
   every filesystem image, even though they are common between all
   filesystem images. Another issue is that some filesystem types do
   specific tweaks, and those tweaks therefore leak into the other
   filesystem images that don't need those tweaks.

   To solve this, Yann's patch series consists in generating in all
   cases, under a fakeroot session, a tarball of the root filesystem,
   in which all the common finalization steps have been done.

   Then, each filesystem format will, under their own fakeroot
   session, extract this tarball in a private location, do their
   custom tweaks, and run their specific tool to create the filesystem
   image.

   This solves the issues mentioned above, but has the downside of
   extracting/re-packing the filesystem for each filesystem image,
   taking a bit more time.

 - Thomas Petazzoni took over Angelo Compagnucci's patch series adding
   the Golang package infrastructure. Thomas did a number of further
   tweaks and improvements to the package infrastructure, further
   reducing the amount of work that remains to be done in each
   package, by making the infrastructure a bit more flexible. The
   patch series was then reposted to the list, reviewed by Yann, and
   finally applied by Arnout Vandecappelle, who did some final
   adjustements.

 - Peter Korsgaard worked on the 2018.02.x maintenance branch,
   backporting a large number of fixes that had been made on the
   master branch.

 - Ricardo Martincoski, participating remotely to the hackathon,
   posted a series that allows check-package to check more
   directories/files, and a large number of associated fixes to remove
   coding style problems in numerous Buildroot source files. Following
   the comments, Ricardo even posted a second iteration of this patch
   series, which will most likely be applied soon.

 - Thomas Petazzoni took over the oldest patch in patchwork, which
   added a <pkg>-show-rrdepends target that recursively displays the
   reverse dependencies of a package. This single patch was turned
   into a 5 patches patch series that reworks the graph-depends
   script, extends it with --quiet and --flat-list options, and
   finally adds <pkg>-show-recursive-depends and
   <pkg>-show-recursive-rdepends targets.

 - And of course, the main part of the hackathon is to look at all the
   patches in patchwork that were sitting there for a while, and
   taking a decision about them. A large number of patches have been
   discussed, and either some comments were made that will require the
   original contributor to rework the patch, or the patch was adjusted
   and applied.

   75 commits have been made, and even though Ricardo added a 36
   patches patch series, the patchwork backlog has reduced from ~350
   patches to 276 patches at the time of this writing.

We have two more days in this Buildroot hackathon, which will allow to
make even further progress on a number of topics.

If you're interested in seeing a picture of the atmosphere of this
hackathon, see our Twitter post at
https://twitter.com/buildrootorg/status/980081463730241536. You can
see that we are working in a very jungle-style atmosphere, in the very
nice environment kindly sponsored by La Maison from Scaleway
(https://careers.scaleway.com/la-maison/).

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
