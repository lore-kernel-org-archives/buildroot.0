Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2B1CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2766612D6;
	Fri,  5 Jun 2026 12:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1eOZrQvsVQB; Fri,  5 Jun 2026 12:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E59756130B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663870;
	bh=Ph9GQaOjPuD1NxN0AzQLGWrJqU+HKIFJkWMTrMsLr1k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VsNOMQCWTkxAfSxC2Kcoed6kvTbt/mydwGWYYMcRMhY7GvBv1s79Lb5iIKVDxWN4y
	 U5E2m5/l0JwRkXtcwU8yg9Jrd6nxq+vAKN0OrNNSrRAHsPTWtwzVhjgcvys9z0Azop
	 x4+zl2z59PghbTaBqrEeRq6JzMMOo3EALGr3Uh+Hqia06rz7f9OEYDWTl3Hm2e8kdB
	 pfyUyvaIvZMZjf5v7jA3mMCE/VtXDy/P0ZkpoZ6rMfJdQcf9E/DgBrRkB2KxkpC3cL
	 5AxKdIgxsSkz/EWbQlK6WZqFtOlwKotRZ5ZtzvAHFFQ/4pMrvcogAqJxL9XQ+vkrzP
	 Q1VphtUBNWsFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E59756130B;
	Fri,  5 Jun 2026 12:51:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA22F388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7BB44037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgX1yuDcU6un for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:51:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA6674037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA6674037E
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA6674037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:04 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-490a765d410so19874085e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663863; x=1781268663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jRSXatZKMw5zC9FWWz+1XvVYiTMuOw7KwNUih0TMlAg=;
 b=sJuGItX/vUJV12PHTcB++dq1xlNM+jnyQxfvYPWnZTtAFG8y8xyZZrmJF1EPjcSHi9
 xHo6z5VxAWscdMK2qYDUnrNf2fKwVzDqDXA627OVw1o/m3w7QhrW+g4bBjl+RjwvOXi0
 l9eVZyjYo9DXmxde0jCkj9+sVgLOKHgt2Uq3Zg/Hn/LdfZ5cYP5ZbSZfFltGvmaDMjaG
 fX0pkAOoVoxnZWVYkam6qRI7L2HzVbI1Jy9fO4vziwZqyfeLp+ib6eZBksLijPum8Gv+
 zbKAgWGOM60m4qF+Iyj65K1ODDHrfE8/IDHoVrU19kdhKlkGhA/sWMmdmoYp1F4fiieY
 m06g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/4j5GIFt095JIhTuACDzd+UrbtMQ8Ze3Lc5ivVdWUtENkphVdaJdGHsiCIxZtvvtxdwAFAbyRVLWE=@buildroot.org
X-Gm-Message-State: AOJu0Yz/3U46S3dd0DRfBx+KPWB1ZIqi+PMDp9lERHRFfDal+rbE9o4q
 1KICtOwukfQVdt5VFt/uLtcC/Gcv14u+N5eTIFSJ+qkP19BV6HsbE9bzXmVPmdtGJLdm3ofUlJI
 C85Lg
X-Gm-Gg: Acq92OHdmmjJWDXs40n2nINr2+HMR+blJOOWGZXhPCBZwVN9XVlC7ViOlf1pvNWuqZx
 jwzfnOE8EqsqtIkHIBhk8Z7QK2o7Zs81bpNUyBW4m8ArF7Cn8AQtqyenl9LwFb8kioxAYtZgkYK
 ogS+zt25o/Gu89JQzqPWY+IzPfp4stSZDagrwhMNXsHNOa9vAHJYQnzFLoJJlMzO9if2s/jXyIH
 iZu1u3N73X2Ik4DTmgXzZipGzWMvc/qnus3B3B0YKhnFbF0ba+azvcHUst/kpCuP/cbC9VLuU0Q
 58G0B0uExgeuh/N2VFULcCHDcChqI4CpBICu/TOceeoPNYtQ4gwcEFOfVPKghxZ4oekyHqj0eCb
 pb+1IGti9cPk/OoKy34DvpGhgRzH+sSyTfqd923QgQ5vSkKVxzRCE9o4wo1sjhAzV0S/3+KchGp
 ZvXwIjilMZ1tUTUFlF8MLUsTAQwQ==
X-Received: by 2002:a05:600c:620b:b0:48a:53ea:140b with SMTP id
 5b1f17b1804b1-490c25cf45bmr50291975e9.28.1780663862947; 
 Fri, 05 Jun 2026 05:51:02 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3c183asm155632505e9.6.2026.06.05.05.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:51:02 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:51:02 +0200
Message-ID: <20260605125102.275104-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529172103.1359117-1-bernd@kuhls.net>
References: <20260529172103.1359117-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663863; x=1781268663; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRSXatZKMw5zC9FWWz+1XvVYiTMuOw7KwNUih0TMlAg=;
 b=fOmySBwRPJzEQJCmBUcY5vXdXfORQ9wfS3LHo67mES9sU2ANxvP6X0NfcZ6YgV1EgE
 kbfk+/+2hSnzQmK1g62+Jg0YgyUOwi/NuIoenEeYiS+S6gV668vZUFu6vsCI3q7r1GkC
 UIV5aLlWlA33oQKiLerDm/ppcailE46VDT1AjQ/FM+mKL7Y3H02g7A/fZIFJsvWiesoV
 5tEEcGPPsgibbDKLgPpjlK8GMBfBFLbEGcHG8QY+kvkpanNzEalyTRhTHmP8DlkKbg1S
 q4BaBhILpvLDKcdKjMESIe7norsoKaGejR5m1hWFguhZPfFTH99h2j7GSfW+c3wrMkzg
 XjVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fOmySBwR
Subject: Re: [Buildroot] [PATCH 1/2] package/libdrm: link with libatomic if
 needed
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
> Fixes:
> https://autobuild.buildroot.net/results/ea0/ea085cdea8458768c5f0ddb16f618a572406e65a/
> 
> The oldest build error dates back to May 2024
> https://autobuild.buildroot.net/results/8ff/8ff4e16bb79294c5e289989855b5875851342909/
> so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/74926d1dfa331217066129ca169b3416027dd058
> 
>  package/libdrm/libdrm.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index 240c09b8b1..cafff8781e 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -19,6 +19,8 @@ LIBDRM_CONF_OPTS = \
>  	-Dcairo-tests=disabled \
>  	-Dman-pages=disabled
>  
> +LIBDRM_LDFLAGS = $(TARGET_LDFLAGS)
> +
>  ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
>  LIBDRM_DEPENDENCIES += libatomic_ops
>  ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
> @@ -26,6 +28,11 @@ LIBDRM_CFLAGS = $(TARGET_CFLAGS) -DAO_NO_SPARC_V9
>  endif
>  endif
>  
> +# Uses __atomic_fetch_add_4
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +LIBDRM_LDFLAGS += -latomic
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
>  LIBDRM_CONF_OPTS += -Dintel=enabled
>  LIBDRM_DEPENDENCIES += libpciaccess
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
