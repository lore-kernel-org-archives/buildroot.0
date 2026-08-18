Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC43CC5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 20:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D02480EDD;
	Tue, 18 Aug 2026 20:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFCKdvj9-GH2; Tue, 18 Aug 2026 20:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787086611;
	bh=bFgSpq6vpjf17k+5NSIvCQio5nL2a3fvNfiJ8pkPcVs=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ry9h0wInGEqxu/Ln75AYZskEDlprwkaIeIn9zZfb+oKJnkbrp1KKqsyBKWDxvbGJq
	 NSp8NhmvlLBfQLSdRLLfPFn9wopIt0nCfDGNKGGBzhzT+njqnGR6NAL6pIIN92620c
	 9x0rX7heCo4HZ20OxtkzX4xwQ0IjkDhZup4u2thHVoBL1QsnAoDgV/ybt7N/48C4S9
	 6aZJCWDG0QldgF7fkoRv18JOW1+mGO7sWJU1aDSur2J/M0pzFUF56I3FkSJYHfe3Hv
	 6Z/+U6JTLDnrmxFDxhtbVXtdYoylNk8G7PPkVfNF24sBONXtw3f3nXfJeIeSOz1sN0
	 pXa1v84IdK/Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FE1E80EB1;
	Tue, 18 Aug 2026 20:56:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F96C27D
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3157280ECB
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYORA_o1JYMa for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 20:56:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=anodize.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=Cgra4lZ2
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5E5A80EA1
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:56:48 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2cee9b74ee1so1997915ad.3
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 13:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1787086608; x=1787691408; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lhtXkfCcMUkaj50bHrVkzqcLhpLpPs4TtF34sFRzXuI=;
 b=Cgra4lZ2pAqoE+BY76pDelO9ZWlcnHsAFaLlQtRyigAR8BAgo+qseogQj5sjpyjikG
 I1rRL2lzaI5hNXtHislM1xPlQqPnK5ByoPP5+7meccG5AToATpbjJFFWD34BDMd2vwPt
 +ngdxPYKkbEPWuD1MseJpMPacHFouq2HMBVAgvdJwmYSgjztjix236MomOQa5+RoqjeJ
 kHO2Va/BpPLLxtQn6pgRss3L7xTVrXhnAyc0EBcG8HmM8ePXWR+xynltTpCVWQ6567Z/
 cyk3fIp4GUhyvvXim/WY2+OMwtuRv7hzRF0DdnOVhVaMPRXEXsJaAq8tQoqXeWnfVE6a
 3noQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787086608; x=1787691408;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lhtXkfCcMUkaj50bHrVkzqcLhpLpPs4TtF34sFRzXuI=;
 b=FPw6uR/PPPHLxHWTI+YAcPT+2KIPrl4zq+xnWqx7B0DhWM486c/D3BlKftSAykALQH
 YkDpwzWiGpRnKwR3VgnArCXln0JXqMoI+RgsSCFUZH1+Ch5uQhOvQrlPlbc8SgiZDgmF
 EwkNzdJLf8M5Wid+Mb/YMGBs4sM891obhekIsQRmZTtAcc0KE2JFritHYmEKXjOVyN2G
 gp+JirST/5gkdIZFp2H+6qSrm8+/xCB5AjpjqNRMHp7CSML03fnV/RjMDS4kHwWWNi53
 NHSl6SaAG8wQpn2/ld1ZZQjGWtmebPosN7Vck9cWBGrEDvRM+fynxPE8eg/sBx000j6t
 as/g==
X-Gm-Message-State: AOJu0YzFlYZ8i/+wxdQtYdaLqsikCI1wYFwiGIuVeCVt7ZREFz1R8Fyt
 pY+Yrytoxw6KfnM6O7VJ7IRKOM8hPA8zORUeOrowmhtiGwO9+TUVE6JK7XfV1RXvNkYx13SHCIZ
 AV2w04j4=
