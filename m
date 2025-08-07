Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706B8C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3367680E67;
	Thu,  7 Aug 2025 18:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVFptat7oS1m; Thu,  7 Aug 2025 18:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7327B80E56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7327B80E56;
	Thu,  7 Aug 2025 18:24:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 873FA4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E29240499
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8YKgPOvmFRD for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5ABCD40573
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ABCD40573
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5ABCD40573
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-459d40d16bdso8917765e9.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591063; x=1755195863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Ib9qyJPp49kK56beQ06be/GLejFNLIBNtx4vA53VYw=;
 b=fte89DWq0oHZiVm0D9y4fWs33W8L1X3czonGE36Q5axqMNi8sg729/4ZldnMC8J58T
 Lx80j4JxO84vbIFSzvAC0exTMtPzQg8DoYMm/xAX85gNOTQsrTPzxNETWG3yGashRTCK
 WtGbrG+yO8i33f7pwR9Jb5ZIluerb6OWlFwBIfzCjDX3vsSOXzc5yxS38aoHXwjlEyYp
 /tO1PzUAIhqMXoRnmJ3XfUunhaW07aWsPt/wcnYtqe1tXzlzB+2VVqvdMCGmYu/yml56
 LGywUEmmQ7Ih8bsUFXPd3Azzrq3PAE9R7m679sCgQFBCdB8mOERbOQzGhBko/YU+npud
 z9Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+Ii/D1bs6iyTF7X2BFAFkSfLy1hDzJcWR823SLaEA7IJxVjTuHv+khzm4IRUpG+R/r4hiwTflJNQ=@buildroot.org
X-Gm-Message-State: AOJu0YyUMuxxoeDkLHUhy/SB39thfr1HgGK8y5ppRKkLz6dJnpWoQoJz
 ebuq6rEcPBEpmZd3pE07XeSuTKP8yRkd2TgtkIeq7tIJW7x/XYFeZ2IA8QF+8Bp9ZRM=
X-Gm-Gg: ASbGncsHOB/xQyCgQX1cwrVbHKaWvcM/ySdS1vPzmnYX0Ydv88ZFRA+bMZ3A90PSqlE
 tocfnf0+/S8FOg8SNCXzw6XP0Tk7Buej65ynfC0GHy4nx07RWjiz7NpqJelbl3odnzrJd1cKGmz
 wDNqy9zrSNgyToN41HvEvNPInxuz1N0dQe3dgPK4FYLXBucWT3cpXLgyyEoBHOpY6EfqDTTrpnt
 27vTVJcHDswScVlmMUaleyGibbKz0fDBJxUPVEGEYogLZY29X4cveZ1XJIObfUI6oZ/tyvdv+OG
 j+mzAdJpZqZ4AwfLZojDIgHjie3msjQOdzHliV1BqLmBmD15KIGdH2c2meDmJ4ZOtE1AZt2OZKj
 RPBg7UoKJcHdIN11zdUIupSWX
X-Google-Smtp-Source: AGHT+IEhjgXEXX7Wr4SoKMkOkv6yQLnrA10q0DL1nGpA9EqT73zz+282IgSLN2sutsn1IVgd2NmJOg==
X-Received: by 2002:a05:6000:2083:b0:3a5:8934:4940 with SMTP id
 ffacd0b85a97d-3b900b7bdfdmr153621f8f.50.1754591063383; 
 Thu, 07 Aug 2025 11:24:23 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c338c7dsm27695208f8f.0.2025.08.07.11.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:23 -0700 (PDT)
To: yegorslists@googlemail.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:22 +0200
Message-ID: <20250807182422.725184-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724061810.3677507-1-yegorslists@googlemail.com>
References: <20250724061810.3677507-1-yegorslists@googlemail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591063; x=1755195863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Ib9qyJPp49kK56beQ06be/GLejFNLIBNtx4vA53VYw=;
 b=Vkq8R9TIQ+Il4EhCy7EI/WL+kdmM4Ej2/Y9WsJJmEn+whcTPbbC82kfrgnHcdMtyqQ
 yqUYQyfmyJFMI/fZjOTgh5gsic30x4j0nnym2Pn4BoASAWl5YrRF/kkLCUldYELaTpuh
 ky5Ks/Jqwe0crVvySyN+oIZzQ/lVBXMsSLc43bd0YPss1Po4otWDffTVe0yCGJ3vtReA
 GL21qsP3tZu98soNgEQ9ic/sBu7Y+FNYJ+dgDdkkte31Zx+G2sKvqHLKzO2BS9EA5PU1
 ft68j/yvutSWEinLKp/CV2b3yx/PYNRL4wcWRBRX6h6yEzywxnBUYT83klG6xx3g7jZc
 S6dA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Vkq8R9TI
Subject: Re: [Buildroot] [PATCH] package/avrdude: remove the obsolete hook
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
> CMake recipe doesn't create a backup of the avrdude.conf.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/avrdude/avrdude.mk | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
> index 619987119b..79447a6205 100644
> --- a/package/avrdude/avrdude.mk
> +++ b/package/avrdude/avrdude.mk
> @@ -29,12 +29,4 @@ ifeq ($(BR2_PACKAGE_HIDAPI),y)
>  AVRDUDE_DEPENDENCIES += hidapi
>  endif
>  
> -# if /etc/avrdude.conf exists, the installation process creates a
> -# backup file, which we do not want in the context of Buildroot.
> -define AVRDUDE_REMOVE_BACKUP_FILE
> -	$(RM) -f $(TARGET_DIR)/etc/avrdude.conf.bak
> -endef
> -
> -AVRDUDE_POST_INSTALL_TARGET_HOOKS += AVRDUDE_REMOVE_BACKUP_FILE
> -
>  $(eval $(cmake-package))
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
