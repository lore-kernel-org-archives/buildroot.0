Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2291EC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B5A80D88;
	Thu,  7 Aug 2025 18:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFxnnzVmc2FV; Thu,  7 Aug 2025 18:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC1680D61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC1680D61;
	Thu,  7 Aug 2025 18:24:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EEF04C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25BDF6064F
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elhsSvhw5qYd for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 495D360646
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 495D360646
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 495D360646
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:00 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-459eb4ae596so12161895e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591038; x=1755195838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cln8N7vY33i9UL5n8/xlyP8f6hq2J+/LkOzic2MMjjc=;
 b=kQBwJYX1nJ8uRfT/RE9v0g/UqOtPuNt7Ig8nqZPjUni2/+U8JWbDZVWLWvhskyILIH
 Ul9EzPF/UyWt5VCvYwc4VaRjT51laIbudtMC9K7Tot1GbQNgbgyHPFrMBfT9du1fowDG
 HtNZdhCn/2uUXuGd9NQjTrjzzEe1gNUcmtZuqV3eUE4jzzeHXMMwzGmAaTaY8B1YaFcS
 8RLuNykTv2V3czowBcDgpCG2h0odpTPyWkIw1qDuxEzmVBfzsSDGkzlAIAkxNhWQ2YxJ
 txZwwYA+R3nnxGCJBQOHGLKRnbuA15BpyOub3U57FpA2ekQooDOe+le8EPvhMc+OVGLw
 ei8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu22249f/dTLwDzCwrxi/w5OS0mamA86rU2v3+15GQL62EiJwW7URJOdO2WL8GRJ+vZ8lmZty4Ar4=@buildroot.org
X-Gm-Message-State: AOJu0YxMHKWRr1r7lUShUR7MNUoCLUJCKnzenS5g475LNDPZUtQ5fgmL
 1pWoL0sZgkGsS9R10TEsAcamcdg6mlTu5j6JTP6NcRDG3S7J4ow3dislkj7MkPtjiMPU5IET3XP
 QhJ5E
X-Gm-Gg: ASbGncuosKBdtOJasgTE50oQj53Rq+PY5bUqAbvDxkOPYvn3S2yi+sWYzk9JIvvAydn
 ggfoZuB96TK7Mc9rAMbH7ur5+/JdJ2fAfSJJUgFcsJ6v1h9vfy5rFeiQ7NgWqY0jK8jw3r6Kog+
 C9Z3ALwjFFfNm32zHMbvhJP1tifMMxeBzVvqEwy+wiWIdH6npS4wSTt2w1cBa4dA6kvBuhEEFlI
 P9Uwhf8ubx/Q5APWfHKyAY2dN+b6TOYZzdSFDRCAHhIZ34dEkrTcXV8RfJ+jnG8XwN/H9Rd7dfL
 wbJgLY0aKQ+tv/AbaHpYDumqLM5kw1jBry7T1zrbzPO/zuzpZl/msmdiBj89ny+La/XNsLfOc6l
 0I+h6+5MaHNbAueyRynIiB29o
X-Google-Smtp-Source: AGHT+IFWqA/SaDRtMctjnSeALKf19OH6D1PuxNHBYtpGlg0pHAr/CzO6GA3lNYKyMoF+BdZxg2Srxg==
X-Received: by 2002:a05:600c:4e94:b0:458:bdd1:b7ef with SMTP id
 5b1f17b1804b1-459e745c33amr66072805e9.19.1754591038353; 
 Thu, 07 Aug 2025 11:23:58 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453ab0sm27942595f8f.44.2025.08.07.11.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:57 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:57 +0200
Message-ID: <20250807182357.723975-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714183517.2354615-1-bernd@kuhls.net>
References: <20250714183517.2354615-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591038; x=1755195838; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cln8N7vY33i9UL5n8/xlyP8f6hq2J+/LkOzic2MMjjc=;
 b=Ni6G6s7uAiFlLSeWOZBjSTKVn93q47qHNv5sY2c/8Wci3V7KWS02L3l9qGcqLOT5ix
 z8tp9GoFDJ3flsncfV2ZFJ7/AkTUmVtnKoZ6BD3+yuXJ/StHUmgknnimh/gvM0msho6/
 WXDWOwaGA+Fc9cZmEVPAFW4OSAdlwbK0Yw208LxnOIdtHYSBq9G9BBqkcxxuhV7eYB2L
 UclzxuKtjf2IxSZqwwxJLRfyYckjBElzGz+IJxJJOPUUV0IO0E7qdyujbVMC3dtREnG1
 6pSSnGXWcd4GzVg6PxpeBcuP+WHOwwW1nk1RWyd/T0oS0BWtM5N0S5iMLN7fjhi6Zvb5
 BFYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ni6G6s7u
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libcddb: Fix build with
 gcc-14
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
> https://autobuild.buildroot.net/results/723/7236cf5fd4f33aabd3178586f877dff04d754abe/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> v2: updated patch (David)
> 
>  package/libcddb/0001-gcc15.patch | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 package/libcddb/0001-gcc15.patch
> 
> diff --git a/package/libcddb/0001-gcc15.patch b/package/libcddb/0001-gcc15.patch
> new file mode 100644
> index 0000000000..379e654951
> --- /dev/null
> +++ b/package/libcddb/0001-gcc15.patch
> @@ -0,0 +1,17 @@
> +Fix incorrect type.
> +
> +Upstream: https://sourceforge.net/p/libcddb/patches/9/#b9ea
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +
> +--- libcddb-1.3.2/lib/cddb_net.c	2009-03-01 03:28:07.000000000 +0000
> ++++ libcddb-1.3.2/lib/cddb_net.c	2025-07-03 17:58:30.064232649 +0100
> +@@ -305,7 +305,7 @@
> +             int rv;
> +             fd_set wfds;
> +             struct timeval tv;
> +-            size_t l;
> ++            socklen_t l;
> + 
> +             /* set up select time out */
> +             tv.tv_sec = timeout;
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
