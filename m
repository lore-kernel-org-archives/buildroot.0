Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910E9CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E28241847;
	Wed,  3 Apr 2024 19:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pgn6NtBPokt; Wed,  3 Apr 2024 19:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99C9B417F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99C9B417F7;
	Wed,  3 Apr 2024 19:52:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D4C31BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A1AA60716
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxbRq13s280E for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:52:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EABD46070D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EABD46070D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EABD46070D
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:52:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6525E0004;
 Wed,  3 Apr 2024 19:52:38 +0000 (UTC)
Date: Wed, 3 Apr 2024 21:52:38 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240403215238.54035ef3@windsurf>
In-Reply-To: <20240328215409.65813-1-fontaine.fabrice@gmail.com>
References: <20240328215409.65813-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712173958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QH5JO/4FwIjK2yHbs5vFA8beVSkMkRU3spOqVULVEHk=;
 b=pEVrgEq08gH9dRDvn/LP74jnb6V1E5ur2wGGx6HkN1NbKSlTQAqani0n1WeZpGvLAV2D+Q
 X3VQpvpBSw2xYk9tB2tVTNGsuKVvr26yltVv1+HGppj6xpLzGoU4iV+3QMJFfCWQxqM1k+
 oQqhPUrZZQAEiZ2tgltbE8Pter5fFwrCBHd5JL/bpXerx1faZPsXRhSRsSSxwU//K3p6Sd
 T+nWgxX81NyE6hrApAmhlODnJ8+q0zwvsdbyMo4Gbtsb3zJEaCYwHvvY/ePLWLYC5wierb
 BzP+iT1+7tQJKRWlDrPNl4wHWIYNuB544acaR9oT2v2yZ/VQMR2vjfnlET/PkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pEVrgEq0
Subject: Re: [Buildroot] [PATCH 1/1] package/libidn: bump to version 1.42
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

On Thu, 28 Mar 2024 22:54:09 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://git.savannah.gnu.org/cgit/libidn.git/tree/NEWS?h=v1.42
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libidn/libidn.hash | 2 +-
>  package/libidn/libidn.mk   | 2 +-
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
