From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 May 2013 23:51:38 +0200
Subject: [Buildroot] [git commit] flex: needs M4 at runtime
Message-ID: <20130527221101.447C69A5E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe6a9e5e9d4046173a60235f8fd9a3b4746929c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For proper runtime execution, flex requires m4 to be
installed. Passing a M4 variable at configure time is needed,
otherwise flex on the target will try to use a 'm4' binary with a
build machine path.

Fixes bug #4988.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flex/Config.in |    2 ++
 package/flex/flex.mk   |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/flex/Config.in b/package/flex/Config.in
index f74a0f0..1ecd0c3 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -12,5 +12,7 @@ config BR2_PACKAGE_FLEX_BINARY
 	# needs fork()
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_FLEX
+	# runtime dependency
+	select BR2_PACKAGE_M4
 	help
 	  Install the flex binary tool in the target filesystem.
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index f7e319f..748365b 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -11,6 +11,7 @@ FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
 FLEX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_GETTEXT_IF_LOCALE),gettext) host-m4
+FLEX_CONF_ENV = M4=/usr/bin/m4
 # we don't have a host-gettext/libintl
 HOST_FLEX_DEPENDENCIES = host-m4
 
