Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDAEE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3ABD81353;
	Sun, 28 Dec 2025 22:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHBhTVF-0rkx; Sun, 28 Dec 2025 22:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22A6681396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766960626;
	bh=iwW7MsNog6QsQzlSrzK7xZPK0gbstIq52s65htEEPqc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VZt60+098iaRJaQ32DiwoYK+YAVflLg8ecn3mOX+aYJ2w9UcZih1LYqPUUrg40Wda
	 ANfHyFaQmohzhcfFjyzEydsxns2ugCDSUCjJ1+xsaB2ln9BPOqZY6m9UwdBPC/Qxkv
	 aIUmUy9MPzCtQStBC65pxwIGQcRMsrHma/8vevgPB7731qNRhN+oCpdJqDOWTW2/LV
	 Un+Q8Y6nJGLEBJQZsnSHDE+PNEqlGvZw3WgvGxNzVUsG5FEuloXCFIk8JAmqXNDG14
	 aW67lBmGi6ljRsyjn3lxi58a62ABJnJ+9/XN3Ht/wlC8BpbK3qCcXHdXV7Dqa8+QLD
	 aoZB9SPP2k10w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22A6681396;
	Sun, 28 Dec 2025 22:23:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86101B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B7C360A5C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tD4v0-qW390j for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76CA460A59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76CA460A59
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76CA460A59
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:23:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C766A1A24C3
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:23:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 921EE60725;
 Sun, 28 Dec 2025 22:23:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E0FC119793A5; Sun, 28 Dec 2025 23:23:39 +0100 (CET)
Date: Sun, 28 Dec 2025 23:23:38 +0100
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
Message-ID: <20251228232338.73bea532@windsurf>
In-Reply-To: <20251216231456.347739-1-ju.o@free.fr>
References: <20251216231456.347739-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766960619; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8fhDC4STuO2I/szLtEYK8GgCIdW9S3pr63O7xAExqYY=;
 b=g5wdb+m4MfkE1fdkqASGGrNBAR3zzGpLmfZxKjRpPcIrypbpbTkslJPkbtFryTjGNckH6q
 NaU64LN7Zd/OWws+zn2H+mcspjW/AAs4FerLj6RVTtPerDL1mnMQPTeW8YprKSJwcjYNFb
 F40aGX/l3K9SxdVhNo1LL/NjgPj4su2XceWGeJSUpFEnGdrehosgykYfoCoTviFoBOoRQq
 SmcGbmer3LaIqKKkpnO/zrfdWOxRLggPL1BEuk9DREyfBe0e1lgA6zFTRAr9SmZnVGGwTS
 s1UKcUQFJ0ZyDlH9ckRErU8QqIYikhFW8jxqB2kiE6WPfJ8I/x6QRUkOs+fJTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=g5wdb+m4
Subject: Re: [Buildroot] [PATCH 1/3] package/kvmtool: remove unneeded
 KVMTOOL_EXTRA_LDFLAGS
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

On Wed, 17 Dec 2025 00:14:43 +0100
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> Buildroot commit [1] "kvmtool: bump to f77d646ba0" removed the
> definition of KVMTOOL_EXTRA_LDFLAGS but forgot to remove its usage
> in KVMTOOL_MAKE_OPTS.
> 
> This commit removes it since it is no longer needed.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/f20615b53e83d6263346cb038d59df8e8d6b2b74
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/kvmtool/kvmtool.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
