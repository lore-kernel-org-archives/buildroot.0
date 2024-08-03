Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF34C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2910181289;
	Sat,  3 Aug 2024 20:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLdSWuumVtc6; Sat,  3 Aug 2024 20:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46CDB8128C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46CDB8128C;
	Sat,  3 Aug 2024 20:30:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE2311BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA61A4026F
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxwISFemb0Xq for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:30:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D142402B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D142402B1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D142402B1
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:30:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82D3B1C0002;
 Sat,  3 Aug 2024 20:30:01 +0000 (UTC)
Date: Sat, 3 Aug 2024 22:30:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240803223000.4e2a0430@windsurf>
In-Reply-To: <20240803104717.2574277-1-bernd@kuhls.net>
References: <20240803104717.2574277-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722717001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yk3W83NREhAaJYPpzFf02KI9g9RgMHXeM/fvv4rQhy8=;
 b=FZWoAdmqH23pVpdnyGJSUuIhjvPo8K/UIpPY+LAVRv3/zTQMR6fNYkD9+n/3Mh1NRlvhub
 fUGwtOqcgyy10Bn5Fo+Q/PQw08p0j8mKXHDGEE1Z/m0aIMZyNDMqI/Jd6zWeRnb9LrYafw
 BQ9P2VUwqBsMTZ7ZPwqByXyCzJ2mnJxAOvUBRhNU6C59SDrMghvzV2y6ViwSNdA/qEkw53
 zgfrsj2qVzAywkw3/QFAY7yZi/yvl36i97Cv+D6GyUDGYuznK+SG/QzyOf1y+0iGZhH31Z
 weXAZEVMpp6f2OCtkoAp+v4QzVz1lTWjgS1b55CEoIGo6QSstnpZRawWsAbEgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FZWoAdmq
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: bump version to 1.18.1
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

On Sat,  3 Aug 2024 12:47:17 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch which is included in this release:
> https://github.com/strukturag/libheif/commit/4944d7d47cc537681d6836e8c77db179f63af005
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...ns-encoder_jpeg.cc-fix-libjpeg-build.patch | 47 -------------------
>  package/libheif/libheif.hash                  |  2 +-
>  package/libheif/libheif.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 49 deletions(-)
>  delete mode 100644 package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch

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
