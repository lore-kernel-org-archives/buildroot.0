Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AE2FF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 16:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EA2261075;
	Sun,  3 May 2026 16:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ey3SfBgp2AW7; Sun,  3 May 2026 16:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E8D761009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777825258;
	bh=dyRB304hr7TusR4S/CCIsoZbbHiic7EOhS0E8W4/CWc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gVidq46zjLgn7aTEg9G/gnnTISB/cmxZ+NdPKRtBi2L3xZuxJWAsJcnC5Kfl0KA8J
	 a2riTF5Y23SlhvIJtlYQCQK2vVe5ufGuj+JM7v6TcQeR3ejca1i9OT/sJostsd8CM/
	 4M1VRZIWocTRXs7+ybZqzct8exnP9jk10G6aciaCHgTH8YnhDCQmHTWSDLVOMtuRDj
	 dhX5u0WrzEdZCAMfgdyzs61WmInUxjxhg8N45xonJztMrgNEGPSoMilZsEYOXvFfaW
	 LrHpi/zIZaEa+aGLdFhVcoGfNiV3viZfN5O7qgpyvT6sbHuicouEbk6MLQ7f2ioCgz
	 39NB/qdCRaAbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E8D761009;
	Sun,  3 May 2026 16:20:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 285D425D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E50F4124C
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KW0WXuZSk4o5 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 16:20:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 387BF41227
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 387BF41227
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 387BF41227
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:20:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D72AF2003B4;
 Sun,  3 May 2026 18:20:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 18:20:52 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 18:20:52 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260502181116.470697-1-giulio.benetti@benettiengineering.com>
References: <20260502181116.470697-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <8701b06bf0bf8dd2e3febd5a4b3996ca@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777825254;
 bh=YpXKQW6n8KApti1OD05ljT9yyUsbAkJSQ3RetNPvDTI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ebhc0sRj572LYHK9JLocR+gelKXDffvfxoxE26Pt2Rd5N+8He77wDyRP47Yr+2CNh
 xGw3aVfSxT3qP6Wc87u+bpTsmGEIQSvnZ0Ispjb+qNlJhLbiFl0IYQd2S1Y9QzvbFu
 jb0m/nF9biTlUH9FcnPhq57TUXpHh1VbCpcI+klh9UguIiqTuh8hXTEaGuoFPBZ5JG
 G16tebL3SrF041jpSJxaAdgDqUEBbfTbjuahTF+eIeC7CIKPWYEc6cb3j0/jTaDO51
 Jg/JRuuDeV3FiTgnopEZtKc3FQmS60No0sf6TBvNPlqGqlByZDYVb8iTXJtuIynWdH
 K6BarVxooWw8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ebhc0sRj
Subject: Re: [Buildroot] [PATCH] package/liblo: bump to version 0.35
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

On 02/05/2026 20:11, Giulio Benetti wrote:
> Release Notes:
> https://sourceforge.net/p/liblo/git/ci/master/tree/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
