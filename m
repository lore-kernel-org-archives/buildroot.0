Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD4BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 06:43:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AACB6610A0
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 06:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AACB6610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60DEF40225;
	Tue, 26 Oct 2021 06:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PzAWGPTVD_XG; Tue, 26 Oct 2021 06:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84F8040239;
	Tue, 26 Oct 2021 06:43:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63D461BF3AD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 06:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7703781025
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 06:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VT8VjNwLvUUT for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 06:43:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80CAC8102A
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 06:43:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e4so17190715wrc.7
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 23:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1tj5Bl91Q/LGI7QRbc7ezowz8GJdRMHBnR9wYnWU//Y=;
 b=Uw4KilGzlcevf/JWQwTI37Ln61/+WfZHUJXAF4lUukzOpv7g09Y7uCmOiQXbm7FRfJ
 lLuvzCz1BXcFgvhnm6FknSh2/39TqwU0APd1eg3XVW8xB/Oo5io8KNqM2WlGJpU3S1XO
 QClxpHpUnAT6pSCqsC5L6A6SK61hM7QrfFdjT2hmvfZkw/HTNNx8n4Kl/Oyj5G2ByzR6
 RNy3sGTGZF4GH4eo+DkS7VIDCY2JodxeHrHj2p1lAKBnBKK4nCap88+LVPjlnY3qyeGq
 2T6O/M44QEtYIadjCK2Org+aR4ZQu0U+oEUSFi+JyVM5zGSULnbubrqEm4yNtbnKYFiG
 SnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1tj5Bl91Q/LGI7QRbc7ezowz8GJdRMHBnR9wYnWU//Y=;
 b=XEYJkNbG5yr/tszQ9E2pxdpGkYRV4QAA7DzREmpUUATkq/GVOZ6ZgaaO05zNyNzXSF
 tjYEOqKW6dyLUa8UNFVh+PCQz8ugEY34KKctnKPJCNl/OZ1jZ7kJU/0w2MLrdFiF4hSb
 gFg4Ev6lVlmZXU3v/8S3k2+Jc0N25L7RBLPahGZ0+R+BjbCaI63Yj4FJN4v+SNIOaK8g
 VjQ9pyQ6sBYVdnJKbbyj0ghPNU1BmUC7wRf+ZpJ0D0nBpGWhM8YxZ0Ze99B/eao+RATN
 JBB6ufqGMte9pT+5VYdsJ8cpW82OP07YWhfdAY7V/eTVkh1Dby6kjCsqT2Spb+XbU/2u
 5Rfg==
X-Gm-Message-State: AOAM530HlPEBBfvFjy/0EWkh2PiBggxWmlzVLqF7AxY1qJLknPF1back
 tvuB6W3BPF0AQRl5RQwOhKHBv42DDfA=
X-Google-Smtp-Source: ABdhPJzhT/tz0KifPmqwWKcxAC0ccrC0Z2zgSpqKCOCo6rPjIDOQLwiC6vUMutKMahy8GMaqeXa8FA==
X-Received: by 2002:a05:6000:44:: with SMTP id
 k4mr29658279wrx.68.1635230586351; 
 Mon, 25 Oct 2021 23:43:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id f20sm21056119wmq.38.2021.10.25.23.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 23:43:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 08:41:25 +0200
Message-Id: <20211026064125.3800163-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: add
 host-python3-six dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the wrong assumption that six is not a dependency with python3 made
in commit 95a63a34ac9204c4fe069154783bd97ed48c3ae2 to avoid the
following build failure with ca-certificates:

Traceback (most recent call last):
  File "/home/buildroot/autobuild/instance-2/output-1/build/ca-certificates-20211016/mozilla/certdata2pem.py", line 31, in <module>
    from cryptography import x509
  File "/home/buildroot/autobuild/instance-2/output-1/host/lib/python3.9/site-packages/cryptography/x509/__init__.py", line 7, in <module>
    from cryptography.x509 import certificate_transparency
  File "/home/buildroot/autobuild/instance-2/output-1/host/lib/python3.9/site-packages/cryptography/x509/certificate_transparency.py", line 10, in <module>
    import six
ModuleNotFoundError: No module named 'six'

Fixes:
 - http://autobuild.buildroot.org/results/2b6872eec31362bf3edf88c69b67d681b2f016aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-cryptography/python-cryptography.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index e21b9db042..58edaa9778 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -14,7 +14,7 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
 HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
-HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-python3-six host-openssl
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
