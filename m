Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C4AC021A4
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 14:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD0BD610C0;
	Wed, 12 Feb 2025 14:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o84TzxdfXDBK; Wed, 12 Feb 2025 14:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C514610B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C514610B8;
	Wed, 12 Feb 2025 14:24:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC1E4C2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 14:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B539811DB
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 14:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s84-t21pQWnN for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 14:24:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3698C81112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3698C81112
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3698C81112
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 14:24:51 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 70B3B440F61;
 Wed, 12 Feb 2025 16:19:23 +0200 (IST)
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org,  Bernd Kuhls <bernd@kuhls.net>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250212135027.759121-1-fancp2007@gmail.com> (Scott Fan's
 message of "Wed, 12 Feb 2025 21:50:25 +0800")
References: <20250212135027.759121-1-fancp2007@gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 12 Feb 2025 16:24:45 +0200
Message-ID: <87tt8znsuq.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1739369963;
 bh=90oMwpKcWU79ya+X0RD44hIg3h3CBgIwPdisXDFnUM0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=y8hZ/7VxPT4EXqgbXKoQ1s1zscUOPmd2MVkSWlgAa7+z6pduQT7ImFO/dj6G8dXE3
 w6zbP742Q0fYOQtGsUTrPqL20YPc+Pfal5Gbd1Eu//Xl8pWGJF8ohYH9rMGGzEK7RG
 XE/xNwJG8g/6pRGUOphFUVMpY/0EbkaxNYPbQnuQ0oHnLbGT8xrTjvU3j1doSJa4Cq
 oxl1KOl3Fwf0+bj5oqPekewxLMd7Zo+tRvufNWNRXsyoYxShE6jbYBcV9SWSjHQOk2
 f2LW9vYTaGU3FMjVM9vCyrd6yBwmpm6Z6LDWAdcDgBJt/CKm6wUvgW3ypmfq9pKurf
 9qpmiJVOizIwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=y8hZ/7Vx
Subject: Re: [Buildroot] [PATCH] package/sqlite: fix build issue since bump
 to 3.49.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Scott,

On Wed, Feb 12 2025, Scott Fan wrote:
> As of release 3.49.0, the author has replaced the configure script used in
> the precompiled amalgamation tarball with Autosetup instead of Autotools.
>
> Fixes:
>   https://autobuild.buildroot.org/?reason=sqlite-3.49.0
>
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  package/sqlite/sqlite.mk | 59 ++++++++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 23 deletions(-)
>
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index a23f6e1d66..30385f9821 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -21,14 +21,6 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA),y)
>  SQLITE_CFLAGS += -DSQLITE_ENABLE_COLUMN_METADATA
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
> -SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
> -endif
> -
> -ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),y)
> -SQLITE_CFLAGS += -DSQLITE_ENABLE_JSON1
> -endif
> -
>  ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
>  SQLITE_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY
>  endif
> @@ -50,30 +42,51 @@ else
>  SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
>  endif
>  
> -SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
> -
> -ifeq ($(BR2_STATIC_LIBS),y)
> -SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
> -else
> -SQLITE_CONF_OPTS += --disable-static-shell
> -endif
> -
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -SQLITE_CONF_OPTS += --enable-threadsafe
> +SQLITE_CFLAGS += -DSQLITE_THREADSAFE=1
>  else
>  SQLITE_CONF_OPTS += --disable-threadsafe
> -SQLITE_CFLAGS += -DSQLITE_THREADSAFE=0
>  endif
>  
>  ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
>  SQLITE_DEPENDENCIES += ncurses readline
> -SQLITE_CONF_OPTS += --disable-editline --enable-readline
>  else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
>  SQLITE_DEPENDENCIES += libedit
> -SQLITE_CONF_OPTS += --enable-editline --disable-readline
> +SQLITE_CONF_OPTS += --disable-readline --editline
>  else
> -SQLITE_CONF_OPTS += --disable-editline --disable-readline
> +SQLITE_CONF_OPTS += --disable-readline
>  endif
>  
> -$(eval $(autotools-package))
> -$(eval $(host-autotools-package))
> +ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
> +SQLITE_CONF_OPTS += --fts3
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),)
> +SQLITE_CONF_OPTS += --disable-json
> +endif
> +
> +SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
> +
> +define SQLITE_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
> +		--prefix=/usr \
> +		--host="$(GNU_TARGET_NAME)" \
> +		--build="$(GNU_HOST_NAME)" \
> +		--sysroot="$(STAGING_DIR)" \
> +		$(SQLITE_CONF_OPTS) \
> +	)
> +endef
> +
> +define SQLITE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define SQLITE_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D) install
> +endef
> +
> +define SQLITE_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))

We also need host-generic-package to replace the host-autotools-package
removed above.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
