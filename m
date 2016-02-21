From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:45:03 +0100
Subject: [Buildroot] [git commit] package/cifs-utils: add optional support
	for keyutils
Message-ID: <20160221135332.8B8F280E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4969784be1f008aac71a3a07d6a7ff0c7f624e16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When keyutils was compiled before, cifs-utils will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/cifscreds | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libkeyutils.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cifs-utils/cifs-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index e668b08..89358b1 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -14,6 +14,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 CIFS_UTILS_CONF_OPTS += --disable-pie
 endif
 
+ifeq ($(BR2_PACKAGE_KEYUTILS),y)
+CIFS_UTILS_DEPENDENCIES += keyutils
+endif
+
 define CIFS_UTILS_NO_WERROR
 	$(SED) 's/-Werror//' $(@D)/Makefile.in
 endef
