Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A81EE9270E
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 20:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 348E840639;
	Sat, 27 Dec 2025 20:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8Kp6UWUF42Z; Sat, 27 Dec 2025 20:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78921405D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766868995;
	bh=aOKIx9cOoVgqZuDVFx8+lhJHzIiK6s3uJAmX6CAEhNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AqSWGIZ29ldstcZBONV1wXlsazh68tLt3XVvKs73lPhkKmSzhEPYYccDmuzwpruHY
	 uZejfmHtgXqxy7ezqNzYcj/3vqf9+R/rHpkC5vWT+nT8GdFJfkwHgoSHJzeXi7uuQa
	 4dsMaR6DrJgxTfShwBIaYiNG/+5Oe7SgGB67izPC42egAMFzbQ4L1sgubHk8YtRVmc
	 3inVYDNke950ZGpmgPsA2iTBhLwcL9GuFyT4dmrrQjLYWX2z1sfY0An4AWfpYB6MeG
	 TiDDKOGBlSRjzbNqR32I5T5DjA05z8dwk1XZSOLjX7eD4oupaHbMM+E3s3LyEQ1NOU
	 yJYpHOESsqBQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78921405D5;
	Sat, 27 Dec 2025 20:56:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AD36D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C47A606C7
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTanii6xb2la for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 20:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 505AC60670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 505AC60670
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 505AC60670
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:56:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id F2C6BC1D1AD;
 Sat, 27 Dec 2025 20:56:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4E64060725;
 Sat, 27 Dec 2025 20:56:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 84DE411978A62; Sat, 27 Dec 2025 21:56:29 +0100 (CET)
Date: Sat, 27 Dec 2025 21:56:28 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, James Hilliard
 <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Message-ID: <20251227215628.73208be6@windsurf>
In-Reply-To: <20251124140517.2833351-1-buildroot@bubu1.eu>
References: <20251124140517.2833351-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766868990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5lHMTLDIuibeGGGVqn6E7qpO+tLLvDxlF50HrFRDSk0=;
 b=N/na45YQACPqEWRkFssBO6xUnx0jIe/b80eyNkX28SXaWy3PhFNp09JnA3PQ15aOGdoBDf
 xLHkyE2bEDTiOmEKpIYqUtfv3lsps7rwSNsGZ6tW4z2n9Iehefno2zVmqvvSugiN8B5qPf
 tjT6/yNy1dY1EHumf8C47R4TaRQoBMiIb/D5JeaFbZ0jpF5zzAFeycagvoRYEXAK9sMakz
 6OZsooHeLjbJR9u4Q+SVeDdZXtvOySGMxrdoceK6u1yifZc3MOV4R/j+FR+pMsu96KEB3R
 uoCqQqd5XngI0kVMWKub5Mw23gX5FEkI6BSYoIX08BMYMxl8XQLCVKB4iIZgBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=N/na45YQ
Subject: Re: [Buildroot] [PATCH 1/2] package/python-varlink: new package
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

On Mon, 24 Nov 2025 15:05:15 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> There are currently problems in updating the pypi.org release[1], so we
> pull the package from the github generated tarball instead. This in turn
> then requires manually setting the version for setuptools_scm in the
> environment.
> 
> [1] https://github.com/varlink/python/issues/81
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/python-varlink/Config.in           |  6 ++++++
>  package/python-varlink/python-varlink.hash |  3 +++
>  package/python-varlink/python-varlink.mk   | 15 +++++++++++++++
>  5 files changed, 26 insertions(+)
>  create mode 100644 package/python-varlink/Config.in
>  create mode 100644 package/python-varlink/python-varlink.hash
>  create mode 100644 package/python-varlink/python-varlink.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
