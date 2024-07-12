Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFCAC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 621A140900;
	Fri, 12 Jul 2024 13:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AD70ldD5rNIz; Fri, 12 Jul 2024 13:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24D2D40929
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24D2D40929;
	Fri, 12 Jul 2024 13:23:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B60C81BF4E6
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F70140900
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TRrz8yE6H6L for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BA414074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BA414074C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BA414074C
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:23:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FBE0C0006;
 Fri, 12 Jul 2024 13:23:32 +0000 (UTC)
Date: Fri, 12 Jul 2024 15:23:31 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240712152331.66aa8800@windsurf>
In-Reply-To: <20240207170959.2672846-4-buildroot@bubu1.eu>
References: <20240207170959.2672846-1-buildroot@bubu1.eu>
 <20240207170959.2672846-4-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720790612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxCUDhiqByiMNzQMxSrfChuuJn3OUPVCPiUnPM7upIg=;
 b=EbthhRFf9hjRDMxU96wN6PtiXyTc2CV4EAOn8O/4IWoItr5QWTIGX8vk1GZ2ce4ZRPzcT/
 ABBYqRuOVy0NwQlFK//doFQ1mZz/Pj8z6kFAb8xXUB6zZMQCOrhVjaOKcmkqLtJ/RIDpgA
 /+R8iTQ67qgZCUAfupRueVZNpA8QebXwhEaw2GNsJw2gkT+/thdljxcvCDRZYy4SA4CkiM
 k7VcRP5FpeFGF0Y6DUnM8M9iP8ZcnCBWPipY0J0tdhoP5mwxiRh95UNvrZKZz6v5USR8yO
 tXu9R1PypAoisyivs+3LwU5rOct8OfCMY+qm2xZRIZb1l2q7hIhI2Qk+Jv06gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EbthhRFf
Subject: Re: [Buildroot] [PATCH 4/4] package/python-ruamel-yaml: bump to
 version 0.18.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Feb 2024 18:09:56 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> From: James Hilliard <james.hilliard1@gmail.com>
> 
> License hash changed due to year update:
> https://sourceforge.net/p/ruamel-yaml/code/ci/56b3e2666fb275deab3eec99193c103e4edf93bb/
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-ruamel-yaml/python-ruamel-yaml.hash | 6 +++---
>  package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
