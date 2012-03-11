From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 11 Mar 2012 15:24:56 +0100
Subject: [Buildroot] [PATCH] lua: fix non-shared library build
In-Reply-To: <CAPEB33x3V6aspqT=H96HgoCpB6n-==5NwcRPj0BKcpx8J7PJWQ@mail.gmail.com>
Message-ID: <1331475896-13161-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building without BR2_PACKAGE_LUA_SHARED_LIBRARY failed because of
missing -ldl.  dl is used by lua's dynamic module loading.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
On ARM, there's still a warning:
ld: warning: creating a DT_TEXTREL in object.

I haven't checked if lua actually works on the target.  But it certainly
won't be worse than before :-)

 package/lua/lua.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 30e95b4..aa0b4bf 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -10,9 +10,10 @@ LUA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
 	LUA_MYCFLAGS += -fPIC
-	LUA_MYLIBS += -ldl
 endif
 
+LUA_MYLIBS += -ldl
+
 ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
 	LUA_DEPENDENCIES = readline ncurses
 	LUA_MYLIBS += -lreadline -lhistory -lncurses
-- 
tg: (15fe220..) t/lua (depends on: master)
