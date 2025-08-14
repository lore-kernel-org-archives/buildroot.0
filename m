Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4C5CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF9DB80E1A;
	Thu, 14 Aug 2025 20:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hM8l-6laLV77; Thu, 14 Aug 2025 20:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F277680E2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F277680E2A;
	Thu, 14 Aug 2025 20:31:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11AAB941
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5801B6079A
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkmZNDk3onmf for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61F8960763
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61F8960763
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61F8960763
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:48 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45a1b0b6ac4so6800005e9.2
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203506; x=1755808306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWRqQnvoBLiLcy6jSSVlDiwNX6sElOACMDQmDiZMLng=;
 b=kYInH3Fbp3MdYzIRQndNf8+C0LyANH2fa0vaG3CwHFcsLY1Jf7IbJfl4uFFv8pT3Gv
 uj2gkrpQFZ/zeDTE9UJz+RWH7ivGSHocPJi1Su1dffZOlxkOw6Ivzx/sWXlKBKGX2qHI
 9lyuXkYXIwGBOLll5qHT56Sw+J2f4MlyWZKno5lFmvQHOaU0Sr8lYKPg/J6U2y0kf9pF
 kiIW5hXa/wIgdNKGjKyYrV5/AWRuVp+5dot9zTZI6ktzmxWPWrrqZj9Gz+Iy153HIhOH
 LtM9M4bM8TpOrfxi7Mlzb+yCZ7TQZshSr7TNgctZVUIgOYsTHNqRLM5GlSmuyULaRAeP
 r6WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0ZoBR9iGT73pD5rHnHGc3j09+dyrRGIAz3Kf3eJMMSDHGRwghgcqqAc8t3l1TFl/esgqovR0VEpg=@buildroot.org
X-Gm-Message-State: AOJu0YyoIvl3q66NTDJzeuxbL0xSeyYFFdYX/kof096IyglAEwgRFX5X
 qt8Bs7rdqQlpqx2nZyRHczYd9Bo3bmdEAw/cMnDy7e3eJFpbo7MLgz/5PX2Ewpgzj2bXiOkkbFO
 lEwL5LE4=
X-Gm-Gg: ASbGncsx8HR8zFuwZ0hwwFjE2D3GWGjh2kObVwCi5+6iMsqOURGUqxcwYDDCfHJlZ+D
 kcuMT6o2QW628ukwKi8Nt4uhMYpkP0Gszp9l6loZMPsFfLhzT/QEbchg6VZtE/uUoCbP+zKsIqe
 zU4TC/a3MkdzATi9CINVsZUAc2KpCzLMnO2JYVJSI7U3inId+AZO68/Rg/5xnH+5Xd4D5OrmCHZ
 2FUZyvqZw1GU+RHFfh6juk8Dgg7n45/Alit9D0uIeDaEdghirePSv3FepzUzPWhmIMBiYOqsLjP
 R84NdDtKUixg/dxPgajepFHzCECKsMv7gS4XnIH6kv/slDv0/xsxGV4oPM85v5G10rCCYoVga9F
 NPRsDlPMH8X0pRw==
X-Google-Smtp-Source: AGHT+IHeglMwC4wnI6VhxOqUTDRS4Bw7kPDDSJq1F6aCeEZrgCSy5dtQGtn8dhjpkaa5oLN/woW7Hw==
X-Received: by 2002:a05:600c:1c28:b0:458:bc3f:6a7b with SMTP id
 5b1f17b1804b1-45a1c7b8a64mr34272345e9.18.1755203506324; 
 Thu, 14 Aug 2025 13:31:46 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c70cb83sm32934055e9.27.2025.08.14.13.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:46 -0700 (PDT)
To: Aaron Sierra <aaron@bubbl-tek.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:45 +0200
Message-ID: <20250814203145.2815281-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716185626.365031-1-aaron@bubbl-tek.com>
References: <20250716185626.365031-1-aaron@bubbl-tek.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203506; x=1755808306; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWRqQnvoBLiLcy6jSSVlDiwNX6sElOACMDQmDiZMLng=;
 b=gFEMsY9q3QVrR9lzN9jkyCbLbauzsbArnE2Yh5qBw1drtDOKe9ogZ9ZwpHMeimqMhT
 Aw7iDozOOoTNWSytwgRzYJ8kDz9JPJNDFqzueWOq+y8Hd5ctxArO/osA3WpYkVAuXnNS
 n4Css9XIDdKBrLpyo77BIY/h0en5nC6Y2oj5ruJAcYt5Bceopg8ESLvPHTlZC/O8TNy3
 ceb7nGSaGEZTMAYRCEDzTVnIwAo2bhIg6J/7ol32mJhPX7mNdtMpdZvKoxXxN3t46vFB
 93Dcl6PL4zRJsiuMVwZ5PrkX+6ukRkRaBYUoVYj5rSRsD1RWrcJOT4yNJ2Ax3vaRCcyy
 aGMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gFEMsY9q
Subject: Re: [Buildroot] [PATCH] package/xinetd: fix build with musl
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
> The ecvt(), fcvt(), and gcvt() functions from stdlib.h, used by the SIO
> library packaged with the xinetd sources, are masked by _GNU_SOURCE in
> musl libc.
> 
> Signed-off-by: Aaron Sierra <aaron@bubbl-tek.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/xinetd/xinetd.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
> index f58c26f02a..f63a8a2251 100644
> --- a/package/xinetd/xinetd.mk
> +++ b/package/xinetd/xinetd.mk
> @@ -29,6 +29,11 @@ else ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),)
>  XINETD_CFLAGS += -DNO_RPC
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +# Make ecvt(), fcvt(), and gcvt() available for SIO library
> +XINETD_CFLAGS += -D_GNU_SOURCE
> +endif
> +
>  XINETD_CONF_ENV += \
>  	CFLAGS="$(XINETD_CFLAGS)" \
>  	LIBS="$(XINETD_LIBS)"
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
