From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 25 Aug 2016 22:13:36 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/iputils: link with -lintl
In-Reply-To: <20160825201336.6751-1-arnout@mind.be>
References: <20160825201336.6751-1-arnout@mind.be>
Message-ID: <20160825201336.6751-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgcrypt pulls in gpg-error which links with libintl if available.
Since iputils doesn't use libtool, -lintl has to be passed explicitly
for static builds.

Fixes:
http://autobuild.buildroot.net/results/f81/f81eabb37788aa6dcdadf4034889c84bef78b876
http://autobuild.buildroot.net/results/f29/f296e8fba1e79f96d3d119aa4c8207ed4b80694b
http://autobuild.buildroot.net/results/478/478a88cd892a119970cfca717ea7f5517bfc4cea
http://autobuild.buildroot.net/results/920/920d2d1d967691779f79fa54a38fac5adc5a8ee4

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Matthew Weber <matt@thewebers.ws>
---
v2: add BR2_STATIC_LIBS to the condition (Baruch)
    Only add -lintl when libgcrypt is selected.

I also tested without libgcrypt (thus without -lintl) and with libcap,
nettle, openssl. No problem there.
---
 package/iputils/iputils.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index d6398f7..42dab08 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -36,6 +36,13 @@ endif
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 IPUTILS_MAKE_OPTS += USE_GCRYPT=yes
 IPUTILS_DEPENDENCIES += libgcrypt
+# When gettext is enabled (BR2_PACKAGE_GETTEXT=y), and provides libintl
+# (BR2_NEEDS_GETTEXT=y), libgpg-error will link with libintl, and libgpg-error
+# is pulled in by libgcrypt. Since iputils doesn't use libtool, we have to link
+# with libintl explicitly for static linking,
+ifeq ($(BR2_STATIC_LIBS)$(BR2_NEEDS_GETTEXT)$(BR2_PACKAGE_GETTEXT),yyy)
+IPUTILS_MAKE_OPTS += ADDLIB='-lintl'
+endif
 else
 IPUTILS_MAKE_OPTS += USE_GCRYPT=no
 endif
-- 
2.9.3
