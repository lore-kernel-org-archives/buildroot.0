Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC4BD13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 509A16006A;
	Sun, 27 Oct 2024 18:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iP9JI9En4OYp; Sun, 27 Oct 2024 18:44:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58BB460621
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58BB460621;
	Sun, 27 Oct 2024 18:44:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 937B05123
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B74E4012F
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QULxnP1_AyYu for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3912A4012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3912A4012A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3912A4012A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5504FF805;
 Sun, 27 Oct 2024 18:44:26 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:43:14 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241027194314.14aec550@windsurf>
In-Reply-To: <20241026210304.2668409-1-bernd@kuhls.net>
References: <20241026210304.2668409-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Suqpqj26pSMTQgXRFqOAYzNTg/ATT6WRY4chRtoME2w=;
 b=CjBkh5/7UF8F+OA3RgeMsfFRewaa7LMwr1+8HgGEIBdbYlDFRSSy5gfYrSMjvDl/nZ1faK
 jndnJrUcd5gSd3960L5suzwLK49/gJmgQq1TZQ+OHDOzHc3DzRENvmYF9K+KU4Wqtr36r5
 LGyVgSIA2PvLstY6ypDzBWnzSY8qs2NumooD8jV2DKsJkvt8ohMUs+RN/nbM1kWghFaxZZ
 pJHmJz6rmMezFdQ77uomCP5LU9zCGr7FHTxFbs7iU2jRRHfgC+nJOoBaRYCUZgqEJbtfT2
 WcwY8sh0CEHy0Qtlw9aYGMMU+lAtzP2I9Ny8s4hoesrnZ6IHWkSWnv52ABp1Gg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CjBkh5/7
Subject: Re: [Buildroot] [PATCH 1/1] package/ghostscript: security bump
 version to 10.04.0
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

On Sat, 26 Oct 2024 23:03:04 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/tag/gs10040
> 
> Fixes CVE-2024-46951, CVE-2024-46952, CVE-2024-46953, CVE-2024-46954,
> CVE-2024-46955 & CVE-2024-46956.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ghostscript/ghostscript.hash | 4 ++--
>  package/ghostscript/ghostscript.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
