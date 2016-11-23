From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 12:08:03 +0100
Subject: [Buildroot] [PATCH v3 03/18] reproducible: add '-n' to gzip
	invocations
In-Reply-To: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
References: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479899298-14655-4-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Default invocation to gzip include timestamp in output file. This feature is
incompatible with BR2_REPRODUCIBLE. It is possible to disable it with '-n'.

The environment variable GZIP can hold a set of default options for gzip. So
instead to find all gzip invocation in build process, we just export 'GZIP=-n'.

Notice bzip2, lzma and xz are not impacted by this problem. On the other hand, lzop
does include timestamp and does not provide any way to disable it.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index fcb80ec..92271d9 100644
--- a/Makefile
+++ b/Makefile
@@ -251,6 +251,7 @@ ifeq ($(BR2_REPRODUCIBLE),y)
 export TZ=UTC
 export LANG=C
 export LC_ALL=C
+export GZIP = -n
 SOURCE_DATE_GIT = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
 export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(SOURCE_DATE_GIT),$(BR2_VERSION_EPOCH))
 endif
-- 
1.9.1
