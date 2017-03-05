From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:48:04 +0100
Subject: [Buildroot] [git commit] pkg-autotools: don't disable dependency
	tracking if using <pkg>_OVERRIDE_SRCDIR
Message-ID: <20170305214814.40D1881E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=630c335868dac137157e4821d465f61323baba22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Include the --disable-dependency-tracking option in <pkg>_CONFIGURE_CMDS
only on the condition that <pkg>_OVERRIDE_SRCDIR is empty. Dependency
tracking is very welcome while developing in order to properly rebuild
when calling make <pkg>-rebuild for instance.

Signed-off-by: Ignacy Gaw??dzki <ignacy.gawedzki@green-communications.fr>
---
 package/pkg-autotools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index f7b8488..e215382 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -199,7 +199,7 @@ define $(2)_CONFIGURE_CMDS
 		--disable-documentation \
 		--with-xmlto=no \
 		--with-fop=no \
-		--disable-dependency-tracking \
+		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 		--enable-ipv6 \
 		$$(DISABLE_NLS) \
 		$$(SHARED_STATIC_LIBS_OPTS) \
@@ -232,7 +232,7 @@ define $(2)_CONFIGURE_CMDS
 		--disable-debug \
 		--with-xmlto=no \
 		--with-fop=no \
-		--disable-dependency-tracking \
+		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
 endef
