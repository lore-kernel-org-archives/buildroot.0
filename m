Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F415BC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAB424013F;
	Sat, 20 Jul 2024 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6HAtl9GKOM1; Sat, 20 Jul 2024 21:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D25440162
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D25440162;
	Sat, 20 Jul 2024 21:09:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 054321BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E45F44014B
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zl27RslAvVBy for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:09:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0C664013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0C664013F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0C664013F
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:09:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1125FF802;
 Sat, 20 Jul 2024 21:09:50 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:09:50 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720230950.28d626da@windsurf>
In-Reply-To: <20240719214610.370192-1-fontaine.fabrice@gmail.com>
References: <20240719214610.370192-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54y4V7bV3uhLE6wb4JSMB/ehqEVYw1w8sfQJ3FgWpcY=;
 b=KoULWUj2yUyI2rea3a6EnYAlD4jILUo7d7bwPARNjctYesHMjUfEEpd4Ufv2rgrvOEM49s
 GKWapR+Mzd4rsTjxShOqnG3WPiFGULfzytsaXboffJLwh+y+0e/Bz1FKZK+jtJGaKjo4Uc
 8h5RxyruiZCkRwTFfksPQRq2EnxD5YnjdsFW3WxiYK5t9+GZJ2AaXbszD4t7+AusBdkHnu
 gfgPaj686zk7Oiuqh/3byI/30i8/viQWmK+CRdUiXtH6wtllsnu9ZjTjvfSQm7+hlYZfGt
 h0Rw4KzP9i6XKfBpwVOlm/ysINLjz/LV1+noJODR45Pd44zjxc/VyLyv2wdm/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KoULWUj2
Subject: Re: [Buildroot] [PATCH 1/1] package/ksmbd-tools: bump to version
 3.5.2
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

On Fri, 19 Jul 2024 23:46:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.5.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ksmbd-tools/ksmbd-tools.hash | 2 +-
>  package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
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
