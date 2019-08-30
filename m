From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Aug 2019 22:31:41 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] busybox: Enable domain
 search list support in udhcpc
Message-ID: <20190830202844.94EB788765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=782cea8a2de87b6970c42b004c25039942742f78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

This is useful in networks with internal resources as it allows
to use much shorter names.

E.g. instead of "server.internal.company.com" it's possible
to use just "server" if DHCP server is configured with:
---------------------------->8-----------------------
option domain-search "internal.company.com";
---------------------------->8-----------------------

This improvement consists of 2 parts:

1. Enable handling of RFC3397 so DHCP client is ready for processing
   corresponding data from DHCP server.

2. Some DHCP servers always send out search list if it is set in server's
   configuration and some servers only provide search list if client
   asks for that (sending list of options it expects to get).

   And exactly for those stubborn DHCP servers we need to add "-O search"
   to udhcp's command line via CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Ignacy Gawedzki <ignacy.gawedzki@green-communications.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 80291c3e9c591ee8cfb9262523cd5151ed0b747a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 1d9560d655..ab04854c83 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -967,9 +967,9 @@ CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
-# CONFIG_FEATURE_UDHCP_RFC3397 is not set
+CONFIG_FEATURE_UDHCP_RFC3397=y
 CONFIG_FEATURE_UDHCP_8021Q=y
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n -O search"
 
 #
 # Print Utilities
