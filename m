From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Nov 2014 23:51:28 +0100
Subject: [Buildroot] [git commit] package/mono: fixing wrong monolite
	library path
Message-ID: <20141130225317.96CBA7FF88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75fa68f5648ed8ccd92c8717794c5499567afeda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: add comment explaining why this is done]
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Reported-by: Rainer Berns <rainer.berns@berns-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mono/mono.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index df67c33..baf205a 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -55,7 +55,8 @@ HOST_MONO_CONF_OPTS += \
 	--with-profile4=$(if $(BR2_PACKAGE_MONO_40),yes,no) \
 	--with-profile4_5=$(if $(BR2_PACKAGE_MONO_45),yes,no)
 
-HOST_MONO_MAKE_OPTS += EXTERNAL_MCS="$(@D)/mcs/class/lib/monolite/basic.exe"
+# ensure monolite is used
+HOST_MONO_MAKE_OPTS += EXTERNAL_MCS=false
 
 HOST_MONO_DEPENDENCIES = host-monolite host-gettext
 
