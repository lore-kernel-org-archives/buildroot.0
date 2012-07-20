From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 14:40:18 +0200
Subject: [Buildroot] [git commit] lua: ensure that host-lua does not depend
	on host-readline and host-ncurses
Message-ID: <20120720180403.D682096BBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ebbec054545df978655eda88af78f531ff25f17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ad6af5819f88bac9ca7f50e565c4fc68d3e408cc removed the
HOST_LUA_DEPENDENCIES assignement to the empty variable, so from that
commit, the dependencies of host-lua are automatically computed from
the dependencies of lua. Since lua can depend on readline and ncurses,
it means that host-lua can depend on host-readline and host-ncurses,
and the host-readline package does not exist in Buildroot. Since there
is no reason to build host-lua with readline/ncurses support, just
re-add the HOST_LUA_DEPENDENCIES variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Francois Perrad <fperrad@gmail.com>
---
 package/lua/lua.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 8f71fc2..074b9ad 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -23,6 +23,9 @@ else
 	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN
 endif
 
+# We never want to have host-readline and host-ncurses as dependencies
+# of host-lua.
+HOST_LUA_DEPENDENCIES =
 HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 HOST_LUA_MYLIBS = -ldl
 
