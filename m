Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07CDC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C9A8840F9;
	Fri, 23 Aug 2024 17:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BF66vOwPHawM; Fri, 23 Aug 2024 17:33:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6162884130
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6162884130;
	Fri, 23 Aug 2024 17:33:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 371A01BF314
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EDF584117
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3n2EnySGx8mj for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:33:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A7F318410E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7F318410E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7F318410E
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:33:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8ED6B240003;
 Fri, 23 Aug 2024 17:32:59 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:32:58 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240823193258.05233ed2@windsurf>
In-Reply-To: <20240822121738.709374-1-buildroot@bubu1.eu>
References: <20240822121738.709374-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724434380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ri6vi6e+GOLd9q01TMtj/3GZ8i6HAGhqTMcS2UW3fhY=;
 b=RSZo3Rw+BR6qrGJOjFN7WOB0l6ZkgfVjui3z1t4N/uy9M2HvVa5isfejS29UNnFiDYk4je
 epPc+/V8Vh99rIdC+WQWjYFH1/wi9szUS5qvJfHLpq2khm9RBCjXB/aXC39Gx9OajxBZyY
 acT37vRZZGaeNH78glOEEQB/wGX8vqttWfCklNQyemG1TULt/KxMcKYEWgWCt+ZRWRyNJZ
 H2ZSh9PXasfMC/LifyUy0qY9elSIlQSfncwkBtD9gDPDzWUPkcNq0xXf57yzCYqvu+EZ8X
 1SOWnrSG1zph7RQ0CYUoIE4Fo48TOOtbW0kmp7BKiuNGzNq2VziPXKjNoMMFlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RSZo3Rw+
Subject: Re: [Buildroot] [PATCH] package/python-asgiref: bump to 3.8.1
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

On Thu, 22 Aug 2024 14:17:38 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog: https://github.com/django/asgiref/blob/main/CHANGELOG.txt
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-asgiref/python-asgiref.hash | 4 ++--
>  package/python-asgiref/python-asgiref.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
