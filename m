Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E45C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 19:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4206A61312;
	Fri, 16 May 2025 19:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOBx7T0a06On; Fri, 16 May 2025 19:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3149560AA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3149560AA9;
	Fri, 16 May 2025 19:14:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE9EE22CD
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A296D60841
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHQ1dL_tvJ4u for <buildroot@buildroot.org>;
 Fri, 16 May 2025 19:14:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4860260AA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4860260AA9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4860260AA9
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:14:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F14FA41DF4;
 Fri, 16 May 2025 19:14:49 +0000 (UTC)
Date: Fri, 16 May 2025 21:14:49 +0200
To: Guillaume Chaye <guillaume.chaye@zeetim.com>
Cc: buildroot@buildroot.org, Christopher McCrory <chrismcc@gmail.com>
Message-ID: <20250516211449.0e04ef51@windsurf>
In-Reply-To: <20250325134609.610846-2-guillaume.chaye@zeetim.com>
References: <20250325134609.610846-1-guillaume.chaye@zeetim.com>
 <20250325134609.610846-2-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfefhfekleeujefhieduhfdtjeeugeduhfejhedvteefkedthfegtdeikeejtdelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehguhhilhhlrghumhgvrdgthhgrhigvseiivggvthhimhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoo
 hhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheptghhrhhishhmtggtsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747422890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrttBgEbp5q3lj1vEjBEtR06vMzxXqaZW5bPv3rpV3U=;
 b=aMhhYTA8HzFL5+yeewirWy/YuGqDC2QxcUzMXtF3zaCHi57LyUErhoi+2VTx/vvfoMMZza
 258vkUSLDMLRpsNI0+70jpngfe3XXT8uKgcICviAuQargjjtVC+llzavRTbHdIkZkuuG1+
 NDvXi5ZyB/7WmlKtdAkwKCuSNbKJRnqknwCbqb6pHYPkF7F7bFlpNQ5+jjx96kRlHh4LjP
 VhrmomvLTjjgUJjE8prpxKNX6eLy01o8Q0HsGa+ihNOmZ7VlEN7/VSDW8h6xf2xq+wDh3Q
 8iZ8oCO9iXlKUDtoazJ/vceKdTXjyDupLuD1hSFrdLwRR9L/pKdltacRY5KsKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aMhhYTA8
Subject: Re: [Buildroot] [PATCH 2/2] package/efitools: efitools is a set of
 utilities to manipulate efi variables.
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

Hello Guillaume,

On Tue, 25 Mar 2025 09:46:09 -0400
Guillaume Chaye <guillaume.chaye@zeetim.com> wrote:

> Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>

The commit title should be:

	package/efitools: new package

without any full stop ("point final" in French) at the end.


> diff --git a/package/efitools/0001-Add-EXTRA_LDFLAGS-variable-to-Makefile.patch b/package/efitools/0001-Add-EXTRA_LDFLAGS-variable-to-Makefile.patch
> new file mode 100644
> index 0000000000..d931e9965b
> --- /dev/null
> +++ b/package/efitools/0001-Add-EXTRA_LDFLAGS-variable-to-Makefile.patch
> @@ -0,0 +1,61 @@
> +From 4847a5a8a46462ee3c6386e2333fb2be87fb9ae6 Mon Sep 17 00:00:00 2001
> +From: Guillaume Chaye <guillaume.chaye@zeetim.com>
> +Date: Fri, 24 Jan 2025 10:05:27 +0100
> +Subject: [PATCH] efitools: Add EXTRA_LDFLAGS variable to Makefile
> +
> +This patch allows to build binaries with proper rpath
> +
> +Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
> +Upstream: N/A

There is an upstream. Not very active yes, but there is an upstream.
The upstream maintainer, James Bottomley is still very active in the
Linux kernel community and he has replied on the mailing list not long
ago.

See: 

 https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/tree/README#n7

on how to contribute.

