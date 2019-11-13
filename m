From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 21:10:12 +0100
Subject: [Buildroot] [git commit] package/chrony: use libedit for command
 line editing
Message-ID: <20191113200253.B170C8EE6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=baadfbcc02298d03b7d532cb37eb31b26322d68b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

chrony is licensed under GPL-2.0, which is not license compatible with
readline (GPL-3.0+), so remove the optional readline handling and replace
with libedit instead.

While we are at it, also explicitly disable the libedit backend when not
available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/chrony/chrony.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index f6dcb11794..379745022c 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -13,6 +13,7 @@ CHRONY_CONF_OPTS = \
 	--host-system=Linux \
 	--host-machine=$(BR2_ARCH) \
 	--prefix=/usr \
+	--without-readline \
 	--without-tomcrypt \
 	$(if $(BR2_PACKAGE_CHRONY_DEBUG_LOGGING),--enable-debug,--disable-debug)
 
@@ -35,10 +36,10 @@ else
 CHRONY_CONF_OPTS += --without-seccomp
 endif
 
-ifeq ($(BR2_PACKAGE_READLINE),y)
-CHRONY_DEPENDENCIES += readline
+ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+CHRONY_DEPENDENCIES += libedit
 else
-CHRONY_CONF_OPTS += --disable-readline
+CHRONY_CONF_OPTS += --without-editline --disable-readline
 endif
 
 # If pps-tools is available, build it before so the package can use it
