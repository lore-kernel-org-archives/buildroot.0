Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6327BC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 09:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA1FF40576;
	Wed,  7 Aug 2024 09:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zgs-wEhwpwUO; Wed,  7 Aug 2024 09:48:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D33405F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D33405F4;
	Wed,  7 Aug 2024 09:48:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9951D1BF2CE
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8417D405EF
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2MdK9R7xOXp for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 09:48:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A3FD4042F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A3FD4042F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A3FD4042F
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 09:48:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FDDAFF802;
 Wed,  7 Aug 2024 09:48:49 +0000 (UTC)
Date: Wed, 7 Aug 2024 11:48:48 +0200
To: Shengwen Cheng <shengwen1997.tw@gmail.com>
Message-ID: <20240807114848.59c41e2f@windsurf>
In-Reply-To: <20240705132544.351613-1-shengwen1997.tw@gmail.com>
References: <20240705132544.351613-1-shengwen1997.tw@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723024130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezbVqDWf2ydKouKeHBkkI3T/R+tX6RXBPBoyu1ptqyI=;
 b=bfGAVxBpAIVCxOoOgsT3KWE5jDWV5EWbn4heniLMhICm2CmRgnCe7YAQFs3TURKw12ipTF
 XnxRavMxUtKUm0vwNnpyYXvZ8xQBhZwFACh1iiItk0BvGPd3kmb8yUxgQZCCIsUWV32e3Q
 CwBDV+HPaXHW91oxjR8QserLnoJlxKX3zEs585xL9Q+53t58IynZygEUYHbKgkn6ZeUpxn
 d1ZipMsTdd3bYl1r4rUJIP6G4pO39WCJWLR6GfYPrexRMQu89ntRJLNb22UKXIepqRBa0x
 +ghJFwy8ftm2kQYbJ1AOZoSr0DTirtqQ/iiAXsKoQiB2tDPgmZeJ7XcGyYek6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bfGAVxBp
Subject: Re: [Buildroot] [PATCH 1/1] package/directfb2: add directfb2
 packages
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jim Huang <jserv@ccns.ncku.edu.tw>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

First of all, thanks a lot for your contribution, and sorry for the
delay in getting back to you. See below a number of review comments: I
will reply point by point to your patch, so make sure to read the
entire e-mail below.

On Fri,  5 Jul 2024 21:25:44 +0800
Shengwen Cheng <shengwen1997.tw@gmail.com> wrote:

> This introduces DirectFB2, a fork of DirectFB to the Buildroot. The original
> DirectFB has not been maintained since 2016. Meanwhile, in 2022, DirectFB2 was
> announced at FOSDEM in Brussels, with the goal of maintaining DirectFB for use
> on embedded systems.

Could you comment on whether directfb2 is compatible with the original
directfb? Do we want to keep both package/directfb and add a separate
package/directfb2 ?

If they are compatible, then I believe we don't want to introduce a
separate package/directfb2 package, and instead we simply want to
update package/directfb to use version 2.x of DirectFB.

I think the main question is whether our current packages that depend
on DirectFB continue to build/work with DirectFB2. Namely:

- gst1-plugins-bad
- links
- lite
- DirectFB backend of Qt5
- sdl
- sdl2
- tekui
- vulkan-loader
- vulkan-tools

> New packages:
> 1. directfb2
> 2. directfb2-csource
> 3. directfb2-lite
> 4. directfb2-media
> 5. directfb2-tools
> 6. directfb2-examples
> 7. dfbterm

Each of those packages should be added by a separate patch, so for your
version 2 of this patch, we expect to receive a patch series containing
7 patches, each introducing one of those new packages (of course unless
we decide to upgrade package/directfb instead of introducing
package/directfb2).

