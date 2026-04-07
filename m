Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E008FEEF2A
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 11:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39196811A7;
	Tue,  7 Apr 2026 11:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mV9qHaUad9ia; Tue,  7 Apr 2026 11:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A41580E6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775562855;
	bh=RwzByCccqGfp9ojfvXO0MiyUjjBTPEVJdgkKlf/pdH8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RZF5VI4QsU3QkxtWjNDdKrCSipsfBBR1+fupH/mrgHAGq2V1Aw/3RSdFROO93r7+a
	 IHh3YXg0jzHxLNcCEVZ9T0VjsCYDLE3LFU2wSRFmvffOYE7RRkELx3e3B4kotG0yHB
	 CBzKZ4hMdm0LC07oMYBl73NRFdcX59VeCrP5/g2I0wP8xDOqS/ivkk7DYhMPhFe6Wv
	 zECZ1tGeaHHxhZ5kxLLkXC3lDWovOczP5LsahYSr7zeQusBnnpbQ3XCF5O8EfglJc4
	 yfD/Z1ff0JQKCQNM8e9U3mT+SNU5b4V/fvsGNLEKWLa9GPC8asxmAVn2czxIOzJFRF
	 0zsI0eVHOUo/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A41580E6B;
	Tue,  7 Apr 2026 11:54:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F21C3219
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 11:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3F3880E6B
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 11:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2sXGlDEIkU2 for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 11:54:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43CD280E4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43CD280E4E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43CD280E4E
 for <buildroot@busybox.net>; Tue,  7 Apr 2026 11:54:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 01A4113F879;
 Tue,  7 Apr 2026 13:54:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Apr 2026 13:54:08 +0200
MIME-Version: 1.0
Date: Tue, 07 Apr 2026 13:54:08 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260407072208.8583-1-francois.perrad@gadz.org>
References: <20260407072208.8583-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <4eb9b9cba06768cae6bc2d256424ba07@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775562850;
 bh=GuP7J4WpbFoPqOiyW0aHPPw3gp08MoVAya3FUop/Xdc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cdRZoFI4srbGOPuHL+gUiuPW2UIid1D3rN1/smQrhZ3kFrd7aY5ic0egZBkityYlC
 w2t6R6PkMoGHkOzSUWf3UxwSztVGgfglb9j4CR7TeT7jwpSrd6ZYv6UQkK21742wbJ
 m58rxI89FGTuZR7egh55wxdKyTTUNGPKmDjUiDgWIy3+vte97cUzhkOxqVrdSz5+wq
 FXvp+wtuV7p3sgVks+M53pFnIQC4NOB3yUm8sF+zfPSEKKfkxjqNRPJuZG2bglYRA0
 YMF35bGq4Uiz47VVkq41JEGZuDgAMpGe7J9UiHNDU/WR91hGQZS3P7+k+7D9twAmka
 b3Tvn2gEUsRlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cdRZoFI4
Subject: Re: [Buildroot] [PATCH v2] package/quickjs: security bump to
 version 2025-09-13
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

On 07/04/2026 09:22, Francois Perrad via buildroot wrote:
> fixes this serie of CVE:
> https://security-tracker.debian.org/tracker/CVE-2025-62490
> https://security-tracker.debian.org/tracker/CVE-2025-62491
> https://security-tracker.debian.org/tracker/CVE-2025-62492
> https://security-tracker.debian.org/tracker/CVE-2025-62493
> https://security-tracker.debian.org/tracker/CVE-2025-62494
> https://security-tracker.debian.org/tracker/CVE-2025-62495
> https://security-tracker.debian.org/tracker/CVE-2025-62496
> 
> For release notes, see:
> https://bellard.org/quickjs/Changelog
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
