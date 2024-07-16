Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EC7C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C73B6401F3;
	Tue, 16 Jul 2024 12:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQ4Evn8KYMw0; Tue, 16 Jul 2024 12:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8280840B02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8280840B02;
	Tue, 16 Jul 2024 12:18:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4561BF38A
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79EAA813E9
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fY8N1TTNFqsR for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26884813D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26884813D8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26884813D8
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:17:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E20A420009;
 Tue, 16 Jul 2024 12:17:56 +0000 (UTC)
Date: Tue, 16 Jul 2024 14:17:55 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240716141755.1bf5473b@windsurf>
In-Reply-To: <20240611152202.951202-4-james.hilliard1@gmail.com>
References: <20240611152202.951202-1-james.hilliard1@gmail.com>
 <20240611152202.951202-4-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721132277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=csRFVDQPxd3ZpCUUiTMbGqpQ9DE72/gBGvNS+W35qCY=;
 b=ZqI6eEQ3uNudIbSoyd0fqKJhz6L2HNHmTEB4zPFMPtORagURIJRYfYpRjayOst0hSPRzsI
 URDx+2wsAAKGfG4L8nTXCaHHp7tm8RY/Zec2i5cdF1x3HL0z/uMQHPFEH+pRxO12Qdj5dX
 CP1Gs7oO2DR5euYisYB64JyZ1mzNkHs4vpqmeoW4ao8jhXrrYJEsdyPw1maxkgnW4Mc+Yv
 CGiiyWmoMvAq2kRe9fBpB1dnNnYQnhj+0K+WKBWj/oU53hOa5fgA172xBGNnf7+YuroMVX
 2BHAWFtbPsbmlPRDUJEcFAVGHOX0ol1qdtw5r+vrxmpYoEcaDTKZJmJygcEndA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZqI6eEQ3
Subject: Re: [Buildroot] [PATCH v2 4/4] package/fwupd: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jun 2024 09:22:02 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in        |   1 +
>  package/fwupd/Config.in  |  19 ++++
>  package/fwupd/fwupd.hash |   3 +
>  package/fwupd/fwupd.mk   | 208 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 231 insertions(+)
>  create mode 100644 package/fwupd/Config.in
>  create mode 100644 package/fwupd/fwupd.hash
>  create mode 100644 package/fwupd/fwupd.mk

Entry in the DEVELOPERS is missing (I had added it locally, but
encountered other issues).

Then, udev dependency is missing:

output/build/fwupd-1.9.20/meson.build:278:11: ERROR: Dependency "udev" not found, tried pkgconfig and cmake

so I added it. But then:

output/build/fwupd-1.9.20/meson.build:327:32: ERROR: Feature offline cannot be enabled: -Doffline=enabled requires systemd

so I moved -Doffline=enabled into the systemd condition.

But then:

output/build/fwupd-1.9.20/meson.build:594:9: ERROR: Command `/home/thomas/projets/buildroot/output/host/bin/python3 -c 'import jinja2; print(jinja2.__version__)'` failed with status 1.

Which probably you had not seen because you had jinja2 installed on
your system. Could you make sure to test build packages with
./utils/docker-run to catch such "spurious" host dependencies?

I quickly grepped for jinja2 in the tree, but it wasn't immediately
clear if it was absolutely mandatory, exactly for what, etc. Hopefully
you'll be able to figure out. It would be nice to not make it a
mandatory dependency to build fwupd, if possible of course.

Could you have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
