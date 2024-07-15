Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63316C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6E1C4074E;
	Mon, 15 Jul 2024 14:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3qQP0S4YJPc; Mon, 15 Jul 2024 14:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D36C408A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D36C408A8;
	Mon, 15 Jul 2024 14:08:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D68E1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8799980C89
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgrTETUbXQ59 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:08:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D35B80BC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D35B80BC7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D35B80BC7
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:08:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DD0A240010;
 Mon, 15 Jul 2024 14:08:11 +0000 (UTC)
Date: Mon, 15 Jul 2024 16:08:09 +0200
To: Fred Lefranc <fred.lefranc.evs@gmail.com>
Message-ID: <20240715160809.351cdc89@windsurf>
In-Reply-To: <20240715111003.1296141-1-fred.lefranc+evs@gmail.com>
References: <20240715101607.1288233-1-fred.lefranc+evs@gmail.com>
 <20240715111003.1296141-1-fred.lefranc+evs@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721052491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fspHeb8EQ++C9pHJ6hq9FZ1Ig5mzF0xlrrlPfbspzIw=;
 b=IPaKD3WjFqiuOb0A0Fm/Z+dhKEipHQySxyRIoJAKFlt47z0pC9jUD3WsVLgedcwJ+fMwc5
 +OMPVYjpYX2+6j1N23a36pw7ZraQLexBgydk1C055GDIH9KByyZKhK15x+5y2fY1I/H4oR
 vFOOM+6DcVfqRC9YIQOcw1Cl9T7IuQQAh3ZLtbx2IIIuIPHOMJH5tSsJGcI/48Sjz1KuFN
 /Et/46y1f/hD3EhjYi816PffSGP0rLK8CCYEWyXehb5MepFz1eAIUdOQ1zdF1xkuQoxIv9
 VCm7vnf7HnnhQ+OagYB3OOkbr4dzat5qeItHD+YfNiCDDyBDMOqd6CotuIt47A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IPaKD3Wj
Subject: Re: [Buildroot] [PATCH v2] package/busybox: fix build with glibc
 2.39
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
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fred,

On Mon, 15 Jul 2024 13:10:02 +0200
Fred Lefranc <fred.lefranc.evs@gmail.com> wrote:

> When glibc was bumped to version 2.39 in commit
> b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
> libcrypt support.
> 
> As glibc's libcrypt was providing systemd's libcrypt dependency this
> broke any systemd build using glibc version 2.39.
> 
> To fix this add the libxcrypt dependency to busybox which is the
> preferred way of providing libcrypt support in busybox as the glibc
> variant is only used as a fallback due to being deprecated.

I'm sorry but I don't follow you on this last paragraph, in particular
the part "as the glibc variant is only used as a fallback due to being
deprecated".

What happens is that recent glibc versions no longer provide libcrypt,
so libxcrypt should be used as a replacement. And it's up to the user
to enable BR2_PACKAGE_LIBXCRYPT if the user enables an applet in the
Busybox configuration that needs lib(x)crypt features.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
