Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D34C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 23:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75F9442A05;
	Fri,  7 Jan 2022 23:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqW0tt4o5Bop; Fri,  7 Jan 2022 23:11:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5CFB42A11;
	Fri,  7 Jan 2022 23:11:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 859831BF36E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73DDB42A02
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vVw756yxyKOs for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 23:10:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40D8E4299E
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 23:10:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 414B0240002;
 Fri,  7 Jan 2022 23:10:49 +0000 (UTC)
Date: Sat, 8 Jan 2022 00:10:47 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Message-ID: <20220108001047.79e8bc24@windsurf>
In-Reply-To: <20200728095346.2103418-1-kamel.bouhara@bootlin.com>
References: <20200728095346.2103418-1-kamel.bouhara@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/cryptopp: add a target build
 configuration
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

Hello Kamel,

I finally applied, but with a good number of changes, see below.

On Tue, 28 Jul 2020 11:53:46 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> diff --git a/package/cryptopp/0001-Add-fully-qualified-SONAME-to-shared-object-for-Linu.patch b/package/cryptopp/0001-Add-fully-qualified-SONAME-to-shared-object-for-Linu.patch
> new file mode 100644
> index 0000000000..11f3090767
> --- /dev/null
> +++ b/package/cryptopp/0001-Add-fully-qualified-SONAME-to-shared-object-for-Linu.patch
> @@ -0,0 +1,30 @@
> +From 78eb43f50978ffd780cf31b1cea6736dadc6b155 Mon Sep 17 00:00:00 2001
> +From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> +Date: Mon, 6 Jul 2020 17:10:55 +0200
> +Subject: [PATCH] Add fully-qualified SONAME to shared object for Linux

That's not really what the patch does. What it does is create a symlink
that matches with the SONAME of the library. The question is: how was
it working before. Answer: because of the ldconfig call that creates
such symlinks. But of course, we don't call ldconfig when
cross-compiling, hence the need for your change.

So, I improved the commit log, also changed the GNUmakefile-cross file,
and submitted that upstream:

  https://github.com/weidai11/cryptopp/pull/1101


>  define HOST_CRYPTOPP_INSTALL_CMDS
> -	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-lib
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(HOST_DIR)" LDCONFIG=/bin/true install-lib

These are unrelated changes, so I dropped them.

>  endef
> 
> +define CRYPTOPP_EXTRACT_CMDS
> +	$(UNZIP) $(CRYPTOPP_DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
> +endef
> +
> +CRYPTOPP_CXXFLAGS = $(TARGET_CFLAGS) -fPIC
> +
> +CRYPTOPP_MAKE_OPTS = \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CXXFLAGS="$(CRYPTOPP_CXXFLAGS)"

You were missing the logic to handle gcc < 4.9 that exists for the host
package, and that we also need for the target package.

> +
> +define CRYPTOPP_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CRYPTOPP_MAKE_OPTS) shared
> +endef
> +
> +define CRYPTOPP_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" LDCONFIG=/bin/true install-lib

PREFIX=$(TARGET_DIR) is wrong. It should have been PREFIX=/usr DESTDIR=$(TARGET_DIR)

> +endef
> +
> +define CRYPTOPP_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)" libcryptopp.pc

Building the libcryptopp.pc file is really a build step, so I moved
this to the build step.

> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)" LDCONFIG=/bin/true install-lib

Same as above, PREFIX=$(STAGING_DIR) is wrong, it should be PREFIX=/usr
DESTDIR=$(STAGING_DIR)

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
