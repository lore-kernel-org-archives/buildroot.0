Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3316CC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 09:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF12A81990;
	Sat,  3 Aug 2024 09:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U68OzKwB_Erg; Sat,  3 Aug 2024 09:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 033CA81ABA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033CA81ABA;
	Sat,  3 Aug 2024 09:52:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43CE31BF378
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 09:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31D5D605FF
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 09:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VS0rA8VHW7pO for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 09:52:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12EA2605AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12EA2605AD
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12EA2605AD
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 09:52:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1651960003;
 Sat,  3 Aug 2024 09:52:11 +0000 (UTC)
Date: Sat, 3 Aug 2024 11:52:10 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240803115210.55905c7e@windsurf>
In-Reply-To: <Zq3NCVPhjeIDwGnW@waldemar-brodkorb.de>
References: <Zq3NCVPhjeIDwGnW@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722678732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMZbqrYp7l/73C6VpUtGrG0YUD7m/ifoORQ4SIUrBXw=;
 b=LIoabiicp6kR2kr5ZWfSDWLLrCiOmxE5OroLXZTCAx5CBQCv/uy26ONjQxn1BZR+ztAqKw
 Llxcsw1g4UtGGZ0NtzQ5DWeYf2tScGL5x/UMVhF+4RjGzDcJ6KELHEPi2Wqn1zWd/hPZzQ
 Pt4nrbfsh+zlj6uLedOUFdWoZASA/CraiC1pH4pXSsMIZ69aSc4ZtCwgRzalNeugKTq7Eg
 r1HvMW4agtGLmIVaRCqKOwlU+CHPfFFm6E18+136cY6ei9rDKT2LzEZfc0H2BWJZO2B4zU
 yRMVxDBV9o15GP1EAQVDixEI7CWz0MLRnKJRj2BQYQhtuM11YQnSponvL7Tepw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LIoabiic
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix missing m_tim issue
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

Hello Waldemar,

On Sat, 3 Aug 2024 08:24:09 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Patch from upstream to fix missing m_tim issue.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...are-st_mtim-if-defined-__USE_XOPEN2K.patch | 205 ++++++++++++++++++
>  1 file changed, 205 insertions(+)
>  create mode 100644 package/uclibc/0003-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch

I believe this potentially fixes some autobuilder build issues. Do you
have some references to those build failures, perhaps?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
