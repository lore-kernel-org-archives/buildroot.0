Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245E6CA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF72180F69;
	Fri,  2 Oct 2026 10:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10epcqojeHWg; Fri,  2 Oct 2026 10:33:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EA02C80F95
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937209;
	b=QvaCz/HhKl7UfhzEG1S2o7Us2Xi7jktPImUqa67/Adq0wLsy/KxSI7STk8s4m3iV7iBn
	 +nzfBkzYBtb0yKTPjj6vLC5qXSJvyRxJjhCGkfSAkdUodMHdbG143LAlDUNmbAHM3o3rl
	 /kZY+ObIlEoimlB+rHXOgXaUUpOZf8ETv/D0+lsq4o9EUEO7ZQKTdmg/AQ7Ny/DEGAkSb
	 DxzmTVipCAeTOE8nxCHTv5R3EuOXqr2pIcLypgJIUUsfECGw2xDBUnXXyrvlTWJW3RU6c
	 bHLKoZlzOW3wJiJgwRtunYh+AgiGmzH6NQfi0IWCYsB12Ot+rcneU8F7TN700qoTp0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937209;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LYW2+1ybFr6Q53R0aUazRLCxRz8XAccWQwUcuS6/9n4=;
	b=CgWyj/QUK6Q/oL2/gG647aXKuKhyNUG5K+idLz/V3N6M5DrYs4zqg+2m3D8ErzXe44fB
	 GUVSi9c0ndWlDPDuuXc/XEkBZqd94LsA3be5yhfJGIHY18fTmS7dG6M8C26FcYYZzkkh9
	 mQ+VN6jiktgIoED3OlOgs7+yv7LP0pipy7qSKa+LOiOd64LweKRMZf42hiEnSzmtzazEc
	 3cN0VSCtn1FsKGEmrxclGcRxJiNGpKLmILKHSjHmNy9aanMWSuw6W2/41PqmraXJNhrZ3
	 S8ejABuoJy9dtjhJ09uHyRAqzTkG44GdablUjwH2TfNs7Eo7lqbBM1v3xpG3M0yNlwA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937209;
	bh=LYW2+1ybFr6Q53R0aUazRLCxRz8XAccWQwUcuS6/9n4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qSFaetZz9/3ywOFOAGC37hdLiv9jAvGOQWLhCygJ/7UF+xtxoI80Od7/WIiLgmzvT
	 blOz7SGxh2h3x/Kw6dc9LAWI2q1gh7qjwpzmOeLhgNAi2/ilVpXv4Z4Mb40yaoTsgu
	 Hp/ogIhzArlgpzqzkFUH+t+K9dZ9gg26ILi2xSlIu0DUeaxdh1V/oJIK3Xg1xY9GYX
	 ehLs+OzXAZ+FMt+fgSvpGWjFU/gLxFeU81Xu0wbLSlTqHTCa42PBWwzsEaBzpG1AdF
	 9djbTTs41zQK0VukiUGa9re/TmN9iuXxcwoxaNssl6XEZeDTxkVsAT077facgTjYsI
	 jZZCwzqZdqtxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA02C80F95;
	Fri,  2 Oct 2026 10:33:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FC9A3AC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55C9560BC0
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wP1t_aBKdS7F for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:33:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 68DDD60BC2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937205;
 b=UK2TlW87EeIN8h+OtbaUY2tu3Ss0+YgrZD3SkGnj/ZLOPcl2PH+YNCj6HFBlVthvTUir
 R6UVRGY8K0wNpbAEnCmjmJk0Tovcbb/B+qtNJQ63lZdIctBi7FYXUZ/dNTNgH/C+JIh6w
 818FmA+Zn9wwNxnqtR8jV4tyLjdJCXPwfvSkSBUXLGfhMTpQCq8J5FHm+s1oV+270J8i8
 NKgIU9obE9U5d4Ksya6n1lnIPWzYlgb4RPQQ4AC3aGUtIM5Fa+4zevtAO+x2Bn/24kR6K
 wH3wvByz4JHw6s1vf0EUWiEsYgmdIRrNc4HXYjgqA9md65iAMmwGz82k6nAo+oySxPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937205;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=laq8uYk4RCaYq6yhjX5OMOjMwK2DdSu0AUzXc+R3nTU=;
 b=bfytFntPG6+OkxpYpckhJP99meY2w4/oWgiGhQuhlsV2MDgsbi4uQcL1eBT5ChudNy15
 8CuZrMUZF7GcRuNyYneAKBDC2qtWeYAgQXOzePBifx6hLcn4qDuL/mPwClqjQIItGZeRQ
 3wBWQv05RQJDME5oevCgNy2au6mdSZCNKcQecuMmbnMe/MXxz65XxOyDZO+Op7FGeMpoG
 Pp+R3d6FOtggPtQmNPErhBlS7o2jmKuarVq1Eq+Ewf6f8xu+EwOf4JhGjktMvL+Mjo/fl
 97nEB2AxTF8+Dskpt71BaUt8yQ8OcSjb4U5dFP8iCq8YnH01bpE4Sx2qJpj5teDVHLA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TmyDR7E9; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68DDD60BC2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:24 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e6c0fce17so41366825e9.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937203; x=1791542003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=laq8uYk4RCaYq6yhjX5OMOjMwK2DdSu0AUzXc+R3nTU=;
 b=ZMhzSOtHfbZOmCWc4U23gcE4W1XdKGle50aYxmM+bb2vsbg3ntv0t9UB2i5GpRmCYW
 0jqV0EhelN/8JuBfk0IEuvKsrMr9FA9XjCZVpauZC91lP1nkrnlAe5nV3Z1Cg/kYYIpv
 DHUjgq8INMEVmQHPgYTn3JibYxhcAPrGSM7LTDNSW2LN750ss1ct8uDX6W3bXbjQNxi2
 buX9MteG46VViQBNMg5omTtXD990pNY7pdJcSk1vFF3GK8yuiKBUIbXBNx76qbQh4Y45
 X6KUDC+N+6B5oLa+6ji8+wvWw5Jo44lbED7NdxEvMUqfBI+GlCiaZRUSzidH5l4RDp2Z
 F19w==
