From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:40:40 +0100
Subject: [Buildroot] [git commit] sudo: Add ldap support for sudoers rules
Message-ID: <20170206184947.A3C1F81E81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=480bba27714c85ebaf7f7c20cffd376364398465
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Automatically build sudo with ldap support when openldap is enabled.

When sudo is built with ldap, /etc/sudoers is only read in for defaults,
all rules need to be provided via ldap which is configured by the user
in /etc/ldap.conf.

Signed-off-by: Chris Frederick <cdf123@cdf123.net>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sudo/sudo.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 12b16e0..b1a6dd3 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -37,6 +37,13 @@ else
 SUDO_CONF_OPTS += --disable-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+SUDO_DEPENDENCIES += openldap
+SUDO_CONF_OPTS += --with-ldap
+else
+SUDO_CONF_OPTS += --without-ldap
+endif
+
 # mksigname/mksiglist needs to run on build host to generate source files
 define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
 	$(MAKE) $(HOST_CONFIGURE_OPTS) \
