Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E927C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D85EF81360;
	Fri, 25 Sep 2026 14:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eS66pmYckMAN; Fri, 25 Sep 2026 14:45:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ED83C81338
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347513;
	b=IB+6RVQr8r7GUH/A0dAoF3XrAheJDZdf6aP5O694O9q3bYpKuIvHBJ91LC0n7HCpn0nP
	 pE5fzRfcvpmvSl8hw9lscQels95TiEARdBUHPCsweMDDENlQSfghISe3i5leGKqgZ3pAv
	 FJPPYI9/Fc1diWK3IfXJifsU2dcKyv9xjNZc4AoMUeaaJYm4ymoAguiTbuLSDk0fF5tog
	 eDQ53L2vBvBVxiwoLlUUbNM+w/8jhTosvushUODk3HLNW4gILLQF8wjJyeL7du3eYH2Lz
	 bTuqBZ6CDXT/IDIOry4m+vKwvJ71+vnC3Y1bLmvE7YHYDjZo3ugNg/paD0uUY4vy7qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347513;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3w+ZYw/R6TZ0ohvvcOb0g3shU7lpY8PCT/sxS14KsL4=;
	b=kS6ESrsmred0BTG6HaaS5wA1r4sjFUtJ1UVb5pUmKfpV1wuHkUlj20SPtITsvjvDiHz7
	 2Zc7V8Z3mmHD6HDAROyRYt+n8UseLmchi912vIwWRl6PLdsb4L5/u/bhnibkyE4ZVqasa
	 apCKaEVgkVXQokuuoVocVUTxm08DbH5L4E1l0w07+r0B1PjNADIIu0AzlW9/Pg+BB0k+U
	 ondTHhBWTliDDqL3Ka5+Cvf6ddFFjW2uEX4Y71LefTabQq0T1+c5+dt5C2DGt35aW8/+h
	 M2Vo0o2Z70cF8XYEPPBo48p5TL5zMa4nD7usDdqgWTHso3SjQ+YZeyO+3XuksPUC2lg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347513;
	bh=3w+ZYw/R6TZ0ohvvcOb0g3shU7lpY8PCT/sxS14KsL4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qFVy2zRUEDM9dNgNOChJV/VVMg0XfFqIk8iH0VQzeGGqpi5+Jc9dHNCKgFY3Y+cjX
	 5A28V04/STkG0OpwsaIsmR2JQD40zd/Nf9qQ80ym0TQ9elQKfKuxd4NAKK57adHdPy
	 1T110xbuYRZUl6ewEvAtH2X5S8W5wsBPjSPnT77hIOsTGmxq/lve5xjmzUoeInBQwk
	 5BgHn/06tyARFxUMOEl+bO/Cwy3Gkh3D+SHQZ/t8vdGr1KrvHDNbXHuupWkH1lSfU1
	 i3+pHIEvYpEE+uaTy+cEakHjKGqTnwHdHzeJxAaMqXkol6cUu5OulN9gKkdV44YOyz
	 WzO6m+mP3mOlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED83C81338;
	Fri, 25 Sep 2026 14:45:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15D51334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0818540181
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xglBH5EEsS4 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D2E0E4016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347509;
 b=ZAqro9W7EY+Gn73XN3h/j0SwhDu9HDB/GZIlcVrkvOw1sh6sgP9WMCOCXac7iiLq6Eq+
 jmIFUzrhDc6HdApYq61rLHh3thunpi6sXAixPiUl9sjYYXVO9rGRL5R/PbqJoJ88mMzm3
 6NOMkS9YgrPWlwvOviGqIhz37BgRRxVsdST1kYztQ50cHpnTbLx/hJLYyyFW5YVsqFLw5
 uoc+w4F1KwHCNNnoWjwmaOfIC/wWBCLhKSB7bGyQBqHtzKWxxeRUXdvFLrPbV3/gPCDws
 JiHFY9QYrNAYIs0rEz/u4JblARig7uza0XGO1R6jdKVPCr4xwuO2RVjVQjfaWbVGQ7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347509;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=XG5r6CMR9+bHUbOC8Z9nPZC34GWtZaOLtoRTj4tLXkI=;
 b=TaNyqK1BiAZLOnnSRwt47JwouXyLroxqscK7IVoAgODEvn9xQxd0kV/aVC7oy2QLcxCb
 WQH4OnKGx06aGEOmW4TN/En8QCLr4js6DeKpyH9WFzNebIi6bPpwgAc10y6jHjTONq7DO
 xnNhc6Bs6q4ODONiC90RoQv1Guj6Eq1MpcIYCGq5H1z5e5MgKvE05MxYqvt6wu1Imy7tU
 EMc+P8mCABWMsM+AXz5QUQ+WaB3Jy87OuCeK6eMNvb2h3qxY1TBOtMr/7NWdil9ZExb3g
 G5M4iuaKfE93zTTh1XI868Bf06RDNIJnrDxdwKlm0sJ0TSTYOD62/fnfjUGlnn7nxog==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PhLD5W+a; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2E0E4016B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48870973bddso379683f8f.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347505; x=1790952305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XG5r6CMR9+bHUbOC8Z9nPZC34GWtZaOLtoRTj4tLXkI=;
 b=DdJFYLj4xVD2YnslXXwozpyCCBdriEeAlKT0/ns9mXpzCghgF3Qicaz/gTF6OoJpjt
 G13dxI9uwpSx0Qs7tztKMgsntO9403/MkxT+jNn8xY0jyMI5Y70Tz6+sNkNsy27e9e03
 Z7vLt1mwm5zcE8pDMDHQHQQegV4iVdc8IS1K5BxKY3sCqG6ef52GV/YhVxMs1HMwwC8j
 FJHqWu5vV2g2IWYEbQJ+8XPcMCSZCw9NIq/gJYgbRhy8z+40N8z6xj/+7NhA2ipC0na+
 sMbSmo3q9hpp3uKQQkGfvfm8UlZYpClciRfh2jBXUQPK3NgC02zYUn+4xClVqWDwgkXt
 PfdQ==