> 
> [1] https://archive.fosdem.org/2022/schedule/event/directfb/attachments/slides/
> 5077/export/events/attachments/directfb/slides/5077/fosdem_2022_directfb2.pdf
> 
> Signed-off-by: Shengwen Cheng <shengwen1997.tw@gmail.com>
> ---
>  package/Config.in                             |   1 +
>  package/dfbterm/Config.in                     |  11 ++
>  package/dfbterm/dfbterm.mk                    |  14 +++
>  package/directfb2-csource/Config.in           |   6 +
>  .../directfb2-csource/directfb2-csource.mk    |  15 +++
>  package/directfb2-examples/Config.in          | 104 ++++++++++++++++++
>  .../directfb2-examples/directfb2-examples.mk  |  61 ++++++++++
>  package/directfb2-lite/Config.in              |   7 ++
>  package/directfb2-lite/directfb2-lite.mk      |  15 +++
>  package/directfb2-media/Config.in             |   6 +
>  package/directfb2-media/directfb2-media.mk    |  15 +++
>  package/directfb2-tools/Config.in             |   5 +
>  package/directfb2-tools/directfb2-tools.mk    |  14 +++
>  package/directfb2/Config.in                   |  70 ++++++++++++
>  package/directfb2/directfb2.mk                |  62 +++++++++++
>  15 files changed, 406 insertions(+)

For each new package, you need to add an entry in the DEVELOPERS file.
Make sure to do that in each patch adding each package.

