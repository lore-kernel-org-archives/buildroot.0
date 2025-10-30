Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFEDCCF9FC
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 953DE812CF;
	Thu, 30 Oct 2025 08:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Abc5xA_hbqir; Thu, 30 Oct 2025 08:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B837281544
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B837281544;
	Thu, 30 Oct 2025 08:24:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F151F160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC44C81141
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NL71x9JN7GqZ for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:23:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 495ED810CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 495ED810CB
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 495ED810CB
 for <buildroot@busybox.net>; Thu, 30 Oct 2025 08:23:53 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42966ce6dbdso506189f8f.0
 for <buildroot@busybox.net>; Thu, 30 Oct 2025 01:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812631; x=1762417431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/7ByEMxdQB+HiWVc8EGsv3a87GFo7wyiR1YqBfHxtQ8=;
 b=Htzuapb5YQroag+kkVj7tepPoSXrk2hx0dpt/KoXecrGvfRPsGhqns/SeeMizo6GS5
 OyvBa9JH/Hc6ZicWHupJ3IsHJxsieAjdbHRcFa7jwZv35SGoMXF3Xx08G4/kHxGdR+OY
 BO6w1iADO7kdtijWz+cCjBEs0fn0skyS300/r3rhMphG+NVwL83RUz/5g1anXazqFMpN
 hkptUV1CN9ltp3N+KvLM5+yRFnPjC+JB4Rsi1Ap6oi7078JJSFjerMc1TLNbjncXSIOF
 fT3f1/8cOqnE4i+00s0LrENyhYCwOhpCTXwWe5EkLSPwm3pRrjWDby206R3K4fUCHUv2
 0BPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdcmgNLweTmZ0SnJ7PAwE/YURqW91uuJIc/Rl3eYdMbCTW2bLvc0vzpA+ZAmEDg9KgKdvEQxCgyAM=@busybox.net
X-Gm-Message-State: AOJu0YwwYQ9fRxNKcHYs15TDmorN8AAQxxrmUwTN7QhLe7dBljQkVfop
 78FyEVhy3LrMxE6qBxwCAubxsGgMFayx4pW4b+CAjoKBA5FvQkNAIQNS7usy/moMDgk=
X-Gm-Gg: ASbGncu6uL18yDNVY5kXeqludvTCMrdiVlVsYs1/59qx2czr5VNof6j5VTTe9Iz9267
 4+QWSBTCYngozdlyAJ2b53VVQSewYdZP2S5XYP/TicqufIEhLT4QKksLYjluMN523a0d+Q8N7Ma
 CFp3ys9TvVnG4+e/WhNa+UIDDSFtWxEr30PHCKMlcbbmLyvJitgKl1qbuBYbXoGccHvpFJ56+zM
 0E8uuWNWpbXe24UJST/zYAfruc0okzu4Au30/N7FzuK38m+zt/r5VY64GkvaSUhITf50s3bVOd/
 BCVEfG75eHSWGa/T2YXzuZMh2Ci52v0hnBLvlz42XzR86M+wE6yeUYDSfFi5tI3Q2gykI6BpKF8
 X8pxcwIwj0UbcvLT3LWKeEuDayZJLgo5XCC026WX933Y0bP5yMKhuwVU79r20ZejxuadFt1nWTc
 3MkMmuOXOPumTaI634+zpeixaEKcXEMdHHEKXE
X-Google-Smtp-Source: AGHT+IFEc51RKrWM+260Wrr4Kqly7o+0Re3TadelPuj0R8fQ/SSmRMpNOcDdddVfy/8IDSz7m6PpTg==
X-Received: by 2002:a05:6000:260f:b0:429:b8c7:1817 with SMTP id
 ffacd0b85a97d-429b8c71e1fmr667059f8f.30.1761812631193; 
 Thu, 30 Oct 2025 01:23:51 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df682sm30503647f8f.43.2025.10.30.01.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:50 -0700 (PDT)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Thu, 30 Oct 2025 09:23:50 +0100
Message-ID: <20251030082350.35191-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022133946.230811-1-francois.perrad@gadz.org>
References: <20251022133946.230811-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812631; x=1762417431; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7ByEMxdQB+HiWVc8EGsv3a87GFo7wyiR1YqBfHxtQ8=;
 b=ZNc7jVidhbBHuKACLZKSPuaqYNlJbH8n+UZCqL02BSDK8CTpzlWjg0h5cOxbyqAtlA
 17gdWP1c3f1PLbW0+EXaINbms/Vw4tpEd8MugbFfnvQuxx+Wmpyt5hDTq+SBXb4RP5hF
 UpBvxcEb5bPRrcgrFOTmfYRTWtDeetrDDKyiswdrIzouDudlOFg3Nru2E8c3v33kW6T/
 JEibAmyrvitCFl5BVKZr5QWBvsRgZAFPTA5RwWe6RbAJFm1dKAsEMSU91WARoh6RfwzH
 eX6sCsJbe0qF8DBLFoFrHCw3lEHEQ+ndhl8s5HxyGHDUnhKv0vxJbyfCkM2jxiaSf01q
 qFiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZNc7jVid
Subject: Re: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.51
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
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x & 2025.08.x. Thanks

> ---
>  package/libgtk3/libgtk3.hash | 4 ++--
>  package/libgtk3/libgtk3.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
> index 6a682a741..5394bb10c 100644
> --- a/package/libgtk3/libgtk3.hash
> +++ b/package/libgtk3/libgtk3.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.43.sha256sum
> -sha256  7e04f0648515034b806b74ae5d774d87cffb1a2a96c468cb5be476d51bf2f3c7  gtk+-3.24.43.tar.xz
> +# From https://download.gnome.org/sources/gtk/3.24/gtk-3.24.51.sha256sum
> +sha256  0013877c6bd23c2dbe42ad7c70a053d0e449be66736574e37867c49c5f905a4f  gtk-3.24.51.tar.xz
>  
>  # Hash for license file:
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
> index d6d7c64a5..be24869d3 100644
> --- a/package/libgtk3/libgtk3.mk
> +++ b/package/libgtk3/libgtk3.mk
> @@ -5,9 +5,9 @@
>  ################################################################################
>  
>  LIBGTK3_VERSION_MAJOR = 3.24
> -LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).43
> -LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
> -LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
> +LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).51
> +LIBGTK3_SOURCE = gtk-$(LIBGTK3_VERSION).tar.xz
> +LIBGTK3_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK3_VERSION_MAJOR)
>  LIBGTK3_LICENSE = LGPL-2.0+
>  LIBGTK3_LICENSE_FILES = COPYING
>  LIBGTK3_CPE_ID_VENDOR = gnome
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
