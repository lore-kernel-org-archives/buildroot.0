Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A707DD5AE70
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 08:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F47D419A8;
	Thu,  7 Nov 2024 08:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0mnDPOIPs7c; Thu,  7 Nov 2024 08:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55563419A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55563419A1;
	Thu,  7 Nov 2024 08:02:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F6F8C1
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2196082112
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmd4Ih7Ko3-G for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 08:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EBE188210F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBE188210F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBE188210F
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:02:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32E6A240004;
 Thu,  7 Nov 2024 08:02:28 +0000 (UTC)
Date: Thu, 7 Nov 2024 09:02:27 +0100
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241107090227.1ebd111d@windsurf>
In-Reply-To: <20241105164900.205431-1-thomas.claveirole@green-communications.fr>
References: <20241105164900.205431-1-thomas.claveirole@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730966548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gtDUtcH8KchQE1sTPTEzBpQou8p+ceNyC2NO/O+JUcM=;
 b=E+6tdHdqqccD+dg4ZNJuewYS2jlQGBAITgPvMX98WQ99yXUHRLssrKhK84gN3KWW+tdqiL
 F5VDeqajnKRCePS1Ldf+KvtazRZ0wfdS7wKjQItLimSQT14hibuykf0tapjnDLNXwSyuaU
 gZW78mcb7GStD6ZYU7hlnSCjRbatc0no0jGyhzlK5sKqEEE+CAIGd/vBlOenf6fA8RVkJL
 pkzgySEI8R7wtpmayFfx+SPR29kdrWTavpJ7a2BeiahFkhfsJmcZCi/c/cbEYyJWXSDtWM
 mJ9xcAUp/og51R1nxVfuFtLHqMLg8qR9iWpTULwso2hQYu0qfSrATr/ym1Vm+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E+6tdHdq
Subject: Re: [Buildroot] [PATCH 1/1] package/openlayers: bump to version
 10.2.1
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

On Tue,  5 Nov 2024 17:49:00 +0100
Thomas Claveirole <thomas.claveirole@green-communications.fr> wrote:

> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/openlayers/openlayers.hash | 2 +-
>  package/openlayers/openlayers.mk   | 2 +-
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