Also please add a .hash file to each package, providing the hash for
the tarball, and the hash for the license files (see other packages to
have an idea of how it's done).

> diff --git a/package/Config.in b/package/Config.in
> index 550fdc1f41..d9b96201ff 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -346,6 +346,7 @@ comment "Graphic libraries"
>  	source "package/cegui/Config.in"
>  	source "package/directfb/Config.in"
>  	source "package/directfb-examples/Config.in"
> +	source "package/directfb2/Config.in"

I think we will want all packages Config.in files sourced from
package/Config.in, rather than package/directfb2/Config.in sourcing the
other packages. Indeed, they are other packages that are not
DirectFB-specific that can also depend/use DirectFB2, and they will not
be included from package/directfb2/Config.in.

>  	source "package/efl/Config.in"
>  	source "package/fb-test-app/Config.in"
>  	source "package/fbdump/Config.in"
> diff --git a/package/dfbterm/Config.in b/package/dfbterm/Config.in
> new file mode 100644
> index 0000000000..4258a857b9
> --- /dev/null
> +++ b/package/dfbterm/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_DFBTERM
> +	bool "DFBTerm"
> +	depends on BR2_PACKAGE_DIRECTFB2
> +	select BR2_PACKAGE_DIRECTFB2_LITE
> +	help
> +	  DFBTerm is a terminal emulator runnning on DirectFB2 and
> +	  based on libzvt.
> +
> +	  libzvt (Zed's virtual terminal emulation library) is
> +	  included directly in the source code, although it is
> +	  possible to use the system's libzvt library.

Then please package libzvt and use it. We very much prefer to use
external libraries than bundled ones.

> diff --git a/package/dfbterm/dfbterm.mk b/package/dfbterm/dfbterm.mk
> new file mode 100644
> index 0000000000..8f53883dfc
> --- /dev/null
> +++ b/package/dfbterm/dfbterm.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# dfbterm
> +#
> +################################################################################
> +
> +DFBTERM_VERSION = 0e78750b5e58655d521da54540dc0a9bdca2f840
> +DFBTERM_SITE = "https://github.com/directfb2/DFBTerm"

Double quotes are not needed here.

> +DFBTERM_SITE_METHOD = git

Please use the $(call github,...) macro instead (see other packages).

Does the project provide tagged releases, instead of using an arbitrary
commit?

> +DFBTERM_LICENSE = GPL-2.0

License is GPL-2.0+

> +DFBTERM_LICENSE_FILES = COPYING
> +DFBTERM_DEPENDENCIES = directfb2 directfb2-lite
> +
> +$(eval $(meson-package))
> diff --git a/package/directfb2-csource/Config.in b/package/directfb2-csource/Config.in
> new file mode 100644
> index 0000000000..0419bcb839
> --- /dev/null
> +++ b/package/directfb2-csource/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_DIRECTFB2_CSOURCE
> +	bool "directfb2-csource"
> +	depends on BR2_PACKAGE_DIRECTFB2
> +	help
> +	  directfb2-csource is a data header file generation utility for
> +	  DirectFB2 code.

Why would we need this tool on the target? I can understand why it
would be needed on the host machine at build time, but on the target?
Why would we want to generate data header files on the target?

> diff --git a/package/directfb2-csource/directfb2-csource.mk b/package/directfb2-csource/directfb2-csource.mk
> new file mode 100644
> index 0000000000..231c848442
> --- /dev/null
> +++ b/package/directfb2-csource/directfb2-csource.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# directfb2-csource
> +#
> +################################################################################
> +
> +DIRECTFB2_CSOURCE_VERSION = 2758dee7937e8850d6c8105bd6ef1db06c86064f
> +DIRECTFB2_CSOURCE_SITE = "https://github.com/directfb2/directfb-csource"
> +DIRECTFB2_CSOURCE_SITE_METHOD = git

Use github macro.

> +DIRECTFB2_CSOURCE_LICENSE = GPL-2.0

GPL-2.0+

> +DIRECTFB2_CSOURCE_LICENSE_FILES = COPYING
> +DIRECTFB2_CSOURCE_DEPENDENCIES = directfb2
> +DIRECTFB2_CSOURCE_INSTALL_STAGING = YES
> +
> +$(eval $(meson-package))
> diff --git a/package/directfb2-examples/Config.in b/package/directfb2-examples/Config.in
> new file mode 100644
> index 0000000000..05f34ee002
> --- /dev/null
> +++ b/package/directfb2-examples/Config.in
> @@ -0,0 +1,104 @@
> +menuconfig BR2_PACKAGE_DIRECTFB2_EXAMPLES
> +	bool "DirectFB2 examples"
> +	depends on BR2_PACKAGE_DIRECTFB2
> +	select BR2_PACKAGE_DIRECTFB2_CSOURCE
> +	help
> +	  The DirectFB2-examples package contains a set of simple
> +	  DirectFB2 applications that can be used to test and
> +	  demonstrate various DirectFB2 features. Note that DirectFB2
> +	  is a fork of DirectFB, as the original DirectFB stopped
> +	  being maintained in 2016.
> +
> +	  The official DirectFB2 website can be visited via
> +	  https://directfb2.github.io/
> +
> +if BR2_PACKAGE_DIRECTFB2_EXAMPLES
> +
> +choice
> +	prompt "DirectFBGL interface version"
> +	default BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_NULL
> +
> +config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_NULL
> +	bool "-"
> +comment "Build without version flag specified"
> +
> +config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_1
> +	bool "1"
> +comment "Pass -Ddirectfbgl=1 to the Meson build system"
> +
> +config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_2
> +	bool "2"
> +comment "Pass -Ddirectfbgl=2 to the Meson build system"

Don't use comments here, but put this in the help text of each option,
or the help text of the choice.

What does this option really does in the end? I.e why is it important
to expose it to the user?

> +
> +endchoice
> +
> +config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL
> +	string "PATH to OpenGL header"
> +	default ""

Should not be needed.

> +config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_CFLAGS
> +	string "CFLAGS of the OpenGL implementation"
> +	default ""

Ditto.

> +
> +config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_LDFLAGS
> +	string "LDFLAGS of the OpenGL implementation"
> +	default ""

Ditto.

> +# Disabled for now as directfb2-csource currently does not generate
> +# pkgconfig file
> +#
> +# choice
> +#	prompt "Select font header for DirectFB2 examples"
> +#	default BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DISABLED
> +#
> +# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DISABLED
> +#	bool "disabled"
> +#
> +# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DGIFF
> +#	bool "dgiff"
> +#
> +# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_ttf
> +#	bool "ttf"
> +#
> +#endchoice
> +
> +# Disabled for now as directfb2-csource currently does not generate
> +# pkgconfig file
> +#
> +# choice
> +#	prompt "Select image header for DirectFB2 examples"
> +#	default BR2_PACKAGE_DIRECTFB2_EXAMPLES_DISABLED
> +#
> +# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_DISABLED
> +#	bool "disabled"
> +#
> +# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_DFIFF
> +#	bool "dfiff"
> +#
> +# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_PNG
> +#	bool "png"
> +#
> +# endchoice
> +
> +# Disabled for now as directfb2-csource currently does not generate
> +# pkgconfig file
> +#
> +# choice
> +#	prompt "Select video header for DirectFB2 examples"
> +#	default BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DISABLED
> +#
> +# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DISABLED
> +#	bool "disabled"
> +#
> +# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DFVFF
> +#	bool "dfvff"
> +#
> +# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_M2V
> +#	bool "m2v"
> +#
> +# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_264
> +#	bool "264"
> +#
> +# endchoice

Please drop commented code. However, what is the problem with
directfb-source exactly? As explained above: you packaged
directfb-source as a target package, which is most likely incorrect as
this tool is very likely needed on the host instead, to be executed
during the build process.

> +
> +endif # BR2_PACKAGE_DIRECTFB2_EXAMPLES
> diff --git a/package/directfb2-examples/directfb2-examples.mk b/package/directfb2-examples/directfb2-examples.mk
> new file mode 100644
> index 0000000000..b627ba6906
> --- /dev/null
> +++ b/package/directfb2-examples/directfb2-examples.mk
> @@ -0,0 +1,61 @@
> +################################################################################
> +#
> +# directfb2-examples
> +#
> +################################################################################
> +
> +DIRECTFB2_EXAMPLES_VERSION = d627550430407ce6f1e42a861985ec42c0f4ac19
> +DIRECTFB2_EXAMPLES_SITE = "https://github.com/directfb2/DirectFB-examples"
> +DIRECTFB2_EXAMPLES_SITE_METHOD = git

github macro.

> +DIRECTFB2_EXAMPLES_LICENSE = MIT
> +DIRECTFB2_EXAMPLES_LICENSE_FILES = COPYING
> +DIRECTFB2_EXAMPLES_DEPENDENCIES = directfb2 directfb2-csource
> +
> +ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_1),y)
> +DIRECTFB2_EXAMPLES_CONF_OPTS += -Ddirectfbgl=1
> +else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_2),y)
> +DIRECTFB2_EXAMPLES_CONF_OPTS += -Ddirectfbgl=2
> +endif
> +
> +ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL)),)
> +DIRECTFB2_EXAMPLES_CONF_OPTS += -Dgl=$(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL)
> +endif
> +
> +ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_CFLAGS)),)
> +DIRECTFB2_EXAMPLES_CONF_OPTS += -Dgl-cflags=$(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_CFLAGS)
> +endif
> +
> +ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_LDFLAGS)),)
> +DIRECTFB2_EXAMPLES_CONF_OPTS += -Dgl-ldflags=$(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_LDFLAGS)
> +endif

