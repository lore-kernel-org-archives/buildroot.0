Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373C3CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F123C60903;
	Sat, 10 Oct 2026 09:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bf4x9GKujEUo; Sat, 10 Oct 2026 09:23:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B4A8160AF2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624208;
	b=UWPROMZrKfeek809OsJE7NKIxHjQBgfyMf0VSU0rS64E1YhuY1Txq5FGPmV306OcJUjV
	 Y2YL+yVElxKxTr9NYqCplZNFKs3OBHwpoD40EaCedDCHKlUm5aCzqFLmjHNXQkAcfYB+i
	 v5tpgAMvDY7nCyWaEfc74bKvT2akTWcFpns0Abj5l2RkEfbFlNx4kaYIpTdEFg+PmZtdq
	 nFIM3wp35FeBWugfjkBQNQ5U/Jlw76Wa9VWYcZXDVdCvFXED+DOjMBuk3DjBJWoTkTPlc
	 FRaZGAqYmRA3z+wpOaRQX2BAgISYmyzJIlQLaJxUMWiiZ1+rDmv6vDVvVAHqC8Cqf5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624208;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=33738L8y9xeAx1laFjGyBRptZPA0RV9NIXtHV089k9U=;
	b=qWMPCp8H9ZZ/PfxXYNNEApBsgU1bvOx2i1zXuTeWSR7FaP39kC4dPVO51VlZQmJrLGQh
	 UL+xw4D8yjZ27a9vEfhfzzPIdGRZDKtHGT1uvNU8iv1l7E1Wt8FUPzRNZMp3XgCZiJ0o+
	 aNT9sl6QyrbklwVDD057wrNeTqIx/cPmcbwpJj5ZU2RiC/J3psOku2bJv4wT6C3AZ6bdX
	 itOcPU5+shpLU7n2HiuLLLGrMAY8sWcgvJGc4pm+21AriIUlxO5I7JTE567WefOD4gT4m
	 G4Sd4z37qvZVJs/8OzqL6ms2jLE46+7dpfCJGeYpZfl7r3Nk701NPnERu0kJEBHzxog==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624208;
	bh=33738L8y9xeAx1laFjGyBRptZPA0RV9NIXtHV089k9U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dwUdsIeXEPLDQ7jLEFr7k4DsqqtmH82qDSiYDq5G6wPl/ccRsYoAOZjn6jEcH7/7/
	 JQo4v0Q8Ndz2utVRX85dZvAXLSJoDeWDCYuUuHxpYMIHiZDqO1NwI2kC1jyt900jwn
	 eNIRycxreehKMocqX+3JpCb/RzZfr6VcqBpBivit8/i/VZBN/lzWroIhVhADQ5aI6D
	 ixoZncs1dIE6obEJ2E5KPrkeesLlek4M8Aq9aSnh34D5zJgDA2NnW9ktSyFWM21Ilm
	 mENU+Wna7Z12YIw1p0NWbD14gK2znQT4uFNRnmEWfpxBagMg+aNJ/teC7kcmCPNsa+
	 Hi6IFZO/Dv4fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4A8160AF2;
	Sat, 10 Oct 2026 09:23:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B35B6A64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FC7B811DA
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmmdeY1gUF5u for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8752681255
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624203;
 b=Ynytf77zDIMOUeZnRN6sr2549BnNx9o6D6SU6VA2s5kLWHLyRlJMdcBvb8uwYEYW4dWk
 J/tbl8mXPdANr8E4VOz4Sw16BobJlkP7PP8mmTXXXBpVbfu07UnwM6s+Y8ndb6TC8tC6S
 RMyLKHoj6ZuzD8M5ztwpd+nsFwEpq7u5zN/lyfyl3XKafnZO91q3Ik3+GxLGY+I2y8FOl
 q9Hd1mwLFYqN6cvmR/LrCTetNwijyz1zfmO5naJQwzkSPHM5M3BZM7qbMt+NZWlH/AerF
 KPA8rrQnaL00kNXeYPiZON4ztqbCAzu8jQQGxpFAdWvW112/QZT5uzCtuuIn/kFFVHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624203;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=Ub8g1ik5yNJPVVnL1M4UzflZfq8YxNs/2MAgtC/LCe8=;
 b=fnX/tbrSM6A1Ymdn10o5QUOWL9I0gW5n0/dzB2E4iSE/EjtUFOtel6yqRo2KUBomtBxg
 gMrGtjF+CKyD6AqpSPdwLiLH64cXXG1U/tCWpjBcqoPX4Gwc9p6/HeqdxMYoxGyTgmgiE
 pjw0VBmlEdeHqb33Qavt0T0IAUZUABdamo8JcwQhJQ9HeXuxmwjZgRnC472s1lA9l/8FN
 xWEj3rhUM5O/w/YLdf1wt1g48syvol64WXjVw4bpqJZAvg3DkgPImiFYDgtmDEu0jBC0R
 Yz4VTTPF+gQrYuZWxkmHp1nkFhHBHxttRFHlftOuznGAdEJhvkYXCpcKUeeXg4ejVbw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MiAJu0yB; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8752681255
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:23 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4956869750eso3808705e9.2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624201; x=1792229001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ub8g1ik5yNJPVVnL1M4UzflZfq8YxNs/2MAgtC/LCe8=;
 b=OzeZ5WbBqtk/tqMo2DzpBuDn8j4+rYJfDCU6vMPu/f+m5zgyEG6iCpwg9rnEbuG824
 X0VZka5HlInHkW9G39yMdWoAsIUEg+EOt0TYB4l/7b+Dp8pRB67vPoGqYglV4p5f+7KI
 d3hZxcwVMcvawkmUVwhODWcYTLwe6+3VgNcz71JS532+L9dcJ907YHW+fOGPJlamleqf
 e6DEK8ZRXyk0VXY7qGRN4Zb0fb6TiIIpIpWvHR+NDx0lFtBH30K1KoYO1qD9Y1oihaxw
 /tmIMYntMZKEzAENVlFA5S96ChOBY1EPiEtTP41ijB6mTA36pi8JBhj3eT9Oagd4GUyF
 LFPw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwN8nk6wRLoAwrW4hCy3hA/0ib9AYT94iR3tDVwkfgIaVm5zMRn1f2u5g0xA026jHwnUbvrDGNvWRI=@buildroot.org
