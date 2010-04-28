From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:43 +0200
Subject: [Buildroot] [PATCH 02/19] libxslt: fix host compilation
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f27aa7c43b67738a8dc641fa309516e6c9a6f813.1272490771.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not build against libgcrypt on the host, since we don't build
libgcrypt ourself, and it might fail even when libgcrypt is installed
on the host:

...configure...
checking for libgcrypt-config... /usr/bin/libgcrypt-config
Crypto extensions will be available.

...build...
gcc: /usr/lib/libgcrypt.so: No such file or directory

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxslt/libxslt.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 407924d..e77663d 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -27,7 +27,8 @@ LIBXSLT_DEPENDENCIES = libxml2 $(LIBXSLT_DEPENDENCIES_EXTRA)
 HOST_LIBXSLT_CONF_OPT = --enable-shared \
 			--without-debugging \
 			--without-python \
-			--without-threads
+			--without-threads \
+			--without-crypto
 
 HOST_LIBXSLT_DEPENDENCIES = host-libxml2
 
-- 
1.6.3.3
