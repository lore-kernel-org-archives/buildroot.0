From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 24 Oct 2017 13:51:33 -0700
Subject: [Buildroot] [PATCH] support/dependencies: always run
	check-host-tar.mk first
Message-ID: <1508878293-15873-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case both host lzip and tar are not suitable the buildroot build
fails with the following error:

  >>> host-lzip 1.19 Extracting
  gzip -d -c dl/lzip-1.19.tar.gz | host/bin/tar --strip-components=1 -C
    build/host-lzip-1.19 -xf -
  /bin/sh: host/bin/tar: No such file or directory

Make sure that if the tar dependency is present it is always the first
one in the DEPENDENCIES_HOST_PREREQ.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 support/dependencies/dependencies.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index ef2ae9b7e158..4e8528b91f05 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -12,7 +12,12 @@
 define suitable-host-package
 $(shell support/dependencies/check-host-$(1).sh $(2))
 endef
--include $(sort $(wildcard support/dependencies/check-host-*.mk))
+
+# Make sure that if the tar dependency is present it is always the first one in
+# the DEPENDENCIES_HOST_PREREQ, otherwise sources for other dependencies will
+# fail to unpack.
+-include support/dependencies/check-host-tar.mk
+-include $(sort $(filter-out %/check-host-tar.mk,$(wildcard support/dependencies/check-host-*.mk)))
 
 ifeq ($(BR2_CCACHE),y)
 DEPENDENCIES_HOST_PREREQ += host-ccache
-- 
2.1.4
