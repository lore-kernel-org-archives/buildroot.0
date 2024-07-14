Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAB4C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8066160585;
	Sun, 14 Jul 2024 15:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-7E8Cmp7tfq; Sun, 14 Jul 2024 15:06:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8454F60586
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8454F60586;
	Sun, 14 Jul 2024 15:06:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9ABA1BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51E8B40096
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uj7JvhLqYGpO for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:06:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DDAB540474
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDAB540474
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDAB540474
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:06:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2EAC60002;
 Sun, 14 Jul 2024 15:05:58 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:05:57 +0200
To: Geoff Levand <geoff@infradead.org>
Message-ID: <20240714170557.25802224@windsurf>
In-Reply-To: <5809d7c9-8cd2-4eb1-8227-901e6722a068@infradead.org>
References: <5809d7c9-8cd2-4eb1-8227-901e6722a068@infradead.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720969559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AH1FRzOs61nn2OFBeLgktFX314vPaFLuR5wIELBDFVQ=;
 b=i9Y4x6kDm3+w6IK0BdrNfWyVCq2L+HXt6qUj6Se2Fj/+oEV9KG1pz1pETEKpPL8ZT+PHhy
 OA/7RA4+ecJoqJtaz8yi5zNnL4ok4YY8xkaNWWWtzxgu82jU0cvTOBojdgVbt8hQq8DHcF
 0xFCmGnbaLAQtK+ayAILbtyiBBli8XdEQukdUg3QeItPaHOL5JSyzysivjf+P8LvvA0ocU
 /YQfRHcnVoZrZuZvVwOiSZBn65hT7UsHHDeLJWHxV6eZC8vtlS9UyW5aLb27OhOQ01xq8w
 7XofnzjRG/uFzrh72KWJUY8CQcXJ4+4moA+XGGxP3l9clqMyLvt+j5qboNBD7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i9Y4x6kD
Subject: Re: [Buildroot] package/flannel: Bump to version 0.25.4
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

On Sun, 14 Jul 2024 14:37:39 +0900
Geoff Levand <geoff@infradead.org> wrote:

> Signed-off-by: Geoff Levand <geoff@infradead.org>
> 
> diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
> index b3caf907db..85bc184368 100644
> --- a/package/flannel/flannel.hash
> +++ b/package/flannel/flannel.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  73c832ab860ceae15d6f890fae7c71e265af4825f885b5c367a91bd884eb2c09  flannel-0.25.3-go2.tar.gz
> +sha256  e4946abe7212d0a3f89f64ff9d4310dd21fafa782d7e5c1c7d44ea264ab25d5c  flannel-0.25.4-go2.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
> index ffbfad888f..5231d41de8 100644
> --- a/package/flannel/flannel.mk
> +++ b/package/flannel/flannel.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLANNEL_VERSION = 0.25.3
> +FLANNEL_VERSION = 0.25.4
>  FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
>  
>  FLANNEL_LICENSE = Apache-2.0
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
