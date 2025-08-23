Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF699CA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 19:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7A24613E1;
	Sat, 23 Aug 2025 19:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyZBSp4Pa1jF; Sat, 23 Aug 2025 19:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3110D613E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3110D613E9;
	Sat, 23 Aug 2025 19:50:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4508319C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E540941676
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9lyUmS6rKjk for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 19:50:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A96941624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A96941624
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A96941624
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:49:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45b4a25ccceso17703025e9.3
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 12:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755978598; x=1756583398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSQqVwM+1LVlc/mU1H4h3TAPD3FaT9rNVpkX4QCzQZY=;
 b=h0TsqP5xsIBYsx3Z8rzyPqvPVYnR+yaQPY2k3mK3U54bXTX1eCS145lfym8/z9/LnT
 /3dt4WfcZ/iK5ZvXfByA3JGw4oxYkN5v98pmsmPJUVzsb02j5v1R8dyOLC4ODmMU+x3p
 oPD3Jrv/SuTls2QdYV57h7v2HJwgm1GH9hoaLWfnipYBvptmxTVnKFnf5sA8Kg1mkwsC
 qM+WV2pERePub3NqsHnhGIKTTnSZYwywAToxuoaEDD8bl4LwrbmrZ/mXwYDDnK0YXlxv
 YchDHm6rIIPjUl3Mm3IyJstSPHPq6huM6qZeMw5HcErebVGb+Q9NRTp8E038v6XmQRMN
 E7aQ==
X-Gm-Message-State: AOJu0YyZPFzF86GFnc2ts4N3SOFrlD8OlLiD2w1G02AIW8GdU7knCkuz
 GyVdtLk2+1hRgiJqRmTa2Le3owCdilBFwOT3ZDA2nDsTIs4sBhAqicdu5VRRXdyjxnU+Cm1Bgfa
 rlkF8
X-Gm-Gg: ASbGnctI0T1+ThYwYbPgK+bEycf656lGqvXyuupPAsBJipY6t0PZ2Gzo88ghBRXI9My
 ioM4PvLEtxVSwuRPLDyFlhgaiBwYL5YeDq9K0mSs5EUYgH4nmzlXR9Xy5OAyJwQJGkS5HICT+BY
 Kel+JRSkAD565aGnTZum5N3xFBxZLtqhgxIHiDwIsGfRHXv+Av2wjWhGvG/M0DlIIgM2dcvpStM
 FEUGG2ulQxNj4rJ4p7MtrtCZ0myE0kOwIok9btEt3B3IKm2JjhwsKtg6P8puAPQ36X/scPnjemK
 BXBf3S4tzbxWT2479e7/oy8NxwRWTYmWjRr+bsN5i8NT61NowUkMfTSKapsx492IV/+AkO2oXG5
 4vjYQ0uor66eY+UUP0oAGgcnoqmFFVJvVfvBpS6dVzBPwennSbU6fHZP2eR/aRnNTXIexVdHKKw
 GuJXehlk2DB0M/t2lz247g
X-Google-Smtp-Source: AGHT+IHOvyV6Jcu77Bh6KXkgv4gsCwYGdSwpDiGCx2IpkBTHYudpOb/Pg87oGu0CMks37lYRDBVQYw==
X-Received: by 2002:a05:600c:4746:b0:459:d494:faf9 with SMTP id
 5b1f17b1804b1-45b517a0bacmr70436775e9.10.1755978598044; 
 Sat, 23 Aug 2025 12:49:58 -0700 (PDT)
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
Date: Sat, 23 Aug 2025 21:49:52 +0200
Message-ID: <20250823194953.3458533-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823194953.3458533-1-romain.naour@smile.fr>
References: <20250823194953.3458533-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755978598; x=1756583398; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aSQqVwM+1LVlc/mU1H4h3TAPD3FaT9rNVpkX4QCzQZY=;
 b=TK0oS07G6aa5CGXdcHQelcxlxNl7JCtaixHEsD2jgpFA7ic7amnCj+IHJj5YoT4/PZ
 678eQXvBcgPYrFWYSmcG6t1SFBX+NCygZAZ8iX2zOLOJMUaIoCyTIeqMEQBa3TVkuHHU
 1PTXq9JEU7pxFbV8DoZTrQw52+NanoDOmZNmg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=TK0oS07G
Subject: [Buildroot] [PATCH v2 3/4] support/testing: TestLibCurl: replace
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
from TestLibCurl.

Busybox's httpd server doesn't report server identification, update
TestLibCurl accordingly.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294712

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_libcurl.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_libcurl.py b/support/testing/tests/package/test_libcurl.py
index b326f9308f..076a5388ca 100644
--- a/support/testing/tests/package/test_libcurl.py
+++ b/support/testing/tests/package/test_libcurl.py
@@ -8,7 +8,7 @@ class TestLibCurl(infra.basetest.BRTest):
         """
         BR2_PACKAGE_LIBCURL=y
         BR2_PACKAGE_LIBCURL_CURL=y
-        BR2_PACKAGE_THTTPD=y
+        BR2_PACKAGE_BUSYBOX_HTTPD=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
@@ -45,11 +45,9 @@ class TestLibCurl(infra.basetest.BRTest):
         self.assertEqual(out[0], msg)
 
         # We download one last time, showing the server response. We
-        # check we can see the OK status and our thttpd server
-        # identification.
+        # check we can see the OK status.
         cmd = f"curl --no-progress-meter --dump-header - -o /dev/null {url}"
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
