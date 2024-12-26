Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2A3E7718E
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 22:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B93A607CC;
	Thu, 26 Dec 2024 22:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2SSmwfT031x; Thu, 26 Dec 2024 22:45:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C972605D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C972605D0;
	Thu, 26 Dec 2024 22:45:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F12FF1B
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F1C6402B5
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJ3QUYDFSfgD for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 22:45:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38AB5402B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38AB5402B9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38AB5402B9
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:45:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80B22FF802;
 Thu, 26 Dec 2024 22:45:36 +0000 (UTC)
Date: Thu, 26 Dec 2024 23:45:35 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241226234535.7722b612@windsurf>
In-Reply-To: <20241101105249.2198353-1-ju.o@free.fr>
References: <20241101105249.2198353-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735253136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aq53KxxUEvDY++8yY7KDsjNa97z+5vICE/wgblINQcM=;
 b=OCmNzvJmEIzHAocCcjDLDgBerIsNW703+wPAj55sCahhAXBceZWQb2sUVIh1FGBU3GIErM
 ml9F/06HZFPY5NhmE4W2d29LSRKT5ZDej1Xr/Oi14Nu5ur6HO38uku/UwY2RkFrcCx8gDV
 WhFaKlPzA9qxPLZC7oklbAXPyVJgCoc+//gs2NyZBCDS1NxFRqcRWvsETKkCANzlC5Ufe/
 C067Mj0akjii3552MrHtKRZK5vnsPZgy3BH5wxQBEt2tymIR4soL/tax5+OTmQKXqujEX2
 zDFcLR1+Ju+cw25gj8r5fZtrLFNcbqB5hQbcsfL4Rtb6cpY09Kq3JIh2FvPU2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OCmNzvJm
Subject: Re: [Buildroot] [PATCH 1/1] package/libnl: bump to version 3.11.0
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

On Fri,  1 Nov 2024 11:52:49 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For the commit log, see:
> https://github.com/thom311/libnl/commits/libnl3_11_0/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 0254077 with commands:

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
