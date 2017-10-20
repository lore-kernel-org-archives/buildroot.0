From: Romain GIMENEZ <romain.gimenez@protonmail.ch>
Date: Fri, 20 Oct 2017 16:36:52 -0400
Subject: [Buildroot] make: user generic package seems ignored
In-Reply-To: <20171020220337.57aa2a8c@gmx.net>
References: <HPj5HjTWoMDOljvL-xyEUyjAnSw4xmReOOp2xBO7hhQIfDaLMaZJXkR1fAHVdioBak50xdOoLNmz6VcgwMsMdVn9vuv897eCms7xgoTy3NM=@protonmail.ch>
 <rcbVjJCgYbsBNkxxQd9Vtizduo4vtAhE62zCPxVqpCm_GP5RQp7pcUF7fktBNLflGP_T5jNYFXIoubRXPDaBQvGiyFkzUxDfC9JP7sYABIk=@protonmail.ch>
 <20171020220337.57aa2a8c@gmx.net>
Message-ID: <jKB3HEoMOunXpTXwMfLSJPI8-C7K_jPthbFRuWRlHlPVvCIGcr8lvrHQxbZi4OChPojxCb5qYMowTcRQYe2HYHqqoauV4BELSpfjS7nY_EE=@protonmail.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Thank you so much! I can't believe I've missed the "_PACKAGE_" part from the documentation. I've been searching for the whole week... Now I feel stupid thinking I should have read the fucking manual more carefully... :)

Sorry for the duplicated message by the way all...

Regards,
Romain

Envoy? depuis ProtonMail mobile

-------- Message d'origine --------
On 20 oct. 2017 22:03, Peter Seiderer a ?crit :

> Hello Romain,
>
> On Fri, 20 Oct 2017 14:57:50 -0400, Romain GIMENEZ  wrote:
>
>> Hello all,
>>
>> I'm trying to add a custom package to my buildroot setup (master branch from the git repo). I have created two files (content at the end of this message) in a new folder buildroot/package/test:
>> - test.mk
>> - Config.in
>>
>> I've added a link to this Config.in file in the file package/Config.in so I can un/select the package from the menu.
>>
>> The issue is that when use the "make" command my custom package is just ignored. Is there something I'm missing please? Do I need to add a reference to the .mk file somewhere ? Thanks in advance.
>>
>> Regards,
>> Romain GIMENEZ
>>
>> Sent with [ProtonMail](https://protonmail.com) Secure Email.
>> ----------------------------------------
>> test.mk:
>> TEST_VERSION = 3.0.15
>> TEST_SOURCE = resource.language.fr_fr-$(TEST_VERSION).zip
>> TEST_SITE = http://mirrors.kodi.tv/addons/krypton/resource.language.fr_fr
>> TEST_DEPENDENCIES = kodi
>>
>> KODI_PLUGIN_TARGET_DIR=$(TARGET_DIR)/usr/share/kodi/addons
>>
>> define TEST_EXTRACT_CMDS
>> $(info extract_test)
>> unzip -q -o $(DL_DIR)/$(TEST_SOURCE) -d $(@D)
>> endef
>>
>> define TEST_INSTALL_TARGET_CMDS
>> $(info install_test)
>> mkdir -p $(KODI_PLUGIN_TARGET_DIR)
>> cp -r $(@D)/TEST $(KODI_PLUGIN_TARGET_DIR)
>> endef
>>
>> $(eval $(generic-package))
>> -----------------------------------------
>> Config.in:
>>
>> config BR2_TEST
>> depends on BR2_PACKAGE_KODI
>> bool "test"
>> help
>> test
>
> Try to chaange to:
> --- begin---
> config BR2_PACKAGE_TEST
> bool "test"
> depends on BR2_PACKAGE_KODI
> help
> test
>
> comment "test needs kodi"
> depends on !BR2_PACKAGE_KODI
> --- end ---
>
> And check for the following entry in your .config file (after enabling your new test package):
>
> BR2_PACKAGE_TEST=y
>
> And for multiple runs remove the already build test package:
>
> rm -rf build/test-3.0.15
>
> Regards,
> Peter
>
> @protonmail.ch>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171020/80ec4d8a/attachment.html>
