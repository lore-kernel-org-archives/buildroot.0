Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C907C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FFFB415CE;
	Wed, 10 Jul 2024 21:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKBsuZwBwzg3; Wed, 10 Jul 2024 21:56:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A3D2415B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A3D2415B0;
	Wed, 10 Jul 2024 21:56:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 303631BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E0DD60A61
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AbUFaDkx-kD for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:56:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA1ED6066D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA1ED6066D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA1ED6066D
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:56:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F9EB40002;
 Wed, 10 Jul 2024 21:56:22 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:56:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240710235621.36ed059f@windsurf>
In-Reply-To: <20240710214245.3432395-1-bernd@kuhls.net>
References: <20240710214245.3432395-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720648582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/ecour52Vj1dkwFdctU5HYbengujKUx8ffoun3OnEY=;
 b=S2ao1wawzcP/qA0AXjRjHsv5vh8H+jxF+gwLiJr1aC2jnVMD5wgT68rwdT8DFlKtJlXYd8
 lW7mIGpTaqw76qCm0myksO9jPSzv8SBTiVXp0CeEKaMa0QLqXHlcfHI3tgnhryAu4heZU8
 Jo9FoKv5JjdSP3kf1+QIPo6Kk95XyM7F++UW9K9uoingY6oM3eXXMjWPXqwEOLLHkOQ3j7
 jxVYMZuBsXFdJV4wcUUslgCM/cPFMc9iyiMZmNLb9JRpcb/NDiEjoiGTUyAGFcO+Fzm/Zb
 TDeoWEgFRuWgJmku7Pdg8JHCRHis8MYJ4KKnkvCBkGHVqqKLAm9L4Lun4aWwsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S2ao1waw
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.30.0
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

On Wed, 10 Jul 2024 23:42:45 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://cmake.org/cmake/help/latest/release/3.29.html
> https://cmake.org/cmake/help/latest/release/3.30.html
> 
> Updated license hash due to copyright year bump:
> https://gitlab.kitware.com/cmake/cmake/-/commit/4bc97565d0f97fa1a840d56ab58be46ccad175e0
> and updated zlib version:
> https://gitlab.kitware.com/cmake/cmake/-/commit/6c2bed54f6610405e1a37aa48ff0f8d25f198076
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/cmake/Config.in.host | 10 ++++++++++
>  package/cmake/cmake.hash     |  6 +++---
>  package/cmake/cmake.mk       |  4 ++--
>  3 files changed, 15 insertions(+), 5 deletions(-)

Applied to master, thanks. Let's see how many of our packages blow up
with this CMake update :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
