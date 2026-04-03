Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AF3E7E366
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97BF8610E9;
	Fri,  3 Apr 2026 10:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NxYewGaLKUb; Fri,  3 Apr 2026 10:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD668610E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212095;
	bh=I7I7fvmlXUQRVbpjysWReeaV1u/pubavAa6bzy9bxWo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q3+yHxVMvHSyNENZppY20QIhbaNEHtSFoSNAeZStJwlDEo9iVlaxNtzxleth0+npx
	 b3VLZrqlYwlRHzwj8SKXq8iF9OZoHCzeKhH968GdwVuyCEOA2LThpy05VcQk0daltb
	 2vLa3cZyeVTi3HF+61zZPxnLmQLFUKhrwLXyJW4xjb3V2ex6yS0lnOvU4yMnXubdhR
	 HOLSFZOet8cTj8gCOlDvWCmG8caPPprbYGjRC3syK8a6PySthMwLZBY3WgXvaPw7KL
	 uie8g4LpDGJIsiLhOJPdgzGiBVgaA+oKNCqyie8/saccsfYcAaOs+5dNANjsAzeLGp
	 cDN3hvK1ePAkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD668610E3;
	Fri,  3 Apr 2026 10:28:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 852C52CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 747E2610F5
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtM2WERboyz5 for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6CA9B610E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA9B610E9
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CA9B610E9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:12 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4887fd35e60so11236245e9.2
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212090; x=1775816890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=keL12kLy51JZlDfi0hgE0oCkNHX5jPxADeoncg4hJp0=;
 b=dMtN3Gc4klKDjKO0NvM/5qmlMBOFBSgyP98PcSs47dEJda3+V2iTnhXAIwxmR7UZ/Q
 Jknzn7c9Qd6igf+LuO68lnzJcV46RLxesbilX01V1rSQ+O6o6A04jPId7sfDi4HoScPW
 eijMpQa8YuDBRzDul8NTmIygT7U45nKgLDRhekK0u2bZ06q42REpfi4TG8fcWeKUJ3rz
 WV7Kn0oEbQrBL28cA6yYOJAKslS9MZjgDFv5+XXEj/o1tDJvLZCwaEQoZo2FvaYLKmK2
 6tKKpIMCmSFJD26iUy007H8UQLAnMo3s2Nf3BCYIQgoAhIwseA36lMGkvVXFfpz9skXE
 S1bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVinuQ4j8MZodjnRlgv3bbBCJooluJoTPqNK+IQcW9IX9tGycMg1a0YyjV3yXBkmw9Ob83HxCwN1DY=@buildroot.org
X-Gm-Message-State: AOJu0Yw3xGa58d1ZivyOJ3xIQw8MebWmWlpH4zT7Qw7275DxPDYccgNm
 Y3pEshROfu28hWfGwT19FRH6v/dHbsp2gyP92xyxh968lX6ow/nkNBNVA64b8gCDYHM=
X-Gm-Gg: ATEYQzzrjUF0p1LMrG7QP3gfRvaJH4rrrEClvXd67OEibW9Nu0AouivmXYHiDO2lGLj
 f8EePlnEJzv2GjBcvl7JXmM8R8zywHDvtwqm+uIPz0mlNkgPA/7z3ks5Ygcsx5twcK0TbICOtLo
 /ld28a6CUJslSR6YqlQlkNkuCDZhM5FeQEYAeiWXr2FNpS6u6KdX53vLinZ4J2e3d35ujj0ohin
 KV+wUkqQd7LIehzh06pwbg9bN16zH97A8+gvUgN6sO7QY9+ETWAy4LeQyGni09js/6tvQS7WAH6
 n6OT+jsZEe6CosUIms6QqVWIrJX0RMsF5oRcxKkENv9U3Xy78J8AUDp7C1iY5qFPchRryLdYQfx
 d9fkYx15Or9t5Q/FHDw1at4990ydOpmk/pdkoBywJd7lou7wsWx+3s3+y2eGSJnw3z8/3XWGiUB
 onMsUvlr5jAsiBQ8QswA0ZqMePvk8=
X-Received: by 2002:a05:600c:3f08:b0:485:3ff1:d5ed with SMTP id
 5b1f17b1804b1-488996d22f4mr41630825e9.1.1775212090370; 
 Fri, 03 Apr 2026 03:28:10 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e83e906sm263888735e9.8.2026.04.03.03.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:28:10 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:28:09 +0200
Message-ID: <20260403102809.210354-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <acDu_6w5SkzNa7rN@waldemar-brodkorb.de>
References: <acDu_6w5SkzNa7rN@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212090; x=1775816890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=keL12kLy51JZlDfi0hgE0oCkNHX5jPxADeoncg4hJp0=;
 b=Tn5Z65gqPYtldUOeFHJh2YAxfO+DPE8W5QTlNpuQb3Z89hW5RxeCDXKfDYisa8/f3o
 NJXQr71qSyRX2Aacsb8V2Uqrfk1MgJPegs1nF4GNCCGMBJGwsf2zHfWNjjwRN7VIkcgc
 CckNmupSuSW3MbDL7RFwHtAmn0sZOoZCCwwvfomdSYi+8yA20ev5voiLU9RPR0M5cT+G
 N9d4SBWVooZQlhyfMk3yXzcYdRvSsvbAbRYsBlzHuqBi9Q/VbsizQILuCXJ4F1gOA73H
 aXq0IMa7xEwcm8H9fgUPuS7iQhbkAEcFBD23IQqFEwZJWBhBpFfj0yVcPbdFVTIJPCGr
 wg7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Tn5Z65gq
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to 22.8.2
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
> See here for detailed changelog:
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.2.html
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/asterisk/asterisk.hash | 2 +-
>  package/asterisk/asterisk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index f1573f6575..3a8274b458 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  4f30af0695a0131fc091d85e7b91e22504609434b3fbd263898c7354d41959c9  asterisk-22.8.1.tar.gz
> +sha256  6669a8d2e50481a3b70c6099a21a100ab7d7ae9ac00e2182eabb94c68c94bcc9  asterisk-22.8.2.tar.gz
>  
>  # Locally computed
>  sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index b59f2bf5aa..e2fdb189fa 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ASTERISK_VERSION = 22.8.1
> +ASTERISK_VERSION = 22.8.2
>  # Use the github mirror: it's an official mirror maintained by Digium, and
>  # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
>  ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
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
