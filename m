From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 14:11:31 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/chrony: use
 libedit for command line editing
Message-ID: <20191118130956.9CCAD8F194@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c487d922f6b24f226f2c81c8921c3b428811fee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

chrony is licensed under GPL-2.0, which is not license compatible with
readline (GPL-3.0+), so remove the optional readline handling and replace
with libedit instead.

While we are at it, also explicitly disable the libedit backend when not
available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit baadfbcc02298d03b7d532cb37eb31b26322d68b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index b5821b238d..00709e6f83 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -13,6 +13,7 @@ CHRONY_CONF_OPTS = \
 	--host-system=Linux \
 	--host-machine=$(BR2_ARCH) \
 	--prefix=/usr \
+	--without-readline \
 	--without-tomcrypt
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
@@ -34,10 +35,10 @@ else
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
