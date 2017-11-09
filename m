From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Nov 2017 16:17:32 +0100
Subject: [Buildroot] Multi-branch support in the autobuilders
Message-ID: <20171109161732.4f37b03b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Signs of this have shown up since a few days on
autobuild.buildroot.org, and then this morning in the daily e-mail, but
since the implementation seems to now be complete, here is an
announcement.

The autobuilder infrastructure is now capable of testing multiple
Buildroot branches, so that we can test master, a maintenance branch,
the next branch, and more.

A very simple CSV file hosted at
http://autobuild.buildroot.net/branches defines the branches to be
tested, as well as some "weight". The current file contains:

master,10
next,4
2017.08.x,1

This means that out of 15 builds, statistically, we should have 10
builds done on master, 4 builds done on next, and one build done on
2017.08.x.

This file is downloaded by the autobuilder instances (in the
autobuild-run script) every time they start a build, to decide which
branch should be used for the next build.

In terms of visualization/reporting:

 - http://autobuild.buildroot.org/ shows all the branches

 - http://autobuild.buildroot.org/?branch=<branch> allows to filter the
   results for just one branch

 - http://autobuild.buildroot.org/stats.php shows the result of just
   one branch (master by default), and one can select a different
   branch. The graph of the build results over time is also updated on
   a per branch basis.

 - The e-mail sent every day to the mailing list has been updated to
   report results from all branches. A first table shows in a very
   synthetic way the result for all branches. And then, with one
   section per branch, the failures are detailed. Note that if a branch
   has seen no failure the past day, then the section for this branch
   is entirely omitted, since there is no failure to report.

 - The e-mail sent every day to the individual developers based on the
   DEVELOPERS file information has also been updated, and has pretty
   much the same logic: one section per branch, with the failures, and
   the section for a given branch is omitted if there are no failures
   to report.

Note that we are currently not testing the 2017.02.x LTS branch,
because the autobuilder infrastructure now relies on having the
toolchain configurations inside the Buildroot source code, as well as
the utils/genrandconfig script. However, it is definitely possible to
backport this script to the LTS branch, as well as a selection of
toolchain configurations, in which case we could add the 2017.02.x LTS
branch to the overall testing effort.

So:

 - People running autobuilder instances today, please update your
   autobuild-run script.

   Peter: please don't update your autobuild-run script on gcc112 until
   you backport to 2017.08.x all the ppc64le-as-host fixes that have
   been put on master, or we will be flooded by build failures.

 - People who are not yet running an autobuilder instance and have some
   spare CPU cycles, please run an autobuilder instance! Do not
   hesitate to get in touch with me if you need details on the
   requirements or setup.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
