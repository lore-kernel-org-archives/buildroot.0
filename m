From: cedric.chedaleux at orange.com <cedric.chedaleux@orange.com>
Date: Thu, 31 Jul 2014 09:13:40 +0000
Subject: [Buildroot] [PATCH 02/14 v4] package/libudev: new virtual
 package
Message-ID: <25285_1406798022_53DA08C6_25285_352_1_D1B3145249B37145BFF7A03F8FC244500F67A78C@PEXCVZYM11.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[ Compiled for x86 target with glibc 2.18 and Kernel headers 3.15.x ]
Tested-by: Cedric Chedaleux <cedric.chedaleux@orange.com>

Regards,
C?dric CHEDALEUX

-----Message d'origine-----
De?: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] De la part de Yann E. MORIN
Envoy??: jeudi 31 juillet 2014 02:17
??: buildroot at buildroot.org
Cc?: Bernd Kuhls; Yann E. MORIN
Objet?: [Buildroot] [PATCH 02/14 v4] package/libudev: new virtual package

Not all packages that currently depend on udev really need an udev
daemon; most may only require a libudev.so to be available. For
example, libcec, mesa3d...

Currently, we conflate udev and libudev into a single virtual package.

Introduce a new virtual package 'libudev' that packages can select if
they provide libudev.so (obviously, systemd and eudev are such packages)
and which packages can depend on if they just need libudev.so and not an
udev daemon.

Note: only the virtual package is added for now, providers and users
will be converted in followup patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in          | 1 +
 package/libudev/Config.in  | 6 ++++++
 package/libudev/libudev.mk | 7 +++++++
 3 files changed, 14 insertions(+)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

diff --git a/package/Config.in b/package/Config.in
index 29b8e6b..230bcf4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -673,6 +673,7 @@ menu "Hardware handling"
 	source "package/librtlsdr/Config.in"
 	source "package/libserial/Config.in"
 	source "package/libsoc/Config.in"
+	source "package/libudev/Config.in"
 	source "package/libusb/Config.in"
 	source "package/libusb-compat/Config.in"
 	source "package/libv4l/Config.in"
diff --git a/package/libudev/Config.in b/package/libudev/Config.in
new file mode 100644
index 0000000..2745fcc
--- /dev/null
+++ b/package/libudev/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_LIBUDEV
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
+	string
diff --git a/package/libudev/libudev.mk b/package/libudev/libudev.mk
new file mode 100644
index 0000000..af1b3dd
--- /dev/null
+++ b/package/libudev/libudev.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# libudev
+#
+################################################################################
+
+$(eval $(virtual-package))
-- 
1.9.1

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
