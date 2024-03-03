Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32323C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 22:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC70340135;
	Sun,  3 Mar 2024 22:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h624GiEAmR77; Sun,  3 Mar 2024 22:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC1B74013C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC1B74013C;
	Sun,  3 Mar 2024 22:17:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B7911BF292
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 22:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8560A40135
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 22:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HxISuJbrB-LE for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 22:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD6614013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD6614013C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD6614013C
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 22:17:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 503F560002;
 Sun,  3 Mar 2024 22:17:01 +0000 (UTC)
Date: Sun, 3 Mar 2024 23:17:00 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240303231700.55fe7c0b@windsurf>
In-Reply-To: <20240303212411.1139387-1-fontaine.fabrice@gmail.com>
References: <20240303212411.1139387-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709504221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HTNc4cfqGrgOrNbgccQNH9Bzn2NfeZ0oYeTH2LCM0Is=;
 b=B+BacrsdQNvMcRJ5kl6iakDqTb6fkLJJYE+TfHVE7IGhnx32r0/KZ1pUidYadymhizQ+I2
 YFMBM4t7/QtVHy5Keh7OlGHm9NNlUUJAz1yXNc0//+vYhC9Be5Ml1L1fO0emlMm+zYRHhU
 qmWXkPWxpArFWf3KiKGg40QraSt4WSp9H+eDpiyabqkDCz9dqu9mKRKZRjW5awajZH28ON
 aT1no8rghUaosEFUKZP9rWH1gN3Q0ZqP+26beqL5LJOShE5RH7xQSNgBrLmZf8hUGwJGP+
 6chtvPjCNWl9An5HoPwv3s+WBFiX3Q7pEizSJ4hJX45l9tf+l3jI8TaHkQTRPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B+Bacrsd
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build with
 BR2_TIME_BITS_64
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  3 Mar 2024 22:24:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Indeed, this LFS workaround was present since the addition of the
> package in commit 6a0f7c39bcb48fc13aa2ce3fc4996baf1be66483 and is
> probably not needed anymore

This package was added just a year ago, so I believe "probably not
needed anymore" is most likely not sufficiently assertive. Can we get
some more clarity on this, by reproducing the original issue that lead
to this FLUENT_BIT_CFLAGS += -U_FILE_OFFSET_BITS magic, and then figure
out how it got resolved, if it did?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