Also,
https://github.com/Wind-River/meta-secure-core/tree/master/meta-efi-secure-boot/recipes-bsp/efitools/efitools
is a layer that also packages efitools, and which has plenty of patches
doing more or less the same as yours. Could be a good idea to re-use
some of them.


> diff --git a/package/efitools/0003-Remove-EFISIGNED-variable-from-makefiles.patch b/package/efitools/0003-Remove-EFISIGNED-variable-from-makefiles.patch
> new file mode 100644
> index 0000000000..92d2c898e4
> --- /dev/null
> +++ b/package/efitools/0003-Remove-EFISIGNED-variable-from-makefiles.patch
> @@ -0,0 +1,31 @@
> +From f7b880dedc4f66c674406687fb6d357b146892ee Mon Sep 17 00:00:00 2001
> +From: Guillaume Chaye <guillaume.chaye@zeetim.com>
> +Date: Fri, 24 Jan 2025 11:55:05 +0100
> +Subject: [PATCH] efitools: remove EFISIGNED variable from makefiles
> +
> +Efitools sign efi files with a key generated during build.
> +We disable it to remove a build dependencie to sbsigntools.
> +These signed files were not actually installed to the target.
> +
> +Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
> +Upstream: N/A

I guess this patch will not be acceptable upstream.


> diff --git a/package/efitools/0004-Add-option-to-efi-updatevar-to-read-from-stdin.patch b/package/efitools/0004-Add-option-to-efi-updatevar-to-read-from-stdin.patch
> new file mode 100644
> index 0000000000..9704269116
> --- /dev/null
> +++ b/package/efitools/0004-Add-option-to-efi-updatevar-to-read-from-stdin.patch
> @@ -0,0 +1,74 @@
> +From 3c7fbc5e24634e229ea785e106382cef4c8eec5c Mon Sep 17 00:00:00 2001
> +From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
> +Date: Wed, 11 Sep 2024 10:52:19 +0200
> +Subject: [PATCH] efitools: add option to efi-updatevar to read from stdin
> + using -f- option
> +
> +The option "-f /dev/stdin" is actually not working.
> +This patch allow to pipe keys in your script without having errors.
> +
> +Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
> +Upstream: N/A

This clearly needs to be submitted upstream.

> ++	bool read_stdin=false;

Coding style: spaces around "=" sign.

