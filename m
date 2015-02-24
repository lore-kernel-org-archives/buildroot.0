From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 24 Feb 2015 12:03:20 +0300
Subject: [Buildroot] [PATCH] gdb: fix target gdb building from git
Message-ID: <1424768600-10056-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently we only add "host-texinfo" dependency for host GDB built
from git sources. But in case of target gdb texinfo won't be built
and so gdb building will fail on attempt to build documentation.

Fix is trivial - add "host-texinfo" as a dependency for target gdb
in the sme way as we disable documentation building via both
GDB_CONF_ENV (for target) and HOST_GDB_CONF_ENV (host) GDB flavors.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 24084b8..579d9ca 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -158,6 +158,7 @@ else
 endif
 
 ifeq ($(GDB_FROM_GIT),y)
+GDB_DEPENDENCIES += host-texinfo
 HOST_GDB_DEPENDENCIES += host-texinfo
 else
 # don't generate documentation
-- 
2.1.0
