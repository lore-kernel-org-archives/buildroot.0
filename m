Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1367E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 10:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5548B81344;
	Tue, 31 Dec 2024 10:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2iD22nRoJyD; Tue, 31 Dec 2024 10:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 527C481346
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 527C481346;
	Tue, 31 Dec 2024 10:54:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C00FEC8
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 10:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 926E040DD1
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 10:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaIVXSvkVTGS for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 10:54:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28D9940CBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28D9940CBE
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28D9940CBE
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 10:54:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFA91FF808;
 Tue, 31 Dec 2024 10:54:49 +0000 (UTC)
Date: Tue, 31 Dec 2024 11:54:47 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Bis <marcin@bis.org.pl>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
Message-ID: <20241231115447.32f36592@windsurf>
In-Reply-To: <20241210162243.1541113-1-fiona.klute@gmx.de>
References: <20241210162243.1541113-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735642491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ng6Ib6RX4rJUK8BceUTGV5/xwfM52Em5PcmYhOZmOA8=;
 b=IFXCf5XQJpert+WB/jXP3kDsqEyxeFcVUMgS9SJIJsL/wuChGAckaXsKgk95seC+kC/hQB
 RyYUquWoeUhJrLSt+WGP3ZntHo//iWCRuF4xb3XiO/6PGEDau0TTVCKTg35/oZvanv6tBd
 wgUsZZYMf3RsgorM8IqqtE9ozOSYlT3YmhwYkqF9NYHyMmf6TWAgGlWHUTxZWzmdpc5Q++
 QvYr+z3eq7MfBnaxUFLJNZB7ljuN8nexP4bhij7MWqLeh5FjlPVEqH1Y+3eawniZ/jEO7F
 Qn4rj2UmmNpySl9rgCnM5Jmqeuoat/aenSN/vKMONcUIGuT064QY8di1Twbnmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IFXCf5XQ
Subject: Re: [Buildroot] [PATCH v2 1/4] package/bluez5_utils{,
 -headers}: bump version to 5.79
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Tue, 10 Dec 2024 17:22:39 +0100
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Upstream changelog:
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?h=5.79&id=0845b8f6ef2ac004b1c953cf4fe4ca3458cd8e36
> 
> Patch for musl compatibility taken from upstream "master".
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  .../bluez5_utils-headers.mk                   |  2 +-
>  ...0001-gdbus-define-MAX_INPUT-for-musl.patch | 33 +++++++++++++++++++
>  package/bluez5_utils/bluez5_utils.hash        |  2 +-
>  package/bluez5_utils/bluez5_utils.mk          |  2 +-
>  4 files changed, 36 insertions(+), 3 deletions(-)
>  create mode 100644 package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch

It looks like this update is causing a few build failures:

  http://autobuild.buildroot.net/?reason=bluez5_utils-5.79

Like this:

/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/mips-buildroot-linux-musl/13.3.0/../../../../mips-buildroot-linux-musl/bin/ld: profiles/input/bluetoothd-hog.o: in function `hog_disconnect':
/home/autobuild/autobuild/instance-7/output-1/build/bluez5_utils-5.79/profiles/input/hog.c:211:(.text.hog_disconnect+0x3c): undefined reference to `input_get_userspace_hid'
/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/mips-buildroot-linux-musl/13.3.0/../../../../mips-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-7/output-1/build/bluez5_utils-5.79/profiles/input/hog.c:211:(.text.hog_disconnect+0x44): undefined reference to `input_get_userspace_hid'
collect2: error: ld returned 1 exit status

Could you have a look perhaps?

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
