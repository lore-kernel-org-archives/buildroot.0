From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 May 2015 22:21:33 +0200
Subject: [Buildroot] [git commit] cc-tool: fix static build problem with
	boost regex
Message-ID: <20150507202544.693F281E01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4051756ad45452a5a949835fb39544d4e425721a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The boost.m4 logic is a bit crappy, and needs some help to know that
boost_regex needs the pthread library.

Fixes:

  http://autobuild.buildroot.org/results/69a/69aff0b9d0ac8fe08e1d2f7ffb691f6a8fc8693b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cc-tool/cc-tool.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/cc-tool/cc-tool.mk b/package/cc-tool/cc-tool.mk
index 7312bd3..3a3f85a 100644
--- a/package/cc-tool/cc-tool.mk
+++ b/package/cc-tool/cc-tool.mk
@@ -14,4 +14,10 @@ CC_TOOL_DEPENDENCIES = boost libusb
 # Configure script "discovers" boost in /usr/local if not given explicitly
 CC_TOOL_CONF_OPTS = --with-boost=$(STAGING_DIR)/usr
 
+# Help boost.m4 find the Boost Regex library, which needs the pthread
+# library, but isn't detected using a modern (pkg-config) mechanism.
+ifeq ($(BR2_STATIC_LIBS),y)
+CC_TOOL_CONF_ENV += LIBS="-lpthread"
+endif
+
 $(eval $(autotools-package))
