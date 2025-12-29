Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A969FE784BE
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 00:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 371798146D;
	Mon, 29 Dec 2025 00:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYz3KONjDp1P; Mon, 29 Dec 2025 00:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA0408144A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766969944;
	bh=grTusUT/KG01LPx9b/+cjksfDj0VpCb+6OukTg6hz+s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bx6LGIpqjHN1VqKEdv+wZlwHzXjF9Sh5OMziRoYgI1U5KWKbnI2PijWyO6Wk5+T1U
	 kwrahRk6et9OqDzyfO80VM2gwenZvvr9+pMTKWcln0SUAXHFHG/zlML0y3RmWO0Vyr
	 gTG9sa/cikHetIMpz7X0ML7LWz36oD/PjWS1cNuGM3pJNMVBRyaRoaKLcxrVMBxWWQ
	 8ZeEK+U8yMIWRFq36MiN2DgdKO6oKZrqZ3EKIXObu7up59+SScPcNhTfr5S6w/rFAd
	 KYa/AcH75SYqQbJNSbsJyzNvUPiEoYaF44aq8Kz2UH0470E+/RKV60BN/4U6GiVMFK
	 a8Khf2hxsYtEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA0408144A;
	Mon, 29 Dec 2025 00:59:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB83BD8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 00:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C184260A38
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 00:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgObTmxAeoGB for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 00:59:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 323A0608F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 323A0608F0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 323A0608F0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 00:59:01 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-455af5758fdso5658155b6e.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 16:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766969941; x=1767574741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GVQxYHSPncLc63CHvLgMrJGAtHrrH1G9PZyE4inqfsU=;
 b=O6JbKsDyTXsER1xhUAIHSZJp0Os41z2xTyhvledD0vqrspWo5Zzjn2OpLcOE/ACWUO
 GzYAimGZY6JnBU6ZymWfETz4k1SK+PCGKQbur3jZ9JexkMuac45Y3rB0m2we8NjbA6av
 +AE07ami4KT613CGsK8qBmYRrQgwUY2HgODo6s+rIAKLi9jaB3SEomWcWO9kWkRmjJMr
 GbNMYyu28f07Ut1IqREZkhnWRYdAsILhNj3DTNjtjNdJXF9mNBZI9NJsqoDgQdjC+KrG
 i8SvAFQ0amc9l4iXuqgauuM13FXFjJx6cG0JUzmK4nLX5rDcJ3b9R84jNSx+081mQLcc
 2odw==
X-Gm-Message-State: AOJu0Yy8UNVqe8jKxHdn/v/XJUQAzeKqMVfkMnlqBLv5S4FzOGoB3PHJ
 Mp3A17bGdacStygoeCpL+fB1/EkkqT7KPQj6L9rA7pgJ6hFVwGQ+Saxtsmxj/+qjSjc=
X-Gm-Gg: AY/fxX5l+Wn2+zfaKhrkOIHriW4XFwllO/2OHhPKS40aB49vlRfm3UNllObdaF+2LCp
 /qbyRJMyZ27i3Sfefb4tOIXvWDzdZm4SL6a3s/fqRk9clxB7tQQspQ1o5W9IUIs+lq20cqjiNEe
 ie8hvDeNS7i5jNIhFolL7pLRDxFarsIb7kTrcrTt21qtwOtakyCTUHNdaM7PPtgq1bYn4d8n2qP
 ymXmNKdFp/e1rHAcAT64gUM3C7HXCbItxgOUdrzyWQj+0xGwa0DI4QGk8OuxJv8xCndulXgNHLt
 i7+pBc4VUmEiZxUwATA5/9e8hHTEoCpDvR1hFVlNWcW+QUQE7xIHKICeAzHA+VoR65648F0Tr7M
 jO80JXFyXgpKxfEUpdPa6Jxho38V3eOf0yvVi8jHL59qaTz59wwhTlcwONpDZdEQeVvr1IZsKIG
 fJiJ5WkQ7LGX8FfyqPsRtPWUgBEy6K+V/b8bmCXXQxLY9eqgYRrVn64CMHiR05/QS5Vh4TyT7Mq
 pTGb6RrStTXDWp2sY6uioBucL+1GvL8ooxn7GgMSkoHGcOtUbi3btI=
X-Google-Smtp-Source: AGHT+IHiih7uqs9E2W/jirGfnsVV+F98pngLSIHSVWI1u77VYtAGL6jM2R0OraTMUtdyP/iylpsU9g==
X-Received: by 2002:a05:6808:6708:b0:44f:6a32:535e with SMTP id
 5614622812f47-457b20eb6d2mr14216973b6e.10.1766969940708; 
 Sun, 28 Dec 2025 16:59:00 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3f1db46sm12733211b6e.21.2025.12.28.16.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 16:59:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 17:58:49 -0700
Message-ID: <20251229005849.3125827-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766969941; x=1767574741; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GVQxYHSPncLc63CHvLgMrJGAtHrrH1G9PZyE4inqfsU=;
 b=EMqCIpHJ10RLLII/y3Xifp7ePIfNf/SJ3DmcYF5hCHWZ8gaGWtjZW/RYmVtn276D3w
 f0K9Qxy5tKXkaQJPNzYEj9cl8UTK0Sc582CTwDbh3STM25ufDUsqeokBp78hJ6+w8rlB
 5L5SHV+vEsP/ay9/SlNclc4tc0Yhb3jxPVc6DnBTSJK+q0cn3qPCyVtVXu3D7E1W5JG0
 nG8SLvEYP320ZIqbecwslZ89F276n2kkFcCywO5ynnaGBNP7E+bBjSU1zKvQMV6lxPrp
 SI+F3LBDBwnXo7A+onMokDvpot61kkCPbBxjRBReV1Yly/eq/0nve1XPBsS+rvHkrMMi
 k++Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EMqCIpHJ
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 2.48.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 3d049e8153..10a54a5387 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  682375882fdb40251c22250d48036468  sentry_sdk-2.47.0.tar.gz
-sha256  8218891d5e41b4ea8d61d2aed62ed10c80e39d9f2959d6f939efbf056857e050  sentry_sdk-2.47.0.tar.gz
+md5  bb7b7afd707b67117b53658abad8e1b2  sentry_sdk-2.48.0.tar.gz
+sha256  5213190977ff7fdff8a58b722fb807f8d5524a80488626ebeda1b5676c0c1473  sentry_sdk-2.48.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 6714cac6b8..216f4999e7 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.47.0
+PYTHON_SENTRY_SDK_VERSION = 2.48.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/4a/2a/d225cbf87b6c8ecce5664db7bcecb82c317e448e3b24a2dcdaacb18ca9a7
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/40/f0/0e9dc590513d5e742d7799e2038df3a05167cba084c6ca4f3cdd75b55164
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
