Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59C2C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72B8E8149E;
	Thu,  9 May 2024 15:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCNyKkqkyFaX; Thu,  9 May 2024 15:43:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8717983DDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8717983DDF;
	Thu,  9 May 2024 15:43:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2641BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88982600B6
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GT9vLGm0Iv2g for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:43:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7411460F4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7411460F4D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7411460F4D
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:43:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8464F60005;
 Thu,  9 May 2024 15:43:18 +0000 (UTC)
Date: Thu, 9 May 2024 17:43:17 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240509174317.4f48d5ce@windsurf>
In-Reply-To: <20240411213940.91282-1-ju.o@free.fr>
References: <20240411213940.91282-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715269398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Sazw+YdoBivwn/qD/o9MHWoTBUP9HUUivud832rRow=;
 b=gRaWws0S5JWcI4o3riKBYKbnGeC5VHqJc+qtUvO5eVQnaLrkAfEPNpPbqlNJcbd/eFubqq
 ap2V0ZUagPKGef5GZMjj9tZivwwFAC3yUMZCk27Gpa3qCvHRTUx1LjfBjrlMZhd/SZ61kz
 rXY5BnI3wt7YPYF34noBH8xT98a5orTXKxdX0hZtBy78MXt36Ft4DHM+JH6xc1Z1NpuF4l
 Py2SnaWW8CKuX8A7I8hIfaW04NFDHQqiyVU6bfnxYB8cm2Fu5THVLjtxMXrt7uEzvRab9g
 TS5lYg5poVnKZj1B/ynkeNiHREUplaHydLQiXu/TmTYsEvVJBSNDnAxtBiS2gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gRaWws0S
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add links runtime test
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

On Thu, 11 Apr 2024 23:39:40 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  2 ++
>  support/testing/tests/package/test_links.py   | 33 +++++++++++++++++++
>  .../test_links/rootfs-overlay/root/file.html  |  9 +++++
>  3 files changed, 44 insertions(+)
>  create mode 100644 support/testing/tests/package/test_links.py
>  create mode 100644 support/testing/tests/package/test_links/rootfs-overlay/root/file.html

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
