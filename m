Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A5EC4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 22:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2336A4076E;
	Mon, 12 Feb 2024 22:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6MnmohSEKuN; Mon, 12 Feb 2024 22:07:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F5BF4079A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F5BF4079A;
	Mon, 12 Feb 2024 22:07:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7D9A1BF34E
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D57E060A49
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Re3MsO5IN9DX for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 22:07:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB88E60A46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB88E60A46
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB88E60A46
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 22:07:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0371240005;
 Mon, 12 Feb 2024 22:07:21 +0000 (UTC)
Date: Mon, 12 Feb 2024 23:07:21 +0100
To: Sebastian Bauer <mail@sebastianbauer.info>
Message-ID: <20240212230721.4f97dae3@windsurf>
In-Reply-To: <20231227182429.1215185-3-mail@sebastianbauer.info>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
 <20231227182429.1215185-3-mail@sebastianbauer.info>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707775642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XMeZPrfJW0+IOBlYDdJJYnMu4gfYiNks+5hqxIuSNlM=;
 b=HJu6rcNurOxqdgyvZa6uRy5C2To8WL23c0v8TrX5JjiCYXdXXbcfijuIvr7g5mRKHcuQ4/
 1bmjnycFv+v2XeQ85QostXXIqOM+o1hY2fESgTqgiVU6VJ51KPL66OaaHO0ZLQ56vUZ3EH
 T90vXB5sQb+x6yXQOzjormDXSvG+r+ruXQ5uyBZ2XrsoDkTsj7vbofTGjZTYE2W69gxt3v
 I6jJYRjFvBpmu0WD5Gd/VbvMUF7XoTnt5a+FfCv1fHAKjHR8P1YgwnhNtYWMhUtXP6bG4c
 gL7PSJzhCv0uQMtalTLqI8ZEp31o5c1/uRLxEp42DKAauq3rYdUMYCloxEuJiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HJu6rcNu
Subject: Re: [Buildroot] [PATCH 3/3] packages/libcamera-apps: Fix build to
 use meson
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sebastian,

On Wed, 27 Dec 2023 19:24:29 +0100
Sebastian Bauer <mail@sebastianbauer.info> wrote:

> Upstream uses meson instead of cmake since a while.
> 
> Signed-off-by: Sebastian Bauer <mail@sebastianbauer.info>

Thanks for your patch, and sorry for the slow feedback. Could you
clarify why this you say "Fix build" in your commit title? Is there
some build failure, or is this an improvement patch?

> -ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -LIBCAMERA_APPS_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
> -endif

You're removing this chunk, but it was important. Do you have some
evidence that it is no longer needed?

It was added in f41d47f15b63a4bbe026834478e63acba85d33fe, as otherwise
libcamera-apps would fail to build on the SPARC CPU architecture. See
the commit log for a reference to an autobuilder failure.

Thanks in advance for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
