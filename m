Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF254CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB390409BE;
	Sat, 10 Oct 2026 09:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhbCjBulFL-m; Sat, 10 Oct 2026 09:23:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CDA4A407ED
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624210;
	b=hOxrQD29pgDTXSKXqlcOhOr8F/p3PG/VZgVjk/WwJrDPfw3+JTSHDFk6v1nkMqqKfMAo
	 hZAEou/W5J93zgCnDNt2Q/43aaZDRqOp4JdDHYpr8HDGLrPJ98PSqFhPsDQieKQ3UJGRw
	 jI5I3u+3dSHTCnjWJS+BO6t6p0M3lclnTDmIANKI+i3FBhXfKMbL4k+WAkcld4ZGKFtPA
	 z3ZiE5100yA8mYHKvNlY3KWmM3XLOAEf2byRmJMnKh1BBuHAxNW9N2PlIv4Zu3lJW2oH6
	 ezOekZPrdC0X/J3VfhIsjsqCiDsSnrjJItEhctSilzeP9gUrN/rCJxA0CPBVfBfwKCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624210;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AlIhaBp4tn+3SQ0D6asHBybuyvG+ZxF9kz655vA7FGw=;
	b=Sy04N+2ZUQ5sGevKunwRi0pAjCDylq0OpKO5hLHRdrnFjMZl6fl6O+nQeKn8Dyae5FFo
	 VGSGn5h6X+W0htPXNpjsICnjcgMiJLJRXFPfNqI/8gh1a0NLBbuo4QZPQ0n52T/FTIU2z
	 S6/YKSaXlt1OyLLhozol9kcENtwmdxpletlXKoEdRPVEGGhhBfrHpxMHaDsgcBWFUqotU
	 Jo5MKiH5s8KZy1qgVmWvW0ma6jiysxsOlavd0mL00CN4NYOZ1Vm1x1evq5gv7/RgfCtQI
	 oBuaLAYWNfzK5Uc5fBI+2tEraXWRVtXpgWIVqmxTfrJ3P7g6qPrExOvn4fj7qBwR81A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624210;
	bh=AlIhaBp4tn+3SQ0D6asHBybuyvG+ZxF9kz655vA7FGw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WoJ5wPKUpcB7KysaajYck3Dfz/3j003b68VEpaRKe3xqYoq3oCsSJj9Oay2W6ibFF
	 0QRt59XsCjljEt8FJ04XUcnihNRtHyPRzoOEQQnTPs3sfxcixnymec2KCJcKyALuQ1
	 VsAZHriVHPYY1mPOExMvFBpk+xrbn6+doxFg6prDKMhbBUmWycafkQYrMQe41+32Vh
	 t3q7GwhZhBq+orhv/t6wklOd8cRGRXlVSuvF/dlTCbXvNy0ursJCIqcyDt1KFDVzr9
	 da0NP98y/XNiU5xYP8UutGcaLKBS3kVMVDSChK447XDvtMjOw2Vzt6pMZ/2wlbOlLJ
	 5jbycRbcn93CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA4A407ED;
	Sat, 10 Oct 2026 09:23:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2166356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3B1981208
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuQflct8ntAg for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AF861811DA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624206;
 b=s7TRIQoCHUrk2HSKaKhPUttqXxXqQ/RfvBra4zWu/dNieHIIqZAv0oWkFaTL99u35g1u
 IrRbG4BpGehGYCi4e8/WtmZ7saiGdrm7wWa+m9DCbzyyS6ntnnjmkxLrWa2PyzZT9BEUH
 yGR8LuTo2VXRL4dHWbCuzdZa4JBvway5ODTjfPyssgRaFCgWwhwifOFvNg9FYJTv8iNOh
 BO8ljjWmDlo8yHFoyR2eV5CXUS8epyNXlF5ghy8PPyFc8o/O0oitdUJ26+ZSuDftq5CII
 KCEzbqBlVasnONXM8qEiwFR8nh8tYi9ZSLlYIrKsKKbuZCdFfjqbdaQ7JrsxI1+CbOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624206;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=OJiPmYVl+QfKXpK5H27pAjpEEPvoCF7lhUlgXbTu/r4=;
 b=L9VabGOBckeYQuy2yqI+bNMoipbzdy6rZ4RIJ2yumLuNjIv7VGXBW5WaScQhe3o7VfdA
 nTGNvt1IoECWUSg+BmSo71DznX7ee+poL66HVVvuqhF4uoer91oCablzzqy6CXmNXA+l8
 TYrfGPctdwWHGOykbOnOeM6Fzs8+u59678ZK1CXhgWcudjasPfSkZ7aeZIgQCSeV0TFwO
 OdZxE6tM8ghQRHJhOfXE9CBxDmkLQGBAJpzmpLzWlyPnNBMIWMMGloFQwrMIWS5LrOP3f
 SnfPs34uOuq5YpaAzYoQnV5C9fCEZSPJ9nfCRUxzqo16olug48kGnx6YsUBr0fyklUw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hiYQvGfV; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF861811DA
 for <buildroot@busybox.net>; Sat, 10 Oct 2026 09:23:25 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so5867805e9.1
 for <buildroot@busybox.net>; Sat, 10 Oct 2026 02:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624203; x=1792229003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OJiPmYVl+QfKXpK5H27pAjpEEPvoCF7lhUlgXbTu/r4=;
 b=MGf6maUshKcWGQfEKOt0RioXwKye1Rru4uLRpDBugRMOCjTzmTIfjLOuvXLsDNGhLJ
 bHgSjl8P7P2vBO78olW5gxw2m8EXHGz2DHlBoFJnlu4buOp2/RAWwYiZvZ2Qm/EOqSGX
 61N13Bj7snnkrpuxFi0B/8TZ5KS+KjP013cTSawwvwjyMUcQtG+ugCzAPnuMrcRi7JUg
 UvWyP6zeUy7tM8isnQPHwE10mAorDS/WXMPVgtWRna4LYvsbXxH5mpJX7CsW/c2GAZ0F
 oyaall2scv6V4CiJSPtjbpAkzzmiyElsiWI4rBv8+BQJfoMRGJwjwS9Jj/vyYLKUcf0L
 KpFA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzBQrwIoMpb6H0bK7/wjYnN8MaCMpqbX/bS+sFZ6aMPQUoRltzxWxOJu9DX0s/oHy5w3BslC41jEy8=@busybox.net
