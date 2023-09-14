Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48678EEAA71
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6F2641905;
	Thu, 14 Sep 2023 21:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6F2641905
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v2ccMm24yCXV; Thu, 14 Sep 2023 21:18:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E19FC4046F;
	Thu, 14 Sep 2023 21:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E19FC4046F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AFA11BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6039A41B8A
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6039A41B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vpn-DUr_LIgF for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:18:48 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D0BB41B75
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D0BB41B75
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-403012f276dso15526665e9.0
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 14:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694726326; x=1695331126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lfqzq1YlwPSE05ZM0Wx9g1Q86gJautnbMn1lVB4huWg=;
 b=IuEv3imoU26nE6lurmlqrNV6MnRceGN30IH0WUJuq8oORXy5QEPvhlqfk2S1jmxBxS
 F1IYG+IqrAhLl2c1xhFga9hTD4ioXGod03bTvz/xxjvu09MHj++Iz5tjXv4Zq7QtiYBi
 HcbbgsKv9HiBMnI/nE4CIsrSeg23VWDG67ewl5KHKY77caEJGFjrteIbu+4xVailBAu+
 /u1mfm5O8oOlPTOvrnUnAbQXfl6FfbNieiw81J1Vofc2QexyoY0RIFCp2w6aBj3Mw6pN
 d+qvrx4ExVnSVLXMNCpB/s3zPOKK9IyYyF8RyY5oqovI41gQsp1CziTVywuGsNOr6tFA
 xCYA==
X-Gm-Message-State: AOJu0Yw6/bV03lSrgWf7FPKlpZ98PX80PbElXD17SW+MSj9cKc0Gp9X6
 cdr41F2kN+JMa/pVb/vDOy9fDFz7Xls=
X-Google-Smtp-Source: AGHT+IF0CS6ALXGeVt4RRDYM3k/BZ8LWHFjsf3V2Y+t5+bL/1gVuvNfWrwUlFzdvU4RGgaO6aWHkYw==
X-Received: by 2002:a7b:cc94:0:b0:401:38dc:8916 with SMTP id
 p20-20020a7bcc94000000b0040138dc8916mr5495794wma.10.1694726325850; 
 Thu, 14 Sep 2023 14:18:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e13-20020a05600c218d00b00402f745c5ffsm2937754wme.8.2023.09.14.14.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 14:18:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 23:18:39 +0200
Message-Id: <20230914211839.456969-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694726326; x=1695331126; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lfqzq1YlwPSE05ZM0Wx9g1Q86gJautnbMn1lVB4huWg=;
 b=NIqNk9Yo60Eb31/AzBOF/xkLC8K21uULeyp4iWgzhbJsn3kYA6X+enRnp4ctVpUZfs
 d0HgY2OgXRWmx9Q0916qBweVg43RhBPxHXceVMBaTkTJdiUu2O+DD/TlC5WwoiBQOtP5
 gwGEZ4Y9SiBayM/Q9PtbUYvdi7s2z2SfULWLcQjCyq3TT+wSGZGdbhslsvLsMw7Livtl
 oe4CnZ4Bt01aZhljmjORdexzZqvgm6OjqvkVJrailg5Z1tnZRU75jlPfec4TOO95I7r0
 dKnRIJX9knxvJxcIygXTq768FlvTRUqucrMuFdC16OXdmrmFZ32qo5Z29i40Hda3cpRM
 tSgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=NIqNk9Yo
Subject: [Buildroot] [PATCH 1/1] package/lldpd: fix CVE-2023-41910
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

An issue was discovered in lldpd before 1.0.17. By crafting a CDP PDU
packet with specific CDP_TLV_ADDRESSES TLVs, a malicious actor can
remotely force the lldpd daemon to perform an out-of-bounds read on heap
memory. This occurs in cdp_decode in daemon/protocols/cdp.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-overflow-when-parsing-CDP-addresses.patch | 24 +++++++++++++++++++
 package/lldpd/lldpd.mk                        |  3 +++
 2 files changed, 27 insertions(+)
 create mode 100644 package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch

diff --git a/package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch b/package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch
new file mode 100644
index 0000000000..05d882a07a
--- /dev/null
+++ b/package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch
@@ -0,0 +1,24 @@
+From a9aeabdf879c25c584852a0bb5523837632f099b Mon Sep 17 00:00:00 2001
+From: Vincent Bernat <vincent@bernat.ch>
+Date: Wed, 12 Apr 2023 07:38:31 +0200
+Subject: [PATCH] daemon: fix read overflow when parsing CDP addresses
+
+Upstream: https://github.com/lldpd/lldpd/commit/a9aeabdf879c25c584852a0bb5523837632f099b
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ NEWS                       | 4 ++++
+ src/daemon/protocols/cdp.c | 1 +
+ 2 files changed, 5 insertions(+)
+
+diff --git a/src/daemon/protocols/cdp.c b/src/daemon/protocols/cdp.c
+index 8a1be863..42861c0e 100644
+--- a/src/daemon/protocols/cdp.c
++++ b/src/daemon/protocols/cdp.c
+@@ -466,6 +466,7 @@ cdp_decode(struct lldpd *cfg, char *frame, int s, struct lldpd_hardware *hardwar
+ 					goto malformed;
+ 				}
+ 				PEEK_DISCARD(address_len);
++				addresses_len -= address_len;
+ 				(void)PEEK_SAVE(pos_next_address);
+ 				/* Next, we go back and try to extract
+ 				   IPv4 address */
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index dd6f8dcf5d..d4abfade81 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -16,6 +16,9 @@ LLDPD_LICENSE = ISC
 LLDPD_LICENSE_FILES = LICENSE
 LLDPD_CPE_ID_VENDOR = lldpd_project
 
+# 0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch
+LLDPD_IGNORE_CVES += CVE-2023-41910
+
 # Detection of c99 support in configure fails without WCHAR. To enable
 # automatic detection of c99 support by configure, we need to enable
 # WCHAR in toolchain. But actually we do not need WCHAR at lldpd
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