I really don't think we want to GL related options. Could you explain
why they are needed?

> +# Disabled for now as directfb2-csource currently does not generate
> +# pkgconfig file

Please don't include commented out code.


> diff --git a/package/directfb2-lite/Config.in b/package/directfb2-lite/Config.in
> new file mode 100644
> index 0000000000..d76a2896e1
> --- /dev/null
> +++ b/package/directfb2-lite/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_DIRECTFB2_LITE
> +	bool "directfb2-lite"
> +	depends on BR2_PACKAGE_DIRECTFB2
> +	help
> +	  LiTE stands for Lightweight Toolkit Enabler and is a simple
> +	  user interface library on top of DirectFB2. Widgets can be
> +	  used with a default theme, or with its own custom theme.

Ah forgot about it for the other packages: the help text must end with
an empty line, followed by the URL of the upstream project page. You
can run "make check-package" to validate the coding style of your
packages.

> diff --git a/package/directfb2-lite/directfb2-lite.mk b/package/directfb2-lite/directfb2-lite.mk
> new file mode 100644
> index 0000000000..56cb099e98
> --- /dev/null
> +++ b/package/directfb2-lite/directfb2-lite.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# directfb2-lite
> +#
> +################################################################################
> +
> +DIRECTFB2_LITE_VERSION = 164bb5eca507c3cee1be2adf3798745f305495d7
> +DIRECTFB2_LITE_SITE = "https://github.com/directfb2/LiTE"
> +DIRECTFB2_LITE_SITE_METHOD = git

github macro.

> +DIRECTFB2_LITE_LICENSE = LGPL-2.1

LGPL2.1+

> diff --git a/package/directfb2-media/Config.in b/package/directfb2-media/Config.in
> new file mode 100644
> index 0000000000..1a0e09d077
> --- /dev/null
> +++ b/package/directfb2-media/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_DIRECTFB2_MEDIA
> +	bool "directfb2-media"
> +	depends on BR2_PACKAGE_DIRECTFB2
> +	help
> +	  DirectFB2-media contains additional font/image/music/video
> +	  providers for DirectFB2.

URL of the upstream project.

