Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA47CD1292
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 07:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FBDF40604;
	Thu, 11 Apr 2024 07:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-vThExwZ9TE; Thu, 11 Apr 2024 07:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EDF04060B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EDF04060B;
	Thu, 11 Apr 2024 07:21:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 433461BF2C5
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 07:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3056C4038B
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 07:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPYDt5dGRtCa for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 07:21:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D233740360
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D233740360
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D233740360
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 07:21:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A93C60004;
 Thu, 11 Apr 2024 07:21:42 +0000 (UTC)
Date: Thu, 11 Apr 2024 09:21:42 +0200
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20240411092142.0d3c816f@windsurf>
In-Reply-To: <20240326101307.271392-1-thomas.claveirole@green-communications.fr>
References: <20240326101307.271392-1-thomas.claveirole@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712820103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3p9+sLGz/FB/42hCHihtUd+xHb7PwOBRql0nSEAs8uM=;
 b=gk68z4b0ddsGhVB4HdpZtbDukoogji8QhR+GkBSQz5uXbTjmAzaYgySAiBaXdpmYk89uuI
 Sb6taaOal0AfVPP67MXhOjwryh23332LBkHDrM9Gc9le2CuyGPpkKrw6dWmZdaeNxetiuH
 NEhHOrJ8pr02Y9M2H+2uw1+dV7/h8VOtoiBY/kjwYPaxeiW7kgAy3LAfUVCFzZ89nIhkC5
 D8ABlD3aHHEVLkR3Qv7P8D7Rtn+bDngeXNEyAkK5JLzlKMqJiekM5paEyRNuEplG34ijMX
 Z3Ub8aSg8aoxUTgkQMOwLsTKnRljGqTd+vykamfPq8+tF4BKJI0JRxP/3dAb/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gk68z4b0
Subject: Re: [Buildroot] [PATCH 1/1] package/openlayers: bump version to
 9.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Mar 2024 11:13:07 +0100
Thomas Claveirole <thomas.claveirole@green-communications.fr> wrote:

> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/openlayers/openlayers.hash | 2 +-
>  package/openlayers/openlayers.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
