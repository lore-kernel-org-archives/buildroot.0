Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F053CDD0CB
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C79140219;
	Tue, 22 Oct 2024 19:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7IEqNTnWKvx; Tue, 22 Oct 2024 19:17:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDBCF403B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDBCF403B2;
	Tue, 22 Oct 2024 19:17:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C66859F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E29EB4060E
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xFlCRIYjCA0 for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:17:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A698A4060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A698A4060C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A698A4060C
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:17:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71CE91BF206;
 Tue, 22 Oct 2024 19:17:25 +0000 (UTC)
Date: Tue, 22 Oct 2024 21:17:24 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Falco Hyfing <hyfinglists@gmail.com>, Asaf
 Kahlon <asafka7@gmail.com>
Message-ID: <20241022211724.69ad17dc@windsurf>
In-Reply-To: <20241013185646.2795292-1-james.hilliard1@gmail.com>
References: <20241013185646.2795292-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729624646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TuTiCoB+tmRFq73F9ABgtZyBSqFvnmXLb6QCdIL81MU=;
 b=GQKV3NfAAYJGMBKTBJKri+5UPgUoWAzfL/tkQZAu225ERxkIBt5mlYZWSzg2qO7rylAPFN
 GjZec/mfgx2T2DD3GymV7tEQqX46MxcEcSgg3gNCixLnB7DUSadzf8k6ChyKQMQ8RvoWoM
 tIeXEBZykb/Zj/UxxnE1KWEqdLAFG61hD11BzOSRbqSuh7kZSTE2w16/5pUyZZ97kIWSVQ
 VtTX1aVJEmVVdZCNDMHaakOQ7zdm6n4VK/WXpS71tLkaBZhXg9azVRVKkBxVIuFpZtNovP
 kxsyNIqMzyfWtc3UGRI7srkW2vVPYbeixTTLNFyOESKQfqONgyVKmUyhS4490Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GQKV3NfA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to
 version 3.7.3
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

On Sun, 13 Oct 2024 12:56:46 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pymodbus/python-pymodbus.hash | 4 ++--
>  package/python-pymodbus/python-pymodbus.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
