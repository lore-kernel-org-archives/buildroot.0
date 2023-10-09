Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AFCCD610E
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 17:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E136409E1;
	Mon,  9 Oct 2023 17:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E136409E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqUs6RdNmuP0; Mon,  9 Oct 2023 17:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 930BE40CA5;
	Mon,  9 Oct 2023 17:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 930BE40CA5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 213191BF2A1
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 17:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1BE980A9B
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 17:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1BE980A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oq-HaTbDF7vN for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 17:04:44 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC49A81F6B
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 17:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC49A81F6B
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so807017466b.1
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 10:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871081; x=1697475881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F6XkCUqw+C9gBsuXvBFsoH2TiAAHHVhoIz6Ub4aV8KQ=;
 b=vdg8ivH5gzWAp7/jWM8DTGq+gPml8zp6pDrOO3JsUV5QrkYp8SwzdiCm8wqOKUlPgY
 AsMDcKIhh20ecLeGExxYPV0+nnXszIPQMw6Kl84lcuu3Mo8XaZCTtD87GU5Tij4cD/en
 XxZehpMpOqDG32R8bT/EuQZ2mCZcStV294rAYLCIr9VX+SZ3jB157pe22LQLe4RHZ7e5
 MnYPU5Ux6AvwZx5POSix0HZw+6NR4SSEv5xyMZNJ27PcyGsWlGjfghCUDeGiw6QzJsWd
 EhV1REz4CXtEBbSRi3ZQKtu9+8B0ZCptLm8VUtZt4uQWcizruoOS7OExKSCSLXsEj+mN
 UOSg==
X-Gm-Message-State: AOJu0YyV8C0vpf11uSIpGlNHMBliY594H5DlbJrtvhTShRqEUVBRvqnE
 RKlWsOwYHmZWaD4kgrq9zH52bW8UZWNvB1RHnfQGDg==
X-Google-Smtp-Source: AGHT+IEag4ATKC4X6kUFSHEw/xf3nWTyDux2EKV4Q/0/cPLFYOCuZUJheVyw1iDxN7yu6m+7G8hkTQ==
X-Received: by 2002:a17:906:cb:b0:9aa:338:4a0f with SMTP id
 11-20020a17090600cb00b009aa03384a0fmr14102027eji.72.1696871081034; 
 Mon, 09 Oct 2023 10:04:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 jp20-20020a170906f75400b0099bcb44493fsm7011066ejb.147.2023.10.09.10.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:04:40 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 19:04:28 +0200
Message-ID: <20231009170428.2836853-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009170428.2836853-1-adam.duskett@amarulasolutions.com>
References: <20231009170428.2836853-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696871081; x=1697475881;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F6XkCUqw+C9gBsuXvBFsoH2TiAAHHVhoIz6Ub4aV8KQ=;
 b=U+KjGA/kdn1ELaljm0JRv7t9u1Sx8PlIajAfNvdA7ZAPghf3RWj7PEvfmAHmnxuGZn
 x+iQmfWC6Eec6sh6om+jr4gW3ATSwn7KkWTD59AIVk6sGirAAQ0VXdsfs8C0VmLF5AsB
 egWrqoMNTko/H3/VPm1CoCH5YeibYnv6S3K3U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=U+KjGA/k
Subject: [Buildroot] [PATCH v4 2/2] package/refpolicy/Config.in: depend on
 merged usr when selecting upstream
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Refpolicy contexts expect a merged /usr file system. In fact, there
are no references to /bin, /sbin, /lib, or /lib64 at all. However, if a user
wants to go through the trouble of creating a policy that works with a
non-merged system, they should be free to do so. As such, only select
BR2_ROOTFS_MERGED_USR if using BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v3 -> v4: Remove accidental removal of upstream patch in this patch.

 package/refpolicy/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 0e72b895df..d2fe391d8d 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -36,9 +36,13 @@ choice
 
 config BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
 	bool "Upstream version"
+	depends on BR2_ROOTFS_MERGED_USR
 	help
 	  Use the refpolicy as provided by Buildroot.
 
+comment "Upstream refpolicy requires a merged /usr filesystem"
+	depends on !BR2_ROOTFS_MERGED_USR
+
 config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
 	bool "Custom git repository"
 	help
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
