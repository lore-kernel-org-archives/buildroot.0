Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D6BC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 17:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BFD7406E3;
	Sun, 16 Aug 2026 17:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id foYUGkb02-v8; Sun, 16 Aug 2026 17:29:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B08C8406D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786901362;
	bh=o1l2tUnM+V5NdwgkQGvtJLU6OE4oMag8kyGgwSR8CHc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TMFfvIOJGS/DnzdFHGuEz/jbIkgzYl3Tjeje2U7wonWBUf6piIMMhrx9HrEiGx/QH
	 BNQsYHUn5UIziDcuF4GKAvsT9/cgnGwW7V3eVoBGnApwXauf3z3IadfYl8HEDPAzLs
	 mowQrQ7IxbBe1AQ78U4fdlgPbzpAt9uNftvkdoJSpvBDhxnWQ7vR9Hi1y91YXymboR
	 JbQOuzcsHaoSCfBRitDMbPQKZwG1ZJ/YkRsxmnOQKXgGFjOATR8DE73uWCoPGXFxT4
	 TjvqkPzAY3RBHLcyyX7rNS3b4XrUJLI1eBTSklNDwEsELf62iR8CY72ovlrbmUPnti
	 SZSnv0ujFJEmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B08C8406D2;
	Sun, 16 Aug 2026 17:29:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E78DF23F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 17:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD5D160629
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 17:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gshO45Quhiec for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 17:29:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DF0E6061A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DF0E6061A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DF0E6061A
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 17:29:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5339F4E41263;
 Sun, 16 Aug 2026 17:29:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1324860352;
 Sun, 16 Aug 2026 17:29:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 669D511C4F9F3; 
 Sun, 16 Aug 2026 19:29:09 +0200 (CEST)
Date: Sun, 16 Aug 2026 19:29:08 +0200
To: Love =?utf-8?Q?Fogelstr=C3=B6m?= <love.fogelstrom@outlook.com>
Cc: buildroot@buildroot.org, ljfogelstrom <ljfogelstrom@protonmail.com>
Message-ID: <aoHw1fSkmK7RdWLr@windsurf>
References: <MRWPR10MB9601C2E95E8C59899FBB997EF2F62@MRWPR10MB9601.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MRWPR10MB9601C2E95E8C59899FBB997EF2F62@MRWPR10MB9601.EURPRD10.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/postfix: add postfix 3.11.4
 package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Love,

Thanks a lot for your patch and your contribution. There is however
quite a lot to fix before it can be accepted in Buildroot. See below.

On Wed, Jul 01, 2026 at 07:16:20PM +0200, Love Fogelstr=F6m wrote:
> From: ljfogelstrom <ljfogelstrom@protonmail.com>
> =

> Signed-off-by: ljfogelstrom <ljfogelstrom@protonmail.com>

We will need your git configuration to be fixed so that your first
name/last name show up here.

The commit title should be just:

    package/postfix: new package

> diff --git a/package/postfix/0001-makedefs.patch b/package/postfix/0001-m=
akedefs.patch
> new file mode 100644
> index 0000000000..f54e98d982
> --- /dev/null
> +++ b/package/postfix/0001-makedefs.patch
> @@ -0,0 +1,203 @@
> +From a0cf1c49eb846a55d014ae91c24810c340e4e85a Mon Sep 17 00:00:00 2001
> +From: ljfogelstrom <ljfogelstrom@protonmail.com>
> +Date: Thu, 25 Jun 2026 11:56:40 +0200
> +Subject: [PATCH] makedefs+install
> +
> +Signed-off-by: ljfogelstrom <ljfogelstrom@protonmail.com>

Same: first name/last name.

But more important, we need:

1. A proper commit log that explains what is going on

2. The patch must be submitted upstream. We no longer accept "hacks"
   in Buildroot that are not submitted upstream. Each patch must have
   an Upstream: tag that points to the upstream submission.

> diff --git a/package/postfix/Config.in b/package/postfix/Config.in
> new file mode 100644
> index 0000000000..9305ce09cc
> --- /dev/null
> +++ b/package/postfix/Config.in
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_POSTFIX
> +	bool "postfix"
> +	depends on BR2_USE_MMU
> +	select BR2_PACKAGE_BERKELEYDB
> +	select BR2_PACKAGE_PCRE2
> +	help
> +	  Postfix Mail Transfer Agent
> +
> +	   http://postfix.org

Indentation for this line should be one tab + 2 spaces.

 +
