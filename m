From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 09:01:26 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/ntp: fix build
	for toolchains without ssp
Message-ID: <20170331071606.DDF90826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccf0e0767d6c73dd23852fad5de2900c6f88fd56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

ntp defaults to use ssp support
http://bk1.ntp.org/ntp-stable/sntp/harden/README

by using these flags
http://bk1.ntp.org/ntp-stable/sntp/harden/linux

If the toolchain lacks SSP support this patch forces ntp to use an
empty set of flags: http://bk1.ntp.org/ntp-stable/sntp/harden/default

Fixes
http://autobuild.buildroot.net/results/1d5/1d58bd8745b22c8eb71fea4c7255d3ace69f6f7a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 00968bcac0674250956e99b6fafbf9b373446488)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/ntp.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index b6eb1b1..e3e53a8 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -23,6 +23,12 @@ NTP_CONF_OPTS = \
 # 0002-ntp-syscalls-fallback.patch
 NTP_AUTORECONF = YES
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+NTP_CONF_OPTS += --with-locfile=linux
+else
+NTP_CONF_OPTS += --with-locfile=default
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 NTP_CONF_OPTS += --enable-linuxcaps
 NTP_DEPENDENCIES += libcap
