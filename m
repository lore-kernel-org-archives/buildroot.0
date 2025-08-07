Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EE4C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E6C180EC6;
	Thu,  7 Aug 2025 18:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GuQcOKbYW1m; Thu,  7 Aug 2025 18:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05EFA80EC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05EFA80EC4;
	Thu,  7 Aug 2025 18:25:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2426F4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0095F80E16
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wY43ZvcycBn3 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 11D3080E05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11D3080E05
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11D3080E05
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-458bf6d69e4so12706155e9.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591076; x=1755195876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=StqQnMLD/wUlMvpp7oTxIfrISFRw7uccyCOnPNihT1w=;
 b=pij7aEa7WtwTNRRjT0VDIQMx7ggiMBGGxoNbykoUhMSbYHYrtf8B7p6M+/soeP6ZBF
 eecPGstgWJ5+SKyAeZc9U4+6GrDc6HFVVZHRXac9vdHCnWVKfJ/y4ZlR1YRjElwNqD48
 9k4/YiJWcjooEWKo8dc4Inqg5+4PVjRdBj3Dk4uZl50yeyhNeclCxxu4CHR0vMHXtxbX
 vxDADP4i6ENBabEgpyZqrw4ER6Nm7DBUKppSDg4hEzxA1TKzUvh1MjaqpbDQ766wnUmM
 I1jfId+Xyl5FgBAejMW727zU35Wy8TQaGaUy8sSO+pn7LVFTO1fhwf5TNTBluTZyAlVV
 Ak+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5pHN9R8DXHuUmzFeGb6C9vXGR74t1/1YjOkmrNTwZDfLnBAckDxiy7NqOtI3dUdGb5u9cm7+cFAU=@buildroot.org
X-Gm-Message-State: AOJu0YxXx0+0MA7DnCF0b0H3fxNJPSgfDO2oVWmvW+9BlIL7pDDjaim8
 U52ilIGRE7RVMy/LjT3UPPx7xVYzOdoRUM3uny3c0bpXCfnDz7tvtx0zVlCHI5dvf58=
X-Gm-Gg: ASbGncuzdGMhdLqmd3I+UG+uq/nzDIZi5L/C5x64QJC7Rj9fdQfVVbH4wnu8AhB5GeN
 LD/DzrzHCgVyTWvhiQRVAAVNCuFLoOx+/qOskSMqeyeDUrjy02+oJSrKDvGFDYeSqHnqHT+22Z2
 6SsDhanuEDFaQyCMkuXpz6PMUBh7uiUEx88DFW34BmX0Tj8yAfvNLvRRPIOhhOaR5hQocuEid2S
 qz03EnJwR5f366sDMLpoG4uZFaet2tKKi+Glt/1cIGFHcTm2Mxun9Fdyb/SWsBVWqJonsDMqQNj
 QhG4QSEyDZCeM98WJOVeMn4lxXurb+Cx4PQRTajxjhZxeNrhbPFwEDa3eb56mHQsObKWIeBMFEB
 NYTZ2VNlNNljKVQ==
X-Google-Smtp-Source: AGHT+IEXchIpGxV+b69BIVuyDg4bx+aARnYlopazhOqyuwlWbYaftxIdZwxPOF3+Yjhjmql8LbSKWQ==
X-Received: by 2002:a05:6000:26c4:b0:3aa:caea:aa7f with SMTP id
 ffacd0b85a97d-3b900b842bamr172909f8f.56.1754591076185; 
 Thu, 07 Aug 2025 11:24:36 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0b2d2fasm17287310f8f.50.2025.08.07.11.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:35 -0700 (PDT)
To: Scott Fan <fancp2007@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:35 +0200
Message-ID: <20250807182435.725789-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726025558.161102-1-fancp2007@gmail.com>
References: <20250726025558.161102-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591076; x=1755195876; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=StqQnMLD/wUlMvpp7oTxIfrISFRw7uccyCOnPNihT1w=;
 b=O4PjXF+IwHqFjm1b2E89isOhhgjzjlBpwzahpYeWuYczEbMm6z8o4BxPhVbzR0yyot
 Zkn6iK+1FE6Ogl2UflNcgscEfZ1h0HccesruTwSNM/u8zpSOjjr8JSLi0QhsTEkMhi5Q
 2ZlWE0Dkx55kVaNId1Jb1BkoK/tr2lhgAnZiDmdIffRucZd06Gan0+S7K0lIYiAKc7ht
 DZUIiMQ9doeJ75VRb10tvKsqaK6E7S21Xju+3W4/Zoizkitx/6dMieqGB5nBb/aSnhnr
 WnGUhlt7FAav6IdvwRS+lCFnPIB8IafVivknw6q/4MwbLA0Q68jBvPzAgVIZq7bftzLR
 L48A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O4PjXF+I
Subject: Re: [Buildroot] [PATCH] package/libmicrohttpd: bump version to 1.0.2
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
> Fix double-close bugs on bind() errors reported by MC on the list.
> 
> Removed MHD2 draft code, now in libmicrohttpd2.git.
> 
> Changelog: https://git.gnunet.org/libmicrohttpd.git/tree/ChangeLog
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/libmicrohttpd/libmicrohttpd.hash | 2 +-
>  package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
> index f1b3f8b7d8..59c87a738d 100644
> --- a/package/libmicrohttpd/libmicrohttpd.hash
> +++ b/package/libmicrohttpd/libmicrohttpd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  a89e09fc9b4de34dde19f4fcb4faaa1ce10299b9908db1132bbfa1de47882b94  libmicrohttpd-1.0.1.tar.gz
> +sha256  df324fcd0834175dab07483133902d9774a605bfa298025f69883288fd20a8c7  libmicrohttpd-1.0.2.tar.gz
>  sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
> diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
> index 6998ffd1ae..335234c14b 100644
> --- a/package/libmicrohttpd/libmicrohttpd.mk
> +++ b/package/libmicrohttpd/libmicrohttpd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBMICROHTTPD_VERSION = 1.0.1
> +LIBMICROHTTPD_VERSION = 1.0.2
>  LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
>  LIBMICROHTTPD_LICENSE_FILES = COPYING
>  LIBMICROHTTPD_CPE_ID_VENDOR = gnu
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
