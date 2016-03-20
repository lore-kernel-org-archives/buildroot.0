From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:02:52 +0100
Subject: [Buildroot] [git commit] binutils: disable plugins for static links
Message-ID: <20160320140313.B92B3817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b3775c8cb2d2a5fe666cf30b95e8ec83a4f26c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plugins want to use dlopen even when configured with --disable-shared.
Add --disable-plugins when STATIC_LIBS is selected.
Fixes:
  http://autobuild.buildroot.net/results/a59e5858d777dcee3d8f7fb6e82ee4735b520155/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 66ee247..ca39f0b 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -51,6 +51,10 @@ BINUTILS_CONF_OPTS = \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
+ifeq ($(BR2_STATIC_LIBS),y)
+BINUTILS_CONF_OPTS += --disable-plugins
+endif
+
 # Don't build documentation. It takes up extra space / build time,
 # and sometimes needs specific makeinfo versions to work
 BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
