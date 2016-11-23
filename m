From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 13:58:40 +0100
Subject: [Buildroot] [PATCH v4 01/18] reproducibility: generate
	SOURCE_DATE_EPOCH
In-Reply-To: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479905937-17241-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>

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
Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---

Notes:
    v4:
     - s/SOURCE_DATE_GIT/BR2_VERSION_GIT_EPOCH/
    v3:
     - Fix typo in commit message (Arnout)
     - Introduce BR2_VERSION_EPOCH (Thomas and Arnout)
     - Set and export SOURCE_DATE_EPOCH together (Thomas)

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
-- 
1.9.1
