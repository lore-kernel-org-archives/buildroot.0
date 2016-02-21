From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 10:50:09 +0100
Subject: [Buildroot] [PATCH 05/14] package/openipmi: add optional support
	for gdbm
In-Reply-To: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456048218-4061-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When gdbm was compiled before, openipmi will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/ipmi_sim | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libgdbm.so.4]
[...]

The build system offers no option to en-/disable gdbm support,
check configure.ac, line 309+

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openipmi/openipmi.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 4dd901b..ea46e19 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -23,6 +23,10 @@ OPENIPMI_CONF_OPTS = \
 	--with-python=no \
 	--with-swig=no
 
+ifeq ($(BR2_PACKAGE_GDBM),y)
+OPENIPMI_DEPENDENCIES += gdbm
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENIPMI_DEPENDENCIES += openssl
 OPENIPMI_CONF_OPTS += --with-openssl=yes
-- 
2.7.0
