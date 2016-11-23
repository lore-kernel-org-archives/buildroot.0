From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 22:55:17 +0100
Subject: [Buildroot] [git commit] Makefile: generate SOURCE_DATE_EPOCH for
	reproducible builds
Message-ID: <20161201222139.0F2F17FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9befe94baf990ee6331e77edb40e286e9dc4df8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When reproducibility is requested, generate a global SOURCE_DATE_EPOCH
environment variable which contains either the date of Buildroot last
commit if running from a git repository, or the latest release date.

This means that all packages embedding build dates will appear to
have the same build date, so in case of new commit or release, all
packages will appear to have been changed, even though some of them
may not have changed in fact.

The meaning of SOURCE_DATE_EPOCH is specified by the following
specification:
  https://reproducible-builds.org/specs/source-date-epoch/

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index eff814b..8acbe58 100644
--- a/Makefile
+++ b/Makefile
@@ -87,6 +87,8 @@ all:
 
 # Set and export the version string
 export BR2_VERSION := 2016.11-rc1
+# Actual time the release is cut (for reproducible builds)
+BR2_VERSION_EPOCH = 1478206447
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
@@ -249,6 +251,8 @@ ifeq ($(BR2_REPRODUCIBLE),y)
 export TZ=UTC
 export LANG=C
 export LC_ALL=C
+BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
+export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
 endif
 
 # To put more focus on warnings, be less verbose as default