X-Gm-Message-State: AFq9FYL3NC2tqX9C6IOtAcCCS1L38P0Kz/dgn4K824tKabcwI9CKkGR+
 n1OrPA22SmoLaejw1j9qq44bVJoTfNeoP/928HrxYl9Ez1jj9LhoRcYhfkJwSR/7xnY=
X-Gm-Gg: AYBFou3DcpVJDZDvAtt5t6X3Ws8Ybzr7Y7dUvs1cTBRai1gSz718TDgsr70VsoQwrbV
 cu/5xTVKzo6VQ983+McnseYSxQWw/VCS3R4YouXJ4AAcG27J5wksGrDSC+27NEsYiHSZ3tDL2tF
 8ozSijcKb5+CNWfEwNXc0uuNu0rAjsNGnCTwelLFL7fim0zO+qGQ3s2W/N7QeaB2h1TL3cHQL0c
 V6nxFrMhReZlWjX0fdTeskNF9IoLDDzI0g8JxYPeE3M8+Aql2ieL/6Pbb6UVbP1bRUusDtXhe78
 7rAhLSyJzLbagkvtQacgdiu0Q60yE3SRe0hAzBOvIhget/+XxJPt38UFBraWNOcvjqSnA2pJ8pC
 Lj448eHlWSO0X3tneyoJDZsVYniKJMKsj0n2UjaQXXKfS7CdWWx9OMfbvxsH//pXvauin8rbmLX
 il4N7dyoarpS49aAtrRzpVc6NdNyJIp/dugsfuBlKorcEs3wTaolRg92+OEWb4MrBo+HdnMeLON
 HLY8RtxmaFs/9aeN9UqqGtHQqxNk6DQFf8g7NJu7XQfmOzPHlkb+GDc
X-Received: by 2002:a05:600c:3e05:b0:4a0:2391:6540 with SMTP id
 5b1f17b1804b1-4a18e4cdbd0mr79231605e9.25.1791624201043; 
 Sat, 10 Oct 2026 02:23:21 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e4a3b4asm205156965e9.5.2026.10.10.02.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:20 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:20 +0200
Message-ID: <20261010092320.139501-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929183607.1849293-35-bernd@kuhls.net>
References: <20260929183607.1849293-35-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v7 34/66] package/ca-certificates: Replace
 c_rehash with openssl rehash
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
> The upcoming bump of libopenssl to 4.0.2 removes the c_rehash script:
> 
> https://openssl-library.org/post/2026-04-14-openssl-40-final-release/
> https://github.com/openssl/openssl/blob/openssl-4.0.2/CHANGES.md#openssl-40
> 
> "* Removed `c_rehash` script tool.  Use `openssl rehash` instead."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Martin Bark <martin@barkynet.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/ca-certificates/ca-certificates.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> index f5675b754d..0f88df3eec 100644
> --- a/package/ca-certificates/ca-certificates.mk
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -36,7 +36,7 @@ define CA_CERTIFICATES_GEN_BUNDLE
>  	done >$(BUILD_DIR)/ca-certificates.crt
>  
>  	# Create symlinks to the certificates by their hash values
> -	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
> +	$(HOST_DIR)/bin/openssl rehash $(TARGET_DIR)/etc/ssl/certs
>  
>  	# Install the certificates bundle
>  	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
> @@ -65,7 +65,7 @@ define HOST_CA_CERTIFICATES_INSTALL_CMDS
>  	done >$(BUILD_DIR)/ca-certificates.crt
>  
>  	# Create symlinks to the certificates by their hash values
> -	$(HOST_DIR)/bin/c_rehash $(HOST_DIR)/etc/ssl/certs
> +	$(HOST_DIR)/bin/openssl rehash $(HOST_DIR)/etc/ssl/certs
>  
>  	# Install the certificates bundle
>  	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
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
