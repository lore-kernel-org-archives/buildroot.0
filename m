Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A076C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D97A605D5;
	Wed, 14 Aug 2024 21:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Jb5a9gOwRDF; Wed, 14 Aug 2024 21:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45782608EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45782608EF;
	Wed, 14 Aug 2024 21:42:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1C2D1BF4DB
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EE914029B
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5DWG4X2h2eb for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:42:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5320B40203
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5320B40203
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5320B40203
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:42:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB0CEE0002;
 Wed, 14 Aug 2024 21:42:34 +0000 (UTC)
Date: Wed, 14 Aug 2024 23:42:33 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240814234233.3eb8f179@windsurf>
In-Reply-To: <Zrtc85Eh/rXEpune@waldemar-brodkorb.de>
References: <Zrtc85Eh/rXEpune@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723671755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lxsQo3EMfxCs++gO88hPjL+OG1+VsDgTHOOFB1bzkk=;
 b=JoNp+rDrGXpI54gNoXzB1qrdNtNtS8dZSDfQUcFOKlMWYX073TQNRveX32ocUZIOWzx8tU
 /y+tOA3NQ/3ZYQO1+SEoP/nbF9oJw4tDJKv3VR2sp7N7sLvG7Ykm3iewwMDISGygn1djw6
 OOnSs/+61AaahLZ72D7w2CiuhCUIRoYYLM0AhmTvugJTpXVzQ9HJdDwoNqA4crR0Encq0G
 W9kXwXFuPxERJnvjLp/JhPV4SgIe0DGN7J1GqZjmbu0ZaTWsP+5o1F5G+TlkvED4Wsvzpn
 VPWrsCw+caTT2s3MjxK7jB9gGnbmpo2v+NtQa5qnMsuQ3dxm9d8nN3ZsTWWZvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JoNp+rDr
Subject: Re: [Buildroot] [PATCH] package/dc3dd: fix compile issues
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

Waldemar,

On Tue, 13 Aug 2024 15:17:39 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Add a patch from Debian to fix the autobuild issues.
> Furthermore something like ea2f52494c32c53a3def6dc3b0c5b9d5d7c7edf4
> from cvs package is required as well.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/6a0/6a0c5dc057eb348afcd5e3859cb37059d6bd91c1
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...e.y-compile-on-QNX-and-NetBSD-5-i386.patch | 104 ++++++++++++++++++
>  package/dc3dd/dc3dd.mk                        |   2 +
>  2 files changed, 106 insertions(+)
>  create mode 100644 package/dc3dd/0004-Make-getdate.y-compile-on-QNX-and-NetBSD-5-i386.patch

Thanks for the investigation, I've applied to master. But here as well,
I would have _really_ preferred a deeper explanation: what was causing
the build issue (which configurations?), and since when the issue
existed? Could you try to add this kind of information for the next
build fixes?

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
