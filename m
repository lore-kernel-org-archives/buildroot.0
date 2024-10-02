Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B13ECF8542
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B192D413E1;
	Wed,  2 Oct 2024 21:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9hHFqJVQT1s; Wed,  2 Oct 2024 21:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1825F409C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1825F409C4;
	Wed,  2 Oct 2024 21:10:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6B0A1BF5EA
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A61FB81F91
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5h4zl1AOu6P for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2608C81F8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2608C81F8F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2608C81F8F
 for <buildroot@busybox.net>; Wed,  2 Oct 2024 21:10:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C8021BF204;
 Wed,  2 Oct 2024 21:10:35 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:10:34 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20241002231034.2c25b1c4@windsurf>
In-Reply-To: <20240925133512.3899750-1-francois.perrad@gadz.org>
References: <20240925133512.3899750-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727903435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=extCvkPRs7ZpM57+HX8+JMJozYNQllW/JmHvxGyJ2kM=;
 b=a4CMNkvAVgH4V2utk49JVRy9E9UzZCyFvrfSNpAAad4UNvbflRKcZ1rDghaBWMlevd09K3
 Ymt52Ssn7ExgXSWYApr6ut8VMU80huAlnxsfKAZq9GghUYnh1aGbqTkZE3ElUYNzdtl5qA
 CI4oSpqctnLV290HJR8P0bDR3Q8cx/BDizzxskAy36qrlKtg1mnqmy+tE3dhRWBt4mmlv1
 H5G2i34aYkULENytKuANerlrRjWUScnHUxBkap2Oga7vDGBlnle/qZMpsO9wqYrSQK67NK
 TgHuGF0Grx1liQ+6MApmW4A/fcYfEoZYURz2bTSZQ3qJwQqwKHCSbyi+lNORrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a4CMNkvA
Subject: Re: [Buildroot] [PATCH] package/freetype: bump to 2.13.3
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 25 Sep 2024 15:35:11 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/freetype/freetype.hash | 6 +++---
>  package/freetype/freetype.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Thanks, I wanted to apply this, but their mirror stuff is not
working... the Savannah mirror I'm redirected to doesn't have the new
tarball:

>>> freetype 2.13.3 Downloading
wget -nd -t 3 -O '/home/thomas/projets/buildroot/output/build/.freetype-2.13.3.tar.xz.wS1eqo/output' 'http://download.savannah.gnu.org/releases/freetype/freetype-2.13.3.tar.xz' 
--2024-10-02 23:07:47--  http://download.savannah.gnu.org/releases/freetype/freetype-2.13.3.tar.xz
Resolving download.savannah.gnu.org (download.savannah.gnu.org)... 2001:470:142:5::200, 209.51.188.200
Connecting to download.savannah.gnu.org (download.savannah.gnu.org)|2001:470:142:5::200|:80... connected.
HTTP request sent, awaiting response... 302 Moved Temporarily
Location: http://mirror.netcologne.de/savannah/freetype/freetype-2.13.3.tar.xz [following]
--2024-10-02 23:07:47--  http://mirror.netcologne.de/savannah/freetype/freetype-2.13.3.tar.xz
Resolving mirror.netcologne.de (mirror.netcologne.de)... 2001:4dd0:1234:1::deb, 194.8.197.22
Connecting to mirror.netcologne.de (mirror.netcologne.de)|2001:4dd0:1234:1::deb|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2024-10-02 23:07:47 ERROR 404: Not Found.

wget -nd -t 3 -O '/home/thomas/projets/buildroot/output/build/.freetype-2.13.3.tar.xz.uaZVXJ/output' 'https://sources.buildroot.net/freetype/freetype-2.13.3.tar.xz' 
--2024-10-02 23:07:47--  https://sources.buildroot.net/freetype/freetype-2.13.3.tar.xz
Resolving sources.buildroot.net (sources.buildroot.net)... 2606:4700:20::681a:25, 2606:4700:20::681a:125, 2606:4700:20::ac43:4838, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|2606:4700:20::681a:25|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2024-10-02 23:07:47 ERROR 404: Not Found.

wget -nd -t 3 -O '/home/thomas/projets/buildroot/output/build/.freetype-2.13.3.tar.xz.r7WbPt/output' 'https://sources.buildroot.net/freetype-2.13.3.tar.xz' 
--2024-10-02 23:07:47--  https://sources.buildroot.net/freetype-2.13.3.tar.xz
Resolving sources.buildroot.net (sources.buildroot.net)... 2606:4700:20::ac43:4838, 2606:4700:20::681a:125, 2606:4700:20::681a:25, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|2606:4700:20::ac43:4838|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2024-10-02 23:07:48 ERROR 404: Not Found.

make: *** [package/pkg-generic.mk:179: /home/thomas/projets/buildroot/output/build/freetype-2.13.3/.stamp_downloaded] Error 1

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
