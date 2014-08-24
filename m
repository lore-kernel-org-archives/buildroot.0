From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 24 Aug 2014 18:53:06 +0200
Subject: [Buildroot] [PATCH 3/3] package/libarchive: fix linking issue with
	uClibc
In-Reply-To: <1408899186-28542-1-git-send-email-romain.naour@openwide.fr>
References: <1408899186-28542-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1408899186-28542-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With uClibc the dynamic linking loader functions needs
to be linked with -ldl

Fixes:
http://autobuild.buildroot.net/results/6af/6af140618b274536238b062635d493709905c8f6/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libarchive/libarchive.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 8c6951d..ce3355c 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -68,4 +68,8 @@ else
 LIBARCHIVE_CONF_OPT += --without-zlib
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+LIBARCHIVE_CONF_ENV += LIBS="-ldl"
+endif
+
 $(eval $(autotools-package))
-- 
1.9.3
