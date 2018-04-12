From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 23:32:32 +0200
Subject: [Buildroot] [git commit] Makefile: take default SOURCE_DATE_EPOCH
 from repo containing Makefile
Message-ID: <20180412213249.53DEF885B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49395dc0e5cc5642670d583b9269a3f92943756d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For reproducible builds, SOURCE_DATE_EPOCH will be set to the git commit
date if it is not defined in the environment, but this was done by
explicitly using $(TOPDIR)/.git as the git repository, which would not
give the expected result if Buildroot had been put into a subdirectory
of another repository.

This commit removes that restriction, meaning that the default date will
now be the date of the git commit that contains Makefile, regardless of
what level above Makefile the repository is at. This works because the
current directory when the 'git log' command is executed will always be
the directory containing Makefile (it must be, since TOPDIR is set from
CURDIR).

In general this should be a sensible default, and in cases where a
different date is required SOURCE_DATE_EPOCH can be defined in the
environment before invoking make.

Signed-off-by: James Byrne <james.byrne@origamienergy.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index cd533624ec..3b846b997a 100644
--- a/Makefile
+++ b/Makefile
@@ -506,7 +506,7 @@ ifeq ($(BR2_REPRODUCIBLE),y)
 # If SOURCE_DATE_EPOCH has not been set then use the commit date, or the last
 # release date if the source tree is not within a Git repository.
 # See: https://reproducible-builds.org/specs/source-date-epoch/
-BR2_VERSION_GIT_EPOCH := $(shell $(GIT) --git-dir=$(TOPDIR)/.git log -1 --format=%at 2> /dev/null)
+BR2_VERSION_GIT_EPOCH := $(shell $(GIT) log -1 --format=%at 2> /dev/null)
 export SOURCE_DATE_EPOCH ?= $(or $(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
 endif
 
