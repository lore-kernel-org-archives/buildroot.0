From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 18:49:41 +0100
Subject: [Buildroot] [git commit] setools: fix build on SPARC64
Message-ID: <20160326175039.55B497FD9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a2e75633f136f021692354434ac0b2d9a81e38c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To build shared libraries on SPARC64, -fPIC must be used instead of
just -fpic. This commit fixes the setools package, which allows to get
rid of the following autobuilder failure:

  http://autobuild.buildroot.net/results/ba1e473178bb66ebc43897b20e534606d2577ee3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/setools/setools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index deb421f..87a19cf 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -31,6 +31,10 @@ SETOOLS_CONF_OPTS = \
 	--with-sepol-devel="$(STAGING_DIR)/usr" \
 	--with-selinux-devel="$(STAGING_DIR)/usr"
 
+ifeq ($(BR2_sparc64):$(BR2_STATIC_LIBS),y:)
+SETOOLS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
+endif
+
 HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol host-sqlite \
 	host-libxml2 host-bzip2 host-bison
 
