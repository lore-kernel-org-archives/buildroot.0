From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 27 Apr 2018 07:40:32 +0300
Subject: [Buildroot] [PATCH 1/2] procps-ng: fix build without wide character
 support
Message-ID: <cd7b2acad0806087a77f051a284df39802c8ff74.1524804032.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Define OFF_XTRAWIDE to disable use of wchar API when the toolchain does
not support that.

Fixes:
http://autobuild.buildroot.net/results/b96/b96d29d64f455726a53a7adcfd3edd546346201c/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/procps-ng/procps-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index a6cf774d7bd2..0d5ce9ddf085 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -40,6 +40,10 @@ PROCPS_NG_CONF_OPTS += \
 	--enable-watch8bit
 endif
 
+ifeq ($(BR2_USE_WCHAR),)
+PROCPS_NG_CONF_OPTS += CPPFLAGS=-DOFF_XTRAWIDE
+endif
+
 # numa support requires libdl, so explicitly disable it when
 # BR2_STATIC_LIBS=y
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.17.0
