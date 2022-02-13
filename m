Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627B5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 14:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFE36608A6;
	Sun, 13 Feb 2022 14:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9rITqUkI-GM; Sun, 13 Feb 2022 14:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11FBB60758;
	Sun, 13 Feb 2022 14:42:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DBB01BF841
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 14:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BB3481779
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 14:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUr5n9R_BK6I for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 14:42:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F88B81775
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 14:42:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8910:5bc5:ca35:1c76])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 406B313F88D;
 Sun, 13 Feb 2022 15:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644763348;
 bh=yaOugCNrhtRO0RXmtdAtjBAMprzaIKQGrZoESqs9lnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RNsQNsckl9NHuXzgcmCAC/3Gbbfp0eFcYNmnz3TOm1UHQeNyKx9sNRM3M6El7uuxa
 BjexGI42dhFdpNYqS2wX2Z46knGWQrK6bwJurKye576YYBZGyhhQXyXaAK5/zYg3ur
 hWAyI1rg6aPalKPKj8mUr6xSCKHlcC6ZIEMo0qP4jE5MTw1iRp/9tmiGmT2Yr9Vk2o
 STTt9Qrsg5yKtsfc9pADTQBCwZVtRGT7PFIemonbXYNO5/bbmaeRh4nsDR1y6pYLXq
 ZI22xf11Q8UwBhrRA1LLrtWm5FiFAhpT5ESfKt2tfFEBz3ujxVsutAn2tpBKI46Txg
 NpE++b3jWGtpQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Feb 2022 15:42:18 +0100
Date: Sun, 13 Feb 2022 15:42:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220213144218.GA4462@scaer>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
 <20220205201837.3324085-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220205201837.3324085-2-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v6 2/8] package/re2: switch to
 generic-package make build
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Martin Bark <martin@barkynet.com>,
 =?utf-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jmes, All,

On 2022-02-05 13:18 -0700, James Hilliard spake thusly:
> The cmake build appears to be missing features such as pkg-config
> generation support, switch to the regular makefile based build
> which appears to work better.

I was wondering why we could not just fix the CMake buildsystem, and
submit the fix upstream...

And then I remembered already talking about this earlier, but this
commit did not carry any explanations why we could not do it... So I
had to dig the archives to recover the previous discussion.

So, bottom line is, the commit log would be better off with more
explanations, like:

    The cmake build appears to be missing features, such as pkg-config
    generation support which is needed for some packages to find re2,
    like qt5webengine.

    Upstream is not keen on fixing the CMake-absed buildsystem [0]

    Instead of patching it on our side, and then have to carry the patch
    forever, we switch to the Makefile-based generic buildsystem.

    Note that previously some packages like grpc failed when the generic
    Makefile was used, because they would not find the cmake-equivalent
    of pkg-config, but this is now fixed [1].

    Signed-off-by: you.

    [0] https://github.com/google/re2/issues/349
    [1] https://github.com/grpc/grpc/commit/45e413d2520795e7281e9a592af81620349bc186

> This will be needed by qt5webengine.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - don't built shared libraries if BR2_STATIC_LIBS is set
> ---
>  package/re2/re2.mk | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/package/re2/re2.mk b/package/re2/re2.mk
> index b562d5d7ef..2863fcb662 100644
> --- a/package/re2/re2.mk
> +++ b/package/re2/re2.mk
> @@ -10,8 +10,32 @@ RE2_LICENSE = BSD-3-Clause
>  RE2_LICENSE_FILES = LICENSE
>  RE2_INSTALL_STAGING = YES
>  
> -RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
> -HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON
> +define RE2_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		-C $(@D) $(if $(BR2_STATIC_LIBS),static)
> +endef
>  
> -$(eval $(cmake-package))
> -$(eval $(host-cmake-package))
> +define RE2_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) \

We usually do not double-quote STAGING_DIR, TARGET_DIR, or HOST_DIR,
because we do not even support building in a directory with spaces in
its name.

    $ git grep -E '=\$\(STAGING_DIR\)' |wc -l
    693
    $ git grep -E '="\$\(STAGING_DIR\)"' |wc -l
    23

So I'd prefer we stick to the not-double-quoted situation.

No need to respin, this can be fixed when applying...

Regards,
Yann E. MORIN.

> +		$(if $(BR2_STATIC_LIBS),static-install,install)
> +endef
> +
> +define RE2_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) \
> +		$(if $(BR2_STATIC_LIBS),static-install,install)
> +endef
> +
> +define HOST_RE2_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> +		-C $(@D)
> +endef
> +
> +define HOST_RE2_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> +		-C $(@D) DESTDIR="$(HOST_DIR)" prefix=/usr install
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
