Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6D8C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 11:06:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B8DE600CC
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 11:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B8DE600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0826380DA7;
	Wed, 18 Aug 2021 11:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMkXCVG1OCY0; Wed, 18 Aug 2021 11:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 670A680DB8;
	Wed, 18 Aug 2021 11:06:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06D091BF3CD
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 11:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3EF760656
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 11:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41k-OdXTW9F9 for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 11:06:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1D1C60600
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 11:06:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8b4:21c0:9a77:1566])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DF7F9B0053F;
 Wed, 18 Aug 2021 13:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629284763;
 bh=2BLpgARvgQ25y4qGn2X3ux2HRvqx0xFA3mIfyHvVLhI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cXr2q2+INn0K/+tvQbqPhql72KFiB03Q2+VZ34FzmqRPJIauRLBkhPupW8odgPCfT
 jyhB1+8c7jU1F1ctmAboDDHIPZHF2Nm2qLbpTpmIqMHYtEF1ppTBOrIkLP+XAZ0yTB
 lfibYu4D+yMAXfybT/0bCRO+2lrpX9tht8RvuJ5tYtuNJqnMt5w4MT5M65pHhU5gHA
 xysnUhG4WpRvzePLelpkpICAEftMshuTo8OFLx1Euz+o4Ty5JwrK+LW60oHT1g+n/4
 5B/89fsYHzW7JYJT7jH+E7uvcvZa+Mpu+agZGnukozyziMtLFJaGpAxcuBN1Eax5Bi
 temxX5FoyIRYQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 18 Aug 2021 13:05:58 +0200
Date: Wed, 18 Aug 2021 13:05:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210818110558.GY27036@scaer>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818122511.005d6a5c@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210818122511.005d6a5c@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-08-17
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas, All,

On 2021-08-18 12:25 +0200, Thomas Petazzoni spake thusly:
> On Wed, 18 Aug 2021 06:57:22 -0000
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> >    sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c5013a4d9a7dd2305bab8d9aa43104fd5f353bcf |     
> >     arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2511a7ec0b4fc29133a4fc99160beb47c5681f02 |     
> >   powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e0d8cb350072ea90c331824a6790c792d60d885d |     
> 
> I am confused by these host-libcap issues, as I'm not able to
> reproduce. I tried on my local machine, and the host binaries have the
> proper RPATH. Thinking it might be a machine/distro specific issue, I
> tried on the gcc160 machine, which has reported build issues, and I
> tried building the exact defconfig of one of the build failures, and
> host-libcap builds just fine.
> 
> So, I'm confused :/ Any idea ?

Not sure the exact reason, but notice that the failures occur at install
time, not build time. And even then, the Makefile is still trying to
compile some stuff.

libcap is a generic package, and I noticed that the build and install
commands do not use the same environment:

    define HOST_LIBCAP_BUILD_CMDS
        $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
            $(HOST_LIBCAP_MAKE_FLAGS)
    endef

    define HOST_LIBCAP_INSTALL_CMDS
        $(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBCAP_MAKE_FLAGS) install
    endef

So I wonder if, at least for sanity sake, we should not just add
$(HOST_CONFIGURE_OPTS) in the environment for the install commands too.

Also, notice spurious errors from ldconfig:

    /sbin/ldconfig
    /sbin/ldconfig.real: Can't create temporary cache file /etc/ld.so.cache~: Permission denied
    make[5]: [Makefile:162: install-shared-psx] Error 1 (ignored)

(ldconfig is a wrapper around ldconfig.real, specific to debian and.or
ubuntu I guess)

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
