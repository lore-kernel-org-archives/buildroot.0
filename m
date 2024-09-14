Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAE5C0219E
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D67E140258;
	Sat, 14 Sep 2024 21:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UgMeyBv7hUq; Sat, 14 Sep 2024 21:53:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF174404A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF174404A9;
	Sat, 14 Sep 2024 21:53:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 994151BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8825960645
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YefXLqvnHLFI for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:53:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E7AC60592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E7AC60592
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E7AC60592
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:53:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CD7E1C0002;
 Sat, 14 Sep 2024 21:53:22 +0000 (UTC)
Date: Sat, 14 Sep 2024 23:53:21 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914235321.16d5089b@windsurf>
In-Reply-To: <20240914204518.1127592-1-james.hilliard1@gmail.com>
References: <20240914204518.1127592-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726350802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XaYTCKIdQjeXrieofLqixnQMzCFAylJDN+lf7daA+74=;
 b=WeZ/6eDPOgjFGTm4eBiarNCQxxRLi8TUCSs+8jQXa3PGx9cPMycC1GyZHj1Fu+bBBUcvog
 UHI9fn3kqvwvyMq0sjfkgfC9YH3tuFRaDU/V5X+OnJ48VkSIGWSC0QTbYCHGcQOiwUe8B/
 LZ1Vm+gi8PcUa8QOvPpHTJyjEr/UaZQwwtj+vteICfD9vDiphmxEyX1ZRqKv5qAiOrZTh1
 9ykol12gehRSOrFunuqguSK8V64lEd9QqkQYPuX6sXndVQWA7aGhrKCnyoPLY35xtYF1Qc
 p6LGSI7BBfLVVxii6AEiaPT8OiECogp4MDatlQNtZ5LKaBegz2lfw8oaTLY4Yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WeZ/6eDP
Subject: Re: [Buildroot] [PATCH 1/1] package/libdnet: bump to version 1.18.0
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

On Sat, 14 Sep 2024 14:45:18 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/libdnet/libdnet.hash | 2 +-
>  package/libdnet/libdnet.mk   | 2 +-
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