X-Gm-Gg: AR+sD12OY1g4j+dj+1n3IsSQaNKNGB+sU8huxOH5S7FdpOzEYr6BJEMQERcBYV9wAn1
 tjxMxzS0tcbbYRJECx9KQb8KmWUz75BYVA5LqSWS1NvmdFbRDyxqXFN+gz577ZLkzxDHBv+ObBZ
 Xg0SpvjpRUQhoCJ9fGUgW+Mxvqb/y3YSvJ9Sam1IQoKv2Gujv8+gpZQcyYGUh2S8VDzVSdoi+Dr
 xY7kZdZQcu/mzyRN27HA+tJah8Ommr3AQJwkEa9IVHWtWaHMfevYNpkzCYmeRr8FM6O8CZK4whm
 dmZL9SONIsCORaQ9Zxj8rylWBDqX61YzjlmY6wuVVoSnAuAs1Glx9KXa6kJ8rkK5C1MrkFxxliJ
 0jgiRDyUyrkjGjMT6ig6fqkl7JGckk0zHrICHHtT5bFZFi0YjW2TGPldh1yDpfRhHg5DrSBHxeo
 gLo1f9cNpK+J3weny3rPNRL5CQrleZtqL6nbO49bbJW9QWuxNkVz9m4mbw+RE=
X-Received: by 2002:a17:902:cf08:b0:2d5:ccb7:12c3 with SMTP id
 d9443c01a7336-2d5f6c98a2fmr9875825ad.2.1787086590582; 
 Tue, 18 Aug 2026 13:56:30 -0700 (PDT)
Received: from wash-4.local ([50.47.124.161]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d5bb51e0e5sm21159135ad.32.2026.08.18.13.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 13:56:29 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Tue, 18 Aug 2026 13:55:33 -0700
MIME-Version: 1.0
Message-Id: <20260818-passt-20260728-v1-1-aa8bc1ce2c5a@anodize.com>
References: <20260818-passt-20260728-v1-0-aa8bc1ce2c5a@anodize.com>
In-Reply-To: <20260818-passt-20260728-v1-0-aa8bc1ce2c5a@anodize.com>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph@anodize.com>, joseph.kogut@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787086588; l=2380;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=apQO8oegYOQ1owP9rz3zVHpKVyONMivT5v+Uwy5/6bA=;
 b=JFRg0sXgXnPOP9CLsH2A9/Zd9H0oTBOSS700cbRuEOG1B8bwFpSX/nSFsQtMKQ7IPXAH9aU8B
 cgM1Ie2+zYiAOth5IkJ1Zinu7E453TueuEMlSFXTxe/Eo6hBYiYfSEJ
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
Subject: [Buildroot] [PATCH 1/2] package/passt: disable on uclibc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream lists uClibc-ng support as a "nice-to-have, eventually", and
tracks the required build fixes as an enhancement:

https://bugs.passt.top/show_bug.cgi?id=5

passt relies on interfaces and definitions missing from uClibc,
resulting in build failures such as:

qrap.c:145:25: error: 'ARG_MAX' undeclared
tcp.c:2926:34: error: storage size of 'wnd' isn't known
tcp.c:3321:47: error: 'TCP_SEND_QUEUE' undeclared

Disable passt for uClibc toolchains and propagate the dependency to
Podman's passt backend.

Fixes:
 - http://autobuild.buildroot.org/results/7e4/7e4434e01baece4d090e44b4b3713f2eeefc1e27/
 - http://autobuild.buildroot.org/results/3f6/3f60889b4599f1bc42a69076f6fe469517ea9ab5/

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
 package/passt/Config.in  | 6 ++++--
 package/podman/Config.in | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/passt/Config.in b/package/passt/Config.in
index fca1dff7c5..d06cc3e482 100644
--- a/package/passt/Config.in
+++ b/package/passt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PASST
 	bool "passt"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
 	help
 	  passt: Plug A Simple Socket Transport
@@ -19,5 +20,6 @@ config BR2_PACKAGE_PASST
 
 	  https://passt.top/passt/about/
 
-comment "passt needs a toolchain w/ headers >= 5.9"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
+comment "passt needs a glibc or musl toolchain w/ headers >= 5.9"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
diff --git a/package/podman/Config.in b/package/podman/Config.in
index 7884171380..bbcb15691d 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -72,11 +72,13 @@ choice
 
 config BR2_PACKAGE_PODMAN_NET_PASST
 	bool "passt/pasta"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC  # passt
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9  # passt
 	select BR2_PACKAGE_PASST  # runtime
 
-comment "passt/pasta backend needs a toolchain w/ headers >= 5.9"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
+comment "passt/pasta backend needs a glibc or musl toolchain w/ headers >= 5.9"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
 
 config BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS
 	bool "slirp4netns"

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
