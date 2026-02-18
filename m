Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555A8E9A02C
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 20:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E43740192;
	Wed, 18 Feb 2026 20:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8YBC0Z4lxdS; Wed, 18 Feb 2026 20:08:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF05D40987
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771445336;
	bh=1ZYXLWY7tmgu8ftm9nLgCAsvWA0Ub07yDBjYajdqhec=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SZImU+p5Tmbk7mWT6Vs/yw23SHYIGbiOaPx+pguziGlTF4SEYbL3X9RtOI1NMtAx7
	 YYdRzG0GHzG95N/6N+Wm759EtOfDyKsPCYaOG4PaHHuTQaSPEPwcrP5QQqK0lkL0ae
	 m28uJvmSW9LGCSHKlQB1tN0Klx7OiZ+938OPfqNJmHw0ESMU2B4gYrKki3i3W2ptAf
	 +I13xiKJ9yrOSTlweQso0ItoOlpPgej0OGs5LlyG8ndi9yoZ5oHXobz/qqqNauTu8r
	 ltHI2MK0nZjCbSQ2/RpE7HFItGB/NQG97qNUdcreQ2gj8dKhgVFMxmuEdVa+WpVBCE
	 +45yPm6NsdDRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF05D40987;
	Wed, 18 Feb 2026 20:08:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39F621CE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FACE8131E
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvCzUL5i8-WG for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 20:08:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79EDB810A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79EDB810A4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79EDB810A4
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:08:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 58B4019F593;
 Wed, 18 Feb 2026 21:08:48 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Feb 2026 21:08:48 +0100
MIME-Version: 1.0
Date: Wed, 18 Feb 2026 21:08:48 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20260215163440.483386-1-bernd@kuhls.net>
References: <20260215163440.483386-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <f55f8867864ea0aa9ac456f480828973@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771445331;
 bh=7WR7OcAJ8jTAtm0wuG7CV7alPGeuG9pn1ki4Ubp4y3Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CLw6HEwmapllBa/XCMQC7RIoGj71KvH+dKF2dR2HctoYgGSh96Q3UK1cZg1LpNKS/
 LirwuNNLuFEeX18yFXQwA76SFO+iYXL0H8X7Z4+FFiSxjq5UMNZyqroCPzJY0kmR2Q
 /3gfL5qv+3qfcJ/fLsV/Vfogl0tOQaPfk3Ui1vJBPvtxuucf0up2kgBs/oI3WekoQM
 eU25Eu54nkDW75+9u66QJ0lsUvKV2igauxAyHdkNEUbvB2pAjSziYWZu3MV3vF20+y
 fIuiMcUjiChWEOYeP5fKBq6chP4WEORDAtvfdLM8A02qDCXBFLhpMs9OOLhD0mwFGF
 sLkW4RGJVunjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CLw6HEwm
Subject: Re: [Buildroot] [PATCH 1/3] package/binutils: add support for
 binutils 2.46.0
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

On 15/02/2026 17:34, Bernd Kuhls wrote:
> https://sourceware.org/pipermail/binutils/2026-February/148149.html
> 
> " This release contains numerous bug fixes, and also the following new
>   features:
> 
>     * Support for new instructions added to AMD, ARM and RISC-V
>       architectures.
> 
>     * Support for version 3 of the SFrame standard.
> 
>     * The readelf program can now display the contents of Global Offset
>       Tables.
> 
>     * Improved linker tagging support."
> 
> We bring and rebased patches 0001 and 0002 that we carry for binutils
> 2.45.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
