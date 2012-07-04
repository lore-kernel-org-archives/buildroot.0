From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Jul 2012 08:47:14 -0300
Subject: [Buildroot] [PATCH 2/2] rpm: needs threads support
In-Reply-To: <1341402434-30526-1-git-send-email-gustavo@zacarias.com.ar>
References: <1341402434-30526-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1341402434-30526-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because beecrypt needs threads rpm does too since it's a mandatory
dependency.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rpm/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index a80a5a7..14072c9 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,8 +1,12 @@
+comment "rpm requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 comment "rpm requires libneon with SSL, XML and ZLIB support"
-	depends on !BR2_PACKAGE_NEON || BR2_PACKAGE_NEON_NOXML
+	depends on !BR2_PACKAGE_NEON || BR2_PACKAGE_NEON_NOXML && BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_RPM
 	bool "rpm"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	select BR2_PACKAGE_BEECRYPT
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_OPENSSL
-- 
1.7.8.6
