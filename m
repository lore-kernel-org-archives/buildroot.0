Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605D810ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 390E9613F9;
	Fri, 27 Mar 2026 10:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmmbUc7UA7M5; Fri, 27 Mar 2026 10:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7551613E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605770;
	bh=s6tSWY5GTj+r4y9feLGZSUG64wnWhaFGS0eUHU/M3/k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nT3rMBJ6VfsvSpk7LMnl8bMbngTnS3p9jlh5cJ2rr3M9yngN4xewbCVYd/tLEIPSd
	 tsT3YNjVMU43BiMXIdLgLDV4bOV73gA/XzpvzVvcrO17s5WrAhabkGWlYMQEdJ0buy
	 EOkktUKMLm7nhaOZWEymDsaEo+gzyFT+VUh3kDXl3pVine7EF5ZvQnxYhyXcSVMZte
	 KMSPTr3DQBSi3XtS/T9yro6SFOJRT4Yz/KUljZoNtLAtpODqYgK3umv1imqCPHXObf
	 0fSIVdLXFKWWSkekMpp8pzKTdg1jdun0A+AuvoozA0AdfkfPCe6olmXkQgD3BwvZue
	 +kT9erHUQgbsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7551613E4;
	Fri, 27 Mar 2026 10:02:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 625E41D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4875083D61
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giN25OFVCvZM for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:02:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6EB9083D5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EB9083D5E
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EB9083D5E
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:43 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso15558995e9.3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605761; x=1775210561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=on89tuXbbz1/hEq2uVY/yEJD3RM+miI6ZL4ZT8Im1cc=;
 b=A7/wjWET0znb268Pj26ObFnBczjQp5iiFXlkhqCNVAlPFJFRmWY0BbeaAuGjYtaWbn
 U82dlC33nRrFofOIKM0U4/nLbnxcOsFDTY4BP5AmGgLPnIoBj7JACuZWaVS0PQeO/VlY
 XU/HufXgaih2yzhL+z4TX9OT+tUBsTJeom53JfRBopOS6UH5X6JJ52h+CSagqxYwY+xr
 iER0HV1Xw7pI3ryh1O4a+xRmgM8YvLGUE4QxPOcP9RzJ5qN9tYmkIVvsLu3bKRYnS6p5
 eqUq5e4/3FjfXlwbHa2YlfTlA0d9c1ClQfsSuBwgqWR4Ah0VdK/tK3sA+WClteqGmxmP
 dlLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV431mSuwchgA1XieoqMJ+nMtB/avlDNkyH8na/H1n7m7PypGJbpaOQ6Xls5FbTFtsoAjCTrjFGzS8=@buildroot.org
X-Gm-Message-State: AOJu0Yw5U/l4YkzFBhZas/NDguh2Az4twKQySdx1O7+9mFdeffl0QzdO
 eSneHwQn/8oaIlQv+R4ipGC0Wz9uRImuJnZ1NBmzif5uuQWuJaBNOqEaHlLLMtuKodA=
X-Gm-Gg: ATEYQzwqUnBJ2iRHCEX+WfS09N3hEhbwvQKvxOeNnI0AlNygtVK2cD7Tk1YSgGIjT1f
 RbdOUBPISJFWH9w77A0nVgzu6usKEvJqNPpB80ebj4L685tCH61ShuobfXNifCKC34wF0tNu/wX
 fsba1nqYAUZCmAuM+6vQJvIOmvbKL6hNmYOOz+r00FhPgDt69m8RE4gdWFLiS/zv4BiPN0RA/Xp
 9w5zR0/+NksfSo1/cd2BY9l2KUbNpU/ufGjPgsJkduO1NqtzCCfmJJWXRHi0SCbvnk2r28iS8v2
 E8Qg7ixmnQXMddiyDZgnNvP/LF9pSui5637+rfYe1zyJq7S6UhKTKM4CdPbG9Ge5oim4zKgwdjg
 wjHl0CBjKMt/XUXMsDF/nTuEenOLnP8RKjSf37mFMXCEDKrMC6HhlYazBK0/YJdfsjsGQtRQVna
 1RG8v4Uz12xbAykGV+
X-Received: by 2002:a05:600c:c086:b0:485:3fc8:de9c with SMTP id
 5b1f17b1804b1-48727d7f9e4mr23199055e9.12.1774605761324; 
 Fri, 27 Mar 2026 03:02:41 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48725eca5f1sm14299965e9.10.2026.03.27.03.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:02:40 -0700 (PDT)
To: Andreas Ziegler <br025@umbiko.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:02:40 +0100
Message-ID: <20260327100240.46313-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314061837.9425-3-br025@umbiko.net>
References: <20260314061837.9425-3-br025@umbiko.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605761; x=1775210561; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=on89tuXbbz1/hEq2uVY/yEJD3RM+miI6ZL4ZT8Im1cc=;
 b=hL3Rn+wDS6fwOEb5rsLr4Gjt4QhG1Pb2EmFsW2OqSy1D3wDByEHlUpDQGt0JqAJATW
 Lwo4PyhxI6kff5B5o9tRj5vBz6r96biJ8Z1LfLuSMjjFPkPplodND1qnQkgYkO/aabCM
 HxfzCEG+lKFidP5jx4JzutEPIvAOXyKqfloVGEZFOvf082pPF8LKyhWc/ZiS293UlCbQ
 s31qjVCQdu26+5IpdHFQey9Qzs+I5ctElOcM5xU2DZlwXO0djmGpRSBLV8kLhJo1B/Cj
 /7EW6LN7y5Kh7pFK0iEz5XVz8FzZxIU0WkVFsXYtEQ7xJokmTH18nek26KzGiH6tnFST
 2IYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hL3Rn+wD
Subject: Re: [Buildroot] [PATCH 2/3] package/mpd: disable build of manuals
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
> The documentation feature was introduced with version 0.22, but is not
> used. Instead two other options (also introduced with 0.22) control
> building HTML manual and man pages. If the tools needed are not found,
> the documentation build finishes silently.
> 
> Save Meson some effort by setting both options to 'false'.
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Applied to 2026.02.x & 2025.02.x. Thanks

> ---
>  package/mpd/mpd.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 3df6276a11..c8107be128 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -19,6 +19,8 @@ MPD_SELINUX_MODULES = mpd
>  MPD_CONF_OPTS = \
>  	-Daudiofile=disabled \
>  	-Ddocumentation=disabled \
> +	-Dhtml_manual=false \
> +	-Dmanpages=false \
>  	-Dmpcdec=disabled \
>  	-Dopenmpt=disabled \
>  	-Dpipewire=disabled \
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
