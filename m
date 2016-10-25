From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 22:57:16 +0200
Subject: [Buildroot] [git commit] package/erlang: add optional dependency to
	unixodbc
Message-ID: <20161025205742.1C8B280E58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f33fcdf2254beb07677a86416ff46ee6d7aed866
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quote from erlang configure without unixodbc:

checking for odbc in standard locations... no
configure: WARNING: No odbc library found skipping odbc
configure: WARNING: "ODBC library - header check failed"
configure: WARNING: "ODBC library - link check failed"

Quote from erlang configure with unixodbc:

checking for odbc in standard locations... -L/home/buildroot/br3_couchdb/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib
checking for SQLAllocHandle in -lodbc... yes

To check for unixodbc support used by erlang use readelf:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/erlang/lib/odbc-2.11.1/priv/bin/odbcserver | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libodbc.so.2]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Tested using this minimal defconfig:

BR2_PACKAGE_ERLANG=y
BR2_PACKAGE_ERLANG_SMP=y
BR2_PACKAGE_UNIXODBC=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/erlang.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 6efffde..c9d7b22 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -55,6 +55,10 @@ else
 ERLANG_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_UNIXODBC),y)
+ERLANG_DEPENDENCIES += unixodbc
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ERLANG_CONF_OPTS += --enable-shared-zlib
 ERLANG_DEPENDENCIES += zlib
