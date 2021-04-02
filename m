From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Apr 2021 23:50:16 +0200
Subject: [Buildroot] [git commit] package/qpid-proton: fix build without C++
Message-ID: <20210402212534.BE3968131A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64f34fbcfeb373b839d43bb986812714540cec07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/05f344151100219c159ca4d466a453df96bf07fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - move code in thread condition, to avoid setting -DBUILD_CPP twice
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qpid-proton/qpid-proton.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index c1bcbd0d1a..4e03357261 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -33,7 +33,13 @@ QPID_PROTON_CONF_OPTS = \
 
 # epoll proactor unconditionally uses pthread and cpp (C++) bindings
 # unconditionally use proactor
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+QPID_PROTON_CONF_OPTS += -DBUILD_CPP=ON
+else
+QPID_PROTON_CONF_OPTS += -DBUILD_CPP=OFF
+endif
+else
 QPID_PROTON_CONF_OPTS += \
 	-DBUILD_CPP=OFF \
 	-DPROACTOR=none
