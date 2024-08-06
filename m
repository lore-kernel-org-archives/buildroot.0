Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0575C49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 14:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C87060874;
	Tue,  6 Aug 2024 14:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EybeDmoVoCwE; Tue,  6 Aug 2024 14:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66B2060829
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66B2060829;
	Tue,  6 Aug 2024 14:48:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 372EE1BF2B0
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 14:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 249F340382
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 14:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_27cfZMFc-J for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 14:48:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DBC2440225
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBC2440225
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBC2440225
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 14:48:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73A8A240007;
 Tue,  6 Aug 2024 14:48:36 +0000 (UTC)
Date: Tue, 6 Aug 2024 16:48:35 +0200
To: Markus Mayer <markus.mayer@broadcom.com>
Message-ID: <20240806164835.4d88e702@windsurf>
In-Reply-To: <CAGt4E5v3F3zJyNZPGtWRpOxbO9eNV4+H6bd6tKXR7fwqBiMWmw@mail.gmail.com>
References: <CAGt4E5vg3nF-T3vbbhCmu6Qd+EXjH3fOB63KaB1LpSdb9nw0cA@mail.gmail.com>
 <20240805234808.36e94ee7@windsurf>
 <CAGt4E5tRANUDpph42+GCw42xZzuTm9+_J_j+ErVFnUz=EpSsbw@mail.gmail.com>
 <CAGt4E5v3F3zJyNZPGtWRpOxbO9eNV4+H6bd6tKXR7fwqBiMWmw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722955717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2vEab3Za1wHe9uVmnpcbeUchY2NVJqIksvDA14OAyKE=;
 b=j/OCZCXFdASxLdqn2zMqARZWCmtQQVbiViuwt6pYgKob3A0F8nKw5msagYXu6jNTAHM1oC
 vpz6LzgJpAjtKF27etsg3eeZoXcYsW83axvJyVCVgB4LyNUtszOTlUiyhpIOfSOTueSt++
 y5m9hbfeyDM36iH/ZI5VOSxJPN73WT3MRFShmdrh1QA5Oxo9sTwPlE0BggYZAYPxfW/Owh
 zIlUqicAelyYzMDLLti+EFp4TFTydyBY0hZ9ozKs0KfR+f9t4vxH2QTlh+3RNMtF9u3An5
 TwmLEeJb+kNyrPGQy9dCBIo/n+bNbAhDiizudaTBgofiF80am4SwfGZDisF/nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j/OCZCXF
Subject: Re: [Buildroot] BR2_FORCE_HOST_BUILD broken
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
Cc: Buildroot Mailing List <buildroot@busybox.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Markus Mayer via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 5 Aug 2024 20:08:51 -0700
Markus Mayer <markus.mayer@broadcom.com> wrote:

> Patch submitted. Turns out this one seems to be a bit simpler than the
> "tar" case. In my tests there was no need for a post patch hook. Just
> setting "HOST_XZ_AUTORECONF=NO" seems to suffice.

Indeed, the tar case is different. In the tar case, we apply patches
that touch configure.ac/Makefile.am, so we have to autoreconf. The
patches are also applied when building host-tar, so if we don't do
anything, configure.ac has a newer timestamp than configure, and
therefore even with HOST_TAR_AUTORECONF = NO, and automagic-autoreconf
gets triggered at build time.

In the case of xz, we don't patch anything, it's just that the provided
configure/Makefile are slightly broken for static builds, which is
completely irrelevant for host-xz, so indeed HOST_XZ_AUTORECONF = NO is
sufficient.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
