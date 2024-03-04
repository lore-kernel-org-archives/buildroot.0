Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05184C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 11:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2FFB820BC;
	Mon,  4 Mar 2024 11:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16j5MCTXW_LG; Mon,  4 Mar 2024 11:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF855820EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF855820EF;
	Mon,  4 Mar 2024 11:47:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E0321BF2F3
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B395820EF
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2vOotNqfQGHZ for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 11:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 979CE820BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 979CE820BC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 979CE820BC
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 11:46:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC83D4000C;
 Mon,  4 Mar 2024 11:46:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rh6mU-00Cex5-0Z;
 Mon, 04 Mar 2024 12:46:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240303181859.1103815-1-fontaine.fabrice@gmail.com>
Date: Mon, 04 Mar 2024 12:46:54 +0100
In-Reply-To: <20240303181859.1103815-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Mar 2024 19:18:59 +0100")
Message-ID: <87plwa2p8x.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/shadow: disable on uclibc
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > shadow unconditionally uses reallocarray, reallocf and explicit_bzero
 > since bump to version 4.14.3 in commit
 > 8a01774d9897310c00a0945865f5a6d5167dfca3 and
 > https://github.com/shadow-maint/shadow/commit/1aa22c14674e14e84efa171614dea2b515d5a223
 > https://github.com/shadow-maint/shadow/commit/0e0a310acf5111251589116343897a63ebc88e7a
 > https://github.com/shadow-maint/shadow/commit/0ec157d579931cfec1cc8439288ed17adf19da5d
 > resulting in the following uclibc build failure:

 > /home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/13.1.1/../../../../arc-buildroot-linux-uclibc/bin/ld:
 > groups.o: in function `main':
 > groups.c:(.text.startup+0x20): undefined reference to `reallocarray'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/98be07d299aa383a447a1f1dd2924a00c1a29a34

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I got a bit confused about reallocf as musl doesn't provide that, but it
turns out that it is no longer used since:

https://github.com/shadow-maint/shadow/commit/6e58c1275252f3314d1aa5cc4d7e7f9068e3a902

So I dropped the reallocf reference and added a comment about
reallocarray/explicit_bzero as suggested by Raphael and committed,
thanks.


> ---
 >  package/shadow/Config.in | 6 ++++--
 >  1 file changed, 4 insertions(+), 2 deletions(-)

 > diff --git a/package/shadow/Config.in b/package/shadow/Config.in
 > index 230271af7d..bc85d0d135 100644
 > --- a/package/shadow/Config.in
 > +++ b/package/shadow/Config.in
 > @@ -2,6 +2,7 @@ menuconfig BR2_PACKAGE_SHADOW
 >  	bool "shadow"
 >  	depends on !BR2_STATIC_LIBS
 >  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 > +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 >  	help
 >  	  Utilities to deal with user accounts.
 
 > @@ -55,5 +56,6 @@ config BR2_PACKAGE_SHADOW_YESCRYPT
 
 >  endif # BR2_PACKAGE_SHADOW
 
 > -comment "shadow needs a toolchain w/ headers >= 4.14, dynamic library"
 > -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS
 > +comment "shadow needs a glibc or musl toolchain w/ headers >= 4.14, dynamic library"
 > +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || \
 > +		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC
 > -- 

 > 2.43.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
