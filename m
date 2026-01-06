Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4383CCEFD03
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8721381A23;
	Tue,  6 Jan 2026 20:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQX99Jn9GB_f; Tue,  6 Jan 2026 20:24:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15EF5818C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767731067;
	bh=YvjpZYB4mB67E5DGK8bZpwtUEIRKw8gtGKmg3ifJQRc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T9bAklwIZwNTET277QjJyPg90oW/uzTTxNSK5FuLXzTsWwK5Bc/qX/wI7uS3s8IGA
	 V1Pykx+tgUlkBwkUxmb0oWc0I9oTa5McfgQRs2pgjRZjMj7QBe7UJ1SVwdZTS3/Gyf
	 5xvu2Ox3gWIh+8KRTRpgGImhjbL7/UVxfmrTM0lzuBK/pBfDeOlEW1VTclMMg459qg
	 TYkNDnzukZvNFD5YaJComOZNP7VTDgCtsnuEaxIfFnsqfPqenb1PzJ2ukimwnNW+DZ
	 ikUePWGOZ+r8QtvrWG5X1u3pB/mvDMFKzmgZGTsVz4SVBaDuu98MOCMk0EBxikgbC9
	 UIRF9D9ZJotEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15EF5818C4;
	Tue,  6 Jan 2026 20:24:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DEFD70B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2329360BAB
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTPNCFSxLaAE for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:24:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB76960755
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB76960755
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB76960755
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:24:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8745AC1E4BC;
 Tue,  6 Jan 2026 20:23:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 96E9460739;
 Tue,  6 Jan 2026 20:24:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D74A1103C8412; Tue,  6 Jan 2026 21:24:19 +0100 (CET)
Date: Tue, 6 Jan 2026 21:24:18 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20260106212418.1f980d25@windsurf>
In-Reply-To: <20260106200115.1985522-1-bernd@kuhls.net>
References: <20260106200115.1985522-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767731060; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Ta6/wCXqUuu0gkC9i4ioogCZmDDzZGRSwJitjkIEzwY=;
 b=0n6Xw0dR+FqfZakLD801BGzkMzE0+DDMeVzLyeWNeBWOIvz4WKqVIRtYhkHlL/yVIW6kl/
 RmycolLyQIuvpHevlUVisllyVIdjNBlUoU5or8vNe/cB6eEacrGELjkR0DJsl5ls3TgGwo
 EZsEn7MGSI6mYwc3dctjDlnCrf1Fbw+LkcfOSgbkiy79BCg7IpJymDgNrTT+8fqvo9P/6F
 EwANY1DWjwghctk+aYuLlOT/pgBd2RppHcOPNEAF2NkpoB3rXc4jxegPz00QY+pDStgjpJ
 sDMuYekDhn2GECZp/BWI2GpO8ZQWhhWlGjUzM2Ph19l+bIPo3RkOfH7DJemtNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0n6Xw0dR
Subject: Re: [Buildroot] [PATCH v2 0/9] Remove packages
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Tue,  6 Jan 2026 21:01:05 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Thomas Petazzoni (5):
>   package/libsvg-cairo: remove package
>   package/libsvg: remove package
>   package/gconf: remove package, broken
>   package/criu: remove package
>   package/cvs: drop package

I'm curious to understand why you integrated those into your series? Of
course, there's no harm, but I'm not sure to see the benefit. Did you
make some changes/improvements?

Indeed, the downside is that this supersedes patches that are not from
you, so you can't mark the previous ones as superseded in patchwork,
requiring more patchwork "maintenance" from our side, with no clear
benefit?

Of course, when you adopt a patch from someone else because you make
improvements, on build on top of it in your series, it totally makes
sense to take the patch from someone else. But here, I'm not sure to
see the point?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
