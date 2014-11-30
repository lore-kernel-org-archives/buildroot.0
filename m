From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 30 Nov 2014 22:41:06 +0100
Subject: [Buildroot] [PATCH] package/mono: fixing wrong monolite library path
Message-ID: <1417383666-23165-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to a bug in makefile logic, monolite libraries path will not
be selected when EXTERNAL_MCS parameter is specified.
Setting EXTERNAL_MCS to a non existent binary, makes the internal logic
to fallback to monolite, setting correctly both binary and
library paths.
This has the benefit to force host-mono to always use monolite as
bootstrap compiler also in case a mono compiler is already installed
on the system.

Fixes:
http://autobuild.buildroot.net/results/fc00952bef03cf3b4785be1a0d9c08dc84aa3f54/


Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index df67c33..d4beb5f 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -55,7 +55,7 @@ HOST_MONO_CONF_OPTS += \
 	--with-profile4=$(if $(BR2_PACKAGE_MONO_40),yes,no) \
 	--with-profile4_5=$(if $(BR2_PACKAGE_MONO_45),yes,no)
 
-HOST_MONO_MAKE_OPTS += EXTERNAL_MCS="$(@D)/mcs/class/lib/monolite/basic.exe"
+HOST_MONO_MAKE_OPTS += EXTERNAL_MCS=false 
 
 HOST_MONO_DEPENDENCIES = host-monolite host-gettext
 
-- 
2.2.0
