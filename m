From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Thu, 5 Sep 2013 13:28:46 -0500
Subject: [Buildroot] [PATCH 1/1] netsnmp: bugfix for openssl dependency
In-Reply-To: <1378401982-23239-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1378401982-23239-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <OFF1E3672B.8ADB58AD-ON86257BDD.00654C41-86257BDD.0065828C@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FYI, I think this was actually a bug caused by the linaro 2013.06 
toolchain (GCC 4.8).  After fixing the netsnmp bug, I ran into another 
issue with quagga linking and a clock_gettime call.  At that point I 
reverted back to 2013.04 and things are functional.


Matthew L Weber / Sr Software Engineer / Platform SW 
MS 137-157, 855 35th Street NE, Cedar Rapids, IA, 52498, USA
Phone: 319-295-7349 / VPN: 295-7349 
mlweber1 at rockwellcollins.com
www.rockwellcollins.com 

CONFIDENTIALITY NOTICE:  This email message is intended only for the 
person or entity to which it is addressed and may contain confidential 
and/or privileged material.  Any unauthorized review, use, disclosure or 
distribution is prohibited.  If you are not  the intended recipient, 
please contact the sender by email and destroy all copies of the original 
message.



From:   Matt Weber <mlweber1@rockwellcollins.com>
To:     buildroot at busybox.net
Cc:     Matt Weber <mlweber1@rockwellcollins.com>
Date:   09/05/2013 12:26 PM
Subject:        [PATCH 1/1] netsnmp: bugfix for openssl dependency



In the configure check of netsnmp (if using with openssl enabled)
it checks for openssl and gets a undefined reference to dl* error.
Adding an additional references to the libld.a lib resolves this bug.

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
 package/netsnmp/netsnmp.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 806f7a6..7d31b9f 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -38,7 +38,8 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
                 NETSNMP_DEPENDENCIES += openssl
                 NETSNMP_CONF_OPT += \
- --with-openssl=$(STAGING_DIR)/usr/include/openssl
+ --with-openssl=$(STAGING_DIR)/usr/include/openssl \
+                                --with-libs=-ldl
 else
                 NETSNMP_CONF_OPT += --without-openssl
 endif
-- 
1.7.1



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130905/15457002/attachment.html>
