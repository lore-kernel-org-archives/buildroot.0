Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B0AC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3355C8410A;
	Fri, 23 Aug 2024 17:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKBIycDqGxUu; Fri, 23 Aug 2024 17:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CA2A84147
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CA2A84147;
	Fri, 23 Aug 2024 17:33:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E63181BF995
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0E29840F2
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYhip03HYPps for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:33:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C4CE84117
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C4CE84117
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C4CE84117
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:33:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5F0120002;
 Fri, 23 Aug 2024 17:33:02 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:33:01 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240823193301.473c90cf@windsurf>
In-Reply-To: <20240822122437.712757-1-buildroot@bubu1.eu>
References: <20240822122437.712757-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724434383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYjqviXo5V2Kf0KQvgGlwfuitKCq/hGfW22Lw2hCC7M=;
 b=gAWPKi8VmZRCgpOnu6kn0SaI4QX6VVXdRpQKRLow7fzE6YejYh0f8vViAbBpRaZnnvagXn
 BaBmLvWOAmSxlbmBF1+SPnTa990gh1BS1304aQxHtPZltWf6hsT5RY5Kp+k90kWoDM1AQb
 O1Yn/aOl7SH+EYMnJQPt/1o54QIaVFVwLw839gjEQlhCOQevYMwE+gqBes2BvabsFiqW0J
 Ug5EHDJfqQydQtrE4lua4cEHaCT+P0XQMj4zI30VhsOlkwvNrRX7lCJqc6oj2VsAr77Lng
 u4l1HR7iczOfPU6zqfOIEHTF4nFZENTg8LQsiNZh5SnMLFKe/ZjGZNpiry263w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gAWPKi8V
Subject: Re: [Buildroot] [PATCH] package/python-wrapt: bump to 1.16.0
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

On Thu, 22 Aug 2024 14:24:37 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog:
> * https://wrapt.readthedocs.io/en/latest/changes.html#version-1-15-0
> * https://wrapt.readthedocs.io/en/latest/changes.html#version-1-16-0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-wrapt/python-wrapt.hash | 4 ++--
>  package/python-wrapt/python-wrapt.mk   | 4 ++--
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
