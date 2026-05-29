Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCA0CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1474C42208;
	Fri, 29 May 2026 08:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvQ1FgDpSzxX; Fri, 29 May 2026 08:29:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D4094220C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043358;
	bh=N9EoEq3salAuoFT97Z+In1/jiayTafe3PUhVXSUjwb0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E53HyiPHUwbAUqIrKQqNTSzjEm+nhgFL96YvxGyLuHQBbtbthlsi3eyBzVBF52npo
	 kXCNoRNYAOmEeNG7jZ9kzespevPPQR6Koem5IYLfun+ork+6xiKkf3Gk9LNWC4kOyX
	 46AiuCs5gJ5JLeLH+Yi+/od2xNSqweHblbqooogWZ1EUWXGG2d/bSfgnInwb0Qx5FB
	 7VDcrXJybHE6OjElCmzrbRQtSCK4FpOaVIp/gFsYx7OK+RN9uRabN3wlcuSPri/mOB
	 TFEmgww5eS6CcWGSxCAzBYf9cC2vaakZYtiEER1AmFc25aRS89N7euHpkpnqWuYi0o
	 P8l6QkT+PxkYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D4094220C;
	Fri, 29 May 2026 08:29:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0111128E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD9C34070D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-eqNVI0ymkq for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C46B4406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C46B4406F3
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C46B4406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45eedcdaeaaso897311f8f.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043349; x=1780648149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7KNQ6fq2shDUdE+AGKIXgP84/4mUdkXlAy8hyS2p+40=;
 b=KVHlWCyQnTSVMpk8WcKvtoGeQWXle77dLu1LfP9jMkPi3Lt6QraWQfODPabjmHl3wP
 haY1Eoq1r0Hkai+cAfljH7J+m6eQ4/c3MWEJ/B6ForvMbJLwFY6hPjscrkhAa0VNes/2
 fP+zMz1tl49w3Okze7bU9AyjwT0M9RkJHz2fueJiHLTnr72QagYqm49UXApxlmbXUaxg
 n4egHKTRAxciuN8E75f/USMePIlrU1fgQYIXqD0n42AsCP/ZJMpnCBQaW8SjQowyzM+O
 GutXYuFhGw70Oc5QDMAa2z9ryXoYkXejmlrpUAF9koxNTOmgFQgkwy2YRCwZ4gVhDo5c
 nn7w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/X+ohAfSRLw4mFRq6HDMOo1Pop2qZKNWZxNLzYAH2r6A/kPj3qFgc/4JC4mFdwJhynknPFTQSqBPc=@buildroot.org
X-Gm-Message-State: AOJu0YygZWvkkxPrxucN8OOFUyE6t1gj4ziM2SE9owq+md0P7GOJSbrb
 QnXCJd6U1ZxqY3TQySq6CkZfS5JPCMljhLbabn8A4C9hS1IGUdwSiCjJKQm6e2W+6MKEYjb7xIE
 Gh63j
X-Gm-Gg: Acq92OHjKQcadD5b+1/wdO/5z0jeznXq3+HKNWya9cH95FKQUJGmZFor7jmvXPdU+XX
 ITEkuLYnMTigyx3WvLNZsUjd5bQGieUF30inYuXMPJOsYgQMHtnuJiCYb2Ioa9Gx9+jTRWhsgLE
 FgD4j9NKbjxBlOseE5rMYq/kGoNjne8GvKJ3BarvHsInuCqBj1lOCj34jGMBWBXOYZ3TVW1sKMv
 mnzAXvOyjZnWYFmoiW9Sh0S5lg5vQmAld30JfdavunyWeulcUai4FHWvAJDVbb6YmiraR8pz/Vs
 QZ5+21ZcvIsZrLhM7C05wk5wUz6VjklSlew5I8EVkVibsS8sT8ueXD6OJ3yD8FD0+7Ssg44hDo5
 AZJMeRnqFLG0Vw3DWZPYnmzzQVzROiLkcvfpIa/paQ53RjcTqrtDLXkQtsdgXVjEEPZvkYBAEiQ
 FcSXngvUyX3oEkv8a01SG3M4I31cK/NWvDoRzTajFiijkmizdzT0KWw8gk8iY9Ky22jbEc
X-Received: by 2002:a5d:5270:0:b0:45e:db3b:921d with SMTP id
 ffacd0b85a97d-45ef144ad78mr2438576f8f.31.1780043349499; 
 Fri, 29 May 2026 01:29:09 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34a065esm1912118f8f.5.2026.05.29.01.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:09 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:08 +0200
Message-ID: <20260529082908.56627-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251215201128.2334659-1-bernd@kuhls.net>
References: <20251215201128.2334659-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043349; x=1780648149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7KNQ6fq2shDUdE+AGKIXgP84/4mUdkXlAy8hyS2p+40=;
 b=YnmcA31yxZ6pVoADhMAzzG9iYOa+NWvhJi+JSEq0Ycs9yLC3viaG8R2qVvxz11GvOP
 pDkqf7Mc78Xm8eW+O/6EK202THPp33n94lNaY6skZoFz6GCqqqBnMsLs2TGVae0PHc6Z
 mUooepv+c8y2cOm2HcovC2j6H4tM9X9vEjMdT36W2+h3xuuCJiMwmPhWpwWmAUV6Ae5F
 +oMaga7qxuD04p83bvD5VHMc6QjTwAI0w0bwFQ2wl64JgrS131TmpHhioGJseCEs/UOs
 MsfL1T4Qeq9xARtKnpJ5xcYjWk7+h4avVaI9e6YXvBX2eLaUztohlIdDSuguntB8m18P
 TNwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YnmcA31y
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpg-error: bump version to
 1.58
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
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=blob;f=NEWS;h=c60ad85d84da2a1721e6bb8c4ae95e645be1b201;hb=e880193c55f0321bbefc16be3194fdbb7a48078f
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/libgpg-error/libgpg-error.hash | 4 ++--
>  package/libgpg-error/libgpg-error.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
> index d02983d1ca..ede1a2113e 100644
> --- a/package/libgpg-error/libgpg-error.hash
> +++ b/package/libgpg-error/libgpg-error.hash
> @@ -1,6 +1,6 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  6db7c51778e424c928993e1d49ccf6ad6866b185  libgpg-error-1.56.tar.bz2
> -sha256  82c3d2deb4ad96ad3925d6f9f124fe7205716055ab50e291116ef27975d169c0  libgpg-error-1.56.tar.bz2
> +sha1  a9876a9e4cb54298960bd4202baf891642060428  libgpg-error-1.58.tar.bz2
> +sha256  f943aea9a830a8bd938e5124b579efaece24a3225ff4c3d27611a80ce1260c27  libgpg-error-1.58.tar.bz2
>  
>  # Locally calculated
>  sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index 1fb1076ef3..5207d926df 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGPG_ERROR_VERSION = 1.56
> +LIBGPG_ERROR_VERSION = 1.58
>  LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
>  LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
>  LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
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
