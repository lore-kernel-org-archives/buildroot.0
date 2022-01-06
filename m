Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDD5C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C89140151;
	Thu,  6 Jan 2022 21:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtLT8SPj8PEE; Thu,  6 Jan 2022 21:08:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A230040140;
	Thu,  6 Jan 2022 21:08:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67D581BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 642E060E0B
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbizUY8xHtj6 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:08:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 560CE60E07
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:08:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id F3534E0005;
 Thu,  6 Jan 2022 21:08:25 +0000 (UTC)
Date: Thu, 6 Jan 2022 22:08:24 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220106220824.31306aa6@windsurf>
In-Reply-To: <20211010234655.585526-4-christian@paral.in>
References: <20211010234655.585526-1-christian@paral.in>
 <20211010234655.585526-4-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH-NEXT v3 4/6]
 support/download/go-post-process: implement Go vendoring support
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
Cc: Anisse Astier <anisse@astier.eu>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 10 Oct 2021 16:46:53 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> +# Do the Go vendoring
> +pushd ${base_name} > /dev/null
> +# modcacherw option leaves directories in the module cache at their default
> +# permissions rather than making them read-only.
> +if [ ! -f go.mod ] && [ -n "${gomod_init}" ]; then
> +    go mod init -modcacherw ${gomod_init}

So here you're using "go mod init" to create the go.mod file, but in
package/pkg-golang.mk, we're manually creating it.

So for the sake of consistency, I tried using "go mod init" in
package/pkg-golang.mk as well, but running that on balena-engine caused
go mod init to start downloading stuff... which is wrong because
balena-engine already comes with its vendored dependencies.

So in the end, I ended up creating the go.mod manually (with the same
logic) in both pkg-golang.mk and in this download post-process script.
But if we find why "go mod init" didn't work in the context of
pkg-golang.mk, we could switch back to using that.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
