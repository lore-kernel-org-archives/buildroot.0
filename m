Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7550110987A1
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4939C41E81;
	Fri, 20 Mar 2026 15:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOwwJVzUSll3; Fri, 20 Mar 2026 15:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBBD141E77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022091;
	bh=VQI3U47PM8hiaA2pprVM5ml1oshERS1K5ibiSfEdr8c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UO2rvmj+WYuQBRNy+ZELBMSqPT4tpd6avyknyV18xWc4rQYWNa9psOWY8365+rd6P
	 vxwWq8Xnv6RCoLakxuAWFIa7q+tjwSLeltF0P/7de2sZyENhCymCdkOFcJhokW+rQK
	 NVBOSXgv0AtXYv064h8RdQohkuotkfbwp6dIdcmPb/PpR9ogzIYvm9+S2NxIogeFOC
	 mOpxQEQv8Y8X51nSTSpuBGg/1nDnwM1Fo8CFGvv0P0tmmkIlW1eib/R/Yb1eRJ5PKd
	 yefUr0H2Golaw9SjL4uwy/1eq5GD2ZdIVH6pCJokFhK+ZhMQ9eGD+T0ShH94Uv2eFq
	 h2im2w/ftKCqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBBD141E77;
	Fri, 20 Mar 2026 15:54:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 687131B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A40E61B77
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDJ4y-RxCZRt for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:54:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5646B61B71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5646B61B71
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5646B61B71
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-486507134e4so25925325e9.0
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022086; x=1774626886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SCmTx/O7z83bdW2I/Y+11JVlBYaALdgNDOVw8wBnQH0=;
 b=fDzPY/3TY3CUcdpQFpSRuEdt4n3pSPilE+GkITIJnyA4Badg6Lrzpw1q2GJqaTfJZ6
 sD1CeXChA8VwqsscwgOBHhiLrE+9e87cuQXurVhwLaw0movFCIKg5gx3IjiRVcq7ds06
 1zyPTRTOJadpas7B/Zc0VoWJ6vhKJ4qB4J2HhAzmxbOk7qiocHya9gGb7hmkgjYtZnZe
 prK5rC17uchLX1NEHfjQHGNUTd7ocvlAms90LgoGmv/MgQ0CZSzYf4GMr7GaJh1WE0xc
 pm5T310Yv6Gjhbxo4zJU/DkoQyYJT5FZIO/vLSiZizqXxxAq7Z1JxUrh7iCHKQLf0/VL
 LlDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB3pCH6toq+7PNT7fPDLeRUbzLHsmlvzkCqFPXC/52zmru0fDd96QdU37w6ByX/PPA8YbNOzMM7qU=@buildroot.org
X-Gm-Message-State: AOJu0Ywx7bT9ilDOhiLi0h+UJSiNYaof1kpoMueMIEU43+sU9Y8Ya58v
 Ts5y4cdNWkXGZfBNLuhEg0yIvHfJKrlUbOmOO+u1drFNUwSAcgysF83u6JvKH2MoNPY=
X-Gm-Gg: ATEYQzw4Z+Op/oNcJdvRaMVJLX39fEFUqeuNhL9JcUZgv062d6Me4S6XgV4B/SP8hAZ
 kpatOrt/jaIEbZgqnHiVlCEVMM1AxboPXUwdzx2coQKaYmsxN3OYqtt76rBG3319C4+I0YbLMv+
 WE4x4+GQGYO4q5rDuskeu6ug0c17eHsSBYOQKFziBADTrZEncS/U49B5O/njOyisCNRIgRip9Ve
 MNwOcRHKbVtaGXpbVOZfzOSlQFEp1QdyPv+LML2sBXzP3Iop0yZe0sAvFSa9p5teoALi47J3T2B
 /EecwAp3oSEJUDYPEyj9Waio0K6BtPSfbKhPHubH2Cdw8daaB5ZPZvRITRQN411iH19M3SOnvOF
 ewp30AqINAjR25YwSjRfJ6wz9jK/aiJ8oUKxs6LdIsUn0Uep7ycSsu+tQcItMp7vKDwh4nCxaEP
 X3gKwejp44EPjiiN/a
X-Received: by 2002:a05:600c:a016:b0:485:3a22:69b9 with SMTP id
 5b1f17b1804b1-486ff024e6emr48765795e9.29.1774022086138; 
 Fri, 20 Mar 2026 08:54:46 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486ff1d8138sm17445955e9.34.2026.03.20.08.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:54:45 -0700 (PDT)
To: Neal Frager <neal.frager@amd.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:54:45 +0100
Message-ID: <20260320155445.175982-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309075127.801847-1-neal.frager@amd.com>
References: <20260309075127.801847-1-neal.frager@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022086; x=1774626886; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCmTx/O7z83bdW2I/Y+11JVlBYaALdgNDOVw8wBnQH0=;
 b=RorGNbNWjKKHGcys3OtwNK0NwdwUXEY7iDTbkWix8PVNKLWGxUiq6Mv748ha6+a2qU
 QZi7QVNBuq2gJ3zq0QUNYPJEkWLUyevLEHCGPqjjTZmB6xCZXtd5O2NxnZqaS7PhFuIA
 KAdi+6LE43Dgzx+lLWh9VB0jjQBrgBbTOyf3/S+9LqYUNnu0H8bzXzgTVb/AzvbVtVHG
 cIhxRr+O0d9bEw40KFyuO/DeZFyplkCEwPDy5R3zqb/G+Rkum9Jtf2qBmPvXCi7jqWsh
 63067wzOlalOOTKpXICquJJpLzVKmLsU5PYYOItwWJkfChsHY9ylicaj+7OW5qR+9+bz
 57MQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RorGNbNW
Subject: Re: [Buildroot] [PATCH v2 1/2] board/versal2/post-image.sh: remove
 incorrect $BINARIES_DIR
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
> Remove incorrect $BINARIES_DIR reference from the symbolic link creation to
> make a relative path and not an absolute path.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to 2026.02.x. Thanks

> ---
> V1->V2:
> - Improved commit message
> ---
>  board/versal2/post-image.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
> index 17746271e1..af50909fb1 100755
> --- a/board/versal2/post-image.sh
> +++ b/board/versal2/post-image.sh
> @@ -3,7 +3,7 @@
>  # By default U-Boot loads DTB from a file named "system.dtb", and
>  # with versal2, the Linux DTB is the same as the U-Boot DTB, so
>  # let's use a symlink since the DTB is the same.
> -ln -fs "${BINARIES_DIR}/u-boot.dtb" "${BINARIES_DIR}/system.dtb"
> +ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
>  
>  BOARD_DIR="$(dirname "$0")"
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
