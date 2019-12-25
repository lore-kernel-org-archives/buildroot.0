From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 23:00:27 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/ntp: override
 host shell check
Message-ID: <20191225215325.D1B288E52C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf3170e2ebcd96930a685056cbc031afed313e27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Add a patch from the upstream AutoGen package that allows POSIX_SHELL
to be taken from the environment, then define that to be '/bin/sh'.

Since we are cross-compiling, the original behaviour of detecting the
host shell is not useful as we cannot assume that the target uses the
same shell, and it can prevent builds being reproducible because a
different host environment will result in a different target binary.

Signed-off-by: James Byrne <james.byrne@origamienergy.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 88f79481878c7adf9642e208c72dea7fe367bee8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/0003-override-shell.patch | 20 ++++++++++++++++++++
 package/ntp/ntp.mk                    |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/ntp/0003-override-shell.patch b/package/ntp/0003-override-shell.patch
new file mode 100644
index 0000000000..0161e6520a
--- /dev/null
+++ b/package/ntp/0003-override-shell.patch
@@ -0,0 +1,20 @@
+sntp/libopts/m4/libopts.m4: allow override shell with POSIX_SHELL
+
+Pull in fix from upstream AutoGen [1] to accept POSIX_SHELL from the
+environment during the configure step.
+
+[1] http://git.savannah.gnu.org/cgit/autogen.git/commit/?id=db064b9a252f3ef3d8db25411ea0edb0ff8ea758
+
+Signed-off-by: James Byrne <james.byrne@origamienergy.com>
+
+diff --git a/sntp/libopts/m4/libopts.m4 b/sntp/libopts/m4/libopts.m4
+--- a/sntp/libopts/m4/libopts.m4
++++ b/sntp/libopts/m4/libopts.m4
+@@ -114,6 +114,7 @@
+   AC_PROG_SED
+   [while :
+   do
++      test -x "$POSIX_SHELL" && break
+       POSIX_SHELL=`which bash`
+       test -x "$POSIX_SHELL" && break
+       POSIX_SHELL=`which dash`
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index d53fcc5d0b..56050f4fe1 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -10,7 +10,7 @@ NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJO
 NTP_DEPENDENCIES = host-pkgconf libevent
 NTP_LICENSE = NTP
 NTP_LICENSE_FILES = COPYRIGHT
-NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
+NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no POSIX_SHELL=/bin/sh
 NTP_CONF_OPTS = \
 	--with-shared \
 	--program-transform-name=s,,, \
