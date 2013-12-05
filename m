From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Dec 2013 20:11:08 +0100
Subject: [Buildroot] [PATCHv7 0/5] Keeping customizations outside the
	Buildroot tree with BR2_EXTERNAL
Message-ID: <1386270673-16051-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the seventh version of the BR2_EXTERNAL patch series. Its main
purpose is to take into account the feedback received recently on the
list.

People interested in testing this can find a branch at
http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=things-outside-br-v7.

Changes since v6
================

 * Various documentation improvements suggested by Ryan Barnett.

 * Added various tags offered by Ryan or Yann.

Changes since v5
================

 * Fix some typos in the documentation, noticed by Yann E. Morin.

 * Split the manual generation fixes patch into two patches: one
   changing the regexp, now first in the series, and another one
   passing BR2_EXTERNAL, squashed with the core infrastructure.

Changes since v4
================

 * Include Arnout implementation of PATCH 1 (core infrastructure),
   which is indeed much simpler.

 * Add a dummy external.mk in support/dummy-external, which allows to
   remove the BR2_EXTERNAL_USED variable entirely.

 * Fix various typos in the documentation, reported by Yann and
   Arnout.

 * Integrate the new version of PATCH 5 (manual generation fixes),
   which includes a lot more details.

 * Fix the "make help" text according to Yann's suggestions.

Changes since v3
================

 * Fix the issue reported by Yann, where not having a
   output/.br-external file would make the build fail completely. I've
   fixed it in a slightly different way than the patch posted by Yann,
   though.

 * Revert back to the idea used in v2: include only a top-level
   BR2_EXTERNAL/Config.in file and a top-level
   BR2_EXTERNAL/external.mk. This way, the user of BR2_EXTERNAL is
   free to use it for target packages, host packages, bootloaders, and
   more. People have raised concern that enforcing the inclusion of
   BR2_EXTERNAL/package/Config.in was problematic, because they also
   wanted to add host tools in BR2_EXTERNAL/package/Config.in, and so
   on. So since people have differerent use cases, let's give some
   more flexibility.

Changes since v2
================

 * Remove the mechanism that was storing the BR2_EXTERNAL value in the
   external wrapper.

 * Add logic that stores the BR2_EXTERNAL value in a file called
   $(O)/.br-external. Whenever the user passes a BR2_EXTERNAL=<value>,
   it gets stored in this file, and Buildroot re-uses for all
   subsequent make invocations. The user can later override it again
   by passing another BR2_EXTERNAL=<value>. He can also remove it
   entirely by passing just BR2_EXTERNAL= (empty value).

 * Enforce usage of a package/ directory in the BR2_EXTERNAL
   directory. Buildroot only includes $(BR2_EXTERNAL)/Config.in and
   shows it under the "Target packages" menu, and Buildroot will only
   include $(BR2_EXTERNAL)/package/*/*.mk.

 * Clearly separate the Buildroot built-in defconfigs from the
   user-defined external defconfigs in the 'make help' output.

 * Include a fix for building the documentation, provided by Samuel
   Martin.

 * Update the documentation accordingly.

Changes since v1
================

 * Store BR2_EXTERNAL in the Makefile generated in the output
   directory, so that BR2_EXTERNAL doesn't have to be passed over and
   over again. Suggested by Ryan Barnett.

 * Patch set splitted in more fine-grained changes, as suggested by
   Arnout.

 * Instead of having the top-level Config.in file generated at
   run-time, use instead a trick proposed by Arnout: make BR2_EXTERNAL
   point to support/dummy-external/, which contains an empty
   Config.in. This way, regardless of whether BR2_EXTERNAL is
   specified by the user or not, kconfig is happy as 'source
   "$BR2_EXTERNAL/Config.in"' will always point to an existing
   file. If BR2_EXTERNAL is not used, it will point to the dummy file,
   if BR2_EXTERNAL is used, it will point to Config.in file in the
   provided BR2_EXTERNAL directory.

   With this, BR2_EXTERNAL always has a value, so testing whether
   BR2_EXTERNAL is empty no longer tells us if the user has provided a
   value or not. Therefore, we have another variable,
   BR2_EXTERNAL_USED, which tells if the mechanism is used by the user
   or not. This variable avoids trying to use defconfigs from the
   dummy directory, or to encode the BR2_EXTERNAL value in the
   Makefile wrapper.

 * As a consequence of the previous change, it is no longer needed to
   refactor the *config dependencies using a variable, so I've dropped
   what was previously the first patch of the series.

 * BR2_EXTERNAL is turned into an absolute path, in order to avoid any
   problem. Suggested by Arnout.

 * Fixed the usage of <some board> vs. <boardname> in the
   documentation, as noted by Arnout.

Thomas

Samuel Martin (1):
  manual: fix manual generation in preparation for BR2_EXTERNAL support

Thomas Petazzoni (4):
  core: introduce the BR2_EXTERNAL variable
  core: allow external Config.in/makefile code to be integrated
  core: allow external defconfigs to be used
  docs/manual: add explanations about BR2_EXTERNAL

 Config.in                            |   6 ++
 Makefile                             |  39 +++++++++-
 docs/manual/customize-outside-br.txt | 138 +++++++++++++++++++++++++++++++++++
 docs/manual/customize.txt            |   2 +
 docs/manual/manual.mk                |   3 +
 support/dummy-external/Config.in     |   0
 support/dummy-external/external.mk   |   0
 support/scripts/kconfiglib.py        |   2 +-
 8 files changed, 188 insertions(+), 2 deletions(-)
 create mode 100644 docs/manual/customize-outside-br.txt
 create mode 100644 support/dummy-external/Config.in
 create mode 100644 support/dummy-external/external.mk

-- 
1.8.1.2
