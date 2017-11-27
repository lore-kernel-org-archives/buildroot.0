From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 09:29:20 +0100
Subject: [Buildroot] [git commit] linphone: add optional dependency on
 libupnp
Message-ID: <20171127082338.5699981452@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e5390a20bf7019d950da3849bb305f5edf692c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linphone can optionally use libupnp, so this dependency should be
accounted for in linphone.mk. In addition, linphone is not compatible
with libupnp18, but misdetects it as a a proper libupnp, causing a
build failure.

The build failure with libupnp18 currently only happens on the next
branch (because libupnp18 has only been added there), but adding the
optional dependency on libupnp makes sense for the master branch
anyway.

Fixes:

  http://autobuild.buildroot.net/results/473c686f9bc5335d25b720cf1b0c45389138a7b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linphone/linphone.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index fb5e18d..a10d6bb 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -50,4 +50,11 @@ else
 LINPHONE_CONF_OPTS += --disable-libv4l1 --disable-libv4l2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUPNP),y)
+LINPHONE_DEPENDENCIES += libupnp
+LINPHONE_CONF_OPTS += --enable-upnp
+else
+LINPHONE_CONF_OPTS += --disable-upnp
+endif
+
 $(eval $(autotools-package))
