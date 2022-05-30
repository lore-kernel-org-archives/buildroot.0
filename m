Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF56C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C4EF6121A;
	Mon, 30 May 2022 21:14:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3t5p5kkNube; Mon, 30 May 2022 21:14:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3241761210;
	Mon, 30 May 2022 21:14:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 72B8D1BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50C6240C88
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tCl-kzZshZWz for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:14:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 220C14011C
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:14:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CF8A6E0002;
 Mon, 30 May 2022 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653945279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mrWzrM8pu7h6mBwmRJjVJILqPfcAAtrk25LSW4UFFlI=;
 b=UnGg2pLo+Pg/GYkX4BAdhS2um/LeGRRD7SlxeqSfYMMzTiTeF7LsqW5EA8ayxYZ7jnRdfX
 lcGticHjoRQd/fXax1ApKFJ7gmRmW/wLMCIz3Nfe1/7zcYzLaWOAXaTo4vj1eipL6u/enn
 NiybC/egWMe7hZ+swmlRizo7E9SJOrQCNYVWMd6HnnY7umnAmRM+WQGi/UAUnTJBadNw3r
 clT76L/4O0CAaHzJifZlRzI6AL/+ggqHzzU3wEUdX+twtY5x+I0FLYV8qkeE8dLE1dJ7sG
 TbHxfrVp1V4dq7cHUSas9cVAUwqJrKK7SDAs3lVbQyXKWFqvDkCSGEYdre3ooA==
Date: Mon, 30 May 2022 23:14:37 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220530231437.7e01723e@windsurf>
In-Reply-To: <20220521152546.894405-1-fontaine.fabrice@gmail.com>
References: <20220521152546.894405-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/boinc: fix build with
 libexecinfo
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 21 May 2022 17:25:46 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised on uclibc and musl since the
> addition of libexecinfo package in commit
> eea8ba446c10701a273432552108d80fb2224ef4:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: ../lib/.libs/libboinc.a(libboinc_la-diagnostics.o): in function `boinc_catch_signal':
> diagnostics.cpp:(.text+0x8a): undefined reference to `backtrace'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4504379b464eb144a4c257001eb4d316bb1f5e44
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boinc/boinc.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

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