X-Gm-Message-State: AFuF++kMgjnxKq9lCFZ1xiMjPAFYlPRP9MrDNST2Tnfln3DDEQuzzzHM
 GhvvKZfYtbelBQGsACYFHHwQIOvyUKupjkNIvGzeGiS2TVYCHfLO/Glb+lel9i0ittu95j1g9+4
 MvASXZzqZ9A==
X-Gm-Gg: AYBFou1ZnnFMIEU0l5s+OHuWKiSDmN6vt8v2lyjcEUaDbOGJ6hKAMohHGH+3eU/Ssb1
 KG/HJ6DUswZ8rFWOp2ZRTl0B0eajBvsZ3NU/yjZPknpmWsw4ElYLUNBcFDsJ+cGQzJGdRScILqQ
 iKSl0O9vUfGHl8PEqKt4OuDgaQVgcf0KHDwMgLvx7kAef8o0zjKtgoJqoyj8jTArLmHRb4i7ykM
 7CYRZ04lHQCk3dc8nWyxfiD7QI76iprCJ5aOYdI52DSvQMRI4RdXQA5S1R9OTNY0AbeJjf4nzj4
 U1rF+QT8GxawvPpz1ZSHNKGEVSk22AQoRruuI7uO0m+fD+w4Aeg+xwRdq9CNXlg5p0wgHynFwu9
 zOxkAosh5VdfWGLDycklwC2puaCVEyykpngyiu/Rsup3qzKEDKMA4U0tU4hpVDsFTHB98HZ5Rzl
 YyfYadHVzt3MQWDeFJG/8hLKRoHXZfcCpdT/pbnDPQEay8j9YwKyBp0H5Zm0gXUvW+s0zTB4nCG
 PnlqFLz/jJRg/ZEqecNnwY96lGR4m9Z59MTKu6zkw==
X-Received: by 2002:a05:6000:1861:b0:487:e:f4f6 with SMTP id
 ffacd0b85a97d-488716dd323mr13354029f8f.15.1790347505544; 
 Fri, 25 Sep 2026 07:45:05 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a349a0esm10739518f8f.10.2026.09.25.07.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:05 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:01 +0200
Message-ID: <20260925144503.4097160-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915095653.279455-1-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/zabbix: update SITE
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
> Zabbix version 7.2 is no longer maintained. The version 7.0 is the LTS
> and the stable moved to 7.4 [1]. The source location moved from "stable"
> to "oldstable" directory.
> 
> This error is present in the autobuilder since the 22nd of May.
> 
> [1] https://endoflife.date/zabbix
> 
> Fixes: https://autobuild.buildroot.org/results/636/636c4514c67f1b0fcd20976d064f17b0e0a314fe//
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/zabbix/zabbix.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
> index caa69fda38..50bdfed609 100644
> --- a/package/zabbix/zabbix.mk
> +++ b/package/zabbix/zabbix.mk
> @@ -6,7 +6,7 @@
>  
>  ZABBIX_VERSION_MAJOR = 7.2
>  ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).13
> -ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
> +ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/oldstable/$(ZABBIX_VERSION_MAJOR)
>  ZABBIX_SELINUX_MODULES = zabbix
>  ZABBIX_LICENSE = AGPL-3.0
>  ZABBIX_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
