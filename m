Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27432C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 06:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E178861632;
	Sat, 11 May 2024 06:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnCo0paaNGSj; Sat, 11 May 2024 06:55:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B88461683
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B88461683;
	Sat, 11 May 2024 06:55:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CCB11BF398
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A1F161632
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVISdXaNh-Ej for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 06:54:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5969E61683
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5969E61683
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5969E61683
 for <buildroot@buildroot.org>; Sat, 11 May 2024 06:54:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5274D1C0002;
 Sat, 11 May 2024 06:54:55 +0000 (UTC)
Date: Sat, 11 May 2024 08:54:54 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240511085454.72e5c418@windsurf>
In-Reply-To: <20240510235510.2454216-1-brandon.maier@collins.com>
References: <20240510235510.2454216-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715410495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L6+0FabGZxhOc1VyYLycM2MMGyf5vDdfDM7bugx/EFI=;
 b=oRTa0DCsDLssJ9anVZyTik+fubT0zQXybDvIEGYzpfmfpL7zqas+THFqvLelfbgxwNyz6I
 whF/u75+yNQZRUasHcYFhwGSZJks0BT7ppy56i4gXgmJWNPMwHdbUV+Y7+QLpWFbDSq4kL
 NeSKnOiqh8fXw3qqX7oNUGYJ9/RcB1wZHgKNugmwmQuCv5u6bBTE5KBvYhH5IJHqueOAF7
 7HfVP4JR81Nd3OwbCvxWp0CDFmzLtz6vdXQHAnuPLPoHhfRV4Bq9QG6VXUU8jtLKw7YCrQ
 QeYahG6x5/NTIEN325LqD7tkSqvMV4DldWzTIGKJyGI3aRYwNmZg7pM2mg96FQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oRTa0DCs
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: add zip test
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
Cc: Jan Pedersen <jp@jp-embedded.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 10 May 2024 23:55:09 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  support/testing/tests/package/test_zip.py | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 support/testing/tests/package/test_zip.py

Applied to master after adding an entry in the DEVELOPERS file.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
