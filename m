From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Feb 2018 09:37:10 +0100
Subject: [Buildroot] [PATCH] asterisk: security bump to version 14.7.6
Message-ID: <20180223083710.31207-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

AST-2018-002: Crash when given an invalid SDP media format description

By crafting an SDP message with an invalid media format description Asterisk
crashes when using the pjsip channel driver because pjproject's sdp parsing
algorithm fails to catch the invalid media format description.

AST-2018-003: Crash with an invalid SDP fmtp attribute

By crafting an SDP message body with an invalid fmtp attribute Asterisk
crashes when using the pjsip channel driver because pjproject's fmtp
retrieval function fails to check if fmtp value is empty (set empty if
previously parsed as invalid).

AST-2018-004: Crash when receiving SUBSCRIBE request

When processing a SUBSCRIBE request the res_pjsip_pubsub  module stores the
accepted formats present in the Accept headers of the request.  This code
did not limit the number of headers it processed despite having a fixed
limit of 32.  If more than 32 Accept headers were present the code would
write outside of its memory and cause a crash.

AST-2018-005: Crash when large numbers of TCP connections are closed suddenly

A crash occurs when a number of authenticated INVITE messages are sent over
TCP or TLS and then the connection is suddenly closed.  This issue leads to
a segmentation fault.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index f537c2df66..a3e9d10aff 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  6525170fa16fecb08cb3cde2c1bd5d3140df55b14e4561ac0771fbd1e04b3b75  asterisk-14.7.5.tar.gz
+sha256  249cf223ef4dd7aea01f0d250a6b9cad661ebd78910c73adb7f59c1c46f9fed8  asterisk-14.7.6.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index fc9a961c89..f14c008111 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 14.7.5
+ASTERISK_VERSION = 14.7.6
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.11.0