> + 	
> + 
> + 	while (argc > 1 && argv[1][0] == '-') {
> +@@ -97,6 +99,10 @@ main(int argc, char *argv[])
> + 			file = argv[2];
> + 			argv += 2;
> + 			argc -= 2;
> ++		} else if (strcmp(argv[1], "-f-") == 0) {
> ++			read_stdin=true;

Same.

> ++			argv += 1;
> ++			argc -= 1;
> + 		} else if (strcmp(argv[1], "-g") == 0) {
> + 			if (str_to_guid(argv[2], &guid)) {
> + 				fprintf(stderr, "Invalid GUID %s\n", argv[2]);
> +@@ -147,7 +153,7 @@ main(int argc, char *argv[])
> + 		exit(1);
> + 	}
> + 
> +-	if (delsig == -1 && (!!file + !!hash_mode + !!crt_file != 1)) {
> ++	if (delsig == -1 && !read_stdin && (!!file + !!hash_mode + !!crt_file != 1)) {
> + 		fprintf(stderr, "must specify exactly one of -f, -b or -c\n");
> + 		exit(1);
> + 	}
> +@@ -219,7 +225,14 @@ main(int argc, char *argv[])
> + 		buf = malloc(st.st_size);
> + 		read(fd, buf, st.st_size);
> + 		close(fd);
> +-	} else {
> ++	}else if (read_stdin){

Space after {, space before {.

> ++		buf=malloc(0x400);

Space around "=".

> ++		st.st_size=0;

Ditto.

> ++		while (read(STDIN_FILENO,buf+st.st_size,1)){

Space before {. Spaces after , in the function call.

Not sure reading byte by byte stdin is the best solution. Also not sure
using st.st_size as the size counter is a good idea. Would make more
sense to have a separate size_t variable.


> diff --git a/package/efitools/efitools.mk b/package/efitools/efitools.mk
> new file mode 100644
> index 0000000000..1da3b88acf
> --- /dev/null
> +++ b/package/efitools/efitools.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# efitools
> +#
> +################################################################################
> +
> +EFITOOLS_VERSION = 	b988d20

Only one space after =, and we need the full commit hash.

> +EFITOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git
> +EFITOOLS_SITE_METHOD = git
> +EFITOOLS_LICENSE = GPL-2.0
> +EFITOOLS_LICENSE_FILES = COPYING
> +EFITOOLS_DEPENDENCIES = gnu-efi openssl
> +HOST_EFITOOLS_DEPENDENCIES = host-gnu-efi host-openssl host-perl-file-slurp

I'm still not sure to understand why the host needs
host-perl-file-slurp but not the target, even though you're building
both in (apparently) the same way.

> +define EFITOOLS_BUILD_CMDS
> +	cd $(@D); $(TARGET_CONFIGURE_OPTS) $(MAKE) SYSROOT_DIR=$(STAGING_DIR) EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"

Please use:

	$(MAKE) -C $(@D)

instead of:

	cd $(@D); $(MAKE)

(same below)

> +endef
> +
> +define HOST_EFITOOLS_BUILD_CMDS
> +	cd $(@D); $(HOST_CONFIGURE_OPTS) $(MAKE) SYSROOT_DIR=$(HOST_DIR) EXTRA_LDFLAGS="$(HOST_LDFLAGS)"
> +endef
> +
> +define EFITOOLS_INSTALL_TARGET_CMDS
> +	cd $(@D); $(TARGET_CONFIGURE_OPTS) $(MAKE) install DESTDIR=$(TARGET_DIR)
> +endef
> +
> +define HOST_EFITOOLS_INSTALL_CMDS
> +	cd $(@D); $(HOST_CONFIGURE_OPTS) $(MAKE) install DESTDIR=$(HOST_DIR)
> +endef
> +
> +define EFITOOLS_APPLY_ADDITIONAL_PATCHES
> +	$(APPLY_PATCHES) $(@D) $(EFITOOLS_PKGDIR)/target \*.patch
> +endef
> +EFITOOLS_POST_PATCH_HOOKS+=  EFITOOLS_APPLY_ADDITIONAL_PATCHES

No, we don't want to apply a specific set of patches depending on
whether we're building the host or target package. There should be one
single series of patches.



> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))
> diff --git a/package/efitools/target/0001-Build-only-binaries-when-cross-compiling.patch b/package/efitools/target/0001-Build-only-binaries-when-cross-compiling.patch
> new file mode 100644
> index 0000000000..9eeaaa1260
> --- /dev/null
> +++ b/package/efitools/target/0001-Build-only-binaries-when-cross-compiling.patch
> @@ -0,0 +1,43 @@
> +From 595a7dc8527f90ba6bf7e0218b00aa7f93885ef1 Mon Sep 17 00:00:00 2001
> +From: Guillaume Chaye <guillaume.chaye@zeetim.com>
> +Date: Fri, 24 Jan 2025 12:56:02 +0100
> +Subject: [PATCH] efitools: build only binaries when cross compiling
> +
> +We cannot execute binaries to generate "auth" files when compiling
> +for another architecture.
> +help2man is also not working properly when cross compiling.
> +
> +Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
> +Upstream: N/A

This unfortunately will not be upstreamable. You need to introduce
variables to allow disabling the build/installation of things that are
not possible/relevant.

Overall, the main concern is the set of patches that has not been
submitted upstream, while there is an upstream project.

Could you have a look at this, and submit patches upstream?

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
