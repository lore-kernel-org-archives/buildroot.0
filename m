Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDAEEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3D0341F5F;
	Fri, 13 Feb 2026 19:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRSpu3_u-dNU; Fri, 13 Feb 2026 19:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E340241F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011440;
	bh=pIhXrf61uoqu6IaSv0FTIJmHTEouohWObiKPlIoFKPo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FlaUC6SxwCesE3QsbrZaDhHUimt26wdLdAcZt4BYvKqgxuld4FO0zoPIuv/Z1v3v9
	 GPfCYPfB6Z1/8x67t/Yn+f0JzxcbyVM3CUh9QR1VuBnxrMUoFQZDhg0SyLyseb+8ac
	 hmULrIHRzRHKs5jI12wGA0zT7Wz4xSqubXRoREq6H82TL/ZJg8MASvK12DkPCfgD3H
	 qHXKj3utk+qNSsGHgo5RZXiOxp0St2aDTZyP//+EVsLPH0XhBnPWC3treq5r7iDJAk
	 4VU0eTdRQLxElVFy+n+0PnPPrmZ+zOgLC22cdp9/W1mcKsXNJCU1/9hjzWCS5dRvkV
	 VVBRuBlhViT4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E340241F52;
	Fri, 13 Feb 2026 19:37:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1170E69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1B3F41F1B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZlJf0lEIsE6 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7282741F11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7282741F11
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7282741F11
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so9679125e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011406; x=1771616206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j0a94d8VU7P4sQKhfjV9Ywd/w6bcWHUIxZtUoVYastQ=;
 b=cpl1FruD3Rb0iFREghIEbFo8Sej3s1GdI6CBNcsQF50H5rFrKY29OD5GcpnujpQB0r
 OnLNEfxO7ZV7yHnOJ1xUPsFdMYKKBL+PHIcKZ3L94+9SwPEegSPRtyuaE6N4NIoIUUEb
 Nxu0b17D+W3Ppb7HwMGNj4iEe+PjZ2mQYS1yaftIqv/Rjc7VYRy2gkWajLxcuYO+9+HB
 2Zq6VWKEmmfFEc7hMOmHNQxXXpYjoYc73NQE5hED2xvLziP7SErQTLMe3aGdI/uYAf+U
 uix8nY32wgCyygqMm9NPjRFyk2pjJNraS83fvyjvTdNFT+HNPRv4820k1YtM0FehMhpe
 dk9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJxclApcN9OLENNTraIQ1mWICDQj5Qj+WRBdIvQILOTU01k4Da3czYMfAploytmEaAIVeQhvQPFD0=@buildroot.org
X-Gm-Message-State: AOJu0YwTe9RRYJeNtfRJc3OJdWOFqReF/KplZ342vA/Srkyg84TDhgYv
 BtpVGcA+eTCIHGlaWIBOJxLJBpCmv3dfcaKe+ccHl8bFANFsSu0SvdrqfMJbdY6WXRw=
X-Gm-Gg: AZuq6aK4dwat9M8Wi7E0f4390GJcSWccMc1W30bgit/w6mJZHerFgrFDcyYHDEoAqp0
 6fVpquo7KO30a/7i+5X4VO1fStpY9/Xcy5RH36emMIDOKvJp2yUK7TQNuLJt8Yabd8/3lMebYdY
 pHEBibzAgVLmDl3r4uZiwfzToHromkFv1Qd64vQwP05JznoE6T1S+STRcs1/GJPCSCMHeraErQl
 DqtrgiqkBcy1Vy3XmtTV8SjLsLdB4hl8cX0q6k7GjcgNHqw5AdM5mDCdSYZGsQhhco6ycwhBHEj
 1SOg5N5sB4BwANpvzmPS8Gkmv2j1m8ADUC50IIH4AtpO8QOMRvIKc98Z0xXSajezWA/BMHMU8qr
 IqflkuqzT2KI5A757RK45I9EeidQzVQ7iCe9TOmLt/Dc7MGrTUk9zsL4f7JrEtszdSziN/KNB1L
 fX+W0+s37VjX39ffk=
