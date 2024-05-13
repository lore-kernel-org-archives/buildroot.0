Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE36C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0C0A606C4;
	Mon, 13 May 2024 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkOKvyedsw91; Mon, 13 May 2024 19:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C12EC6087B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C12EC6087B;
	Mon, 13 May 2024 19:59:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62B951BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FA6140C0F
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T01fhhS0VnRf for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2FD044018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD044018D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FD044018D
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:58:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D925E0004;
 Mon, 13 May 2024 19:58:56 +0000 (UTC)
Date: Mon, 13 May 2024 21:58:55 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20240513215855.35919b41@windsurf>
In-Reply-To: <20240513064039.2091596-2-neal.frager@amd.com>
References: <20240513064039.2091596-1-neal.frager@amd.com>
 <20240513064039.2091596-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715630336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=036oYZcMyfPgENKszI2maVeTqDTgUSAgXjcGqMd4c8k=;
 b=ObQoHZViudrqzO0pF5I0woEOYH7w+MpmSyRCoR3s3VFOL3USfNJNJxVACx9Wg22VRWAEd4
 c3aD1x16d+7uNjITzCuUiy77Nm5oNMJgoSxe8YejSDBqeEIsibWrGeXxaZNoJTHF26JHWW
 njcmM7WaemsfpQcHul2fADv6mBtHVsO6FmA5pIPqUDwRuBrn/0/lmVYIYMmqk3YuLkJUQU
 gTHCUhHFBvEETtx8hU08Jf5/Z0iggwKAPA4s2tYmC1Zb7RQijx6Mz2ZQ8TH5Pj/0qMyXmF
 allAKQC5c05kXp8SDTDJCR9V72KiTjhl2HhFwNde0eG7eqlTEC7I0M3TyIIyhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ObQoHZVi
Subject: Re: [Buildroot] [PATCH v1 2/2] package/gcc-bare-metal: bump to gcc
 14.1.0
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 May 2024 07:40:39 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> See here for changes:
> https://gcc.gnu.org/gcc-14/changes.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  package/gcc-bare-metal/13.2.0            | 1 -
>  package/gcc-bare-metal/14.1.0            | 1 +
>  package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  delete mode 120000 package/gcc-bare-metal/13.2.0
>  create mode 120000 package/gcc-bare-metal/14.1.0

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
