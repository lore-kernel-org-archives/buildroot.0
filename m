From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 18 Nov 2016 10:10:10 +0100
Subject: [Buildroot] [PATCH v2 01/15] reproducibility: generate
	SOURCE_DATE_EPOCH
In-Reply-To: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479460224-6119-2-git-send-email-jezz@sysmic.org>
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
packages will appear to have been change, even though some of them
may not have changed in fact.

The meaning of SOURCE_DATE_EPOCH is specified by the following
specification:
  https://reproducible-builds.org/specs/source-date-epoch/

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index eff814b..17e49e4 100644
--- a/Makefile
+++ b/Makefile
@@ -249,6 +249,10 @@ ifeq ($(BR2_REPRODUCIBLE),y)
 export TZ=UTC
 export LANG=C
 export LC_ALL=C
+export SOURCE_DATE_EPOCH=$(SOURCE_DATE_EPOCH)
+SOURCE_DATE_GIT = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
+SOURCE_DATE_CHANGES = $(shell date -d `echo $(BR2_VERSION) | sed 's/^\(....\)\.\(..\).*/\1-\2-01T23:59:59/'` +%s)
+SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(SOURCE_DATE_GIT),$(SOURCE_DATE_CHANGES))
 endif
 
 # To put more focus on warnings, be less verbose as default
-- 
1.9.1
