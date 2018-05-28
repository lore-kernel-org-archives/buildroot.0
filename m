From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:04:47 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/apr-util: fix
 ldap detection
Message-ID: <20180528142834.151A1822ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aca5fba3a57c530bc7cb186a78634db63065ee35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

configure checks if ldap_set_rebind_proc takes 2 or 3 arguments
http://svn.apache.org/viewvc/apr/apr-util/tags/1.6.1/build/apu-conf.m4?revision=1812528&view=markup#l370

It uses the macro APR_TRY_COMPILE_NO_WARNING which adds -Werror to
treat all warnings as errors when gcc is used:
http://svn.apache.org/viewvc/apr/apr/tags/1.6.3/build/apr_common.m4?revision=1812527&view=markup#l504

In some buildroot configs a compiler warning occurs during this check:
http://autobuild.buildroot.net/results/241/241ed78b93ce86c859e175530fa485711ff61615//apr-util-1.6.1/config.log

/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/features.h:218:5:
 error: #warning requested reentrant code, but thread support was disabled [-Werror=cpp]
cc1: all warnings being treated as errors

Due to this warning 'ac_cv_ldap_set_rebind_proc_style' is set to two
instead of three leading to a build error later on. This patch forces
ac_cv_ldap_set_rebind_proc_style=three to be inline with openldap which
fixes
http://autobuild.buildroot.net/results/241/241ed78b93ce86c859e175530fa485711ff61615/

This solution was inspired by a discussion on the fink mailinglist:
https://sourceforge.net/p/fink/mailman/message/31720482/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b4dfee63d25629b26fdfc89a870c22474482642f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr-util/apr-util.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 973194b915..b006964ccb 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -48,6 +48,7 @@ APR_UTIL_CONF_OPTS += --without-sqlite3
 endif
 
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+APR_UTIL_CONF_ENV += ac_cv_ldap_set_rebind_proc_style=three
 APR_UTIL_CONF_OPTS += \
 	--with-ldap \
 	--with-ldap-include="$(STAGING_DIR)/usr/include/" \
