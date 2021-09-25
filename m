Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0430AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:47:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87AD360F70
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87AD360F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F297833B7;
	Sat, 25 Sep 2021 09:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GgFcbigDN2qy; Sat, 25 Sep 2021 09:47:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD5BC83339;
	Sat, 25 Sep 2021 09:47:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 357541BF29E
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31780401C4
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LXY5wK7rSK2x for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 09:46:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 109F04018C
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 09:46:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u18so34923124wrg.5
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aJ6t/MsrHmKB+PUKlC1pYcr1yEJLO8x2vmJw6aCt84A=;
 b=GsKC6VxXs6b0JL9UsfgfQP4tNOQi2fyfNOQ4EgdFAvCZuEAIyAedhsuKESwJeUV37J
 1SJGPL+XA06NaxBpIrCZnNXU8cn928mmKl+e1CHfvEZuaATb6pPrxZwRDAEo+W1yLg0s
 hc4gc3IRTKVYf8tX3QSDnDwYy00APJRmKrlkKdhMzj0QHsWOU6hxs6C4zg6Lu2zuddh1
 THZPcUK/TKg63dQeNwatklScEIN8Nu7SmacAz799uZMTFZdY7DgtEBJDTZjKmnm9pNGN
 BA6DEs0F4Xgu3r1VMegQrhqi4+XYq41jr7MSbWrzSXp1TMlWZHLpZw9ja80g3PAnNz/R
 nkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aJ6t/MsrHmKB+PUKlC1pYcr1yEJLO8x2vmJw6aCt84A=;
 b=j0BhAtAizTujVEuoUyb/+Qa4xE8ZoOtv10zTPgp6WFwYEpCej5pbrl+kAIMmBI9XDg
 zD0vhWLbiMUn52kZbipczFiiRXiORXBPKpX4x0oLSrQ/Fd3/z0ttDS7gvTABdOZNu+ZM
 SoTf+hPQBEuMPuqKpHTmMdT1KWMh/i99sEo2qIoiKp9Z8spLo+et92ziGXdLXU6ntqq5
 +gr4ISkdQO9GlQwtGuM6gtIO2qVSg+1D9zh450JFmvHgJ0dCWHqkcP4pIZeTu2VC+kjk
 76mk0d/AiEQ29AxRem3/TDHfQLZ9pkmNbe8pL4cTZiy1TzdJRd+I3/XneHhWB66Q/gPp
 BB9Q==
X-Gm-Message-State: AOAM5332w4vzqzqQQ8c/PA2wiZaO1hiJ8uE7z5cqSqIBdmx3cpy60mzG
 vU4uZSAwVzv9YMSPM6l1jDfBHt3F8cI=
X-Google-Smtp-Source: ABdhPJwyWSTkLASG7w4N5AO127hs0aNDxGKSrVUg6+w/JlZS+47kTZz1RRM8t2hVDW5JKkwrtTvXIA==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr6358860wmf.22.1632563194902; 
 Sat, 25 Sep 2021 02:46:34 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:7829:fae8:ae6e:81f0])
 by smtp.gmail.com with ESMTPSA id d2sm10297194wrc.32.2021.09.25.02.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 02:46:34 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 12:46:24 +0300
Message-Id: <20210925094626.365400-4-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210925094626.365400-1-asafka7@gmail.com>
References: <20210925094626.365400-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to version
 5.1.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 6b78301200..65af9a58e5 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  b1dab3349efe90934ae3612f1202b733  multidict-5.0.2.tar.gz
-sha256  e5bf89fe57f702a046c7ec718fe330ed50efd4bcf74722940db2eb0919cddb1c  multidict-5.0.2.tar.gz
+md5  df8b37f069809779214d6b80b250e45b  multidict-5.1.0.tar.gz
+sha256  25b4e5f22d3a37ddf3effc0710ba692cfc792c2b9edfb9c05aefe823256e84d5  multidict-5.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index a7043643c5..edf9656043 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 5.0.2
+PYTHON_MULTIDICT_VERSION = 5.1.0
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/da/e6/50c7f52781f45c2b37c77e962c30a3944a9e79a46ea92956e826c24d3432
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/1c/74/e8b46156f37ca56d10d895d4e8595aa2b344cff3c1fb3629ec97a8656ccb
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
