From: fabrice.fontaine at orange.com <fabrice.fontaine@orange.com>
Date: Mon, 25 Apr 2016 14:31:26 +0000
Subject: [Buildroot] [PATCH 1/1] openzwave: new package
References: <18817_1461334846_571A333E_18817_3477_2_e09544cf-8249-4083-9f10-e131ddeb87e0@OPEXCLILM6D.corporate.adroot.infra.ftgroup>
 <20160423003957.215d1683@free-electrons.com> 
Message-ID: <25449_1461594686_571E2A3E_25449_11989_1_EEB3FED4859B6C488DDDEC4B2D3DE92B0FC5BD69@OPEXCLILM23.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

I sent a new patch with the changes requested by Thomas as well as the changes requested by Julien on Joris's patch.

Best Regards,

Fabrice

-----Message d'origine-----
De?: FONTAINE Fabrice IMT/OLPS 
Envoy??: lundi 25 avril 2016 09:14
??: 'Thomas Petazzoni'
Cc?: buildroot at buildroot.org; Yann E. MORIN; Arnout Vandecappelle
Objet?: RE: [Buildroot] [PATCH 1/1] openzwave: new package

Hello Thomas,

Thanks a lot for your review.

I will fix all the issues and send a new patch by the end of the day.
Concerning the email address, my contribution has been validated internally by Orange but I can use my personal email address to send the new patch if needed because I can't remove the footer added by the mail server.

Best Regards,

Fabrice

-----Message d'origine-----
De?: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
Envoy??: samedi 23 avril 2016 00:40
??: FONTAINE Fabrice IMT/OLPS
Cc?: buildroot at buildroot.org; Yann E. MORIN; Arnout Vandecappelle Objet?: Re: [Buildroot] [PATCH 1/1] openzwave: new package

Hello Fabrice,

First of all, thanks for your contribution!

On Fri, 22 Apr 2016 16:20:42 +0200, fabrice.fontaine at orange.com wrote:
> Free software library that interfaces with selected Z-Wave PC 
> controllers, allowing anyone to create applications that manipulate 
> and respond to devices on a Z-Wave network, without requiring in-depth 
> knowledge of the Z-Wave protocol
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

Your e-mail carries the following footer:

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration, Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law; they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

According to this, the contents of your e-mail are confidential, which is a bit annoying for things that are meant to be contributed to a public open-source project.

> diff --git a/package/0001-fix-wcsdup.patch 
> b/package/0001-fix-wcsdup.patch new file mode 100644 index 
> 0000000..f0807df
> --- /dev/null
> +++ b/package/0001-fix-wcsdup.patch
> @@ -0,0 +1,11 @@
> +diff -Naurp openzwave-v1.4/cpp/hidapi/linux/hid.c openzwave-v1.4-wcsdup/cpp/hidapi/linux/hid.c
> +--- openzwave-v1.4/cpp/hidapi/linux/hid.c	2016-04-22 15:17:56.753232758 +0200
> ++++ openzwave-v1.4-wcsdup/cpp/hidapi/linux/hid.c	2016-04-22 15:18:11.161482711 +0200

All patches should have a description + Signed-off-by. Also, since OpenZwave is on Github:

 - We want to have a Git formatted patch.

 - Please submit this patch upstream.

> diff --git a/package/openzwave/Config.in b/package/openzwave/Config.in 
> new file mode 100644 index 0000000..d959ae6
> --- /dev/null
> +++ b/package/openzwave/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_OPENZWAVE
> +	bool "openzwave"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_USE_WCHAR
> +	help
> +	  Free software library that interfaces with selected Z-Wave PC
> +	  controllers, allowing anyone to create applications that manipulate
> +	  and respond to devices on a Z-Wave network, without requiring
> +	  in-depth knowledge of the Z-Wave protocol
> +
> +	  http://www.openzwave.net
> +
> +comment "openzwave needs udev and a toolchain w/ C++, threads, wchar"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_PACKAGE_HAS_UDEV || !BR2_USE_WCHAR
> +

Unneeded empty new line at the end of file.

> diff --git a/package/openzwave/openzwave.mk 
> b/package/openzwave/openzwave.mk new file mode 100644 index
> 0000000..e6a4bd6
> --- /dev/null
> +++ b/package/openzwave/openzwave.mk
> @@ -0,0 +1,43 @@
> +#####################################################################
> +###########
> +#
> +# openzwave
> +#
> +#####################################################################
> +###########
> +
> +OPENZWAVE_VERSION = v1.4
> +OPENZWAVE_SITE = $(call
> +github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))

Since the source code is fetched from Github, please add a hash file to your package submission.

> +
> +# The OpenZWave Library is distributed under the LGPL Version 3 license.
> +# The Example Programs and some support files are distributed under # 
> +different licenses.

I generally like comments, but in this particular case, the comment does nothing but repeat what the <pkg>_LICENSE variable says, so I find the comment a bit useless.

> +OPENZWAVE_LICENSE = LGPLv3+, GPLv3 (examples), Apache-2.0 (sh2ju.sh) 
> +OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt \
> +	license/gpl.txt license/Apache-License-2.0.txt

I haven't checked the licenses. Arnout, can you fossilify this package to see what are the correct licenses?

> +OPENZWAVE_DEPENDENCIES = host-pkgconf udev OPENZWAVE_INSTALL_STAGING 
> += YES
> +
> +define OPENZWAVE_BUILD_CMDS
> +	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)

Please add $(TARGET_MAKE_ENV) in the environment:

	$(TARGET_MAKE_ENV) $(MAKE) ...

This mainly ensures that the PATH contains $(HOST_DIR)/usr/bin.

> +# Set pkgconfigdir to /usr/lib/pkgconfig to install libopenzwave.pc 
> +in the # correct directory otherwise openzwave will call # 
> +"pkg-config --variable pc_path pkg-config" which returns an incorrect 
> +value define OPENZWAVE_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(@D) \

Ditto TARGET_MAKE_ENV.

> +		PREFIX=/usr DESTDIR=$(STAGING_DIR) \
> +		pkgconfigdir=/usr/lib/pkgconfig \
> +		install
> +endef
> +
> +# Apply the same trick on pkgconfigdir even if libopenzwave.pc is not 
> +useful in # release directory define OPENZWAVE_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) \
> +		PREFIX=/usr DESTDIR=$(TARGET_DIR) \
> +		pkgconfigdir=/usr/lib/pkgconfig \
> +		install
> +endef

Other than that, it generally looks good. This pkgconfigdir trick is not nice, but it's probably the easiest solution indeed.

Could you rework your patch to take into account those comments, and send an updated version?

Please note that when sending new version, it should be indicated in the title [PATCH v3], and a changelog should be added in the patch, after the "---" marking the end of the commit log. This allows the reviewers to more easily keep track of what has been changed/fixed between revisions.

Thanks!

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com

_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
