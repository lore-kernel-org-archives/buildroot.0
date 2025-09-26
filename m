Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBDACAC5B8
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 21:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5B2C84C51;
	Fri, 26 Sep 2025 21:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSOAkMWUpVrF; Fri, 26 Sep 2025 21:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7255884CBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7255884CBD;
	Fri, 26 Sep 2025 21:37:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AB6512D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 21:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BE5D84CBD
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 21:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4XESgH23yTi for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 21:37:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13ADB84CC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13ADB84CC4
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13ADB84CC4
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 21:37:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B654AC8F1EA
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 21:37:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1C7FB606B5;
 Fri, 26 Sep 2025 21:37:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BC085102F1820; 
 Fri, 26 Sep 2025 23:37:13 +0200 (CEST)
Date: Fri, 26 Sep 2025 23:37:11 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250926233711.7e3b39a3@windsurf>
In-Reply-To: <20250926163239.162734-1-thomas.perale@mind.be>
References: <20250926163239.162734-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1758922639; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nTZ4M0a7tfjdfC66sB4LDUY5AxaClAYUaYFJHzw5nIg=;
 b=pN+AlC/uNQgHtvJUgazWi+lrxWKMSTQ4tPDEa2mdpHYkHuuEqFl3Mdd4iUWyNz1VIE2IM2
 BogjFlV4vZN+eQwRj6SDfz7H/psPHQuurvl+aQCcEgw0U0fzh89jyDRKZGQfc84PUbZorh
 KnogtO8cCocRx1WZiburiRtpJwXy0sLicUzbeuiVvliIK/2mB9Hhthahy5na2p4MMZ7gWH
 agySJRNh8hoVPTuBeRg5/0b5A5WxocKxLjCBVtgrbHfmgWbQeJaHTUyauDapHiZ8v9wcEC
 gcVNVShYN46w62JxoFRXo7MLKEjnQinCyZ9XXukaTJtQpMbVZpyB94IcsV0JWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pN+AlC/u
Subject: Re: [Buildroot] [PATCH 1/2] package/tiff: ignore CVE-2025-8851
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

Hello Thomas,

On Fri, 26 Sep 2025 18:32:38 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> The CVE-2025-8851 [1] has been fixed in upstream commit [2] that is part
> of the v4.7.0 release.
> 
> Because the NVD reference includes the version '<2024-08-11' most of CVE
> checker will fail to compare it against 4.7.0 and report it as a
> positive.

Thanks for the patch. Why isn't this fixed in the NVD database? Was the
issue reported to the NVD maintainers?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
