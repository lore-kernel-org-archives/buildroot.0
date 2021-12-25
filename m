Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF115C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 19:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B56E8146A;
	Sat, 25 Dec 2021 19:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LcZBFsd70U8v; Sat, 25 Dec 2021 19:39:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89BBD81438;
	Sat, 25 Dec 2021 19:39:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DB121BF32B
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 19:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C06E60ACF
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 19:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cviY7nEr-L1q for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 19:39:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 639FB60AAA
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 19:39:02 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a9so23608471wrr.8
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 11:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S7x3/zJUlosxxM+CtRdEwHLXxKdcGZcXvkjkJ5vDHUw=;
 b=EtGFPqNo1qPN6cQmgwLt8XeIk4tv72rOSZZmQVsJ5aKpE7BIGO3i55dSkml2mNenE+
 ODmryXOyhhIq9euDt1eihGIGJWfP87DX7EgMyw4uNQ0FQf8uZ24jg0BMsihD5xZ8+/76
 RV/wihGZ+nXLkgPmqqClgnnXcykLDBCSv/ubQIM+b+Bo2B3K47sxwTh37nGuJy9O0eip
 yf1oqiYbAX/vjnnXyBTOZu/iYpVjwE2D5DPuiM8P6X52lVHJ4e+bfLpBu28rDcrgqnnK
 GIuipek9NUccmCqnBsjWdlE31uQj8604gJez8o9nlrtZUqqyRhWO+THuCtVZ2uXNkU50
 Xdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S7x3/zJUlosxxM+CtRdEwHLXxKdcGZcXvkjkJ5vDHUw=;
 b=x9Ace+4rXZKc4qsHJAczN9D9HN1EkS2adi/I3oDkL1kEPArnJ9fHwk7aI7lXnxjeAu
 1k1BaGifeUsH7ozULtbrvZ+LYFvpkk462qO339Do8AEvMd7wG2SPfca72JP8/hXWYHxw
 xgoNaoHR5Z2eepWK4q4q4mf720fCKE1snhYBBqv7iPiAQHcZdILILKRGpI0apJ3KbGCs
 RK08rVZTeKzvrSwZBMgfueqi0/rkF7DqXTECBDOldbDLic49vlI8mBX6efp4OZWp9H5a
 FEcsKqZmaUy46YnLAdJ5wGC5vRbwO1Gk6fJQ9KyBsCnSf7OsitNhKMrUuG6cLOZHfEeu
 LLCw==
X-Gm-Message-State: AOAM532Pdf77AK9SUAp5sxkqK8JQv2hsSK1JaMAlC6+2tO+PgevWssNR
 riHepb6qP9P/2fH5oAu4KxlH/Yz34tE1Aw==
X-Google-Smtp-Source: ABdhPJwri3mOHpv2kgi6vN2mamJtu5InZvmYjRdLTO/vn8d0ihxKJgerD8rBraC5ft54syMa1mnpdg==
X-Received: by 2002:a5d:46cf:: with SMTP id g15mr8139574wrs.207.1640461140546; 
 Sat, 25 Dec 2021 11:39:00 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id b14sm7100263wri.112.2021.12.25.11.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 11:39:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 20:38:16 +0100
Message-Id: <20211225193816.491118-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/memcached: fix build with gcc 10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 1.6.12 in
commit f727b6da04c21732bbd07d8c70aa814bc56014a1:

logger.c: In function '_logger_parse_cce':
logger.c:297:13: error: 'rport' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  297 |     total = snprintf(scratch, LOGGER_PARSE_SCRATCH,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  298 |             "ts=%d.%d gid=%llu type=conn_close rip=%s rport=%hu transport=%s reason=%s cfd=%d\n",
      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  299 |             (int) e->tv.tv_sec, (int) e->tv.tv_usec, (unsigned long long) e->gid,
      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  300 |             rip, rport, transport_map[le->transport],
      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  301 |             reason_map[le->reason], le->sfd);
      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7a46ac38d10b1859034017e0294961daa8f48dd2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-logger.c-initialize-rport.patch      | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/memcached/0001-logger.c-initialize-rport.patch

diff --git a/package/memcached/0001-logger.c-initialize-rport.patch b/package/memcached/0001-logger.c-initialize-rport.patch
new file mode 100644
index 0000000000..5fb13d5eee
--- /dev/null
+++ b/package/memcached/0001-logger.c-initialize-rport.patch
@@ -0,0 +1,55 @@
+From b3431c4fcaf65e66fda80ef89b79ff3da1912b4f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 25 Dec 2021 20:05:29 +0100
+Subject: [PATCH] logger.c: initialize rport
+
+Fix the following build failure raised since version 1.6.11 and
+https://github.com/memcached/memcached/commit/617d7cd64d04698b76fee74882627690017e20ad:
+
+logger.c: In function '_logger_parse_cce':
+logger.c:297:13: error: 'rport' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+  297 |     total = snprintf(scratch, LOGGER_PARSE_SCRATCH,
+      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  298 |             "ts=%d.%d gid=%llu type=conn_close rip=%s rport=%hu transport=%s reason=%s cfd=%d\n",
+      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  299 |             (int) e->tv.tv_sec, (int) e->tv.tv_usec, (unsigned long long) e->gid,
+      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  300 |             rip, rport, transport_map[le->transport],
+      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  301 |             reason_map[le->reason], le->sfd);
+      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7a46ac38d10b1859034017e0294961daa8f48dd2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ logger.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/logger.c b/logger.c
+index 667f3c7..394adae 100644
+--- a/logger.c
++++ b/logger.c
+@@ -269,7 +269,7 @@ static int _logger_parse_extw(logentry *e, char *scratch) {
+ 
+ static int _logger_parse_cne(logentry *e, char *scratch) {
+     int total;
+-    unsigned short rport;
++    unsigned short rport = 0;
+     char rip[64];
+     struct logentry_conn_event *le = (struct logentry_conn_event *) e->data;
+     const char * const transport_map[] = { "local", "tcp", "udp" };
+@@ -286,7 +286,7 @@ static int _logger_parse_cne(logentry *e, char *scratch) {
+ 
+ static int _logger_parse_cce(logentry *e, char *scratch) {
+     int total;
+-    unsigned short rport;
++    unsigned short rport = 0;
+     char rip[64];
+     struct logentry_conn_event *le = (struct logentry_conn_event *) e->data;
+     const char * const transport_map[] = { "local", "tcp", "udp" };
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