X-Gm-Message-State: AFuF++kQeNPg5W48C3k5pHcoJSkUBJjYtHsAd7urIvkSvZVFQR7z0Un4
 60dhb1ZZWmyVFKS6crCsH6Zazh5YHp8CCWN3VWuHdLtz5aNDKa1ybULTDrwnyeV92aIZ1rh+YaZ
 T6BXdzIs=
X-Gm-Gg: AYBFou26b+xnrTnCiNVNBdJwE57ng1KwH2MGiN5SWedPTSVIE9M8UZkp/4M7IBWw4WU
 sgaEjC3D/b7aXVbbuKFLpGZaaKzJ/E70zvwdLLhQA+mgUbfBTLQ26ZgRsABcw/WHnWLOMVVJiMu
 PzVBkhHi0U1H5WPNd0h1yuCrUEucbnX8/fWf+8FIyj+ilX+keKikTysfLApmFhilDCMDnti2XHP
 /jvWTxUYfjLco43Uxhr7076ueYzab0/7YitLBwAon+TDTlJbJ4ckxtukMYCJ3r3gwIfQ0uS8dq/
 wHSQNoNpbx2Wx8Uvq6y0Cp0pUP9ELpGySbA/xDlOByXTE1B5D111bYKSIjaCq/kxkh6U4KTwLo9
 J1BnCVQ+ZZrcl5NGtjPQb5hN8CPOGbG9RfTC9Ij7jv6c1WKZ6FXDTyvsmyyW33UZUzfiELuiuYn
 yYvTGYwG9OBrjPxSwmRqCF4QZ7yVxOWjMcU+ooiDbpymt8MDW1muJ6NPp3h7DzRXAi7HO9GuSCj
 kmZ3KKuvYeONJIeF2dicXizpAh4uNBcpHCLVXjtew==
