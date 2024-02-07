Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB8BC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 18:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 087C760ABE;
	Wed,  7 Feb 2024 18:52:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cNKGSWscXQVZ; Wed,  7 Feb 2024 18:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 380CC60AE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 380CC60AE1;
	Wed,  7 Feb 2024 18:52:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3528C1BF20D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2243D60AE1
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:52:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NhP_eAjTyKok for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 18:52:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECF8B60ABE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECF8B60ABE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECF8B60ABE
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 18:52:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F25701C0003;
 Wed,  7 Feb 2024 18:52:16 +0000 (UTC)
Date: Wed, 7 Feb 2024 19:52:16 +0100
To: Martin Kurbanov via buildroot <buildroot@buildroot.org>
Message-ID: <20240207195216.5ded8acb@windsurf>
In-Reply-To: <20240119150244.204049-1-mmkurbanov@salutedevices.com>
References: <20240119150244.204049-1-mmkurbanov@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707331937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppcaEv0LcTQjFzJJF9KIR1XYVFihT8xoYVJoHiGVrXc=;
 b=DZzNAkcRC2ANHKA+2UjhTaZCCRmup02dVWprwIzl9EY8O4R99BIpfLfTBJrm8cDClvm27S
 kM4G5HBnwkNfItfZkcBKGFedBQnFInE4VEPASJAoOiG1BBLnZgPCa3c0Ado3XdfcctTfOI
 btmFoUgZ5sMTdbqWt1R4aBEO0LlmuesnvMBBPatx26Zhqj0UgG0TD1Eon1UPbrljZ2vsA6
 JcN1TTsLWnqfornKvPcEeppIxTa/LIo8TlbEOGEywYt2B9dMPrjd/iaruRXxmADdAFbNqY
 Fa3N48ZwEI6LdoaQ5YmVUPkzrGEzIKaZlXzd66Hd2dPIzrwzSnyRh/IwUWM7GQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DZzNAkcR
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: add patches fixing
 hangs asn1parse
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
Cc: Martin Kurbanov <mmkurbanov@salutedevices.com>, kernel@salutedevices.com,
 sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 19 Jan 2024 18:02:44 +0300
Martin Kurbanov via buildroot <buildroot@buildroot.org> wrote:

> The asn1parse command hangs forever on 3.2.0 when the genstr or genconf
> option is passed.
> 
> This commit fixes the issue by adding upstream commits [1] [2].
> 
> [1] https://github.com/openssl/openssl/commit/a552c23c6502592c1b3c67d93dd7e5ffbe958aa4
> [2] https://github.com/openssl/openssl/commit/749fcc0e3ce796474a15d6fac221e57daeacff1e
> 
> Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
> ---
>  ...x-genstr-genconf-option-in-asn1parse.patch |  42 ++++++
>  ...en-asn1-oid-loader-to-invalid-inputs.patch | 122 ++++++++++++++++++
>  2 files changed, 164 insertions(+)
>  create mode 100644 package/libopenssl/0005-Fix-genstr-genconf-option-in-asn1parse.patch
>  create mode 100644 package/libopenssl/0006-Harden-asn1-oid-loader-to-invalid-inputs.patch

Sorry for the delay in getting back to you! I have applied your patch,
after updating the two patches to indicate the final upstream commit
references, rather than the reference to the pull request.

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
