Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6A0C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 13:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 193F060A8B;
	Sat, 22 Jan 2022 13:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1QeE3o91bmcQ; Sat, 22 Jan 2022 13:20:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CDF66068D;
	Sat, 22 Jan 2022 13:20:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 145861BF3D5
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 102E6414E7
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24ROQAE6E5Lw for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 13:20:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 960DD414CD
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 13:20:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 646B5240003;
 Sat, 22 Jan 2022 13:20:47 +0000 (UTC)
Date: Sat, 22 Jan 2022 14:20:46 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Tom Marcuzzi <tom.marcuzzi@orolia.com>
Message-ID: <20220122142046.14e8ff50@windsurf>
In-Reply-To: <20220119140703.12978-1-tom.marcuzzi@orolia.com>
References: <20220119140703.12978-1-tom.marcuzzi@orolia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] packages/nodejs: install npm packages
 on host
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Tom,

On Wed, 19 Jan 2022 15:07:03 +0100
Tom Marcuzzi <tom.marcuzzi@orolia.com> wrote:

> Signed-off-by: Tom Marcuzzi <tom.marcuzzi@orolia.com>
> ---
>  package/nodejs/Config.in.host | 32 ++++++++++++++++++++++++++++++++
>  package/nodejs/nodejs.mk      | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)

Thanks for your patch. Since the change is non-trivial, it would be
good to have some details in the commit log about the motivations for
the change. I suppose your build process at some point requires NodeJS
on the host ?

> diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
> index 4ceaf0c73e..601eb6e052 100644
> --- a/package/nodejs/Config.in.host
> +++ b/package/nodejs/Config.in.host
> @@ -16,3 +16,35 @@ config BR2_PACKAGE_HOST_NODEJS
>  comment "host nodejs needs a host gcc >= 8"
>  	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>  	depends on !BR2_HOST_GCC_AT_LEAST_8
> +
> +if BR2_PACKAGE_HOST_NODEJS
> +
> +	config BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL
> +		string "Additional modules"

Please don't indent options, so remove the leading tab on all those
lines.

> +		help
> +		  List of space-separated nodejs modules to install via npm.

Perhaps clarify that they will be installed for the host NodeJS.

> +		  See https://npmjs.org/ to find modules and 'npm help install'
> +		  for available installation methods. For repeatable builds,
> +		  download and save tgz files or clone git repos for the
> +		  components you care about.
> +
> +		  Example:
> +		  serialport uglify-js@1.3.4 /my/module/mymodule.tgz \
> +		  	git://github.com/someuser/somemodule.git#v1.2
> +
> +		  This would install the serialport module (at the newest
> +		  version), the uglify-js module at 1.3.4, a module from a
> +		  filesystem path, and a module from a git repository.
> +
> +	config BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL_DEPS
> +		string "Additional module dependencies"
> +		help
> +		  List of space-separated buildroot recipes which must be
> +		  built before your npms can be installed. For example, if in
> +		  'Additional modules' you specified 'node-curl' (see:
> +		  https://github.com/jiangmiao/node-curl), you could then
> +		  specify 'libcurl' here, to ensure that buildroot builds the
> +		  libcurl package, and does so before building your node
> +		  modules.

The libcurl example here is bad, because this
BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL_DEPS option should only
contain host packages, and never target packages. So the example should
mention host-libcurl and not libcurl.

Also, this new option BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL_DEPS
is not used anywhere. You forgot to change:

HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-python3 host-zlib

to:

HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-python3 host-zlib \
	$(call qstrip,(BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL_DEPS))

Could you have a look at the above questions, so that we can resolve
the open points, and converge towards a solution that we can merge ?

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