X-Received: by 2002:a05:600c:468b:b0:49d:1df8:156d with SMTP id
 5b1f17b1804b1-4a0276bfcc8mr41060365e9.18.1790937202855; 
 Fri, 02 Oct 2026 03:33:22 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03043fae5sm38369615e9.0.2026.10.02.03.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:33:22 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:33:20 +0200
Message-ID: <20261002103322.77379-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927104301.1801638-22-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v6 21/82] package/asterisk: bump bundled
 pjsip to 2.17
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot commit 7f48325de69ddaed921572edad875694a8154419 bumped the
> asterisk package from 22.9.0 to 22.10.1.
> 
> This bump includes upstream commit
> https://github.com/asterisk/asterisk/commit/5d543ad80ce6ad8a697cbd6c1938565047d26a99
> which bumped the bundled pjsip package to 2.17.
> 
> To allow offline builds we download the pjsip tarball so we need to keep
> the version numbers in sync.
> 
> The autobuilders logs show a download process:
> https://autobuild.buildroot.net/results/400/400e53158f11926446c11d22681eb8a9430caf1d/build-end.log
> 
> checking for embedded pjproject (may have to download)... configuring
> [pjproject]  Downloading https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.17/pjproject-2.17.tar.bz2 to
>                /home/autobuild/autobuild/instance-3/dl/asterisk/pjproject-2.17.tar.bz2
> [pjproject]  Verifying /home/autobuild/autobuild/instance-3/dl/asterisk/pjproject-2.17.tar.bz2
> 
> where the tarball was once stored in the configured download directory:
> 
>   --with-download-cache=$(ASTERISK_DL_DIR)
> 
> to be used during later autobuilder runs.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/asterisk/asterisk.hash | 2 +-
>  package/asterisk/asterisk.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index 35aa1282e8..1bd76ef865 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -2,7 +2,7 @@
>  sha256  373c98f4d4a1b923b42def0aee03f4e36aca9d1c244a8eeda646da8a97f89663  asterisk-22.10.1.tar.gz
>  
>  # Locally computed
> -sha256  633c3dc34ffb21af8ac9ee160245c9c174379391e35cace1b6c9f516a260f683  pjproject-2.16.tar.bz2
> +sha256  04b2eb1f0f01aa0ad1945b167171843448a51aa6b7c3e806496d434f13a112b7  pjproject-2.17.tar.bz2
>  sha256  6775095bcd417d375faddc1f17cdd7706ad8aa9b9b02404990c4b0ee218ee379  libjwt-1.15.3.tar.gz
>  
>  # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index b6b40645ee..8d03f2bdde 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -12,13 +12,13 @@ ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
>  # compilation with the external pjsip produces a non-working asterisk, which
>  # segfaults. The reason behind this is unclear.
>  # https://github.com/asterisk/asterisk/issues/671
> -ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.16/
> +ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.17/
>  ASTERISK_LIBJWT_URL = https://raw.githubusercontent.com/asterisk/third-party/master/libjwt/1.15.3/
>  ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
>  ASTERISK_EXTRA_DOWNLOADS = \
>  	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.6.1.tar.gz \
>  	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz \
> -	$(ASTERISK_PJSIP_URL)/pjproject-2.16.tar.bz2 \
> +	$(ASTERISK_PJSIP_URL)/pjproject-2.17.tar.bz2 \
>  	$(ASTERISK_LIBJWT_URL)/libjwt-1.15.3.tar.gz
>  
>  ASTERISK_LICENSE = GPL-2.0, BSD-3-Clause (SHA1, resample), BSD-4-Clause (db1-ast)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
