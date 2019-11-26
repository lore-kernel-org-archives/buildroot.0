From: James Byrne <james.byrne@origamienergy.com>
Date: Tue, 26 Nov 2019 11:33:01 +0000
Subject: [Buildroot] [PATCH v2] package/ntp: override host shell check
In-Reply-To: <0102016e898693a5-82db32f2-a59d-42c1-996b-97661b367c25-000000@eu-west-1.amazonses.com>
References: <0102016e898693a5-82db32f2-a59d-42c1-996b-97661b367c25-000000@eu-west-1.amazonses.com>
Message-ID: <0102016ea77c74a6-7525be73-3836-4c75-ae25-c9197a85b768-000000@eu-west-1.amazonses.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch from the upstream AutoGen package that allows POSIX_SHELL to
be taken from the environment, then define that to be '/bin/sh'.

Since we are cross-compiling, the original behaviour of detecting the
host shell is not useful as we cannot assume that the target uses the
same shell, and it can prevent builds being reproducible because a
different host environment will result in a different target binary.

Signed-off-by: James Byrne <james.byrne@origamienergy.com>

---
Changes v1 -> v2:
  - Simplify by using upstream AutoGen change

Signed-off-by: James Byrne <james.byrne@origamienergy.com>
---
 package/ntp/0003-override-shell.patch | 14 ++++++++++++++
 package/ntp/ntp.mk                    |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 package/ntp/0003-override-shell.patch

diff --git a/package/ntp/0003-override-shell.patch b/package/ntp/0003-override-shell.patch
new file mode 100644
index 0000000000..823dedf028
--- /dev/null
+++ b/package/ntp/0003-override-shell.patch
@@ -0,0 +1,14 @@
+Pull in fix from upstream AutoGen package to accept POSIX_SHELL from the
+environment during the configure step
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
-- 
2.24.0
