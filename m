From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 23:38:04 +0100
Subject: [Buildroot] [PATCH 1/2] dependencies.mk: reverse check-host-*.mk
 include to work around lzip -> tar dependency
Message-ID: <20180226223805.17496-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-lzip needs host-tar to extract the source code tarball, so we need to
ensure that host-tar gets added to DEPENDENCIES_HOST_PREREQ before host-lzip
in case they are both available, otherwise host-lzip will fail to extract.

With the upcoming change to blacklist modern tar versions this situation is
likely to trigger more often.

The real solution to this issue is the <foo>_EXTRACT_DEPENDENCIES rework,
but that series is a bit too intrusive to add this close to 2018.02, so
therefore this hack.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 4f606f849d..dfdc1fa116 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -12,7 +12,9 @@
 define suitable-host-package
 $(shell support/dependencies/check-host-$(1).sh $(2))
 endef
--include $(sort $(wildcard support/dependencies/check-host-*.mk))
+# host-lzip needs host-tar to extract the source code tarball, so
+# ensure check-host-tar.mk is included before check-host-lzip.mk.
+-include $(call reverse,$(sort $(wildcard support/dependencies/check-host-*.mk)))
 
 ifeq ($(BR2_CCACHE),y)
 DEPENDENCIES_HOST_PREREQ += host-ccache
-- 
2.11.0
