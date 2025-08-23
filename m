Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1284ECA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 19:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B682F613E7;
	Sat, 23 Aug 2025 19:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iS62pL6wQMZ3; Sat, 23 Aug 2025 19:50:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC227613E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC227613E1;
	Sat, 23 Aug 2025 19:50:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20C0EE4
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DD2541635
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jndv7Ma220Ek for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 19:49:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81C9E41621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81C9E41621
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81C9E41621
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:49:59 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45a1b00f23eso18944045e9.0
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 12:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755978597; x=1756583397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nxsH2ZaLb7PRf8OArCfnyWFSijDA7h4jP8EGXEgJBB0=;
 b=WtOQW+HUygBMQWBAnnZvK1cjjZmHdxncw4Q10qEOApAT3ZjPy21gpmV0NcLthmJsHI
 vPSFVDLfNmvcEC4hbP6JqG5RrmAVm0QdkHi6yZE+2V3WiXuIdQzuZYhhtKwXBrOmfI69
 oVxHhcFjy0s2oHSPc9s74izpQFBH9VlYkpXzHdn1s9g7+Azi+T6KpnruBKB/vGQAqEvh
 h+CPBYvyQ2kJguTgn/7Zp23GJNH2mNW9prODx6CmPhVlV5Ei8uS6n+TrWCxj28l4t62M
 8UbR/R9rZoYtkyhrzsEUs0ejWY/Sttray1EUcA6lCD6OygdrAxovzrV955PU9kA7JduU
 /p5Q==
X-Gm-Message-State: AOJu0YyG72+wbJeegKAlbtTD+YCNlmuVG/dqEloXajK1Pe5SCMxyxoz5
 ajqZ5XTA1ahOctpn2x5z1EIQ5Ad3T1xKvFJLTh20m5AkU3y0YZCzDd9s0OIMVsvUmRE9NJtAZ7b
 fMcKL
X-Gm-Gg: ASbGnctZLmv1VzJ3I2esKZRyNgnSdidyp/Y30TVwH++xS25Jdp38XUGXsZ0HquG3G74
 PkiyXT41uuBOr4mIkbpTUO5l9O47eigPiu+WdmjjD4PxXeuTHN2ina83TFZJPwgUJhpe4CWmoID
 R6gqGE6UkkNwrlC4QfuE+LVktoSYmRPule2WAqSNKn+PvW7ENnw/ReQKRY1dBW+TGFB+jGNGbeY
 WngAAFGOo9188xto09VBdSW57uGoFFExO1erkEY9Y2raa5+zkjKR9RLPB3z8Kw8OVvf2IS3XAL7
 5jZp4Ek6Y2NiReMy1unJD4HOENdsNCHVNWsu/YNQOeOWLHo9FRQgbjmUsEhT5fLOUotU/N/GFVg
 M52+MSS/1gPtDqcT4vRJr8kLnTAkjWRWQWMw/5e2U9dU7RdaPIrA1dBUS4AtFPI8+SeLh7Ij2tB
 bwpfMsSDySgv9TL8zfVKo2
X-Google-Smtp-Source: AGHT+IGc9AVDYb9sh7SeaXgw0uxusx01vzkqbhDaXJUJV70iKnFYR5sjtQAHqdmSo+kH/+EZktP0ew==
X-Received: by 2002:a05:600c:3596:b0:458:bd31:2c35 with SMTP id
 5b1f17b1804b1-45b517cca56mr62393265e9.25.1755978597490; 
 Sat, 23 Aug 2025 12:49:57 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b57444958sm45881125e9.2.2025.08.23.12.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 12:49:57 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat, 23 Aug 2025 21:49:51 +0200
Message-ID: <20250823194953.3458533-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823194953.3458533-1-romain.naour@smile.fr>
References: <20250823194953.3458533-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755978597; x=1756583397; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxsH2ZaLb7PRf8OArCfnyWFSijDA7h4jP8EGXEgJBB0=;
 b=F9GdPGZA+O9boFjqztc9+yTV1gu0wMExDYr85UoT01PTps+DDke6az0FQLp8woOSNX
 PSPsm3fMnF++VIV3huZGBY9NrHcgOIMl+yh3jeirS2BYdZNAbYNmeWHpVokpPrUeK23q
 QReZCOhqqmAxJ44x/1BcY3Ug3eg+CQeqBPeSQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=F9GdPGZA
Subject: [Buildroot] [PATCH v2 2/4] support/testing: TestWget: replace
 thttpd by Busybox's httpd server
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to remove thttpd package from Buildroot, we have to replace it
from TestWget.

Busybox's httpd server doesn't report server identification, update
TestWget accordingly.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295041

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_wget.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_wget.py b/support/testing/tests/package/test_wget.py
index c121cbd21c..7279b77667 100644
--- a/support/testing/tests/package/test_wget.py
+++ b/support/testing/tests/package/test_wget.py
@@ -7,8 +7,8 @@ class TestWget(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_BUSYBOX_HTTPD=y
         BR2_PACKAGE_WGET=y
-        BR2_PACKAGE_THTTPD=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
@@ -47,11 +47,9 @@ class TestWget(infra.basetest.BRTest):
         self.assertEqual(out[0], msg)
 
         # We download one last time, showing the server response. We
-        # check we can see the OK status and our thttpd server
-        # identification.
+        # check we can see the OK status.
         cmd = f"wget --no-verbose --server-response -O /dev/null {url}"
         out, ret = self.emulator.run(cmd)
         self.assertEqual(ret, 0)
         out_str = "\n".join(out)
         self.assertIn("HTTP/1.1 200 OK", out_str)
-        self.assertIn("Server: thttpd/", out_str)
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
