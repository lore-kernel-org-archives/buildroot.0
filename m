Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47764105F79E
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E23407CA;
	Sat, 14 Mar 2026 07:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Hz5AMZPJHfp; Sat, 14 Mar 2026 07:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30D6040F6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474812;
	bh=RBkkS43vdu+9r/YgZU5kVqUa5ji8WLerj/WxOJKrqGk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Bj9tJKZ8FyT6zGU/DLdEoLlUd1V3JLhXwjsRBWvxzSxfOESji7LLvEkRjw6zVigVa
	 ZzdogY4GCez0a1/oFr4gGazph9m+E4/Zay1TSlfujp6R+WK4aZ8pBov9/66ZbPPFx0
	 vjyNsWq9irOt9TSta3a6XTeyd7oofHgirf5YJ6KQM56rmqDQXcClr4cyDTOKqNiVxS
	 +XNnsKVVjvbnY4GBbcWpwdG1JaWWokW9eC9B2P+deOT8euYxetHdQTMq37JTvHBSUF
	 eW9Aanfg8/XyyBrxwbnl5bMPE7qyq6XvCpcLbuWLCdi1/2Gdbzljb0O+iOuMwr0j9P
	 ZF7knq8eIKtQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30D6040F6A;
	Sat, 14 Mar 2026 07:53:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CADF1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2E368229D
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UejhOdKOrtQl for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D194D8229A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D194D8229A
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D194D8229A
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:26 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48558d6ef83so12259245e9.3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474804; x=1774079604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tRNE7z4ZKxGf2yjV9/fIJhptfet9fgreUag+v9OX/1s=;
 b=rSPSQySPS3XGTFLFztcTZlL15uiqdrQYlJfMF7ML5vWpetrmjggua7zxny1VgNrqh9
 IvL4WX0v2GZDnVW1RzYtziewkUlT2gmALxygwz3Y7DsyEsBYakQlLt1OWKTE/XR2KD4s
 zQQcfvTyuMyeX/shnkl9PZhMVYZQ/vpulcaJWYUE90kVH6dH1Vg705ktM0QEm9m7WPIQ
 yT5WDDp3HedahR7p07B7UhbH/X9ToobuLxtq6KJeAcs9YxEnxN3gBLp39HbCTBIWEBOd
 60mCIoSxVpaZLg1au8xDJslsROc2vBDPNA774ZFSodi2KoLXrTLVV9Q11mNrlAgJCwgQ
 mwEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf4/DHgWflGDkZPEUv1EmQiDjMtOjK8aYQJroUUC45ieveUy6doUz02TmBgJEzdWNHjV0yf8SXsM8=@buildroot.org
X-Gm-Message-State: AOJu0YyNLSx/zWXePMEtEcBUEUj3b/VgwBpPg6dA/B8bkWCwrM9yisvL
 hNxyGTBr97vjTMF9E+5IfujHuesUBL3bL1TMT00B/R2meaoKcrl3wd4NlStuC54tVzQ=
X-Gm-Gg: ATEYQzwAqyOPbmI8dfXq9qnwkjn3ZlE8yX0+SVCHvqZrqOa58d8/BoOZnGRHq0uLeA8
 xEdSxu6C5X2ChX1KpXDBAPl7Dwn6CKDPCkD+Ht85v3InFPK615TwyPpKkZDhOdJeD4Hp4QTLVdP
 rHdcbwYzuUxyCRfPhWQjrmD+R7EQqFZNNkrYFfs4ZzUqD8DMOGn+Xn8t00T4wKxIgvXog76bDXS
 o3NvmksQcHUUmLSnwWq9coUOY/c9azjmGolYfgvQc/OwqhdyIZKWP47NA0RVBVmxn+l+Oaw0i1M
 +INa/iczkUWe2I/r6wbOmdjoy4rlUX+W9SGth10YGU4xxcKUSYzDQFYbYsonJaqs7Kw7IZrmzoU
 fyr6LyUtAaUBhszV0t1wvz+ZdO9InC6EY7/T0al4Vks/mYxvhO6qYbqcChuQeIWjBj1ivQxFdQQ
 h4cWybGk0EW8aRAMU=
