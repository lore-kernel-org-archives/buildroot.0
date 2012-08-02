From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:55 -0000
Subject: [Buildroot] [git commit branch/next] libnspr: fix 64-bit build
Message-ID: <20120802195255.41F198EE7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20b2199d30f9c00abd51ae199d0934f4eb70d870
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

On some architectures (found on x86_64, but probably others too),
libnspr builds with -m32 unless it is configured for 64-bit build.  So
force 64-bit build on 64-bit architectures.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnspr/libnspr.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index c2cc996..689caa4 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -12,6 +12,8 @@ LIBNSPR_INSTALL_STAGING = YES
 LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \
 		   HOST_LDFLAGS="-lc"
 # NSPR mixes up --build and --host
-LIBNSPR_CONF_OPT = --host=$(GNU_HOST_NAME)
+LIBNSPR_CONF_OPT  = --host=$(GNU_HOST_NAME)
+LIBNSPR_CONF_OPT += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
+LIBNSPR_CONF_OPT += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
 
 $(eval $(autotools-package))
