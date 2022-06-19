Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C37FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2539E414E5;
	Sun, 19 Jun 2022 16:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2539E414E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sLTO1-XTvrqy; Sun, 19 Jun 2022 16:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9262E408AB;
	Sun, 19 Jun 2022 16:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9262E408AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FA7C1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECCB88239A
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECCB88239A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x_dsS5a3duoW for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:32:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC39D81DCA
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC39D81DCA
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:32:16 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id z9so4625207wmf.3
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8l5cm+HIhZ7+T82gahMmeKQsRjMWdtNQVuvABT5t4JQ=;
 b=hS0bs00E3m/xrpWoQLY35y0+XIQtC0ckqWQ5jMhhAmDj7bpsNWpiwQPMnBk9C+7M2q
 CIOUSPfz67O+wz1OzIcO54IoCS6w/EjBUpbaTHTR+MbyW/D3EHJqxvBxdaIm8uRU3FjZ
 4CVK0pGF8C0+VcmZa6VFW3g5xE5bXtrPmKBjavDVnhLkWMCDoXW2yr+xSKW4xiuLHpBJ
 bywfXVAfvKI5e8egDW70IVsP5UX2zuNPPzWdTDuMaMw8IJTnoLyw5D/+dzWFP0VTPv+d
 it1pXNC+UDPiNiefh+h3IVnWr948E+Mw/5g6HDzpvBMMxCIa8LcK3GbXQE0A7OarBuRs
 OYEw==
X-Gm-Message-State: AJIora8Qbd69gy5F2+uY5rlA/Wfpp+kHqgyxei9pCE6iXtjRm5MueC/1
 fa8C5eAPDgFCXpnzeYuwV7H1CVctoCs=
X-Google-Smtp-Source: AGRyM1uJAgoR/24bHpR9gZ1EkDgdmN4aPESgDrlsPwp2wtGLQPMNiGsx9lKROcBsjjvVcFyf0b8hIg==
X-Received: by 2002:a05:600c:190b:b0:39c:7704:74a4 with SMTP id
 j11-20020a05600c190b00b0039c770474a4mr20057371wmq.92.1655656334745; 
 Sun, 19 Jun 2022 09:32:14 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002103bd9c5acsm10675497wrn.105.2022.06.19.09.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:32:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:29:33 +0200
Message-Id: <20220619162933.627103-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8l5cm+HIhZ7+T82gahMmeKQsRjMWdtNQVuvABT5t4JQ=;
 b=SrxVhLDHetF79dG+ruXSJBXmr/Q95MagMsXs+SMQg0C35T+YOaYU9DxBcXYSQiGijT
 5u+ysqHVRv1xug8DEjiCBM1/i4zovd4e4c+t6UKWYWZBxeFpjOTNvxBUVZLs+pJ/wGrN
 TqIaEpHLIzYKQvPyUzbSmAiifetFzyYQEpMr/lk4H2oodqh1KzPbozbWrG7Ids/5WYWs
 YPRseZNBt6Jjj5X0pMB+U7cHG4xgpjoERyTWtHbdcpojbe7vgMGuCy9LFOjVem3/FXa0
 wWGVonJ2BsM6Y0UKGV+yDygTK1S0BM9N/RRaUsj6BcsXb0q6QKJvLZMK8sxMf8Mqa72l
 ZALQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SrxVhLDH
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: fix CVE-2022-31031
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PJSIP is a free and open source multimedia communication library written
in C language implementing standard based protocols such as SIP, SDP,
RTP, STUN, TURN, and ICE. In versions prior to and including 2.12.1 a
stack buffer overflow vulnerability affects PJSIP users that use STUN in
their applications, either by: setting a STUN server in their
account/media config in PJSUA/PJSUA2 level, or directly using
`pjlib-util/stun_simple` API.

https://github.com/pjsip/pjproject/security/advisories/GHSA-26j7-ww69-c4qj

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ull-request-from-GHSA-26j7-ww69-c4qj.patch | 44 +++++++++++++++++++
 package/libpjsip/libpjsip.mk                  |  3 ++
 2 files changed, 47 insertions(+)
 create mode 100644 package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch

diff --git a/package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch b/package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch
new file mode 100644
index 0000000000..42b842a616
--- /dev/null
+++ b/package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch
@@ -0,0 +1,44 @@
+From 450baca94f475345542c6953832650c390889202 Mon Sep 17 00:00:00 2001
+From: sauwming <ming@teluu.com>
+Date: Tue, 7 Jun 2022 12:00:13 +0800
+Subject: [PATCH] Merge pull request from GHSA-26j7-ww69-c4qj
+
+[Retrieved from:
+https://github.com/pjsip/pjproject/commit/450baca94f475345542c6953832650c390889202]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ pjlib-util/src/pjlib-util/stun_simple.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/pjlib-util/src/pjlib-util/stun_simple.c b/pjlib-util/src/pjlib-util/stun_simple.c
+index 722519584..d0549176d 100644
+--- a/pjlib-util/src/pjlib-util/stun_simple.c
++++ b/pjlib-util/src/pjlib-util/stun_simple.c
+@@ -54,6 +54,7 @@ PJ_DEF(pj_status_t) pjstun_parse_msg( void *buf, pj_size_t buf_len,
+ {
+     pj_uint16_t msg_type, msg_len;
+     char *p_attr;
++    int attr_max_cnt = PJ_ARRAY_SIZE(msg->attr);
+ 
+     PJ_CHECK_STACK();
+ 
+@@ -83,7 +84,7 @@ PJ_DEF(pj_status_t) pjstun_parse_msg( void *buf, pj_size_t buf_len,
+     msg->attr_count = 0;
+     p_attr = (char*)buf + sizeof(pjstun_msg_hdr);
+ 
+-    while (msg_len > 0) {
++    while (msg_len > 0 && msg->attr_count < attr_max_cnt) {
+ 	pjstun_attr_hdr **attr = &msg->attr[msg->attr_count];
+ 	pj_uint32_t len;
+ 	pj_uint16_t attr_type;
+@@ -111,6 +112,10 @@ PJ_DEF(pj_status_t) pjstun_parse_msg( void *buf, pj_size_t buf_len,
+ 	p_attr += len;
+ 	++msg->attr_count;
+     }
++    if (msg->attr_count == attr_max_cnt) {
++	PJ_LOG(4, (THIS_FILE, "Warning: max number attribute %d reached.",
++		   attr_max_cnt));
++    }
+ 
+     return PJ_SUCCESS;
+ }
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index a3303d1e8a..4134d40da8 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -16,6 +16,9 @@ LIBPJSIP_CPE_ID_PRODUCT = pjsip
 LIBPJSIP_INSTALL_STAGING = YES
 LIBPJSIP_MAKE = $(MAKE1)
 
+# 0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch
+LIBPJSIP_IGNORE_CVES += CVE-2022-31031
+
 LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
 
 # relocation truncated to fit: R_68K_GOT16O
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
