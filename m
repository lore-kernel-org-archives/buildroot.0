Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3460C4167D
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 11:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AE01612BB;
	Thu,  9 Nov 2023 11:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AE01612BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X3zEc5WuO5qG; Thu,  9 Nov 2023 11:10:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A5B860AB9;
	Thu,  9 Nov 2023 11:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A5B860AB9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFE141BF352
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 11:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4380409F3
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 11:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4380409F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96Druu2r62IL for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 11:10:23 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4302C40119
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 11:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4302C40119
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13E3520010;
 Thu,  9 Nov 2023 11:10:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r12vT-001rhD-0y;
 Thu, 09 Nov 2023 12:10:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>,
 thomas.petazzoni@bootlin.com
References: <20231009143440.1776155-1-adam.duskett@amarulasolutions.com>
Date: Thu, 09 Nov 2023 12:10:19 +0100
In-Reply-To: <20231009143440.1776155-1-adam.duskett@amarulasolutions.com>
 (Adam Duskett's message of "Mon, 9 Oct 2023 16:34:40 +0200")
Message-ID: <87cywjp4h0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: select linux-pam if
 refpolicy upstream is selected
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

>>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:

 > linux-pam is required to login via OpenSSH if the upstream refpolicy for
 > SELinux is enaabled, as linux-pam handles changing user contexts. If a
 > user wants to make their own policy and use a refpolicy via git, we of course
 > should let them do so. As such, only select linux-pam if the upstream version
 > of refpolicy is selected.

 > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 > ---
 >  package/openssh/Config.in | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/openssh/Config.in b/package/openssh/Config.in
 > index 08d3c7d391..e7d8f46c07 100644
 > --- a/package/openssh/Config.in
 > +++ b/package/openssh/Config.in
 > @@ -3,6 +3,7 @@ config BR2_PACKAGE_OPENSSH
 >  	depends on BR2_USE_MMU # fork()
 >  	select BR2_PACKAGE_OPENSSL
 >  	select BR2_PACKAGE_ZLIB
 > +	select BR2_PACKAGE_LINUX_PAM if BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION

Hmm, we cannot do that without taking the dependencies on linux-pam into
consideration:

config BR2_PACKAGE_OPENSSH
        bool "openssh"
        depends on BR2_USE_MMU # fork()

..

config BR2_PACKAGE_REFPOLICY
        bool "refpolicy"
        depends on BR2_TOOLCHAIN_HAS_THREADS # libsepol
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsepol
        depends on BR2_HOST_GCC_AT_LEAST_5 # host-setools -> host-libsepol

..

config BR2_PACKAGE_LINUX_PAM
        bool "linux-pam"
        depends on BR2_ENABLE_LOCALE
        depends on BR2_USE_WCHAR
        depends on !BR2_STATIC_LIBS
        depends on BR2_USE_MMU # fork()
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h

So there is no guarantee that locale, wchar and !static are
available. You either need to propagate these dependencies to openssh if
the standard refpolicy is used or only select if they are / display a
warning otherwise.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
