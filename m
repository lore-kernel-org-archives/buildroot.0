Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F78CA0EDC
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 16:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FB6C411DA;
	Fri, 30 Aug 2024 16:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TZS5zjhAjAa; Fri, 30 Aug 2024 16:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A700411D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A700411D1;
	Fri, 30 Aug 2024 16:57:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 328991BF35F
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F02661463
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3_mB9v8NYn6 for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 16:57:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15C106145F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15C106145F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15C106145F
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 16:57:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02E6220003;
 Fri, 30 Aug 2024 16:57:45 +0000 (UTC)
Date: Fri, 30 Aug 2024 18:57:45 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Message-ID: <20240830185745.324994c3@windsurf>
In-Reply-To: <20240830101327.2000179-5-niklas.cassel@wdc.com>
References: <20240830101327.2000179-1-niklas.cassel@wdc.com>
 <20240830101327.2000179-5-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725037066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuzKbhFayAkKGunl0NTuVmWj0jH3yqeaG+MGytMldzk=;
 b=JgTtz8GweyjBSaebZSELw1NLtXbak56CqB+xVqI7/8/L6dJfB2kNW79QQqxuW1ubybAqtl
 vezSsENvBYUkxniFrx65lLRHA75p7DOOOuMf3Nl8kHgechPj/WC8G+wbR7cI133l2Eu1eL
 lYoQyA9o6oOib+f6rQhBi73xH2SzPfTW/drNxB7U+naWrs/AJPcrRD3rxj5BQiSJZcVJGR
 rhefqJLOkTJHOGleF6IpYzX80ez+Y5vf/16GvmIMN2ch4TxHE+5aPGKjApWbqZf5cEKoqR
 7Sh4q0YhtcOK834XPomt8NveXc9yBq8NBtFsoagP7VZWRtoqIDuQ9VQrV/tjAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JgTtz8Gw
Subject: Re: [Buildroot] [PATCH 4/4] configs/rock5b: add firmware for the
 RTL8125 NIC
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>, Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 30 Aug 2024 12:13:27 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> From: Niklas Cassel <cassel@kernel.org>
> 
> Add the proper firmware to avoid the following warning + error during
> boot:
> r8169 0004:41:00.0: Direct firmware load for rtl_nic/rtl8125b-2.fw failed with error -2
> r8169 0004:41:00.0: Unable to load firmware rtl_nic/rtl8125b-2.fw (-2)
> 
> Note that the NIC appears functional even without the proper firmware.
> However, add the firmware anyway, since the error messages are distracting
> and clutters dmesg.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  configs/rock5b_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

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
