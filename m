Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4CAC3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 19:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E18F60664;
	Thu, 11 Jul 2024 19:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCcqkUo9pvNz; Thu, 11 Jul 2024 19:24:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F25F608AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F25F608AB;
	Thu, 11 Jul 2024 19:24:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9ECD11BF479
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CA93610FB
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXf_dZWzx89E for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 19:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AF51606BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AF51606BA
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AF51606BA
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 19:24:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE1281BF203;
 Thu, 11 Jul 2024 19:24:51 +0000 (UTC)
Date: Thu, 11 Jul 2024 21:24:50 +0200
To: Jan Havran <havran.jan@email.cz>
Message-ID: <20240711212450.03598fa8@windsurf>
In-Reply-To: <Zm70YkR_roWwY-ms@arch-zen.localdomain>
References: <Zm70YkR_roWwY-ms@arch-zen.localdomain>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720725892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMR/+jEpZv8T1Bii/86ews/X509wLLc1ihZYquyDzbk=;
 b=mIIAVsSzX7rKVKjpoXK/jfRiPndo19RAQ8oLzOAfWOuQGVoCPhitSKQSgv+UmQUPEIWuuy
 Tzk9vZ5B7BolH6DooNdX+vCWwWloJyVO13c19oc2AeiB12MVuiLw5a4++2pDzQphay27qU
 dwliuHJvN5TqpM8fiGytDO/rwJwofvF42R5THSOa68RJ+oO0CF0jnEuwy/f7HcV7LBZV1e
 EKcxH3DWPK8uXoLF6X51vWFGICQmiwEGUqSf4uEvTVOLlWwpESaXK/M1+lZ+3fATQmNxw8
 elaARXR8LS8+mVVWnT/1BidaI1xO7NMgKypDDMIYv77oqnRJvMJEHrpwGj8Y8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mIIAVsSz
Subject: Re: [Buildroot] [PATCH 1/1] package/ubus: remove obsolete systemd
 option
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 16 Jun 2024 16:19:14 +0200
Jan Havran <havran.jan@email.cz> wrote:

> ENABLE_SYSTEMD option has been removed from ubus by commit:
> 96ab0b3032f5 ubusd: remove systemd socket activation support
> 
> Signed-off-by: Jan Havran <havran.jan@email.cz>
> ---
>  package/ubus/ubus.mk | 7 -------
>  1 file changed, 7 deletions(-)

I've done a bit more research to see from a Buildroot perspective since
when this obsolete systemd option has been dropped, and I added the
conclusion of this investigation in an improved commit message:

    package/ubus: remove obsolete systemd option
    
    ENABLE_SYSTEMD option has been removed from ubus by upstream commit:
    
      96ab0b3032f5 ubusd: remove systemd socket activation support
    
    From a Buildroot perspective, this means that this systemd socket
    activation feature no longer exists since Buildroot commit
    130be80d34905d3e79ff6b8f8fb31b3c3765eb96 ("ubus: bump version"), as we
    bumped ubus from 259450f414d8c9ee41896e8e6d6bc57ec00e2b63 to
    34c6e818e431cc53478a0f7c7c1eca07d194d692 in this commit, and the
    96ab0b3032f5 ("ubusd: remove systemd socket activation support")
    commit is in this range. It was therefore dropped upstream in 2016,
    and in Buildroot in 2017.

Applied with this improved commit message. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
