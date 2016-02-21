From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:41:56 +0100
Subject: [Buildroot] [git commit] package/openipmi: add optional support for
	gdbm
Message-ID: <20160221114251.985E580506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33b6119d87e8eea6244894f914ce51f4bce1efa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