> diff --git a/package/directfb2-media/directfb2-media.mk b/package/directfb2-media/directfb2-media.mk
> new file mode 100644
> index 0000000000..50efa168d9
> --- /dev/null
> +++ b/package/directfb2-media/directfb2-media.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# directfb2-media
> +#
> +################################################################################
> +
> +DIRECTFB2_MEDIA_VERSION = 8f8cb02a3d67a3eb9726ca2927061e2697b7f2de
> +DIRECTFB2_MEDIA_SITE = "https://github.com/directfb2/DirectFB2-media"
> +DIRECTFB2_MEDIA_SITE_METHOD = git

github macro.

> +DIRECTFB2_MEDIA_LICENSE = LGPL-2.1

LGPL-2.1+

> diff --git a/package/directfb2-tools/Config.in b/package/directfb2-tools/Config.in
> new file mode 100644
> index 0000000000..f4d16596bc
> --- /dev/null
> +++ b/package/directfb2-tools/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_DIRECTFB2_TOOLS
> +	bool "directfb2-tools"
> +	depends on BR2_PACKAGE_DIRECTFB2
> +	help
> +	  DirectFB2-tools contains various DirectFB2 utilities.

URL of the upstream project.

> diff --git a/package/directfb2-tools/directfb2-tools.mk b/package/directfb2-tools/directfb2-tools.mk
> new file mode 100644
> index 0000000000..7930159f2b
> --- /dev/null
> +++ b/package/directfb2-tools/directfb2-tools.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# directfb2-tools
> +#
> +################################################################################
> +
> +DIRECTFB2_TOOLS_VERSION = 679838c281cbe7849011f7f6db1c815167c44fee
> +DIRECTFB2_TOOLS_SITE = "https://github.com/directfb2/DirectFB2-tools"
> +DIRECTFB2_TOOLS_SITE_METHOD = git

github macro.

> +DIRECTFB2_TOOLS_LICENSE = GPL-2.0

GPL-2.0+

> diff --git a/package/directfb2/Config.in b/package/directfb2/Config.in
> new file mode 100644
> index 0000000000..6ef6e69a07
> --- /dev/null
> +++ b/package/directfb2/Config.in
> @@ -0,0 +1,70 @@
> +menuconfig BR2_PACKAGE_DIRECTFB2
> +	bool "DirectFB2"

Just bool "directfb2"

And in fact, please do that for all packages: the bool string should be
exactly the name of the package.

> +	default n

Not needed, "default n" is the default.

> +	help
> +	  DirectFB2 is a fork of DirectFB (Direct Frame Buffer) whose
> +	  purpose is to preserve and maintain the DirectFB graphics
> +	  backend, particularly for use on embedded systems.
> +
> +	  The official DirectFB2 website can be visited via
> +	  https://directfb2.github.io/
> +
> +if BR2_PACKAGE_DIRECTFB2
> +
> +menu "DirectFB2 Options"
> +
> +config BR2_PACKAGE_DIRECTFB2_DRMKMS
> +	bool "Enable Linux DRM/KMS support"

No dependency on any library?

I see:

#include <xf86drm.h>
#include <xf86drmMode.h>

so presumably it needs some libraries?

> +config BR2_PACKAGE_DIRECTFB2_FBDEV
> +	bool "Enable Linux Framebuffer support"
> +
> +config BR2_PACKAGE_DIRECTFB2_LINUX_INPUT
> +	bool "Enable Linux input support"

> +
> +if BR2_X86_CPU_HAS_MMX
> +config BR2_PACKAGE_DIRECTFB2_MMX
> +	bool "Enable MMX assembly support"
> +	default y

No need to have an option, just enable MMX support in the .mk file when
BR2_X86_CPU_HAS_MMX=y.

> +config BR2_PACKAGE_DIRECTFB2_MULTI
> +	bool "Enable multi application support"
> +
> +config BR2_PACKAGE_DIRECTFB2_MULTI_KERNEL
> +	bool "Enable Linux fusion device support for multi application"
> +	select BR2_PACKAGE_DIRECTFB2_MULTI

This option BR2_PACKAGE_DIRECTFB2_MULTI does not exist in your submission.

> +# if BR2_ARM_CPU_HAS_NEON
> +# config BR2_PACKAGE_DIRECTFB2_NEON
> +#	bool "Enable NEON assembly support"
> +#	default y
> +# endif # BR2_ARM_CPU_HAS_NEON
> +#
> +# DirectFB2 currently has issues enabling NEON. For more details, see:
> +# https://github.com/directfb2/DirectFB2/issues/142

