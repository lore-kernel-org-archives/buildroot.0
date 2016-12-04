From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 22:49:15 +0100
Subject: [Buildroot] [git commit] erlang: odbc support requires thread
	support
Message-ID: <20161204214928.09EDE817CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1120fdc379440b23063b0d083b1d3592e6a086a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/cba60679fa916128796a7b4131ed50403bc74798/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/erlang.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index c9d7b22..3200c38 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -55,8 +55,12 @@ else
 ERLANG_CONF_OPTS += --without-ssl
 endif
 
-ifeq ($(BR2_PACKAGE_UNIXODBC),y)
+# ODBC support in erlang requires threads
+ifeq ($(BR2_PACKAGE_UNIXODBC)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 ERLANG_DEPENDENCIES += unixodbc
+ERLANG_CONF_OPTS += --with-odbc
+else
+ERLANG_CONF_OPTS += --without-odbc
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
