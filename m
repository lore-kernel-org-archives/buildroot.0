Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C04CD342F
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 08:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D174841F2;
	Fri,  8 May 2026 08:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xM8mKty8JG0c; Fri,  8 May 2026 08:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3733C841E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778227829;
	bh=q4UsC0uCX2eb8dF3Fzq7MpXHsBZQCny6ABFXPGNdD5E=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YecDqVsNDSQP5PO0vnlgd0xihIZ4J1lyhVcb8RpqRoa0bmUfomoLSyYg+ntmt/RTF
	 1WHS2tgBYCNSwIHyzU2589MUOEjo5R30kuhjBgc3gezc0pv1xtByUkgFmdLZ6oT+83
	 cvUzB/LECIA4ccTldw/9c2sIaeVsb53g+y/+Z1rmTTyJhWLJrEwCv6I3BOpyg8iPah
	 evaGzSPrBc41XI7gAnn/b1Mc/dLrArqW0qlRLHFYlYIplV1OdVEoqmVHfwxRU61Z9n
	 Xx4vmvCH8pXLovR7A9Fr2NOksCYWmm3koxwJFBtTn5+O87TIOEPGj1Dh48uOchP4Zx
	 eC2uksMYuzjjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3733C841E8;
	Fri,  8 May 2026 08:10:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29520358
 for <buildroot@buildroot.org>; Fri,  8 May 2026 08:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AD2540C56
 for <buildroot@buildroot.org>; Fri,  8 May 2026 08:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rf4DC5Nms5CO for <buildroot@buildroot.org>;
 Fri,  8 May 2026 08:10:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 78B9640506
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78B9640506
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78B9640506
 for <buildroot@buildroot.org>; Fri,  8 May 2026 08:10:27 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2babfd18435so8801315ad.1
 for <buildroot@buildroot.org>; Fri, 08 May 2026 01:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778227826; x=1778832626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bRMjiNpJIe44gAk8pLQWjaLR1zw7GbDWZUDcaAMY8Y0=;
 b=Nk3kSPp8LW9KtLVhrTLU3Q+RpBN62M2vumATrLYlP8+T4pr7/iGwbslFi8x0a3HFrs
 raxbCpkREi5d4wJ0YiIC3fnBiy9Y2KkT5S1lMM7HLvQjNTYvI8+CRcvb960hia0foO+U
 7IQuFs+sRx5shJT4tWAR7D3Xk6v5pfgfUWfpIkgGte1Qdk7GgtF6JcIFQhJ9nSW7Nh5y
 0Nv5wwRnGtFeT+KVC7L/A9pPbiiGqSLSNDKfjxfMKaEnQRTU5E0fqataZDQEchivi7Cv
 q8tBxkr1JRZD3yN1uVA0HWsffp8Z0NVAKpFz/KsML7Ce4Whnro8D+H/N8O5NaTt5TSM7
 7WaQ==
X-Gm-Message-State: AOJu0YwzGChy7xkox/kk0Jo3arrqIGw35laEak4to6RII94z/i9n1yRX
 eia6cJWSA/XpGiV6QLy9oV8jdBvF0PYbGOvC3g1wAX/X9zGeGtb9NWf2eGA4gG8A
X-Gm-Gg: Acq92OGramOV73F9rGWxutQhleoE/KePmRZs0kaWeuZyXMzarbjHi26i3D68HacKnfO
 tyXz0+t+TVg7JCVMuhF9wF3UmZC262lBS6cIJ2D8/e6Tl+54S3bXkD1aSarOKnpVa3i4tTMy0e1
 0ZvNVTJRmqYiv+TlrSO9TYNtEvF3b/3OSk0PTlNc0dZjACJHUZxxAzTV/0IHA+qVunZYj/D63Nk
 DoJzXb3VIiUJmM5nY5yAseFuojn01DNJzw5UmIxYN4l507uHaqRSXVvvUVAgjmZJP3NzSdWk8a4
 vWBo6FZ7CgtU+g3XmA2eQoqeuppZ53MqOSF39iQJ9xJjNoBrCDuKE77b+ZFz2BQqpbJ6T+gcdbk
 uNeT4Tx4U2WbYFxYz9sx0qyro0JVWTj5zDv+DBTbEnExu4LieQ2AZB/5UASo72bzcNBmkLwcu2s
 YtKfgV5T0kOp/gDzjhLu8t5SVheOjPHtL16kfhWlgaFyE3SerONuEJZDZ0Drym/SRJ5CTG
X-Received: by 2002:a17:903:2844:b0:2b7:ca38:975f with SMTP id
 d9443c01a7336-2ba792877bdmr85934015ad.23.1778227826113; 
 Fri, 08 May 2026 01:10:26 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:116d:5714:b897:b3fc:b3f:3166])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1e6199csm17766425ad.55.2026.05.08.01.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 01:10:25 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri,  8 May 2026 13:40:08 +0530
Message-ID: <20260508081010.250838-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508081010.250838-1-chakrabortyshubham66@gmail.com>
References: <20260508081010.250838-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778227826; x=1778832626; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bRMjiNpJIe44gAk8pLQWjaLR1zw7GbDWZUDcaAMY8Y0=;
 b=NLNSCdYYRLcib0sobBsB5RVEEXrK3oS70VQU7O9jvr8jAHi5MOr3XaaR2ZkJDTEiYP
 m2pkDovzT0Y/9yPjlCyYNRti7bOJEL+WlqfmW0x2jmCYuFZbY5BghcGqbJXBT54noxFh
 S9dx8V9iNByI2NyC6mSpGAOq1sq+h+LHfpcHouLNyGuJgXBsDOrA2ZQsPCMPjwXQ7nT+
 uBIm+apOnS87YXoQvGT80bnIyzov4mxNHG6vhiZYvu2ilyxYzL33vtjlRMX5cCJs1Cbo
 n3PtJp1lvXk6dnMnJgYhzNcxVMo5dT08kXqc+mYKwLxRRCAAKHj0WC91yCUxkMUQzYrQ
 zDtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=NLNSCdYY
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: added Shubham Chakraborty for
 htop
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

Sined-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fd973d7f86..ad3fdfc5a6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3050,6 +3050,7 @@ F:	package/wolfssl/
 
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
+F:	package/htop/
 F:	package/hyperfine/
 F:	package/pv/
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
