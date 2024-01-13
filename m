Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25AEC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6E5C60A81;
	Sat, 13 Jan 2024 21:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6E5C60A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psOAvTA0Qg5B; Sat, 13 Jan 2024 21:13:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB00060A6B;
	Sat, 13 Jan 2024 21:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB00060A6B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF8441BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D22EA8301D
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D22EA8301D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mKDF2F5zFuXg for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:13:16 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C216F83004
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C216F83004
Received: by mail.gandi.net (Postfix) with ESMTPSA id 289981BF203;
 Sat, 13 Jan 2024 21:13:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOlJZ-00DPlG-20;
 Sat, 13 Jan 2024 22:13:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
References: <20240101213454.558295-1-aleksandr.o.makarov@gmail.com>
Date: Sat, 13 Jan 2024 22:13:13 +0100
In-Reply-To: <20240101213454.558295-1-aleksandr.o.makarov@gmail.com>
 (Aleksandr Makarov's message of "Mon, 1 Jan 2024 23:34:54 +0200")
Message-ID: <87le8tndhy.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/haproxy: fix runtime 'FATAL
 ERROR: invalid code detected -- cannot go further'
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

>>>>> "Aleksandr" == Aleksandr Makarov <aleksandr.o.makarov@gmail.com> writes:

 > Forcing HAPROXY_CFLAGS on the haproxy build command line overrides CFLAGS
 > which were internally set by the package Makefile.

 > In such a way, a bunch of flags that were deduced by the package build script
 > in *_CFLAGS variables, specifically in SPEC_CFLAGS, are omitted. Compiling and
 > running haproxy without SPEC_CFLAGS taken into account results in runtime error:

 > $ haproxy
 > FATAL ERROR: invalid code detected -- cannot go further, please recompile!
 > The source code was miscompiled by the compiler, which usually indicates that
 > some of the CFLAGS needed to work around overzealous compiler optimizations
 > were overwritten at build time. Please do not force CFLAGS, and read Makefile
 > and INSTALL files to decide on the best way to pass your local build options.
 > ...

 > This error is produced by haproxy.c [1] source which effectively ensures that INT_MAX+1
 > expression wraps around using twos-complement representation. It is only true when -fwrapv
 > gcc option is set in SPEC_CFLAGS.

 > To address this, append necessary *_CFLAGS variables to the CFLAGS in haproxy Makefile.

 > [1] https://git.haproxy.org/?p=haproxy.git;a=blob;f=src/haproxy.c;h=e1863255422459e806f7e50828e81976bb41c14c;hb=HEAD#l3304

 > Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 > ---
 >  ...fix-runtime-FATAL-ERROR-invalid-code.patch | 50 +++++++++++++++++++
 >  1 file changed, 50 insertions(+)
 >  create mode 100644 package/haproxy/0002-package-haproxy-fix-runtime-FATAL-ERROR-invalid-code.patch

 > diff --git a/package/haproxy/0002-package-haproxy-fix-runtime-FATAL-ERROR-invalid-code.patch b/package/haproxy/0002-package-haproxy-fix-runtime-FATAL-ERROR-invalid-code.patch
 > new file mode 100644
 > index 0000000000..39706048f3
 > --- /dev/null
 > +++ b/package/haproxy/0002-package-haproxy-fix-runtime-FATAL-ERROR-invalid-code.patch
 > @@ -0,0 +1,50 @@
 > +From 9dbf27180c5ae04b11076c46da029bfd1446782a Mon Sep 17 00:00:00 2001
 > +From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 > +Date: Mon, 1 Jan 2024 22:04:15 +0200
 > +Subject: [PATCH 1/1] package/haproxy: fix runtime 'FATAL ERROR: invalid code
 > + detected -- cannot go further'

Has this patch been submitted upstream? If so, what is the status of it?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
