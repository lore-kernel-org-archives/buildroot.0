Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF79CEFD16
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC8874094B;
	Tue,  6 Jan 2026 22:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EuUjUiNOEm3; Tue,  6 Jan 2026 22:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 502E74093C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767737037;
	bh=frWzH/wLZCXvhX+rqNDeogUZA1oph0gocBXwdagaQcc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OJmX9BOS+pQdQw65HccptwcwEcZmDZLUR+dqe+rN0CLYboNFr6vDof5Wrm/V4Xt7R
	 PweQ1LOxw/yz2xN9wmduCEhwTUn8LZGWpsXDS27oSmj3NMRdV4mNlApgFWDaglch7r
	 IxV2a+6jwHdCwAMg3umfGWnkjQiUgZKjFSWfv32WKNdX334tLuGcL3vUVjwwKuLi1G
	 ZhFy3ptFzE+Y6keHQMf1NAwbIpDQ2M5Qak8KX9MboPV/ezSqntfUDCMicnslo3qPc8
	 /Ug6WKXGIS1TwBW5BNa146uEIkI2vizAuHQLrqb5h9m2K4AZ6fSIQedEtbEK5s1Mie
	 DE2q0IINHwuWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 502E74093C;
	Tue,  6 Jan 2026 22:03:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A42670B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0053E60C27
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWP0LllCCoQN for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:03:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F31FE60C22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F31FE60C22
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F31FE60C22
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:03:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 350F2C1D700
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:03:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 21BEC60739;
 Tue,  6 Jan 2026 22:03:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C2F94103C807E; Tue,  6 Jan 2026 23:03:51 +0100 (CET)
Date: Tue, 6 Jan 2026 23:03:50 +0100
To: James Knight <git@jdknight.me>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20260106230350.0339a615@windsurf>
In-Reply-To: <20250809033757.1197-1-git@jdknight.me>
References: <20250809033757.1197-1-git@jdknight.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767737032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=s9Mvuq/xzZb24NiWwsgK22JmlzgnKZ0srr0f/HROhiQ=;
 b=AZDkNVjEpLGZWj8UD9nQ5j8eqH7eR4DaR8FfRBnFeFBF+cmplhGRjdkH3Ksk4HGNcKEZGD
 7Wu9vxRPnPFcik2nPakyDhC+Kqzpqnh10LspjofqAGqdYuKxevkWYNau3bMoeW4SvPSw+O
 WiEwGcICHCE04O6ILV8UZYwmLomSom3EpoS6JLSEu3fhya/CoAxKruOeJqUFmITMczx/HR
 XDW0rge1dkF+Wzb5LhIzOO63xmGHzRr5nitDAmRHoVUURUd2AZorQJ85EvQNiAY27lG5Uz
 z2rcIOEK+jgFbG3cZkpq3GcdwkFHuA5LX615QxEC7ywXS5ue0wBgw8ihejvzXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=AZDkNVjE
Subject: Re: [Buildroot] [PATCH 1/3] package/libgtk3: remove schema compile
 hook
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

On Fri,  8 Aug 2025 23:37:55 -0400
James Knight <git@jdknight.me> wrote:

> Dropping the need for this package to compile any schemas as the
> libglib2 package (a dependency) already handles this during target
> finalization.
> 
> Signed-off-by: James Knight <git@jdknight.me>
> ---
>  package/libgtk3/libgtk3.mk | 7 -------
>  1 file changed, 7 deletions(-)

Thanks, series applied. Sorry that it took so long to apply this
obviously correct series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
