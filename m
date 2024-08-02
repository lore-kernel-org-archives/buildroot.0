Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EE1C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 18:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B80B284605;
	Fri,  2 Aug 2024 18:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-lgBprh6a2y; Fri,  2 Aug 2024 18:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E986A84608
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E986A84608;
	Fri,  2 Aug 2024 18:03:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3781BF41C
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 18:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 088D3608BF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 18:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCbs1SyWl7IC for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 18:02:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E57D560709
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E57D560709
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E57D560709
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 18:02:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33C75240002;
 Fri,  2 Aug 2024 18:02:56 +0000 (UTC)
Date: Fri, 2 Aug 2024 20:02:55 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240802200255.2b57129d@windsurf>
In-Reply-To: <20240723133004.652232-1-fontaine.fabrice@gmail.com>
References: <20240723133004.652232-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722621776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zt9XF9ARRoOkQPCwfu3/4uTdldyOLTAanGZr+QBDP7E=;
 b=ND2wHZfWIImbhUTgeV1HGTYlyKvhFgOa72r9mDoHF2qGfkq0phBf5CUMP0604OI2VlDWQn
 SLiUsmK1tOXFLBGdnI19zoxUkstOFhqQ/iHXFiNZwp3/VB1gX3ukzBGVZarlyPo6M9UkfQ
 i2sFOK1Bu5hOkdBu9S+7T6lPIYPTNPre4ambvkn4Yh+k4wNgl9+7mx4X6fBqrlRmTnjITx
 BtSGIAdNc4BKUK5DdhFC+uwIdOXT1xDBArA9rLM1a0urlZOUmIJBickII2cD1+SYltsJrb
 ZR3EEoiJ4huR1hqo78T2fEvpa/r31A4hJJZHz8rlMel8z3uGnoPsUHnLTNRPbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ND2wHZfW
Subject: Re: [Buildroot] [PATCH 1/1] package/rtty: bump to version 8.1.2
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 15:30:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - This bump will fix the following build failure with musl >= 1.2.5
>   thanks to
>   https://github.com/zhaojh329/rtty/commit/eb6394c3d83a21a8825e47b40659cfe0ead33b6f:
> 
>   /home/autobuild/autobuild/instance-22/output-1/build/rtty-8.1.0/src/file.c: In function 'start_upload_file':
>   /home/autobuild/autobuild/instance-22/output-1/build/rtty-8.1.0/src/file.c:156:24: error: implicit declaration of function 'basename' [-Werror=implicit-function-declaration]
>     156 |     const char *name = basename(path);
>         |                        ^~~~~~~~
> 
> https://github.com/zhaojh329/rtty/releases/tag/v8.1.2
> https://github.com/zhaojh329/rtty/releases/tag/v8.1.1
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/382405b421a8ea7b5b3beb553f47fa20427fa3c3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...keLists.txt-prefer-pkg_check_modules.patch | 40 -------------------
>  package/rtty/rtty.hash                        |  2 +-
>  package/rtty/rtty.mk                          |  2 +-
>  4 files changed, 2 insertions(+), 43 deletions(-)
>  delete mode 100644 package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch

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