X-Received: by 2002:a05:600c:3502:b0:47e:e97e:11aa with SMTP id
 5b1f17b1804b1-48378d4f382mr18334495e9.4.1771011406317; 
 Fri, 13 Feb 2026 11:36:46 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a78c89sm79669235e9.5.2026.02.13.11.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:46 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:45 +0100
Message-ID: <20260213193645.38071-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206113430.571889-1-bernd@kuhls.net>
References: <20251206113430.571889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011406; x=1771616206; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j0a94d8VU7P4sQKhfjV9Ywd/w6bcWHUIxZtUoVYastQ=;
 b=Y0iA6AFhY5BWFPToMqzLzODaIriD28SmbgDS/vuQNLQwrZzwNIZxnPRq9pYrEle7Ok
 BO6LTWiNskUGzBBDgL3uh+7fqwgwPjt181DzoDGrO6AGxBWt83ut9LIB7/LQJoPk5NjZ
 tyzvY5De2rpGCccvMQ0ZlRcMGQhEnSMubSUGr7rr6et4wcG9GcuOjeX56QzOd7ypuNk7
 /tvTmlc/jK9163//gxbbFiiKLKKJvnHGFU/5r5RTMb/ZjXZiGoolqq84yi0xI26Xh0ba
 lxSWBGlYcrZw9IU2Y36FBRXa9J3hwrXfcgK4ojjhbMWaHoTaAeb26oO7cUe+xKrTGFpy
 A7Zw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y0iA6AFh
Subject: Re: [Buildroot] [PATCH 1/1] package/squeezelite: fix build with
 gcc-15.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> No autobuilder errors recorded yet.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  .../0001-ir.c-fix-build-with-gcc-15.patch     | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/squeezelite/0001-ir.c-fix-build-with-gcc-15.patch
> 
> diff --git a/package/squeezelite/0001-ir.c-fix-build-with-gcc-15.patch b/package/squeezelite/0001-ir.c-fix-build-with-gcc-15.patch
> new file mode 100644
> index 0000000000..a472d37bd5
> --- /dev/null
> +++ b/package/squeezelite/0001-ir.c-fix-build-with-gcc-15.patch
> @@ -0,0 +1,44 @@
> +From 787961d52130bd3c6c18b19218219650786e5352 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sat, 6 Dec 2025 12:25:08 +0100
> +Subject: [PATCH] ir.c: fix build with gcc-15
> +
> +ir.c: In function 'ir_init':
> +ir.c:273:48: error: passing argument 3 of 'pthread_create' from incompatible pointer type [-Wincompatible-pointer-types]
> +  273 |                 pthread_create(&thread, &attr, ir_thread, NULL);
> +      |                                                ^~~~~~~~~
> +      |                                                |
> +      |                                                void * (*)(void)
> +In file included from squeezelite.h:300,
> +                 from ir.c:36:
> +/home/buildroot/br/output/per-package/squeezelite/host/lib/gcc/x86_64-buildroot-linux-gnu/15.2.0/include-fixed/pthread.h:213:36:
> + note: expected 'void * (*)(void *)' but argument is of type 'void * (*)(void)'
> +  213 |                            void *(*__start_routine) (void *),
> +      |                            ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
> +ir.c:169:14: note: 'ir_thread' declared here
> +  169 | static void *ir_thread() {
> +      |              ^~~~~~~~~
> +
> +Upstream: https://github.com/ralph-irving/squeezelite/pull/254
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + ir.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/ir.c b/ir.c
> +index 84294b6..aeea23c 100644
> +--- a/ir.c
> ++++ b/ir.c
> +@@ -166,7 +166,7 @@ static u32_t ir_key_map(const char *c, const char *r) {
> + 	return 0;
> + }
> + 
> +-static void *ir_thread() {
> ++static void *ir_thread(void *vargp) {
> + 	char *code;
> + 	
> + 	while (fd > 0 && LIRC(i, nextcode, &code) == 0) {
> +-- 
> +2.47.3
> +
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
