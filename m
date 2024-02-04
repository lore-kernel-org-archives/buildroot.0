Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAAFC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 15:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1898A80B12;
	Sun,  4 Feb 2024 15:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1898A80B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DfHyPzXAA-Ym; Sun,  4 Feb 2024 15:41:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 334BD80B0F;
	Sun,  4 Feb 2024 15:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 334BD80B0F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 190371BF47A
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED1B080B0F
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED1B080B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2NEIMHxrPiLD for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 15:41:16 +0000 (UTC)
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C49580B0E
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 15:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C49580B0E
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 80B184402B1;
 Sun,  4 Feb 2024 17:40:45 +0200 (IST)
References: <20240117210756.265708-1-ju.o@free.fr>
 <Zazgd8sRYiHBY1CB@landeda> <871q9sr42s.fsf@48ers.dk>
User-agent: mu4e 1.10.8; emacs 29.1
To: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Feb 2024 17:40:14 +0200
In-reply-to: <871q9sr42s.fsf@48ers.dk>
Message-ID: <87il345jah.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1707061245;
 bh=d+Xfo+R0aYtHud2u1lmbHDb7u4ZS6yztJc9Ldu34UEM=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=KK9ZS1ZpK3uk04AuI6An/CwHiKRo2aabnMda4lZxwNRSdS/9ZJW7RRXK2uacjh0P7
 jQKlFFodZs7/xcAq4YYb8VIQfj+Eh4XHcrOTeyV1Fv1gmU3kVsXoN5mfzL6O2Udta8
 X4OXttG+au0udTMub/meASIf18S8908qYiJ4pcjiOvBTAKnO29sP2jMv4/mN2g8YQ0
 5/Bvp/Dbusq492x59vzfOSJ5Nx4VCLtsf1BLpGo/zFBkvQJMXXCAlf2ulZPu/0l0fq
 4REEmQp4e3A5Zi5qEqEMFTOqgTIIV/2diKNa8FX5AemIdTzkltqemU7ec+EvH7F987
 3tWor81+adbAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=KK9ZS1Zp
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: fix service runtime
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Julien Olivain <ju.o@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Sun, Feb 04 2024, Peter Korsgaard wrote:

>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > Julien, All,
>  > On 2024-01-17 22:07 +0100, Julien Olivain spake thusly:
>  >> Since commit 2a8065e "package/postgresql: bump version to 16.1", the
>  >> postgresql service fail to start at runtime with an error:
>  >> 
>  >> FATAL: could not load library
>  >> "/usr/lib/postgresql/dict_snowball.so":
>  >> /usr/lib/postgresql/dict_snowball.so: undefined symbol:
>  >> CurrentMemoryContext
>  >> 
>  >> This is due to the Posgresql autotool configure script trying to
>  >> detect whether the toolchain linker needs --export-dynamic or not.
>  >> This test is done with a runtime execution of a test program, and
>  >> therefore cannot run in cross-compilation. In that case, the
>  >> configure script assumes it is not needed. See commit [1], included
>  >> in PostgreSQL v16.0.
>  >> 
>  >> This commit fixes the issue by forcing the value in _CONF_ENV. The
>  >> package has already a Kconfig dependency on !BR2_STATIC_LIBS, so the
>  >> value can be unconditionally set.
>  >> 
>  >> [1]
>  >> https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=9db49fc5bfdc0126be03f4b8986013e59d93b91d
>
>  > I've added references to the ML thread upstream, with their position
>  > that cross-compiling is not really a supoprted thing.
>
>  >> Signed-off-by: Julien Olivain <ju.o@free.fr>
>
>  > Applied to master, thanks.
>
> Committed to 2023.11.x, thanks.

Not in 2023.11.x as of commit 7d35d445a1ae ("package/micropython: fix
building after dropping GIT_DIR=. workaround").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
