From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Mon,  8 Apr 2019 14:00:10 +0300
Subject: [Buildroot] [PATCH] busybox: Enable domain search list support in
 udhcpc
Message-ID: <20190408110010.2596-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
   asks for that (sending list of options it expectes to get).

   And exactly for those stubborn DHCP servers we need to add "-O search"
   to udhcp's command line via CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Ignacy Gawedzki <ignacy.gawedzki@green-communications.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
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
-- 
2.16.2
