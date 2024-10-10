Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975C9D24455
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D2F4412EA;
	Thu, 10 Oct 2024 21:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X17bIajeQLtV; Thu, 10 Oct 2024 21:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39A2E41305
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39A2E41305;
	Thu, 10 Oct 2024 21:51:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDAF71BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBBDF412DE
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8zbrCwsvxpv for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A8FE412E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A8FE412E5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A8FE412E5
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:50:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74F9E1BF208;
 Thu, 10 Oct 2024 21:50:45 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:50:44 +0200
To: Gilles Talis <gilles.talis@gmail.com>
Message-ID: <20241010235044.3328fe01@windsurf>
In-Reply-To: <20241005205607.222164-2-gilles.talis@gmail.com>
References: <20241005205607.222164-1-gilles.talis@gmail.com>
 <20241005205607.222164-2-gilles.talis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728597045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4eeJEqcCaPjQ2YVvo2De9j+QcKy+c7mmFP2t9VRbE0=;
 b=W3066BY+Ep6cEs4x615DknaDAxKBedFX+omm7VnF4oOKWsz1sQ1CM7fYHlxzuOGc4+roIW
 0cxIS6/K8OoJ2nMqjdJGEe8rTNtk7I7/Rjv08dHNsTg2WFgzB+rxNJV+hIfAO9ERWDalVO
 fFxBpxFa9GtbDbUFAKstej+EI1GVwwAs8NdK2eoxv5fYd7eoiS1mda5C9IZzVBAFLL6bNR
 //ZOkmcEhE8ckZrhmavFnYtN1KippKbKckmt4B/1dlOL/j9ZlOoHjqFUVqurXVcyhwx6ZA
 4lTPeqqF+JdRqSfAdYtd2v05J0GnNWKAsTwPIxJvtLVF2bNfY19r5EocfEqnOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W3066BY+
Subject: Re: [Buildroot] [PATCH] package/tesseract-ocr: bump to version 5.4.1
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

On Sat,  5 Oct 2024 16:56:06 -0400
Gilles Talis <gilles.talis@gmail.com> wrote:

> Change log:
> https://github.com/tesseract-ocr/tesseract/blob/main/ChangeLog
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  package/tesseract-ocr/tesseract-ocr.hash | 2 +-
>  package/tesseract-ocr/tesseract-ocr.mk   | 2 +-
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