X-Received: by 2002:a05:600c:1e8c:b0:485:40c6:f516 with SMTP id
 5b1f17b1804b1-4855670e79dmr94330965e9.33.1773474804257; 
 Sat, 14 Mar 2026 00:53:24 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b6756e4sm301907245e9.15.2026.03.14.00.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:53:24 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:53:23 +0100
Message-ID: <20260314075323.14729-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307093629.22188-1-bernd@kuhls.net>
References: <20260307093629.22188-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474804; x=1774079604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tRNE7z4ZKxGf2yjV9/fIJhptfet9fgreUag+v9OX/1s=;
 b=h8aKLYrl7OOGhqb4EM5AGSlt4dKlbei5ZrL6lASQ4yqeRTGqH2ua9EhJ/0Q//jupql
 BVSDN62gwQ7qBekZlJRM/UUM3eelv4y93F0K8viGvXp15BQPNbI4U7a7wAwDqgRilgr6
 zUJeZ0QtV1afp+3WKl1Z3xtiQtuajFJc70bZ2RRnLVT+AB0jnPupWLo8ot9JES28YXvH
 9/oM5Iep8plEhQIotxTNsPyOBH3HthxKjow5GZXgIv1t+jsqlJmyV8jD6ED9QBtzx/gS
 hBTb9kb/Bhx0ffGE21brrGKTuY1y3hZtzaJq8/xJ76pWK5EU0Kyy9EXCCybDuhufYq6Q
 gkSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=h8aKLYrl
Subject: Re: [Buildroot] [PATCH v2 1/1] package/docker: Fix build with
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
> Add patch from Debian to fix build error with gcc-15.x
> 
> Fixes:
> https://autobuild.buildroot.net/results/495/4956555fd033d43c1877e66141789bcd06aff5be/
> 
> Patch sent to fork which is used by Arch Linux:
> https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=wmdocker
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x & 2026.02.x. Thanks

> ---
> v2: updated upstream URL after commit of the PR
> 
>  ...tibility-explicit-fallthrough-undecl.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch
> 
> diff --git a/package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch b/package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch
> new file mode 100644
> index 0000000000..c0dc18d17a
> --- /dev/null
> +++ b/package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch
> @@ -0,0 +1,38 @@
> +From 55054532589041e3c7b970fefaeeeee871f4f6be Mon Sep 17 00:00:00 2001
> +From: Tianon Gravi <tianon@debian.org>
> +Date: Wed, 25 Feb 2026 08:24:26 +0100
> +Subject: [PATCH] fix gcc-15+ compatibility (explicit fallthrough,
> + undeclared/unused arguments)
> +
> +Downloaded from Debian:
> +https://sources.debian.org/src/docker/1.5-6/debian/patches/gcc-15.patch
> +
> +Upstream: https://github.com/mdomlop/wmdocker/commit/55054532589041e3c7b970fefaeeeee871f4f6be
> +
> +[Bernd: rebased patch]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + docker.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/docker.c b/docker.c
> +index 4cc8d78..6105ab8 100644
> +--- a/docker.c
> ++++ b/docker.c
> +@@ -46,7 +46,7 @@ void signal_handler(int signal)
> + }
> + 
> + 
> +-void parse_cmd_line()
> ++void parse_cmd_line(int argc, char **argv)
> + {
> +   int i;
> +   gboolean help = FALSE;
> +@@ -283,6 +283,7 @@ void event_loop()
> +       case ReparentNotify:
> +         if (e.xany.window == win) /* reparented to us */
> +           break;
> ++        /* fallthrough */
> +       case UnmapNotify:
> +       case DestroyNotify:
> +         for (it = icons; it; it = g_slist_next(it)) {
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
