Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A22BC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 532F381C40;
	Sun, 15 Sep 2024 08:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXShqLev_Ufc; Sun, 15 Sep 2024 08:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51B3481CDB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51B3481CDB;
	Sun, 15 Sep 2024 08:09:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1F21BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1697260701
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjIJ59NBgIew for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:09:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18C1F606FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18C1F606FD
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18C1F606FD
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:09:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89D8EE0003;
 Sun, 15 Sep 2024 08:09:35 +0000 (UTC)
Date: Sun, 15 Sep 2024 10:09:34 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240915100934.7322f202@windsurf>
In-Reply-To: <20240914222820.1351112-1-james.hilliard1@gmail.com>
References: <20240914222820.1351112-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726387776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VN50e3D3+C02sIX95fFUj+NUu9znCozOvSDp1K2W5g=;
 b=PcKLoN2tcxCWGepOVjFJR30Sf2ORFj2Lrr9gj6g7Wy2Zu9cIAdtU2Ipclhc5Q1SdtMoHPC
 +P2YZEsscO0Bd1tK1VkXR1ET1G8Sh2mKbd59HXJG9w0sd+pQ/ehBj9/V3QGdPlmuuy7fSm
 egR0z4AdTIlVFarFfNt128EJOoAhZQoLDyQqg4nJgk56aYQmj97Etw3blQZpQQAxggsKC0
 /pZ0/klRqA1u7fsk6IXa2PcGFd91L0IKW5p+3688crH7kkP+Qfj+EIzG75eK+V6ebfVfRV
 2N3xLD9g3ueD+AYNLFEdP4Z3Uv51LzO5cYk3D/PYY3+lA8V9Yd5lyYs1/FXtdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PcKLoN2t
Subject: Re: [Buildroot] [PATCH 1/1] package/python-blinker: bump to version
 1.8.2
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
Cc: Peter Seiderer <ps.report@gmx.net>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 16:28:20 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate build backend from setuptools to flit.

I've added here a small note that the license file was renamed but not
changed. Pretty obvious, but better said than silenced.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
