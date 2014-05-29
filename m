From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 May 2014 22:38:21 +0200
Subject: [Buildroot] [PATCH 07/11 RFC] package/cryptodev: make it behave
	more like other virtual packages
In-Reply-To: <cover.1401395407.git.yann.morin.1998@free.fr>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
Message-ID: <fb4fd59c1256e4af634e09bde41079a0f14acbc8.1401395407.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, the virtual package cryptodev is a special virtual package,
as it offers a choice for its implementation, rather than letting the
user enable them manually.

In so doing, it defines its _HAS option as a 'def_bool y' rather than
letting each implementation 'select' it.

Since we are going to generate a list of virtual packages and their
providers, this defeats the heuristic used to find providers.

Coming with an alternate heuristic that also matches the cryptodev
package is quite complex, so better and easier to make it look more
like any other virtual package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/cryptodev/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cryptodev/Config.in b/package/cryptodev/Config.in
index 2407e04..9f9df02 100644
--- a/package/cryptodev/Config.in
+++ b/package/cryptodev/Config.in
@@ -18,6 +18,7 @@ choice
 config BR2_PACKAGE_CRYPTODEV_LINUX
 	bool "cryptodev-linux"
 	depends on !BR2_microblaze
+	select BR2_PACKAGE_HAS_CRYPTODEV
 	help
 	  Cryptodev-linux is a device that allows access to Linux kernel
 	  cryptographic drivers; thus allowing userspace applications
@@ -27,6 +28,7 @@ config BR2_PACKAGE_CRYPTODEV_LINUX
 
 config BR2_PACKAGE_OCF_LINUX
 	bool "ocf-linux"
+	select BR2_PACKAGE_HAS_CRYPTODEV
 	help
 	  OCF-Linux is a Linux port of the OpenBSD/FreeBSD Cryptographic
 	  Framework (OCF). This port aims to bring full asynchronous HW/SW
@@ -38,7 +40,7 @@ config BR2_PACKAGE_OCF_LINUX
 endchoice
 
 config BR2_PACKAGE_HAS_CRYPTODEV
-	def_bool y
+	bool
 
 config BR2_PACKAGE_PROVIDES_CRYPTODEV
 	string
-- 
1.8.3.2
