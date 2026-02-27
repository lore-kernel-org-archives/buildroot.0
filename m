Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626D5FEFB72
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 18:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19520605A7;
	Fri, 27 Feb 2026 18:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_MHlyFuLc-s; Fri, 27 Feb 2026 18:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DCF160B8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772216033;
	bh=EQvZdpfMSapUgnT58mLeH0erFRgLg+NvDi/dMTc8D8c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OoKjp/MjI7jvlM99h8pbxmND19RBFVFGv5CD+p04Rs8atNtxCOKjrFtmgRktf0IO2
	 kfSrAiwvGU6V29ikOd8MgNq/y6D2xEGg/AlfQtgKPJjNFR2dm6BARvpz/r3vR96rWe
	 PgKBUrjW7LsyQMpI1tHRa/l2RgEeudIBu4u5yo/dT9BXMI27a1qPHLJAmY0orfi9Oy
	 JIoLI4v6PB4nWbwOwWVzhKpS0F1M9XHb7GytiRZyPxsNgKa24cmGy9/ce6fq4sdrBP
	 zAMT7yKrfoFGOPX9cL6TsYa8a8MPxRMi+yppVkXMX7OvWjQ0A7fmOHN8iWbEdSlrmj
	 lrBtsfCSD/6Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DCF160B8E;
	Fri, 27 Feb 2026 18:13:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7F1D131
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDA0A60B8E
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKV36kwK6yAq for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 18:13:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06DC0605A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06DC0605A7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06DC0605A7
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:13:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 41D762003B4;
 Fri, 27 Feb 2026 19:13:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Feb 2026 19:13:47 +0100
MIME-Version: 1.0
Date: Fri, 27 Feb 2026 19:13:47 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260227084404.35563-1-thomas.perale@mind.be>
References: <20260227084404.35563-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <3d183781ae5ba05acf6d4153e11d9c42@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772216028;
 bh=A1CegoBjSKq7W97iAGcvbX55bvH7Ou09fOOD4NA1NHg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VePy6fhkCvDAxK2FlOk3z4Bl5DttkDfOgx1fM7YcVtQ096kPZdffPMtES18kIIyEc
 3hyDgnJ5x3cGDhl3QQlcY0yegcHlHYHHoapD/x12+7J41JXkCKGdA+rwZBg02E6V8+
 bKVTY22J0R8nbYx/EC3leLOZm8YE7vAzy+N3zTP11h2vxI24CbD3nnZn11GLU0UhUq
 icXldi9H1kKxHKUqF4BCkjFE+nWooRTJg2pnepafwTrf0mnvUh7c5ZsSbCAMJLnOSn
 6fmaOqC8qDrQqDTkwo0Zll/ZwAn0n8avD0o6T88OIvI5vPzU0Qlbf4hOjBe/HM5mX6
 kojAtGZG2j5Uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VePy6fhk
Subject: Re: [Buildroot] [PATCH] package/botan: add patch for CVE-2024-50382
 & CVE-2024-50383
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

On 27/02/2026 09:44, Thomas Perale via buildroot wrote:
> Fixes the following vulnerabilities:
> 
> - CVE-2024-50382:
>     Botan before 3.6.0, when certain LLVM versions are used, has 
> compiler-
>     induced secret-dependent control flow in lib/utils/ghash/ghash.cpp 
> in
>     GHASH in AES-GCM. There is a branch instead of an XOR with carry. 
> This
>     was observed for Clang in LLVM 15 on RISC-V.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2024-50382
>   - 
> https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957
> 
> - CVE-2024-50383:
>     Botan before 3.6.0, when certain GCC versions are used, has a
>     compiler-induced secret-dependent operation in lib/utils/donna128.h 
> in
>     donna128 (used in Chacha-Poly1305 and x25519). An addition can be
>     skipped if a carry is not set. This was observed for GCC 11.3.0 
> with
>     -O2 on MIPS, and GCC on x86-i386. (Only 32-bit processors can be
>     affected.)
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2024-50383
>   - 
> https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
