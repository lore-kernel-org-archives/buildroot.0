Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9798C43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 10:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CC1840C35;
	Mon, 29 Jun 2026 10:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stHgIi3lU5VA; Mon, 29 Jun 2026 10:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 858CF40B8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782730464;
	bh=PFtfs68l57Brx2mYqZsJtj7ZjVquIBkmecBraduQl4k=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=arqQpskdYReypERDcohF5E8TSCAk2QRHv3Vpj+o9l/XpewZWkq3K6pu2TGQu0DHSb
	 ZeWtx+OVFr2pkGiNchPU6dXkTpU2GmRaUNzhqCB8cuPyvKdSkUD8ynuH7YX90qCjO+
	 QcaasK7ivMV7l8Wjs5PuyN3kLk8glO45Q/ovVaicuaP/Q7zNhS5fbZTRGNlPYjuHR8
	 OtqldJ0cqk+bSJZwKPjIxcDy0AZGc9VIesZr0lZ0aOgrw8yd964LWxn2GEWwhrP/cY
	 mAgaWkw1lPe3DUY24Q71Owdxv21xAoZJ3r1kIcw7zxSiDX2WaIrWxr5GGHcEOvpQSC
	 qkr1xYJC+H1Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 858CF40B8B;
	Mon, 29 Jun 2026 10:54:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C9C9264
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91A8A6079A
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6giwxe_3uW5 for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 10:54:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35F4560744
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35F4560744
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35F4560744
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:54:20 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1078637367; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 10:54:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1we9cz-00000001yjM-1lgq;
 Mon, 29 Jun 2026 12:54:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260627120452.803450-1-fiona.klute@gmx.de> (Fiona Klute's
 message of "Sat, 27 Jun 2026 14:04:52 +0200")
References: <20260627120452.803450-1-fiona.klute@gmx.de>
Date: Mon, 29 Jun 2026 12:54:13 +0200
Message-ID: <877bnhvcq2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Es7tDGK2/poZop7iRxGhc89m+TkbTE2C/oeRR/40SoEzdN8/MtZByUKceiliFRIgJZOadnhnkCekdv1+tDkcsTBsxO3ErgAqlc4nbIiIB9ShC5mSQylLJpVaflTnLg4BxsS6FRJ9PmcYNnNQD/McHUFG0v7jmr9SM6a/M3zHoVYyKUhvMITs81Z68zPfyVIb7n5ZHtvrpEn18iclEH75fJxcabYEivKD5AX2HW1NiRMMT5yxpUBBeLNvO4SN/xtnjrqORrvwqSab2lA4h2C1zYzZIn6bYdE7Ut6CsIvUUku2rPF+XB9pb5PDntgt/bcHmVYQrTuxdlxcP9lUm5RI1A==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=xXNTRKYMnASIZs7kbVwjkj6gaiqGPRTKV7Tor9LjbZk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Es7tDGK2
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: drop unused
 0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
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

>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:

 > In 11aa1cfa5af9a77a0a9f726bd38f1b7db659c0bf the patch was accidentally
 > moved into a versioned directory with the wrong version (2.82.0
 > instead of 2.82.4) and thus not applied. However, there have been no
 > issues reported.

 > The patch description mentions being needed to fix build errors in
 > package/atk and package/libnice. It was originally added in
 > b094f88a4d501101bfba9b65491209e6a0fe0397, and amended for libnice in
 > 2c916b400bc608512db790d97df010ca666b6dd2. package/atk was removed in
 > 2c3ca7bea1de76163aeef432412eb14551ed0581, because atk has been merged
 > into at-spi2-core. Both at-spi2-core and libnice are Meson packages,
 > as was atk at the time of its removal.

 > Both current packages build with the following configuration (tested
 > using utils/test-pkg):

 > BR2_PACKAGE_PYTHON3=y
 > BR2_PACKAGE_GOBJECT_INTROSPECTION=y
 > BR2_PACKAGE_LIBNICE=y
 > BR2_PACKAGE_AT_SPI2_CORE=y

 > Evidently the patch is no longer needed, presumably because the
 > correct search path for GIR files is set by other means, and we can
 > remove it instead of fixing the version number of the patch directory.

 > Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
 > ---
 > I admit it is a bit unsatisfying that it's unclear exactly *what*
 > fixed that search path. Another bit of evidence I have is that when
 > working on that libglib2 2.82.x and gobject-introspection 1.82.0
 > version bump it was primarily for package/python-gobject, which also
 > uses Meson, so it probably was either that bump or a Meson bump at
 > some point before.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
