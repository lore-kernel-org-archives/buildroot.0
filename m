Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759EEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 13:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4DBF61315;
	Thu, 31 Mar 2022 13:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vaUItBV408DY; Thu, 31 Mar 2022 13:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDC5661307;
	Thu, 31 Mar 2022 13:22:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01FAA1BF28C
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 13:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E47FF83FA9
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 13:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7mLwPN5hQG7M for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 13:22:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A024983FA5
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 13:22:21 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 1480BD8C491E;
 Thu, 31 Mar 2022 15:22:19 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 31 Mar 2022 13:22:19 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
In-Reply-To: <20220330132749.1417115-1-br015@umbiko.net>
References: <20220330132749.1417115-1-br015@umbiko.net>
Message-ID: <31e6b41904b9d6c1bafeb294d0ca8ffe@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: disable expat explicitly
 unless target package exists
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
Cc: =?UTF-8?Q?J=C3=B6rg_Krause?= <joerg.krause@embedded.rocks>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


I marked this patch as obsolete. A variant of this failure has come up, 
and this approach is not feasible anymore.

Kind regards,
Andreas

On 2022-03-30 13:27, Andreas Ziegler wrote:
> Background:
> During configuration, mpd tries to determine the availability of 
> optional
> dependencies using (host) pkgconfig and CMake. If host and target 
> architecture
> are identical, it locates host-libexpat (CMake dependency) and tries to
> incorporate it into the build process. The link step fails
> subsequently, because
> some dependencies of host binaries come from the build machine, and are 
> not
> present on the target.
> 
> This results in the following build error:
> /home/data/buildroot.x86_64/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.2.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld:
> warning: libc.so.6, needed by
> /home/data/buildroot.x86_64/host/lib/libexpat.so.1.8.7, not found (try
> using -rpath or -rpath-link)
> /home/data/buildroot.x86_64/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.2.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld:
> /home/data/buildroot.x86_64/host/lib/libexpat.so.1.8.7: undefined
> reference to `__errno_location@GLIBC_2.2.5'
> 
> The link step fails, because libexpat was built against the build 
> machine's C
> library.
> 
> The optional expat dependency is disabled, unless the expat target 
> package is
> selected. This is in line with BR2_PACKAGE_MPD_UPNP_* handling logic, 
> which
> selects the target package and needs to enable the expat option. The 
> grey area
> of expat present on the target for other reasons, but not explicitly 
> needed for
> mpd, is accepted to avoid making the logic too complicated.
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
>  package/mpd/mpd.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 12da36098f..c1ad1bc6c6 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -21,6 +21,11 @@ MPD_CONF_OPTS = \
>  	-Dpipewire=disabled \
>  	-Dsnapcast=false
> 
> +# Disable expat explicitly, unless the target package is selected
> +ifneq ($(BR2_PACKAGE_EXPAT),y)
> +MPD_CONF_OPTS += -Dexpat=disabled
> +endif
> +
>  # Zeroconf support depends on libdns_sd from avahi.
>  ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
>  MPD_DEPENDENCIES += avahi
> --
> 2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
