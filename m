From: Ignacy =?iso-8859-2?Q?Gaw=EAdzki?= <ignacy.gawedzki@green-communications.fr>
Date: Wed, 1 Feb 2017 14:53:10 +0100
Subject: [Buildroot] [PATCH] Don't disable dependency tracking if using
 <pkg>_OVERRIDE_SRCDIR.
Message-ID: <20170201135310.3ghqvpqww25jfzm2@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Include the --disable-dependency-tracking option in
<pkg>_CONFIGURE_CMDS only on the condition that <pkg>_OVERRIDE_SRCDIR
is empty.  Dependency tracking is very welcome while developing in
order to properly rebuild when calling make <pkg>-rebuild for
instance.

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
---
 package/pkg-autotools.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index f7b8488..e8579f4 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -199,7 +199,8 @@ define $(2)_CONFIGURE_CMDS
 		--disable-documentation \
 		--with-xmlto=no \
 		--with-fop=no \
-		--disable-dependency-tracking \
+		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),, \
+		   --disable-dependency-tracking) \
 		--enable-ipv6 \
 		$$(DISABLE_NLS) \
 		$$(SHARED_STATIC_LIBS_OPTS) \
@@ -232,7 +233,8 @@ define $(2)_CONFIGURE_CMDS
 		--disable-debug \
 		--with-xmlto=no \
 		--with-fop=no \
-		--disable-dependency-tracking \
+		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),, \
+		   --disable-dependency-tracking) \
 		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
 endef
-- 
2.9.3
