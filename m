From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 13:32:35 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/nftables: check
 for python
Message-ID: <20200408112057.55A6E81476@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f92c0475ddd82c33503221b566571e7f94877bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

If python or python3 is selected, nftables should depend on the package
and set the --enable-python option, otherwise set --disable-python

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d6f33d36af353668fe09a93a111c529e4ac5eaa7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nftables/nftables.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 11ef6844ce..210e950c11 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -27,6 +27,13 @@ else
 NFTABLES_CONF_OPTS += --without-json
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+NFTABLES_CONF_OPTS += --enable-python
+NFTABLES_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
+else
+NFTABLES_CONF_OPTS += --disable-python
+endif
+
 ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
 NFTABLES_LIBS += -ljansson -lm
 endif
