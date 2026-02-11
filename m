Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157A2EB2719
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 10:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F6444073D;
	Wed, 11 Feb 2026 10:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ii6xtMiekX5e; Wed, 11 Feb 2026 10:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85533404EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770806512;
	bh=LNpH6d1hFYkekln67WYi5yGkeSWokbXyZMy0DIyC6LU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ORmTwVod2YOOu09sx1m1zL7TkrLov5yvb6/rltcVZ8aJWOTJPuUbJjDU00XnUQnHs
	 WMhl/BoZfHISocWsai3W4mvED04rOmwyXgEhNXNN9mJ16Wsdo+I6NCCI4nM4Aexd3H
	 cnVCe5QuWKbxEDbaJ40XTTMpVYQpgYLhDmk3zuEpALfvwUSAjLfNi4ZE1zn5VtwGDr
	 YGhRWKfPdYDukMYMpugO5O15TUhD9QT99QIaab5j0Vpud1DRYef+1+LlOwZ89IwXnP
	 0NF2D41AeE0x+UJ77fez2yDKmQ+g2gcrQokQM9CO3XmJ2aLHmDeJYiDRgUOr6dUCnr
	 nwBwYi04m3WKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85533404EF;
	Wed, 11 Feb 2026 10:41:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6CA91F6
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 10:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A860C4042D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 10:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YkZTsCCBN8X for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 10:41:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D3BA4018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D3BA4018D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D3BA4018D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 10:41:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B6A204E40C57
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 10:41:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 86355606BE;
 Wed, 11 Feb 2026 10:41:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC15711948CC0; Wed, 11 Feb 2026 11:41:43 +0100 (CET)
Date: Wed, 11 Feb 2026 11:41:43 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <aYxc0zQw3tIc2MrU@windsurf>
References: <20260210225042.1414C86BD1@busybox.osuosl.org>
 <87jywjr35s.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jywjr35s.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770806505; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+XwguePTCTlhVz47dUVc3dvwVExGVoxAyhXiNCdRpaA=;
 b=lmoXS4/1vtTcdSiJPkHAGTpB6YkwQJ88cDrDI4EUgngG72FtAj9Xp+5LNnfgVJjEDn5fnl
 1aOawPql597lL27nfIv64YmOOf/hBXJ1wo2fT1LbwayxuFDQ4+3AxBWTTVt+cm4rT33XSC
 YNXBfuoHWq0Chx2ust6kA7wIUGQsAa5QmKm1ajpImiLcQSkp2SpocCRL0WyZiThTXjcpcH
 /bDoC1dQ/XVzQqJcjVQ2nqsKCes9OyY4ZDtHyYo7FptAAO475XmRFsovWxMR9qUv/7iE0G
 4fpAg9r99aBDCpj60EwU45ailrV9Umto2Fbdh+QsITpLuCT8COAmD4/sCLn/cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=lmoXS4/1
Subject: Re: [Buildroot] [git commit] DEVELOPERS: add missing final slash
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Feb 11, 2026 at 11:21:51AM +0100, Peter Korsgaard wrote:

>  >  N: 	Alexis Lothor=E9 <alexis.lothore@bootlin.com>
>  >  F:	package/libxmlsec1/
>  > -F: 	package/python-scp
>  > +F: 	package/python-scp/
> =

> Could we perhaps extend check-package to complain about this?

Oh, it would certainly be great indeed! Are you volunteering? :-)

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