> +if BR2_PACKAGE_POSTFIX
> +
> +	config BR2_PACKAGE_POSTFIX_ICU

Do not intend sub-options.

> +		bool "UTF-8 support"
> +		select BR2_PACKAGE_ICU

You need to replicate the depends on from ICU here:

        depends on BR2_INSTALL_LIBSTDCPP # icu
        depends on BR2_USE_WCHAR # icu
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # icu
        depends on BR2_HOST_GCC_AT_LEAST_7 # icu
        depends on BR2_TOOLCHAIN_HAS_THREADS # icu
	depends on !BR2_BINFMT_FLAT # icu

> +		help
> +		  Enable support for SMTPUTF8 with the ICU library
> +		  which allows international characters
> +		  in email addresses and headers.
> +	comment "icu needs a toolchain w/ C++, wchar, threads, gcc >=3D 7, host=
 gcc >=3D 7"

And this should be:

comment "UTF-8 support needs ..."

> diff --git a/package/postfix/init/systemd/postfix.service b/package/postf=
ix/init/systemd/postfix.service

File should be directly in package/postfix, the init/systemd subdirs
are not needed.

> new file mode 100644
> index 0000000000..7a72aaa8e5
> --- /dev/null
> +++ b/package/postfix/init/systemd/postfix.service

postfix doesn't provide upstream a proper systemd unit file?
> diff --git a/package/postfix/init/sysv/S51postfix b/package/postfix/init/=
sysv/S51postfix
> new file mode 100644
> index 0000000000..d3e6d61648
> --- /dev/null
> +++ b/package/postfix/init/sysv/S51postfix

No need for package/postfix/init/sysv/S51postfix, put it directly in
package/postfix.

Make sure to have a look at package/busybox/S01syslogd and use it as a
template for init scripts. You can also check out the Buildroot
manual. We try to have consistency between our initscripts.

> diff --git a/package/postfix/postfix.mk b/package/postfix/postfix.mk
> new file mode 100644
> index 0000000000..e2cda4e85f
> --- /dev/null
> +++ b/package/postfix/postfix.mk
> @@ -0,0 +1,94 @@
> +########################################################################=
########
> +#
> +# postfix
> +#
> +########################################################################=
########
> +
> +POSTFIX_VERSION =3D 3.11.4
> +POSTFIX_SITE =3D https://www.artfiles.org/postfix.org/postfix-release/of=
ficial

POSTFIX_LICENSE and POSTFIX_LICENSE_FILES must be added.

> +POSTFIX_DEPENDENCIES =3D berkeleydb pcre2
> +
> +ifdef BR2_PACKAGE_POSTFIX_ICU

ifeq ($(BR2_PACKAGE_POSTFIX_ICU),y)

> +POSTFIX_DEPENDENCIES +=3D icu
> +endif
> +
> +ifdef BR2_LINUX_KERNEL_VERSION
> +export pf_linux_release !=3D echo $(call qstrip,$(BR2_LINUX_KERNEL_VERSI=
ON)) | grep -Eo \
> +	"[1-7]\.[0-9]{1,3}(\.[0-9]{1,3})?"
> +else
> +export pf_linux_release =3D 6.12 # assuming we're building for linux, de=
fault version shouldn't matter
> +endif

Hu? What are you trying to do here?

> +pf_ccargs =3D -DNO_NIS -DNO_NISPLUS -DHAS_DEV_URANDOM $(strip $(TARGET_C=
FLAGS))
> +ifneq "$(strip $(TARGET_LDFLAGS))" ""
> +pf_ccargs +=3D -Wl,$(TARGET_LDFLAGS:$() $()=3D,)
> +endif

Variables should be in capital letters, and prefixed by the package
name, i.e POSTFIX_CFLAGS for example.

Why do you need to strip TARGET_CFLAGS?

What are you trying to do with TARGET_LDFLAGS?

> +pf_shared =3D $(if $(BR2_STATIC_LIBS),no,yes)

Variables should be in capital letters, and prefixed by the package
name, i.e POSTFIX_SHARED for example.

> +
> +pf_default_settings =3D config_directory=3D/etc/postfix \

Same comment.

> +			 command_directory=3D/usr/sbin \
> +			 daemon_directory=3D/usr/libexec/postfix \
> +			 data_directory=3D/var/lib/postfix \
> +			 html_directory=3Dno \
> +			 mail_owner=3Dpostfix \
> +			 mailq_path=3D/usr/bin/mailq \
> +			 manpage_directory=3D/usr/local/man \

Really relevant?

