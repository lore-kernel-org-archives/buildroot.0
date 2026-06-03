Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC71CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 21:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83D0361B84;
	Wed,  3 Jun 2026 21:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTbwdHlzzk4B; Wed,  3 Jun 2026 21:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0D2461B77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780521388;
	bh=wiSM4HAhTLZI1SPcL8d8tBZbYkAUF8Be/giQp/Nh8tk=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y7QFnaqyXEZrmnh4g9Mo6RJSaJruD0uMfmuxrHDXa4b8zl7yZ48XfZ/JPtDaiEZJu
	 rvYMUbfeiPPofQpiqmaQQu7adg+PRTgDzgZIxT1sAeHKYUHhDw3/3+rbz4GrVomlYY
	 Dr/RlivSD38hjfZyAZcHkThJXcKCEbG36AyeYFCRGcVDXK8L9KlRquLuiMV3yZ2fr3
	 QrXljiXfkuYQ70vKtA7NF62CLtocNmDX1eEQ9i7PP0D9iOYZda3w8QHVP3jqHOiBLj
	 YgnUm1WWe3GtEKWluWF2WMl6uzNOGIGmPdefRA31CLN3T+p88TCVceLOyZHEbVnwae
	 Xx55qW6gc5IOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0D2461B77;
	Wed,  3 Jun 2026 21:16:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41581192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3383261B77
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0shfJzCeTI7 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 21:16:27 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com;
 envelope-from=ben.wolsieffer@hefring.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 570F861B74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 570F861B74
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 570F861B74
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:16:26 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-5174a1d78f8so174431cf.2
 for <buildroot@buildroot.org>; Wed, 03 Jun 2026 14:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780521385; x=1781126185;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RI3l5aJ99nq0HEKxjP2U7UqyrL5D8H5ZOHvnZR9Qx+k=;
 b=GmvNc912CaaWjTycbjrFSQSr53/FqP3Er68n1skoHbqLgc94swEki8jsKFg4zPrpLp
 44D1DIra04kporOnD09I4lTYSducHh/FsClrz+kwSuhXw+LECsqqs42YV3uFRLbWlgSN
 RBEwAoWPUZlBRfohPi8QeHE30fGAOeVldsOXZBslrLwzLt5PCu+yBU6P/7ZZXBW42N4o
 fLRHSGiKuXeutA2JvcXHz6QC5z7ur85ohyAR0FxN55k2u8+GJs5+seOMmMQRkAlSPfxG
 cAJa2mHaptA10SYXU+6hN7ysyA74Y45jYR5dbkafe4316Zl8qyXi6N62VLJHiiKzEukq
 bLJw==
X-Gm-Message-State: AOJu0YweSLtgpk3XXFeiutaLXvKggsruL+1mx1DAPIcoVqKe6CJfP66b
 ofQLqDzoTTmdcleyp+7iYjy8IFEtvFQOt1ABcUZ4B/IyhCqk27D+ldNFbwla8sGi1dDkzNYzSe0
 4FGLz
X-Gm-Gg: Acq92OGJlbef1RjfBez9PzfL5a8megNuV4gGud/O5Y1Yt0ALVTzxLd3z+8zEiBt+Nvt
 n4o6ZtgaLKcdUHPudvG6Q2w5B8SFVt//2ibT2I/xTXABQxgiQf+IKnWjMmMc+aHC1rWwQ8luAEM
 qZM5CeSIngXFNtFDrfw7lLnLYvYotRubnBD3wvSYOehrEXStCV6T7UOexpK8O1TSlV5N6qRGoNE
 1+xtxrVUOcJsfa6doop1G5fahYbBnE4htU2EOC+rXZRvHif+BD9DL1D3li3U1L+I5LWik3wS96K
 FLCObD6NTGLQhxVD2DNX0BHXyZp3cLoieg/tb+IbnK7i+KM2vZuAqWv1S6G2SAdU7d6pR/4hWPL
 OXOM7zbWQ+IRaPqUniVnKkhUgrTngmXCtABMAi9y6RHtJfrGaRHEKUQr3nlev9NMoWTQH5MdnpE
 dFn4KP92dx1O/JvzN/VHEtAY8OSUNKdc7MK6U7E94=
X-Received: by 2002:a05:622a:1181:b0:516:dbf6:f8e7 with SMTP id
 d75a77b69052e-5177863195fmr80884901cf.17.1780521384866; 
 Wed, 03 Jun 2026 14:16:24 -0700 (PDT)
Received: from dell-xps-15-9500 ([2601:18c:8002:3d41::5])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775c4648asm36820811cf.10.2026.06.03.14.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 14:16:24 -0700 (PDT)
Date: Wed, 3 Jun 2026 17:16:21 -0400
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <aiCZpdX4M_muNuQG@dell-xps-15-9500>
References: <20260603201439.3893380-2-ben.wolsieffer@hefring.com>
 <87qzmnjr2g.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87qzmnjr2g.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20251104.gappssmtp.com; s=20251104; t=1780521385; x=1781126185;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RI3l5aJ99nq0HEKxjP2U7UqyrL5D8H5ZOHvnZR9Qx+k=;
 b=N85saEidNnZ2uUTS7EsdQQhTD6sL+2m2ymDODJLb5kC0kZztno/hFDQ9Fp9o5wPGwA
 FLP4OirjYylqB/nPbZKyHBSXRlIKsOpfBAEeF0GeyzPfJ+6GlNGr2lzFEO8TScnNi7gb
 GGxUHlRxO6sUE2KLnwYBuErIygFc2Suka2ywBi3lSbIlUamLXhW0w33o+20mqI2IULU+
 qqWizoBxYm4RagVTczaMcerLAONsWRznZgpiIzTwycKnlGMYtxa/M0fkqIXMYYuVjxHI
 9Edpc/wFzKFTgTM9z2VoGebdBCW3ep/C6o8ga30+UQWCuDrO2ihNUPyYZd8FtnFXootj
 Gc+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hefring.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hefring-com.20251104.gappssmtp.com
 header.i=@hefring-com.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=N85saEid
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: allow installing only
 sftp-server
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jun 03, 2026 at 10:40:23PM +0200, Peter Korsgaard wrote:
> >>>>> "Ben" == Ben Wolsieffer <ben.wolsieffer@hefring.com> writes:
> 
>  > It is common to use dropbear as an SSH server while pulling in OpenSSH
>  > sftp-server for SFTP support. Currently, this requires installing all of
>  > sshd. Add a new BR2_PACKAGE_OPENSSH_SFTP_SERVER option to allow
>  > installing just sftp-server. This is enabled by default by
>  > BR2_PACKAGE_OPENSSH_SERVER to maintain backwards compatibility.
> 
> Out of interest, what advantage does this have over gesftpserver?

I have come across gesftpserver, but I admit I have not used it. I was
dissuaded by the "experimental" label and the lack of recent development
activity, although the latter could just be that is not much work left
to do.

In general, using OpenSSH sftpserver provides full compatibilty with
common clients, because it is what most people test against. I see that
there are a few OpenSSH extensions not supported by gesftpserver.

Ben
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
