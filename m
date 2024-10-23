Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F1DCFA474
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 974F740909;
	Wed, 23 Oct 2024 20:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Ye-H8nBHG_e; Wed, 23 Oct 2024 20:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE95D408F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE95D408F0;
	Wed, 23 Oct 2024 20:55:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CDB2D972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A41A740925
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRTgwiW5z7Lz for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:55:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9318F40148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9318F40148
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9318F40148
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:55:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3DDBC0005;
 Wed, 23 Oct 2024 20:55:35 +0000 (UTC)
Date: Wed, 23 Oct 2024 22:55:34 +0200
To: Ayrton Leyssens <aleyssens@idtech.be>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20241023225534.34ed60ff@windsurf>
In-Reply-To: <VI1PR06MB8926C0355B067317D6675B37AD432@VI1PR06MB8926.eurprd06.prod.outlook.com>
References: <VI1PR06MB8926C0355B067317D6675B37AD432@VI1PR06MB8926.eurprd06.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729716936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Omqysq7s2H4fox5qGFIuRoD3052/I36ydu8tswfgAc=;
 b=L4jshBOl21oK44DR4K0+Y1xcVjDSNipRQvBcl+PUjiURtD+8nsjnTOz8aFXpdZ4TFgZczQ
 xEUBeGe0oh9DF+l+vHyLPm619fgkvVY/Qv1wHFX7I5yBJwAG21KRitFTP7ThqYGVEOVw81
 xiRbb0AqDIGGPGNCujRpLDFByNqILcmaJb3NaUrv1OcWVsDenbzk/0CTlFLMJIctZUp+Gd
 Qifyqyr8+Cqkrvn+eELrZ8qRnanvoTODuaHCVMDQRACpl+kTuF5EixePAmWlasIeLjHvc1
 bxGh+9qhjwiJQooTPsR0/ttLXKh0JLCvldFOs7BOE0sZxig/4McAkx01I6kBzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L4jshBOl
Subject: Re: [Buildroot] [PATCH 1/1] package/certmonger: add certmonger
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ayrton,

Thanks for your patch! Here as well, I have a number of comments.

First, same as the other patch, the commit title should be:

	package/certmonger: new package

On Mon, 21 Oct 2024 11:56:54 +0000
Ayrton Leyssens <aleyssens@idtech.be> wrote:

> Added support for the certmonger package (version 0.79.20).
> Certmonger is used to monitor certificates and can refresh the certificate with the help of a CA.
> In today's age, cybersecurity is a critical need for network connected devices.
> Certmonger can help maintain all the certificate stuff so the user itself has less to worry about.

Please wrap the commit log to ~80 columns.

I think the sentence "In today's age, cybersecurity is a critical need
for network connected devices." is quite useless in such a commit log.

> Signed-off-by: Ayrton aleyssens@idtech.be<mailto:aleyssens@idtech.be>

Please fix your Signed-off-by line, like explained on the libevent
patch.

> ---
> package/Config.in                  |  1 +
> package/certmonger/Config.in       | 19 +++++++++++++++++++
> package/certmonger/certmonger.hash |  2 ++
> package/certmonger/certmonger.mk   | 25 +++++++++++++++++++++++++
> 4 files changed, 47 insertions(+)

Please add an entry in the DEVELOPERS file.

> create mode 100644 package/certmonger/Config.in
> create mode 100644 package/certmonger/certmonger.hash
> create mode 100644 package/certmonger/certmonger.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index d4cc03dcdb..73efaae622 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2688,6 +2688,7 @@ endif
>                source "package/zabbix/Config.in"
>                source "package/zeek/Config.in"
>                source "package/znc/Config.in"
> +             source "package/certmonger/Config.in"

Indentation and alphabetic ordering should be fixed here.

