Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48975ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 06:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA05641CCE;
	Sat, 17 Sep 2022 06:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA05641CCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EDTWf7oMFQvN; Sat, 17 Sep 2022 06:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B223541CC6;
	Sat, 17 Sep 2022 06:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B223541CC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2673B1BF846
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 06:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F405141CC6
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 06:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F405141CC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxeJOGMKUWKE for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 06:50:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C2E341CA2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C2E341CA2
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 06:50:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7C1461C0004;
 Sat, 17 Sep 2022 06:50:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZReY-0096g5-Jr; Sat, 17 Sep 2022 08:50:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220818213936.442912-1-fontaine.fabrice@gmail.com>
Date: Sat, 17 Sep 2022 08:50:14 +0200
In-Reply-To: <20220818213936.442912-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 18 Aug 2022 23:39:36 +0200")
Message-ID: <87o7ve4hqx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: fix wolfssl build
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with BR2_PACKAGE_WOLFSSL_ALL raised
 > since bump to version 5.9.0 in commit
 > da912a3d2abe2eb2b338c03ec56c7e39a4d640f9:

 > In file included from ../../../../src/libstrongswan/utils/utils.h:59,
 >                  from ../../../../src/libstrongswan/library.h:101,
 >                  from wolfssl_common.h:29,
 >                  from wolfssl_aead.c:23:
 > wolfssl_aead.c:90:16: error: conflicting types for 'encrypt'; have '_Bool(union <anonymous>,  chunk_t,  chunk_t,  chunk_t,  chunk_t *)'
 >    90 | METHOD(aead_t, encrypt, bool,
 >       |                ^~~~~~~
 > ../../../../src/libstrongswan/utils/utils/object.h:99:20: note: in
 > definition of macro 'METHOD'
 >    99 |         static ret name(union {iface *_public; this;} \
 >       |                    ^~~~
 > In file included from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/wc_port.h:573,
 >                  from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/types.h:35,
 >                  from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/logging.h:33,
 >                  from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/ssl.h:35,
 >                  from wolfssl_common.h:64,
 >                  from wolfssl_aead.c:23:
 > /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/unistd.h:149:6: note: previous declaration of 'encrypt' with type 'void(char *, int)'
 >   149 | void encrypt(char *, int);
 >       |      ^~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/02f080c2f6d8272cb8cc1de66e058d66fb7499bc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
