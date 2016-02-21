From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:21:21 +0100
Subject: [Buildroot] [git commit] package/kismet: add optional support for
	libcap
Message-ID: <20160221172737.3DDD281801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46143f16834987dce379a88d98ce7068cabfe29f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libcap was compiled before, kismet will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/kismet_server | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
[...]

The build system offers no option to en-/disable libcap support:
https://www.kismetwireless.net/gitweb/?p=kismet.git;a=blob;f=configure.ac;h=e874b10f3c1d56e2deb5e8adf4b8da4066fdde56;hb=HEAD#l635

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kismet/kismet.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 64a0ab2..f4a28b8 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -15,6 +15,10 @@ KISMET_LICENSE_FILES = debian/copyright
 # We touch configure.in:
 KISMET_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+KISMET_DEPENDENCIES += libcap
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE),y)
 KISMET_DEPENDENCIES += pcre
 endif
