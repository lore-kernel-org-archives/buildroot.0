Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65948C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 10:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0082F6FBE3;
	Thu,  6 Jan 2022 10:33:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7x48n3xwnu8S; Thu,  6 Jan 2022 10:33:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D0956FBDD;
	Thu,  6 Jan 2022 10:33:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52AD51BF47D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41153415F8
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RnkAVzaDzKV8 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 10:33:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08EB4410E8
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 10:33:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BB0F860013;
 Thu,  6 Jan 2022 10:32:59 +0000 (UTC)
Date: Thu, 6 Jan 2022 11:32:58 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220106113258.36ce7f11@windsurf>
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

Hello Christian,

On Sun, 10 Oct 2021 16:46:53 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> This commit introduces the download post-process script
> support/download/go-post-process, and hooks it into the Go package
> infrastructure.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> v1 -> v2:
> 
>  - re-submitting Thomas's series with adjustments:
>  - run "go mod init" just before "go mod vendor"
>  - this fixes the case when go.mod does not exist
>  - use -modcacherw to fix "make clean" permissions errors
>  - use the mk_tar_gz helper in the post-process step
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

I am a bit confused by the changes you introduced here. You're
labelling this patch series v3, so I assume it comes after my v2:

  https://patchwork.ozlabs.org/project/buildroot/patch/20201219153525.1361175-6-thomas.petazzoni@bootlin.com/

I'm particularly confused by the addition of the -g option to pass the
argument of "go mod init" as opposed to using the BR_GOMOD environment
variable.

In the patch I linked above, you reported that it was causing some hash
issues, but I don't understand which of your changes fixed that
problem. Could you clarify?

Also, my patch dropped the creation of go.mod from
package/pkg-golang.mk (macro $(2)_GEN_GOMOD), but I'm not sure why your
patch doesn't drop that.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