> +			 newaliases_path=3D/usr/bin/newaliases \
> +			 queue_directory=3D/var/spool/postfix \
> +			 readme_directory=3Dno \
> +			 sendmail_path=3D/usr/sbin/sendmail \
> +			 setgid_group=3Dpostdrop \
> +			 shlib_directory=3D/usr/lib/postfix \
> +			 meta_directory=3D/etc/postfix \
> +			 sample_directory=3D/etc/postfix \
> +			 mail_version=3D$(POSTFIX_VERSION)
> +
> +# Replace definitions in the 'makedefs' script to enable cross-compilati=
on.
> +define POSTFIX_CONFIGURE_CMDS
> +	[ ! -f $(@D)/makedefs.orig ] && mv -v $(@D)/makedefs $(@D)/makedefs.ori=
g;:

Why is this needed?

> +	/usr/bin/sed -E -e "s,/usr/,$(STAGING_DIR)/usr/,g" \

Use $(SED).

> +			 -e "s,\s/lib(32|64)?, $(STAGING_DIR)/lib\1,g" \
> +			 -e "s,(pcre2|icu|pkg)-config,$(STAGING_DIR)/bin/\1-config,g" \
> +			 -e "s,pkgconf,$(STAGING_DIR)/bin/pkgconf,g" \
> +			$(@D)/makedefs.orig >$(@D)/makedefs

Why aren't you doing this in place in $(@D)/makedefs ?

> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) \

Please pass $(TARGET_MAKE_ENV) in the environment.

> +		CCARGS+=3D"$(pf_ccargs)" \
> +		OPT=3D$(shell echo $(TARGET_CFLAGS) | grep -Eo "\-O([0-3gsz]|fast)?") \
> +		DEBUG=3D$(shell echo $(TARGET_CFLAGS) | grep -Eo "\-g[a-z0-9]*") \

This is a bit meh :/

> +		SHELL=3D"/bin/sh" \
> +		shared=3D$(pf_shared) makefiles -C $(@D)
> +	/usr/bin/sed -Ei -e "s,bin/postconf,:,g" \
> +			$(@D)/Makefile;: just in case
> +endef
> +
> +define POSTFIX_BUILD_CMDS
> +	$(MAKE) -C $(@D)

$(TARGET_MAKE_ENV) in the environment.

> +endef
> +
> +define POSTFIX_INSTALL_TARGET_CMDS
> +	$(MAKE) POSTFIX_INSTALL_OPTS=3D"install_root=3D$(TARGET_DIR) $(strip $(=
pf_default_settings))" \

Why do you need to strip $(pf_default_settings) ?

> +		non-interactive-package -C $(@D)
> +endef
> +
> +define POSTFIX_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 755 $(POSTFIX_PKGDIR)/init/sysv/*postfix $(TARGET_DIR)/et=
c/init.d

Please make this:

       $(INSTALL) -D -m 755 $(POSTFIX_PKGDIR)/S51postfix $(TARGET_DIR)/etc/=
init.d/S51postfix

> +	if [ "$(BR2_INIT_OPENRC)" ] ; then \
> +		if ! find -P $(TARGET_DIR)/etc/init.d -type f -name "sysv-rcs" ;\
> +		then \
> +			ln -st $(TARGET_DIR)/etc/runlevels/default \
> +				$(TARGET_DIR)/etc/init.d/*postfix ;\
> +		fi ;\
> +	fi

What are you trying to do here?

If you really need to so something related to openrc, then:

ifeq ($(BR2_INIT_OPENRC),y)
define POSTFIX_OPENRC_FIXUPS
       ...
endef
endif

define POSTFIX_INSTALL_INIT_SYSV
       ...
	$(POSTFIX_OPENRC_FIXUPS)
endef


> +define POSTFIX_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -m 644 $(POSTFIX_PKGDIR)/init/systemd/postfix.service $(TARG=
ET_DIR)/etc/systemd/system

Change to:

       $(INSTALL) -D -m 644 $(POSTFIX_PKGDIR)/postfix.service $(TARGET_DIR)=
/etc/systemd/system/postfix.service

> +endef
> +
> +define POSTFIX_USERS
> +	postfix -1 postfix -1 ! - - - Postfix Mail Transfer Agent
> +	postdrop -1 postdrop -1 ! - - -
> +endef
> +
> +$(eval $(generic-package))

Also, you need to add a .hash file.

And ideally, a runtime test in support/testing/ would be good for this
kind of package.

Could you try to work on a new iteration?

Thanks a lot!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
