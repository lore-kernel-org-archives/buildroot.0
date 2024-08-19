Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC91C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 11:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08F0280E0A;
	Mon, 19 Aug 2024 11:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiYkeBwSx3Qz; Mon, 19 Aug 2024 11:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CDE980E1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CDE980E1C;
	Mon, 19 Aug 2024 11:09:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 311371BF3DF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D6F580E1C
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gNnwLzzL6rW for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 11:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2EE980E0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2EE980E0A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2EE980E0A
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 11:09:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B293240006;
 Mon, 19 Aug 2024 11:09:07 +0000 (UTC)
Date: Mon, 19 Aug 2024 13:09:07 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240819130907.01f7e7f7@windsurf>
In-Reply-To: <20240818162123.1012529-1-ju.o@free.fr>
References: <20240818162123.1012529-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724065748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fbn3NScBupxAcISo0UAYwBQ4YQ+DkENLhclhF1GtDtk=;
 b=LNbp+sJfcoQLh7R36/tYNrNDFBVVS7MM7onCh+7hpICAJ+xT0HkV0FaPyw91+JNw2bb3GZ
 KiSjVSiNsNQD9urNEYEih73XIr+4iXfvi3W8ybbWPKOydO8T1fTlubHPWhswxf3ftukFQG
 RANmFJ5s5/4xMns3d9ir4pm6j6vIGMSgNz6nDWkf0kPKAn7qQoNy3G0jYVqUYXi9mtjRD6
 /VF1XUhKKnHVwwVSJ4vbOapwSIy8VT2Z1zRwcZNlYzP6wOyDf6ud4L26ZuEJLncygeo9wT
 CvxsVgIm7w8w4OyCo6/D8LX5oy3IfH2bGsOquzvux2oDnBxtxUOGupqpj2Gubg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LNbp+sJf
Subject: Re: [Buildroot] [PATCH next 1/1] package/erofs-utils: bump to
 version 1.8.1
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
Cc: Gao Xiang <hsiangkao@aol.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 18 Aug 2024 18:21:23 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For a change log since 1.7.1, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/ChangeLog?h=v1.8.1
> 
> Version 1.8 introduced a preliminary Zstd support, so this commit adds
> this new optional dependency for target, and disable this option for the
> host variant.
> 
> Version 1.8 also introduced a use of atomic operations, in commit [1].
> This commit adds linking with libatomic when appropriate.

It would be good to provide a patch upstream that handles this in
configure.ac (there are several examples in Buildroot of how this can
be done).

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=0d6f9835ce27ead0f23848408366d9ca7f2b0d15
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