Then, please don't include any code related to that, and just disable
NEON support in the .mk file.


> +menu "DirectFB2 Applications"
> +source "package/directfb2-examples/Config.in"
> +source "package/dfbterm/Config.in"
> +endmenu
> +
> +menu "DirectFB2 Utilities"
> +source "package/directfb2-media/Config.in"
> +source "package/directfb2-tools/Config.in"
> +source "package/directfb2-csource/Config.in"
> +source "package/directfb2-lite/Config.in"
> +endmenu

As said previously, these includes should go in package/Config.in.

> diff --git a/package/directfb2/directfb2.mk b/package/directfb2/directfb2.mk
> new file mode 100644
> index 0000000000..197ff38632
> --- /dev/null
> +++ b/package/directfb2/directfb2.mk
> @@ -0,0 +1,62 @@
> +################################################################################
> +#
> +# directfb2
> +#
> +################################################################################
> +
> +DIRECTFB2_VERSION = 2952d1d16b546be09e1cbb5da5e0c718d8f5ee32
> +DIRECTFB2_SITE = "https://github.com/directfb2/DirectFB2"
> +DIRECTFB2_SITE_METHOD = git

github macro.

> +DIRECTFB2_LICENSE = LGPL-2.1

LGPL-2.1+

> +DIRECTFB2_LICENSE_FILES = COPYING
> +DIRECTFB2_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_DIRECTFB2_DRMKMS),y)
> +DIRECTFB2_CONF_OPTS += -Ddrmkms=true
> +endif

Please disable explicitly:

else
DIRECTFB2_CONF_OPTS += -Ddrmkms=false
endif

Also as stated above, doesn't this require an external library?

> +
> +ifeq ($(BR2_PACKAGE_DIRECTFB2_FBDEV),y)
> +DIRECTFB2_CONF_OPTS += -Dfbdev=true
> +endif

Disable explicitly.

> +
> +ifeq ($(BR2_PACKAGE_DIRECTFB2_LINUX_INPUT),y)
> +DIRECTFB2_CONF_OPTS += -Dlinux_input=true
> +endif

Ditto.

> +
> +ifeq ($(BR2_PACKAGE_DIRECTFB2_MMX),y)
> +DIRECTFB2_CONF_OPTS += -Dmmx=true
> +else ifeq ($(BR2_PACKAGE_DIRECTFB2_MMX),n)
> +DIRECTFB2_CONF_OPTS += -Dmmx=false
> +endif

Directly use BR2_X86_CPU_HAS_MMX.

> +
> +ifeq ($(BR2_PACKAGE_DIRECTFB2_MULTI),y)
> +DIRECTFB2_CONF_OPTS += -Dmulti=true
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DIRECTFB2_MULTI_KERNEL),y)
> +DIRECTFB2_CONF_OPTS += -Dmulti-kernel=true
> +endif

As explained above: this doesn't work, you didn't add the package that
was needed.

> +
> +# ifeq ($(BR2_PACKAGE_DIRECTFB2_NEON),y)
> +# DIRECTFB2_CONF_OPTS += -Dneon=true
> +# else ifeq ($(BR2_PACKAGE_DIRECTFB2_NEON),y)
> +# DIRECTFB2_CONF_OPTS += -Dneon=false
> +# endif
> +#
> +# DirectFB2 currently has issues enabling NEON. For more details, see:
> +# https://github.com/directfb2/DirectFB2/issues/142
> +DIRECTFB2_CONF_OPTS += -Dneon=false

Just keep this, and not the commented condition above.

> +
> +ifeq ($(BR2_PACKAGE_DIRECTFB2_NETWORK),y)
> +DIRECTFB2_CONF_OPTS += -Dnetwork=true
> +endif

Disable explicitly.

> +
> +ifeq ($(BR2_PACKAGE_DIRECTFB2_SENTINELS),y)
> +DIRECTFB2_CONF_OPTS += -Dsentinels=true
> +endif

Same.

> +
> +ifeq ($(BR2_PACKAGE_DIRECTFB2_SMOOTH_SCALING),y)
> +DIRECTFB2_CONF_OPTS += -Dsmooth-scaling=true
> +endif

Same.

Could you have a look at those review comments and send a new
iteraiton? Most of them are fairly trivial things. Really the only
important consideration is whether we want package/directfb2 as a new
separate package or if we want to upgrade package/directfb.

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
