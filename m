Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D33D10376
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 21:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 273D760E5A;
	Thu, 24 Oct 2024 21:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mO_37HbayXWX; Thu, 24 Oct 2024 21:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A2460EF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A2460EF3;
	Thu, 24 Oct 2024 21:09:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 240DE59BD
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EB8140535
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rt-jVrd3SvTn for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 21:09:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09BC0402DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09BC0402DE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09BC0402DE
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:09:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C896A60002;
 Thu, 24 Oct 2024 21:09:54 +0000 (UTC)
Date: Thu, 24 Oct 2024 23:09:53 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241024230953.4ba8d5c7@windsurf>
In-Reply-To: <20240930231156.1212998-1-james.hilliard1@gmail.com>
References: <20240930231156.1212998-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729804195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/j+Ux4WvkBMLwVsmH+dM5Lc/lcuHoTZWTiL6qPW0jUI=;
 b=RmLlEtVQdnbrId9G7f1TEaVBwHkATcj9IVeK0TWMPvz4eoTmDj4fIdvDMF+awhqqQrHpu7
 drd5rLm/Yp80zKPegX87Xv88Z/WGYrAa1h3chj2kPPjverWubFNUliNe8Oqi6szVOWQWUY
 cpKb6VGwKr595CnuHAwI2TkID3YBwSHCgZvNMlK4lIFtL5n2MY5H9PFQDiE1eCmc9ZliSJ
 OrXYu72GZr7F5rLS5qaDLuJVDD2dhNie3Q1KhEdPNu/uDxsoNMnHfwrJWqpKYABTjtlbx3
 /2Ynq6SYN/1h5L+5ZQovmq1B7HnUji7FH0n/jZT1IzpT6u2VZ34L0vk29ivcvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RmLlEtVQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pysnmp: bump to version
 7.1.4
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

On Mon, 30 Sep 2024 17:11:56 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer required python-pysnmpcrypto runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pysnmp/Config.in          | 2 --
>  package/python-pysnmp/python-pysnmp.hash | 4 ++--
>  package/python-pysnmp/python-pysnmp.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 6 deletions(-)

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
