Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB85F364B1
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 19:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73BD34107F;
	Thu,  9 Apr 2026 19:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjmK3R1YYdq0; Thu,  9 Apr 2026 19:26:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2052641071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775762773;
	bh=zvdvHxHWry26OVSDJhV+K7LHUg9vMNlPmlykdMkAxDc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M+Ia9FftQwJB0A+1jm3DOLTvhuwY8f1QiJWErd0ssP5OVxgHOgLQhSJGAsgEctEHy
	 FcQKLy+WiAwPhMHrKwkV4oEGl7ANRV3DdlzS3ZXV2NvUrdw9pY9j9rBc71p8S24oFH
	 iDtxgEBhHK5ZzLfx4MVqbnvZPVIz1qgo4HSe02dOLaUiiPaj7TRcR6pv7VFpboTh0k
	 rCkxrNDxCnqYzbajCGM+IEUff5upayMbjBisQQVUh7aV8JylbrDu5aQim0hnlVGY+G
	 oInNyWMF7ogJqTSzd9mSoZxauUotdWiv8alTri53sTXm+n7LDY9Ua00sypo0U8zL6q
	 iB0W7sk+5y3BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2052641071;
	Thu,  9 Apr 2026 19:26:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3146194
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B401A60AEF
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id areW0oqa0PhB for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 19:26:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D35DF60A80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D35DF60A80
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D35DF60A80
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:26:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7DB19B0055E;
 Thu,  9 Apr 2026 21:26:07 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 09 Apr 2026 21:26:07 +0200
MIME-Version: 1.0
Date: Thu, 09 Apr 2026 21:26:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260409131700.278723-1-bernd@kuhls.net>
References: <20260409131700.278723-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <2e1fb21e69bba7708f569b3fd543ec65@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775762768;
 bh=mMQAxuWeIH1FvbL/Qs0x2our3+AfOcTyFqunBC7VN4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qYlprKgLh2OIA1v5NJsnk6ax+k0+7xWNVejpOWPMaUPLBy+5mIXuxjhrEuwvoDnYp
 ZMQbOaeukMCHEkxLsFHQdOK5wgFglDYR4CHeflIRhvgDkS/q8yTwhBqFF712yJDAmb
 fIqX3ygEL3EIGECKH5phbE9dVN+BbdWV/SnawHZIef+067CeqPJibR1mUR7XPMCpAA
 pyW82ux3jYR4jXd7J+AfgMiA0wVvc2ZuDE9a2pwrjqke1hsiYSM4204ZMtHR7enaXQ
 Q6Q6MsyTD/effRB8AnIx14o1JGcFY4yaEwRunrPG86lkuNp3a4NKfs5g3Dc0113jFC
 XqAVLOfpkiCuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qYlprKgL
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 3.6.2
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

On 09/04/2026 15:17, Bernd Kuhls wrote:
> https://openssl-library.org/post/2026-04-07-release-announcement/
> 
> Fixes the following vulnerabilities:
> 
> CVE-2026-31790 - Incorrect Failure Handling in RSA KEM RSASVE 
> Encapsulation.
> CVE-2026-28386 - Out-of-bounds Read in AES-CFB-128 on X86-64 with 
> AVX-512 Support.
> CVE-2026-28387 - Potential Use-after-free in DANE Client Code.
> CVE-2026-28388 - NULL Pointer Dereference When Processing a Delta CRL.
> CVE-2026-28389 - Possible NULL Dereference When Processing CMS 
> KeyAgreeRecipientInfo.
> CVE-2026-28390 - Possible NULL Dereference When Processing CMS 
> KeyTransportRecipientInfo.
> CVE-2026-31789 - Heap Buffer Overflow in Hexadecimal Conversion.
> 
> Removed patch 0004 which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
