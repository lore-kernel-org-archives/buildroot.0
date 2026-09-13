Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03103C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 08:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB5D84064C;
	Sun, 13 Sep 2026 08:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAut0UwTVkSI; Sun, 13 Sep 2026 08:51:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C483740659
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789289489;
	b=OWTLX33vEkLMdHoHCXLv8usjof+BlyI0vMsntrdn1JJYjXzczZMiMzL0nQuTlxIJTbmh
	 S4vcCTPmp/HOx4FD96VLs29RnF9ppE01VR205utLB8D0biSuTX1kiWf6zmEwfBe6WAW2C
	 Jg9BEp2hgh3HYqI64GZ1xxeLTcbLJNgAKV6vZludj2wPf14pCM+K037wzUSOD6tr87bWi
	 5+o+vpnnk/BFLCD1xzWYBXMpEzcW3pX2it9oGAMbCE8Wui6UBHXByQpOqm8RoPBRAa/JR
	 Fk141f5psaFVk+eakGdm3Vgx8tQ1T99I76zcuCGlb9yaS6P9RE14QL5sQLpH1CahQ4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789289489;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=3WXoQQtjSeNBAFzZgjSvi/X1LkZ6x997lpAzU6T+sKo=;
	b=dxLdetFfc1EtJg7ooJFYnza3tWw0FuG8SAmNez10tiBypZQ0gnX3+9eWtmP7uAq3IC4c
	 rg2VTAYtpgkDhR/HZApfA5mZGY5sCv2dngn43XktmxTuJAZ6RyrqboalclwsfLLlA0olJ
	 5eFIY4srKb26dX9H6FmsO8GMe9sHgyr3ti0M1yPlPisKC4TcCMkKWSSE7jNanY+D6dze2
	 QkIHxrKkbtQQk2XPA/77eZKTnH+gVjV3Ov9yPEZRm6REsEYv8zRUPgvBWL1QJdAFd25Ne
	 2piRAckiLp9OLcFMtsGIoiNgxSV/8eQZAZS5Sb7wrG//4KFR2ZS6Hti2CUDxMbkLijQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789289489;
	bh=3WXoQQtjSeNBAFzZgjSvi/X1LkZ6x997lpAzU6T+sKo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z8N2avfPFIiC+WFIWade+YdKYqmGYxf1h59cpnkk9f25+j6FCeK/vFk8sHAOy3ACO
	 JjIhtPjLe+sZTZek0d9joco7atypEHbBWwStpP9uPisDZrdDKX56vS7+Uw+G668da9
	 Sp24OW5kCLceIcc5yEOjy9EsllrwZt1pzBqEHkH+dmwKxmNuTamNm4G0DWNhOfOVdV
	 ZelCR6097YFNeu/k/cYvz0UenQYjoaFtoMCxYXnMXSGZvFnSyyvF1z2O248CVtoAyb
	 8dCYDh+wkjSmd7np5IqksRDpaNibaTRLu7pB/1D/ST0iUZ2OkwEBZPSQ9TrG1I+dU9
	 paC/9wX28TLOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C483740659;
	Sun, 13 Sep 2026 08:51:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4263EB
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A17360621
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmGtie1MLcc4 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 08:51:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7F45A60614
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789289487;
 b=BIrxCvgqU3M+P/26yKPr3Xoqnmv5/nczITTdym++AH9dyfkE56OT+Zcmu2sCM+qXhVLJ
 5vaUPMydVobzsImmL4PhEpNhpCKtSZnm2PBV0ATB+SaRAAdME6wXUsQOebnKYIW0ZLK9n
 qvdhW6Qw4fRAFwRpf3K7kD9tAjmgW3vb5z7G8A7coLpNwaivf+jG038VX3r5PNPr5r7k0
 vP+S8vND7bRWX6WyyfDZbTgABLX3jGlNqYupYsf++cw1EXj5rhTt0ftgG0C0clY/P3mf6
 a/grv5UkVqIdFB+zgCtokwkEcFNcxsoetH8eluHYVGyyC26nFSjla6SQir0Mo+BjH0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789289487;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=nZHcp32GWZJ+t7DwM0JKbPx/WXYblgdaZpbPV3RzJlk=;
 b=K+S+I/3Sq8u8HJCKpgAkm3iY055g74XO9h/QMuRbr8LcaZ0VeGLYHoX5z1AbdqJMfjNu
 fSvvLXAULGdODQtjRORI+BNRyLUqmSOF8ty92T5HNTLh1Y0NGolNBtiGaaA4I0kN14wvw
 09LYtCIMwxkGiIbvcKYXc3fU+7ddXFuYa87NB8421Dk2dKTHtFYMkDjMdqGth4wf+RVZL
 gw+XiEEMsJlqlG9lJnHF9p1hq0KA5+sFOqekGloqnwFMkE7G6l/Gd/qaKb0QwYEuqbx33
 CnfyCwGGmmqNwjTlvuFywVNOUSej6qoCjPlrksaOEo35rZB358A1u4Fe4r63gD+Dngw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=m5BqeOHw; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F45A60614
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:51:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0C9632003D6;
 Sun, 13 Sep 2026 10:51:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 10:51:22 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 10:51:22 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260912211206.1555090-1-thomas.petazzoni@bootlin.com>
References: <20260912211206.1555090-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <a090dfc178092936c82a4be9efc5125b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-memray: add missing
 dependency on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/09/2026 23:12, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_PYTHON_MEMRAY selects BR2_PACKAGE_LIBUNWIND but forgot to
> propagate "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9".
> 
> Fixes: c2df8bab97d7f7b8b61ce055b4820ceb1bd34a48 
> ("package/python-memray: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
