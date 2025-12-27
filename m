Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425CBE8FDCD
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA9A40633;
	Sat, 27 Dec 2025 15:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-UwoIzMLWkf; Sat, 27 Dec 2025 15:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1CAD40612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766847602;
	bh=a0tEp9oO7gQnfBDwKFfqf5+47gozS4322p1ZDBJTYzA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bEFWgBX8pazxe0yF4TBgvk6TqASGmq+mMqkUC5arnfeXockJpYYoRD0bcilizSCSC
	 meoGXg0UJjy0Kq2OuupW7gsEYNH1HmgWe9f4f5svFcbaPZ2tx66ptK5NaZQ1qzRgXB
	 e45akno6Eiy0GZeEPqdM7vdodzXvvKySxfQkZOUH8yb3DKFsuAHAPCY5MvYNFIv+LP
	 gB9KRmGDrE72v+94cjVuu9qHFveGUCocQ+fzDkbFe6yE0GWFELKHbYXi5N42LFmamA
	 inrb38NquqGF0knZ9ADjEjIxqFFV77fI6h8itoZhZg3SVixwdWjHKiFHzJo46A3Gby
	 cUF8lcyReJ4+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1CAD40612;
	Sat, 27 Dec 2025 15:00:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BF34119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 426194024C
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MO5qOG1MH8KG for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:00:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30F8C4020B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30F8C4020B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30F8C4020B
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:59:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 999A04E41E17;
 Sat, 27 Dec 2025 14:59:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5105E60725;
 Sat, 27 Dec 2025 14:59:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A723E119784E3; Sat, 27 Dec 2025 15:59:54 +0100 (CET)
Date: Sat, 27 Dec 2025 15:59:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Antoine Tenart <atenart@kernel.org>, Marcus
 Folkesson <marcus.folkesson@gmail.com>, Julien Olivain <ju.o@free.fr>
Message-ID: <20251227155952.41c9e50d@windsurf>
In-Reply-To: <20251217184822.3765937-1-bernd@kuhls.net>
References: <20251217184822.3765937-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766847596; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=A2ycuH2MTjGnnBmfmC2LUHhoSW5ZFe2hLVrA+E6CbEg=;
 b=fPO1cfnvxiJnmf0f9JO/8NuVdMM2wPsUgWQR+l0RPiFxv7Yx81Wh6uw0eij/dUVtDphmeg
 siLR8TI3J4Txn8HJzmkRf7uuzHDLPWdsJQqTAfzmU8qYfHfiyzfX3kUzxsGbrAD95FJ8Cz
 7JBuslMyfCzIVmynv3ekQALKITtJyk6UODGQ0/Nm9R/2wg1MFYrnSAqVP0ueFIPEOyyHd1
 lxVoH7sCvfNPyPFb816bUR886ah7HyavcafGOPnhcJH565JVLGZdiX2YEB2QOFqIVvtSp7
 Z6CeMebChbiCYPDViqS6asmB9/2ojTnprB3kGEVsMEVeNGWYELr9ilJ1NR5Peg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=fPO1cfnv
Subject: Re: [Buildroot] [PATCH 1/1] package/libselinux: host-python3 needs
 SSL support
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

On Wed, 17 Dec 2025 19:48:22 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit 285097051d4a7dd821f01d15c705867f7e26c635 bumped
> python-pip to version 25.3, causing build errors when host-python3 was
> built without SSL support:

Following my previous report, I ended up reverting this patch, as it is
incorrect, and in fact not needed. Instead, I committed your
"package/libselinux: fix Python build errors" after doing a small fix
that makes it also work for host-libselinux.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
