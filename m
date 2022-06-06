Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A1BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 21:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D369417E6;
	Mon,  6 Jun 2022 21:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSBKhTPP2kmw; Mon,  6 Jun 2022 21:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB7BC41680;
	Mon,  6 Jun 2022 21:13:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B39651BF279
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A20EE832B0
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1terW3I_9ieB for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 21:13:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FB3F8329E
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 21:13:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4013:c8f0:ae9b:2a1c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 04A3178032A;
 Mon,  6 Jun 2022 23:13:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654550021;
 bh=/HkgGO1jOk3UCkvJu8FEI6ijK1RByBhoAPYJMLXVLaY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fY9fCs6XsYND6VwMQOcQLQ0UMGn2Yi1ZYKaNC0uX7SB/CoukjA/KgansKM1uKe1A+
 1ftXrdsblcyr8vjIJVf9fW7MBxIio68dFoIRHEY4ZGz3v7Y9AMFt0Ns70mmCqdFl3U
 0yF9g2lhq6RHSWf4/0T9oOfFguIILRUZ65LhFilhw5ViV1wOWNkNgs3yWKDXeyVxAW
 XoybnxgzidjvbfYyjrmxe/WhgoGK2ZaDYMC17L11dypdAkJVm1StTREVkcbW+zMZoI
 /VYez+NzSI2k8H5wmgB1x7IJcuUPmT1mAWlkTmw3xZnYo6x0w6fn44oAJHFhO4BiGJ
 YJcwjEyI9oI1A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 Jun 2022 23:13:15 +0200
Date: Mon, 6 Jun 2022 23:13:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220606211315.GA427639@scaer>
References: <20220606142118.1055501-1-fontaine.fabrice@gmail.com>
 <55581997-b9da-7187-204c-3a47b32d6350@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55581997-b9da-7187-204c-3a47b32d6350@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/openssl: libopenssl needs atomic
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
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 Sven Haardiek <sven.haardiek@iotec-gmbh.de>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Mauro Condarelli <mc5686@mclink.it>, Matt Weber <matthew.weber@collins.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Norbert Lange <nolange79@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>,
 Manuel =?utf-8?Q?V=C3=B6gele?= <develop@manuel-voegele.de>,
 Pierre-Jean Texier <texier.pj2@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Asaf Kahlon <asafka7@gmail.com>, Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, Arnout, All,

On 2022-06-06 21:06 +0200, Arnout Vandecappelle spake thusly:
> On 06/06/2022 16:21, Fabrice Fontaine wrote:
> >libopenssl needs atomic or the build will fail (e.g. on sparcv8 without
> >libatomic):
> 
>  I don't understand how it's possible that this error happens only with
> James' fully random configs, and not with e.g. bootlin-m68k-5208-uclibc
> (which I double checked does still have autobuilder results, and does not
> have libatomic). In fact, there are successful builds of libopenssl without
> libatomic, e.g. [1]. I found this with the autobuild query [2] (there's no
> way to search for the absence of a symbol in the advanced search, but
> m68k_cf5208 can't have atomic so it's a good way to search it).

I did some test, and indeed, sparc v8 fails to build. But leon builds
successfully.

For sparc v8, there are indeed references to __atomic_fetch_sub_4 and
__atomic_fetch_add_4. But for leon, none.

> >${LDCMD:-/nvmedata/autobuild/instance-7/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc}  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O0 -g2  -g2  -L.   \
> >	-o apps/openssl apps/asn1pars.o apps/ca.o apps/ciphers.o apps/cms.o apps/crl.o apps/crl2p7.o apps/dgst.o apps/dhparam.o apps/dsa.o apps/dsaparam.o apps/ec.o apps/ecparam.o apps/enc.o apps/engine.o apps/errstr.o apps/gendsa.o apps/genpkey.o apps/genrsa.o apps/nseq.o apps/ocsp.o apps/openssl.o apps/passwd.o apps/pkcs12.o apps/pkcs7.o apps/pkcs8.o apps/pkey.o apps/pkeyparam.o apps/pkeyutl.o apps/prime.o apps/rand.o apps/rehash.o apps/req.o apps/rsa.o apps/rsautl.o apps/s_client.o apps/s_server.o apps/s_time.o apps/sess_id.o apps/smime.o apps/speed.o apps/spkac.o apps/srp.o apps/storeutl.o apps/ts.o apps/verify.o apps/version.o apps/x509.o \
> >	 apps/libapps.a -lssl -lcrypto -ldl
> >/nvmedata/autobuild/instance-7/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./libssl.so: undefined reference to `__atomic_fetch_sub_4'
> >
> >It should be noted that openssl3 has added OPENSSL_DEV_NO_ATOMICS but
> >"this is intended for internal development only, to check the
> >refcounting is properly coded.  It should never become a configuration
> >option, hence the name of the macro.":
> >https://github.com/openssl/openssl/commit/503d4745a115b82db01c1fb22baaddb153d27cdb
> >
> >Fixes:
> >  - http://autobuild.buildroot.org/results/bce526d538f43a541fdfbc0c9b4a7cecebbbc539
> >
> >Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> [snip]
> >diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> >index 7bf49b05f6..ed165569f0 100644
> >--- a/package/openssl/Config.in
> >+++ b/package/openssl/Config.in
> >@@ -16,6 +16,7 @@ choice
> >  config BR2_PACKAGE_LIBOPENSSL
> >  	bool "openssl"
> >+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> 
>  Unfortunately, this is not enough (and it is already a huge patch...).
> 
>  The result of this new dependency is that openssl is only available if
> BR2_TOOLCHAIN_HAS_ATOMIC (libopenssl) ||
> (!BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL && BR2_TOOLCHAIN_HAS_THREADS &&
>  !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU))
> 
>  So, in addition to the packages that select
> BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL, all the packages that select
> BR2_PACKAGE_OPENSSL have to be updated as well...

This is going to be a huge change...

Can we maybe instead add an exception in the autobuilders, so that
"fringe" architectures or variants just get excluded?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