X-Gm-Message-State: AFq9FYJTsy+uOs/+RTyTTqYImmXe1d0K8oAXVxOd9XFwliqRL256+Zbx
 Y1ZZjSQjOC68otL3Tqls17EzBpIm/odHIlV8/1KjYv5ln9Yho7aRnBhY5egubxoLPP4=
X-Gm-Gg: AYBFou1hre4j5aaaJpJawVfXi3p+fqpw8Td8gbmAjuEYsUL4oz+k0cP6VSRbepW6jK5
 7Rfhtswa8ZW33giJjgUoPYWDuAoIJZSLD0Keeg3gHe86lDzde4SSY5KIAeH2X+wTx82Z8uA0V4q
 P0V2wqe9q0Pb6J9XoPaIt1LNrRnb5iJEGZGvaxaQBJ847yO95w3WIm6G/F0jJDiM4M9amJ50S00
 ifzyJIixR06D9NUknYQmWwYVLiLe74n0Kr/HobBfmrM3cYzflc9g2aZb81ANWFS+ETaYgGEaT6F
 QQKWRsegD5uMJPuAzy72i06jym80kjofvBhTgjaa5VgFOxggvHqBIBEiBeCvbAyOdZSLRs55w3l
 AxiWyx3DlCK7XXtCJibfQqECTaYBWOUviDM0H6lRnYnGQ8ysi6w28Y7wDSYbb9XEmJypyoipiwV
 2f10hesm6AxwkDENYq1iHQM1Bf3r1s6Y0zT+DaM637pM4oM3jnDyZgadEPKiOLLpnlFe1swyHKJ
 wscAc5TTBpN4nfjB3kxRZ3iFiicJHMZg2sgpTzxEFpqf82/HT1Zd3Yu6c5Y95xq8dk=
X-Received: by 2002:a05:600c:c165:b0:4a1:706f:b40d with SMTP id
 5b1f17b1804b1-4a18e4988ecmr85366105e9.7.1791624202437; 
 Sat, 10 Oct 2026 02:23:22 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bb6b3cbsm99701525e9.0.2026.10.10.02.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:21 -0700 (PDT)
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Sat, 10 Oct 2026 11:23:21 +0200
Message-ID: <20261010092321.139555-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929175341.2329-1-francois.perrad.86@gmail.com>
References: <20260929175341.2329-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/haproxy: allow Lua 5.4
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
> see commit "MEDIUM: lua: Add support for the Lua 5.4"
> https://github.com/haproxy/haproxy/commit/08ed98fd7963968de49593304fdd9234812845a4
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/haproxy/haproxy.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index d2fba7f92..de2df549b 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -40,7 +40,7 @@ HAPROXY_MAKE_OPTS += USE_THREAD=1
>  endif
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LUA_5_3),y)
> +ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
>  HAPROXY_DEPENDENCIES += lua
>  HAPROXY_MAKE_OPTS += \
>  	LUA_LIB_NAME=lua \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
