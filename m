Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBC1C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 21:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BC746061D;
	Wed,  7 Aug 2024 21:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkQ002QMnzGC; Wed,  7 Aug 2024 21:08:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A40CB60635
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A40CB60635;
	Wed,  7 Aug 2024 21:08:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C30F01BF2CA
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B024540722
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxeM_y2SOz43 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 21:08:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6773F40110
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6773F40110
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6773F40110
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 21:08:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 493EB20002;
 Wed,  7 Aug 2024 21:08:13 +0000 (UTC)
Date: Wed, 7 Aug 2024 23:08:12 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240807230812.75e9e56e@windsurf>
In-Reply-To: <20240807205509.382108-1-giulio.benetti@benettiengineering.com>
References: <20240807205509.382108-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723064893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pv5ll4vfyXVcaxfaf0/wDN8d9GrQK/jnAx+ucfhfUf0=;
 b=kuDHbx6HmKULMNjvtynk/kHjzTLF36YH/mXnT/+Ch2ox7/xBmRoMOuiWfv33ZdUStVZRFW
 YDLQJB+tqBJp4SjCgRZzBBNIC12igJG7bGW9GGOnfjkfEzygSDpqY74TugTs2uMJ0S2Bp7
 U588JCWhFm/b2gawPAjxLbooCpkCMvyRjkrsW1IfurOWzi7h3/gtAVGHi4G9mta2bLh12a
 xzbRCv2ilQ0HrjwSPZpv+lemjMPX0fclU7Ld+x5957ZrCBXXZmaKOaJIHggTpFWPSlmf5z
 UOoO0SUtisbJ2RGU8QtVoTWWwxmhhzGdJ+72ohlk4kVhiLkIl1FCqXLs7bW32A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kuDHbx6H
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.7.4
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

On Wed,  7 Aug 2024 22:55:09 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/cryptsetup/cryptsetup.hash | 2 +-
>  package/cryptsetup/cryptsetup.mk   | 2 +-
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
