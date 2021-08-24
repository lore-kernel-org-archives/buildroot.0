Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020AAC4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 07:13:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A843A61165
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 07:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A843A61165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70ABA40494;
	Tue, 24 Aug 2021 07:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yD5hkrxfkNa1; Tue, 24 Aug 2021 07:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0946404E2;
	Tue, 24 Aug 2021 07:13:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 618EA1BF31B
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 07:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EE7340242
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 07:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pyr8VVe1gZ05 for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 07:13:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C02AB400E7
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 07:13:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:74bb:d99:1780:d670])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C86A7200390;
 Tue, 24 Aug 2021 09:13:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629789198;
 bh=VaVOMNWq1rjArDQ94oeVJln6oymuSKXFofFGvXvn1q8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MMch9oxN9ixsbHHs7xWJWHIJPcL9nLh44dYCBJtO7QSxnNlJ01FFd5/DP0Qk2P7vA
 TfjIW9C46F7fCFmqM/eAMVR0oUBs8rgMkBqZ6cKwBW91pJmaBoM5n9wY5U7fMwa1ue
 QFKeVDTGfEDiIrF/lJr/45fqyEAawKaUtzK//QICM8x7kGjK8Uq51/ulxcgKf2zJd1
 OZEUv6juIveJ2HTX6dPWxBRT6rTCkAUYPBPG5kGue8KgUJ9NyzK7b6rfBA7byRbzCe
 NvGEx+E8fd6zHKve+2UVRV0jLG3m67NVPTLP3xA5RNfbpTZjeaqa18xi8rNGGYNGyg
 fi4Bze28WXCHA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 24 Aug 2021 09:13:11 +0200
Date: Tue, 24 Aug 2021 09:13:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20210824071311.GW27036@scaer>
References: <20210823233113.936711-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210823233113.936711-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libcap: don't overwrite 'empty'
 when generating loader.txt
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Arnout, All,

On 2021-08-24 01:31 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Upstream commit [1] introduced an invocation of objcopy to generat
> loader.txt. However, objcopy, if not provided with an output file, will
> overwrite the input file. This is usually harmless because it will be
> identical, but the timestamp is updated. This may cause 'empty' to be
> newer than 'loader.txt', which causes 'loader.txt' and its dependencies
> to be rebuilt during 'make install'
> 
> We provide a different set of parameters during 'make install'. In
> particular, we no longer pass in HOST_CONFIGURE_OPTS, so we no longer
> set LDFLAGS. Thus, there is no -Wl,rpath option that is passed in, which
> causes the resulting binaries to have an incorrect RPATH.
> 
> Fix this by adding /dev/null as the output file in the objcopy
> invocation.
> 
> Patch was sent upstream, but there's no mailing list, just a single
> person.
> 
> Fixes: http://autobuild.buildroot.net/results/600/600aff5b839b48db80751cace5fa9670b7a3d698
> (hopefully)
> 
> [1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=efd293947f940180eedd8d0915b124f4aedccc08
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, then reverted, then applied to next, thanks.

/me goes grab a third coffee before resuming patch reviews...

Regards,
Yann E. MORIN.

> ---
> Note: I tried updating to v1.2.53 first, but that failed due to [2]
> 
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=214023#c16
> ---
>  ...don-t-overwrite-empty-when-generatin.patch | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch
> 
> diff --git a/package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch b/package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch
> new file mode 100644
> index 0000000000..a47a2c788e
> --- /dev/null
> +++ b/package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch
> @@ -0,0 +1,50 @@
> +From dc507a812d931c24f1ac98c811fdd29bffa21da9 Mon Sep 17 00:00:00 2001
> +From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> +Date: Tue, 24 Aug 2021 00:36:40 +0200
> +Subject: [PATCH] libcap/Makefile: don't overwrite 'empty' when generating
> + loader.txt
> +
> +objcopy takes an input file and an output file as arguments. If the
> +output file is left out, the input file will be overwritten.
> +
> +Since the objcopy command used to generate loader.txt only does a
> +dump-section and no filtering, in practice there is no change to empty.
> +However, as a side-effect, its timestamp is updated. The timestamp of
> +empty and of loader.txt will be more or less the same; however,
> +loader.txt is closed just before the output file is closed, so it's
> +possible that the timestamp of loader.txt is just a little bit earlier.
> +If this happens, it causes loader.txt to be rebuilt later, which in turn
> +causes a number of other object files to be rebuilt.
> +
> +Usually that's harmless, but it sometimes causes the rebuild to happen
> +during 'make install'. This is particularly annoying if 'make install'
> +is done as root, since loader.txt becomes owned by root in that case.
> +
> +Fix this by specifying a harmless output file: /dev/null.
> +
> +While we're at it, take in an upstream change that removes the redundant
> +redirect.
> +
> +Fixes: ee3b25c0a877fa74d1aec88f325ac45b09963c82
> +
> +Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> +---
> + libcap/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libcap/Makefile b/libcap/Makefile
> +index 47cf8f4..18e4f4f 100644
> +--- a/libcap/Makefile
> ++++ b/libcap/Makefile
> +@@ -105,7 +105,7 @@ empty: empty.c
> + 	$(CC) -o $@ $<
> + 
> + loader.txt: empty
> +-	$(OBJCOPY) --dump-section .interp=/dev/stdout $< > $@
> ++	$(OBJCOPY) --dump-section .interp=$@ $< /dev/null
> + 
> + cap_magic.o: execable.h execable.c loader.txt
> + 	$(CC) $(CFLAGS) $(IPATH) -DLIBRARY_VERSION=\"$(LIBTITLE)-$(VERSION).$(MINOR)\" -DSHARED_LOADER=\"$(shell cat loader.txt)\" -c execable.c -o $@
> +-- 
> +2.31.1
> +
> -- 
> 2.31.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
