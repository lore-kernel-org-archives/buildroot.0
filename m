From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 16:43:46 +0100
Subject: [Buildroot] [git commit] libupnpp: fix libupnp detection with
	static linking
Message-ID: <20150227154450.4667C7FA39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb56d371639746f0d90f2e443e1b032883d57cef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/566/566e1510f94670d4ff642c7bfa9918c1d9ec583f/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnpp/libupnpp.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index ad790f8..853a724 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -11,4 +11,10 @@ LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
 LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
 
+# configure script fails to link against the dependencies of libupnp
+# causing upnp detection to fail when statically linking
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBUPNPP_CONF_ENV += LIBS='-lthreadutil -lixml -pthread'
+endif
+
 $(eval $(autotools-package))
