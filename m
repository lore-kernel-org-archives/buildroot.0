From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2013 23:24:47 +0100
Subject: [Buildroot] [git commit] Makefile: fix out-of-tree builds with
	multiple targets with 'all'
Message-ID: <20131106222810.7559D9BAF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=971faf828d8d243141b7a689a787f335864e37c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For out-of-tree builds, this use-case fails to build:
    $ make clean all

This is because 'all' is filtered-out in the Makefile wrapper, since
the wrapper itself has a 'all' target.

The 'all' target is just the usual naming for the default target in a
Makefile. In fact, the first target is the default one, so we can name
it whatever we want.

Rename the Makefile wrapper 'all' target to avoid name-clashing.

Fixes #6644.

Reported-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/mkmakefile |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
index cef2ec7..27b1507 100755
--- a/support/scripts/mkmakefile
+++ b/support/scripts/mkmakefile
@@ -32,16 +32,16 @@ MAKEFLAGS += --no-print-directory
 
 .PHONY: all \$(MAKECMDGOALS)
 
-all	:= \$(filter-out all Makefile,\$(MAKECMDGOALS))
+all	:= \$(filter-out Makefile,\$(MAKECMDGOALS))
 
-all:
+_all:
 	\$(MAKE) \$(MAKEARGS) \$(all)
 
 Makefile:;
 
-\$(all): all
+\$(all): _all
 	@:
 
-%/: all
+%/: _all
 	@:
 EOF
