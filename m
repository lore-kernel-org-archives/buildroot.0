Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A303C52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 20:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A672608E2;
	Wed, 14 Aug 2024 20:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjcLheoBgdND; Wed, 14 Aug 2024 20:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8576E608D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8576E608D1;
	Wed, 14 Aug 2024 20:04:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B814F1BF40D
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3406608CD
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7oXQ4r8lWW6 for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 20:04:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73A22608C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73A22608C9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73A22608C9
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 20:04:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E1D6FF803;
 Wed, 14 Aug 2024 20:04:13 +0000 (UTC)
Date: Wed, 14 Aug 2024 22:04:12 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240814220412.704fbe13@windsurf>
In-Reply-To: <20240813173113.138454-1-ju.o@free.fr>
References: <20240813173113.138454-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723665853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/uP4uE8JSSxYR66kJfAwLwMyez0DHGaiNuqEbi5izc=;
 b=SKXzlqiNbNPwO1Ky5zwYjcYQD3WEcST9KtgRhBNfxRDHMeTO2Xr4vdzlEfuts0DeJ9lIWx
 UkQRYWMStIx3dgmYaFpoBie0rIxCQgFt98Szxos9bpokg+HjyU2rGLWBkVAEKJMxmtXeN0
 5lpaYMninprrvAyN93xLRTYxQUEWRE7reRZ/2dpUgr+JTtLVHsIhWuyVsu9eoSbIx3FpRv
 bwxoEd+xU0INVN1WA+H/AIcljK/hIe1JFBx6jwY3FgKqRmCyFvlSN363109spae/+QtXrE
 OoS9m4Znt6Uz8lyDYWcp4Tycw4rLEC+5O4EpxmapPN1WLws1UHwS7R8lPPnFfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SKXzlqiN
Subject: Re: [Buildroot] [PATCH next 1/1] package/uhd: bump to version
 4.7.0.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Aug 2024 19:31:13 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 4.3.0.0, see:
> https://github.com/EttusResearch/uhd/blob/v4.7.0.0/CHANGELOG
> 
> This commit removes the package patch 0002, which is now included in
> this new version.
> 
> Also, uhd version 4.5.0.0 raised the minimal gcc version requirement
> to 7.3.0. This change is reflected in the package dependencies.
> 
> Also, some UHD Kconfig sub-options (B100, B200, USB, USRP1) had
> dependencies on gcc >= 4.9. Since the whole uhd package raised the
> gcc dependency to gcc >= 7, those sub-options dependencies are now
> useless. This commit removes those.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  ...h-GCC-13-add-missing-cstdint-include.patch | 117 ------------------
>  package/uhd/Config.in                         |  22 +---
>  package/uhd/uhd.hash                          |   2 +-
>  package/uhd/uhd.mk                            |   2 +-
>  4 files changed, 5 insertions(+), 138 deletions(-)
>  delete mode 100644 package/uhd/0002-Fix-build-with-GCC-13-add-missing-cstdint-include.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
