From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2015 00:04:32 +0200
Subject: [Buildroot] [git commit] neardal: properly quote output of
	pkg-config
Message-ID: <20150521220835.B0D427F99C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ae0e16afd1eb3e48c9b49de87f8b1a382a95112
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5504039c4e (neardal: fix readline/libedit detection with static
linking) added the output of pkg-config to the LIBS shell variable without
adding quotes around it, breaking the logic if the output would ever consist
of more than 1 word.

Now, pkg-config --libs ncurses currently only outputs '-lncurses', so
nothing is really broken (for now atleast), but lets add the quotes before
it does or the syntax gets copied somewhere else where it does.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/neardal/neardal.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index c65a5e6..ddaecbe 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -25,7 +25,7 @@ endif
 # forgets to take that into account, causing the detection to fail
 # when linking statically
 ifeq ($(BR2_STATIC_LIBS),y)
-NEARDAL_CONF_ENV += LIBS=$(shell $(PKG_CONFIG_HOST_BINARY) --libs ncurses)
+NEARDAL_CONF_ENV += LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs ncurses)'
 endif
 
 define NEARDAL_INSTALL_NCL
