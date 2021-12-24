Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F150AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Dec 2021 17:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A26CF60B5F;
	Fri, 24 Dec 2021 17:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kwh5AOxrboEj; Fri, 24 Dec 2021 17:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0494B60B5D;
	Fri, 24 Dec 2021 17:22:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4D81BF2A4
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 17:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEC8C81404
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 17:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JyHcr5d_g-K5 for <buildroot@lists.busybox.net>;
 Fri, 24 Dec 2021 17:22:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D20DC813F8
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 17:22:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 231651C0005;
 Fri, 24 Dec 2021 17:22:28 +0000 (UTC)
Date: Fri, 24 Dec 2021 18:22:28 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20211224182228.70f47125@windsurf>
In-Reply-To: <20211224162152.1035557-1-br015@umbiko.net>
References: <20211224162152.1035557-1-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/zziplib: fix static build
 failure with mpd
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Fri, 24 Dec 2021 17:21:52 +0100
Andreas Ziegler <br015@umbiko.net> wrote:

> The latest released version of zziplib copies static libraries with appended 
> major version, but omits creating the necessary links to the base file names. 
> This prevents the linker to find the libraries via the search path. 
> 
> There is a discussion upstream: https://github.com/gdraheim/zziplib/issues/117
> 
> Update zzip/CMakeLists.txt to the current master, version a32538e to enable 
> creation of symlinks. 
> 
> This resolves the following autobuild issue:
> 
> http://autobuild.buildroot.net/results/ba711034c0abe980f677e26de41739223e2f66e9
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
>  ...01-update-zzip-cmakelists-to-a32538e.patch | 220 ++++++++++++++++++
>  1 file changed, 220 insertions(+)
>  create mode 100644 package/zziplib/0001-update-zzip-cmakelists-to-a32538e.patch
> 
> diff --git a/package/zziplib/0001-update-zzip-cmakelists-to-a32538e.patch b/package/zziplib/0001-update-zzip-cmakelists-to-a32538e.patch
> new file mode 100644
> index 0000000000..1ed9243f69
> --- /dev/null
> +++ b/package/zziplib/0001-update-zzip-cmakelists-to-a32538e.patch
> @@ -0,0 +1,220 @@
> +--- zziplib-0.13.72/zzip/CMakeLists.txt
> ++++ zziplib-a32538e/zzip/CMakeLists.txt

Thanks a lot for looking into this build issue!

However, we want patches to have a proper description and
Signed-off-by. But it's not really nice to just have a large patch that
updates file XYZ to version ABC. What about backporting the few
specific patches that are needed?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
