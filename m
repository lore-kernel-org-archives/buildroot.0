From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Nov 2013 12:40:53 +0100
Subject: [Buildroot] [git commit] poco: fix sh4a fenv build failure
Message-ID: <20131126114423.B6C699BDF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54b369c51fef40d1515c8f8815f3de464cf52800
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable FP environment on sh4a. Fixes
http://autobuild.buildroot.net/results/8dc9bca5969d455cc30206fc1ae6e1d3ba6eb6ca/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poco/poco.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index a18f209..3516c04 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -34,6 +34,11 @@ ifeq ($(LIBC),uclibc)
 POCO_CONF_OPT += --no-fpenvironment --no-wstring
 endif
 
+# sh4a is missing FE_DOWNWARD and FE_UPWARD in its fenv.h
+ifeq ($(BR2_sh4a),y)
+POCO_CONF_OPT += --no-fpenvironment
+endif
+
 define POCO_CONFIGURE_CMDS
 	(cd $(@D); ./configure \
 		--config=Linux-CrossEnv	\