>  endmenu
> diff --git a/package/certmonger/Config.in b/package/certmonger/Config.in
> new file mode 100644
> index 0000000000..9d0e112b5a
> --- /dev/null
> +++ b/package/certmonger/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_CERTMONGER
> +             bool "Certmonger"
> +             select BR2_PACKAGE_LIBTALLOC
> +             select BR2_PACKAGE_LIBTEVENT
> +             select BR2_PACKAGE_DBUS
> +             select BR2_PACKAGE_LIBNSS
> +             select BR2_PACKAGE_LIBXML2
> +             select BR2_PACKAGE_LIBCURL
> +             select BR2_PACKAGE_JANSSON
> +             select BR2_PACKAGE_LIBKRB5
> +             select BR2_PACKAGE_POPT
> +             select BR2_PACKAGE_LIBOPENSSL
> +             select BR2_PACKAGE_POPT
> +             select BR2_PACKAGE_OPENLDAP
> +             help

Indentation of bool, select and help should be one tab.

The select entries should be alphabetically sorted.

Also, are you sure all those dependencies are mandatory dependencies,
i.e certmonger cannot be built without them?

Finally, many of those options that you select have "depends on". You
need to replicate them here. For example, BR2_PACKAGE_OPENLDAP has:

        depends on BR2_USE_WCHAR
        depends on BR2_USE_MMU # needs fork()

so you need to add:

        depends on BR2_USE_WCHAR # openldap
        depends on BR2_USE_MMU # openldap

to this BR2_PACKAGE_CERTMONGER option. And do that for all other
options you are select-ing.


> +               Certmonger is a service which attempts to simplify
> +               interaction with certifying authorities (CAs) on
> +               networks which use public-key infrastructure (PKI).

Indentation of help text should be one tab + two spaces.

(Make sure to run "make check-package" to find all those small coding
style details).

The help text should also be followed by the upstream URL of the
project, see all other packages.

> +
> diff --git a/package/certmonger/certmonger.hash b/package/certmonger/certmonger.hash
> new file mode 100644
> index 0000000000..653ba1dcfc
> --- /dev/null
> +++ b/package/certmonger/certmonger.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  1e66094ef4130fc15c8acf5abfca097c2f8f40f57f699f80bb14e9941260d473  certmonger-0.79.20-git4.tar.gz

Please add the hash of the license file.

> diff --git a/package/certmonger/certmonger.mk b/package/certmonger/certmonger.mk
> new file mode 100644
> index 0000000000..c6a9c179e4
> --- /dev/null
> +++ b/package/certmonger/certmonger.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# CERTMONGER

lower case.

> +#
> +################################################################################
> +
> +CERTMONGER_VERSION = 0.79.20
> +CERTMONGER_SITE = https://pagure.io/certmonger.git
> +CERTMONGER_LICENSE_FILES = LICENSE

Please add CERTMONGER_LICENSE, which it seems is "GPL-3.0+ with OpenSSL
exception".

> +CERTMONGER_NAME = certmonger

Not useful.

> +CERTMONGER_SITE_METHOD = git
> +CERTMONGER_DEPENDENCIES = openssl dbus libtalloc libtevent libnss libcurl jansson libkrb5 openldap popt libxml2

Please sort alphabetically.

> +
> +MY_CFLAGS = $(TARGET_CFLAGS) -lssl -ldbus-1 -ltalloc -ltevent -lnss -lcurl -ljansson -lkrb5 -lldap -lpopt -lxml2 -lcom_err

This variable shouldn't be named MY_CFLAGS: all variables in a package
should start with the package name, i.e here CERTMONGER_<something>.
However, why do you need this special CFLAGS variable? It only contains
libraries that should be detected by the configure script of
certmonger, so this variable really shouldn't be needed.

> +define CERTMONGER_RUN_AUTOGEN
> +             cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +CERTMONGER_PRE_CONFIGURE_HOOKS += CERTMONGER_RUN_AUTOGEN

Please use instead CERTMONGER_AUTORECONF = YES instead. Indeed what you
did doesn't work, because it doesn't add host-autoconf, host-automake
and host-libtool to certmonger's dependencies.

> +define CERTMONGER_BUILD_CMDS
> +             $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CXX="$(TARGET_CXX)" CFLAGS="$(MY_CFLAGS)"

Why is this needed?

certmonger seems like a quite complicated package. Is there a way to
easily test it? If so, it would be good to add a runtime test in
support/testing/.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
