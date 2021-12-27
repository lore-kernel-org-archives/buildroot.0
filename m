Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748C6C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E0914014E;
	Mon, 27 Dec 2021 21:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13j04ViYIJl0; Mon, 27 Dec 2021 21:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E3594020B;
	Mon, 27 Dec 2021 21:24:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0B281BF35D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC3F460767
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ke9t1oyaUbpb for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:24:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF05A605AC
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:24:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 91FAB1BF203;
 Mon, 27 Dec 2021 21:24:36 +0000 (UTC)
Date: Mon, 27 Dec 2021 22:24:35 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211227222435.393248e5@windsurf>
In-Reply-To: <20211225214638.105114-1-giulio.benetti@benettiengineering.com>
References: <20211225214638.105114-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: fix host build failure
 due to C++11
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 25 Dec 2021 22:46:38 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Package harfbuzz fails to build for host with error:
> ```
> ../src/hb-map.hh:67:18: error: 'is_trivially_copyable' is not a member of 'std'
>    static_assert (std::is_trivially_copyable<K>::value, "");
> ```
> 
> Only starting from gcc version 5.0 we have 'is_trivially_copyable' member
> of std. So let's depend on BR2_HOST_GCC_AT_LEAST_5 for harfbuzz. Let's
> also depend on it in pango package which is the only one which needs
> host-harfbuzz.
> 
> Fixes:
> http://autobuild.buildroot.net/results/89e1194c1659d7e1af9db8ffe5feee770c448f76
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/harfbuzz/Config.in | 6 ++++--
>  package/pango/Config.in    | 4 +++-
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
> index 2e4219ee22..81acebce46 100644
> --- a/package/harfbuzz/Config.in
> +++ b/package/harfbuzz/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_HARFBUZZ
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	depends on BR2_HOST_GCC_AT_LEAST_5 # C++11

It is kind of hard to believe that it would require gcc 5.0 on the
host, but only gcc 4.9 for the target.

Could you clarify this?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
