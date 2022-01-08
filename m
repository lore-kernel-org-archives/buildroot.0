Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C9FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60C558175B;
	Sat,  8 Jan 2022 13:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2HXredhRCQ1V; Sat,  8 Jan 2022 13:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7B67814B5;
	Sat,  8 Jan 2022 13:38:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 965621BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B5BD400D3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ygUqCJjo9jT for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:38:29 +0000 (UTC)
X-Greylist: delayed 19:43:06 by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14C91400CF
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:38:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BDB1560007;
 Sat,  8 Jan 2022 13:38:25 +0000 (UTC)
Date: Sat, 8 Jan 2022 14:38:24 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Message-ID: <20220108143824.2cdc9a29@windsurf>
In-Reply-To: <20200715223514.15744-1-aleksandr.o.makarov@gmail.com>
References: <20200715223514.15744-1-aleksandr.o.makarov@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/libest: new package
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

Hello Aleksandr,

On Wed, 15 Jul 2020 16:35:14 -0600
Aleksandr Makarov <aleksandr.o.makarov@gmail.com> wrote:

> libest is a C implementation of RFC 7030 (Enrollment over
> Secure Transport).
> 
> It can be used to provision public key certificates from
> a certificate authority (CA) or registration authority (RA)
> to end-user devices and network infrastructure devices.
> 
> https://github.com/cisco/libest
> 
> Notes on patches included in this package:
> 
> - libest bundles a stubbed version of libsafec, and has no provision
>   to build against a system-installed full (non-stubbed) libsafec.
>   We add a patch to make that possible.
> 
> - Added a configuration option --{enable,disable}-examples to toggle
>   examples build by a separate patch.
> 
> - There's a configuration option `--enable-jni` which allows to build
>   a JNI library for binding libest to Java programs. And that library
>   would be using an outdated version of OpenSSL 1.0.
>   We fix that by adding support for OpenSSL 1.1 API for that library.
> 
> - Fixed a bug when specifying either `--enable-FEATURE` or `--disable-FEATURE`
>   has always been enabling the feature.

Sorry for the long delay. I finally applied your patch, but after
making some significant changes:

    [Thomas:
    - Added comments about the upstream status in existing patches
    - Added a patch fixing an autoreconf issue
    - Added a patch adding a missing "extern" on a variable to fix build
      with gcc 10
    - Removed the glibc dependency by using the new libexecinfo package
    - Drastically simplified the complex libcoap disabling and client-only
      mode vs. OpenJDK issue. libcoap support is now forcefully disabled,
      and client-mode only option is made invisible when OpenJDK is
      enabled.
    - Fixed the license information;
    - Added missing host-pkgconf
    ]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
