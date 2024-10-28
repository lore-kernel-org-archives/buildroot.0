Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AD4D5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E24AF607CA;
	Mon, 28 Oct 2024 21:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-In6TGEVNGm; Mon, 28 Oct 2024 21:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01013607FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01013607FD;
	Mon, 28 Oct 2024 21:45:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26EDCAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 147E5607FD
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmQT1oc7v9Ht for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:45:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED1BE607CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED1BE607CA
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED1BE607CA
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:44:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E36360004;
 Mon, 28 Oct 2024 21:44:58 +0000 (UTC)
Date: Mon, 28 Oct 2024 22:44:57 +0100
To: Mattia Narducci <mattianarducci1@gmail.com>
Cc: buildroot@buildroot.org, Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <20241028224457.32d30f3b@windsurf>
In-Reply-To: <3276979.mvXUDI8C0e@localhost>
References: <3276979.mvXUDI8C0e@localhost>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730151898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mBKVWwKjnFa/kBlQI/QvqPKCZ/0bM6jlk/pLB1JSmkY=;
 b=a0bp5Eb/VHEbUun8uVHc+6iJMNaB71MHRmaOAXwJY/Tnv6GwpjSMBfcaJDVDe1QBzrGoO5
 y9XpyfWAXs+aMfOZWFzgrvondb3EiHXCcsF4IfnqFxxd6MATnNYo7kEqJ2QeeX8p7DuMON
 Ng2LjHPtSBEW1btIZIhYd2Q1XNzcVgRw5VLrp44TOeKwuk0YNSJzKLATfl7ZNOrEA5vOiJ
 Tz3N7yP218D55PgmkIwhJvsrj/+Ztzul5oOHp4hXrtuiAc/7uAIyFiEQqLrC0u6njMrMPc
 3gZu48+VKdK2IeebvCOhu3IPQ/FDsVw5xF+kViMRCJxFlXVC8v/FsAx17wu7tA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a0bp5Eb/
Subject: Re: [Buildroot] [PATCH 1/1] board/pine64/pine64: use offset to
 specify boot partition alignment
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

On Thu, 05 Sep 2024 22:52:18 +0200
Mattia Narducci <mattianarducci1@gmail.com> wrote:

> Use the 'offset' property in genimage.cfg to align the boot partition on
> 1 MiB boundary. It is clearer than fixing the size of the previous
> u-boot partition.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
> ---
>  board/pine64/pine64/genimage.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
