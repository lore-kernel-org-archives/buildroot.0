Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23B3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 13:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57B8140352;
	Thu, 30 Dec 2021 13:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmA9exw4TK2A; Thu, 30 Dec 2021 13:37:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49E1440523;
	Thu, 30 Dec 2021 13:37:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73C701BF408
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 13:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B6FC60BFE
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 13:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lSpwX8URYNZR for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 13:37:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E906660BEC
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 13:37:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7B7DAE0008;
 Thu, 30 Dec 2021 13:37:02 +0000 (UTC)
Date: Thu, 30 Dec 2021 14:37:01 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211230143701.4dcc6915@windsurf>
In-Reply-To: <20211230012836.3350448-1-aduskett@gmail.com>
References: <20211230012836.3350448-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/python-setuptools: bump to
 version 60.2.0 and split python2 version
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Wed, 29 Dec 2021 17:28:34 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> Python setuptools 44.0 is not compatible with python 3.10. Unfortunately,
> python-setuptools 60.2.0 is not compatible with python2. As Buildroot is not
> ready to end python2 support, the python-setuptools package must accommodate
> both the old version for python2 and the new version for python3.10.
> 
> Changes include:
>  - Add two new directories: package/python-setuptools/44.0.0 and
>    package/python-setuptools/60.2.0
>  - Add the appropriate patch and hash files to each directory.
>  - Modify python-setuptools.mk to support both setuptools 44.0 and 60.2.0
>    (setuptools 60.2.0 does not have a .zip on pypi anymore, only a tar.gz)
>  - Point the symlinks in package/python3-setuptools to the files in
>    package/python-setuptools/60.2.0/
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Thanks for working on this!

Unfortunately, there are a number of problems with the patch.

First, there's a trivial issue: the URL you're using for setuptools
60.2.0 simply doesn't work, it returns a 404. The correct URL is:

https://files.pythonhosted.org/packages/9b/be/13f54335c7dba713b0e97e11e7a41db3df4a85073d6c5a6e7f6468b22ee2

Then, the second problem is that your patch breaks the build of the
python3 package, in the following basic configuration:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_SETUPTOOLS=y
# BR2_TARGET_ROOTFS_TAR is not set

I've posted the full build log at https://paste.ack.tf/d1bd39@raw,
because I'm not exactly sure which of the error message causes the
build failure.

Note: I have reproduced this issue with just your setuptools patch
applied, *not* with the python 3.10 bump applied.

Then, there is a design problem in your patch that will cause breakage
in some configurations. For example, in a configuration with neither
python nor python3 selected for the target, if host-python-setuptools
gets built, the build fails, because you download version 60.2.0, while
you should be downloading the older version.

In fact this python-setuptools package is a bit weird:

 * The target variant must adapt to python or python3

 * The host variant must always build for python2 (hence the
   NEEDS_HOST_PYTHON = python2)

To address this, I have rewritten python-setuptools.mk as follows:

################################################################################
#
# python-setuptools
#
################################################################################

# For the target variant, we adapt the version depending on whether
# Python 3.x or 2.x is selected for the target.
ifeq ($(BR2_PACKAGE_PYTHON3),y)
PYTHON_SETUPTOOLS_VERSION = 60.2.0
PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/9b/be/13f54335c7dba713b0e97e11e7a41db3df4a85073d6c5a6e7f6468b22ee2
else # Python
PYTHON_SETUPTOOLS_VERSION = 44.0.0
PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
endif

# The host variant is only for Python 2.x, so we need to use 44.0.0.
HOST_PYTHON_SETUPTOOLS_VERSION = 44.0.0
HOST_PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
HOST_PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON = python2

PYTHON_SETUPTOOLS_LICENSE = MIT
PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools

ifeq ($(BR2_PACKAGE_PYTHON),y)
define PYTHON_SETUPTOOLS_EXTRACT_CMDS
        $(UNZIP) -d $(@D) $(PYTHON_SETUPTOOLS_DL_DIR)/$(PYTHON_SETUPTOOLS_SOURCE)
        mv $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)/* $(@D)
        $(RM) -r $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)
endef
endif

define HOST_PYTHON_SETUPTOOLS_EXTRACT_CMDS
        $(UNZIP) -d $(@D) $(HOST_PYTHON_SETUPTOOLS_DL_DIR)/$(PYTHON_SETUPTOOLS_SOURCE)
        mv $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)/* $(@D)
        $(RM) -r $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)
endef

$(eval $(python-package))
$(eval $(host-python-package))

To test a patch like this, here are the combinations that need to be
tested:

 * Build a basic configuration with neither python/python3 enabled, and
   run "make host-python-setuptools"

 * Build a basic configuration with neither python/python3 enabled, and
   run "make host-python3-setuptools"

 * Build a basic configuration with python + target python-setuptools
   enabled. Once built, run "make host-python3-setuptools"

 * Build a basic configuration with python3 + target python-setuptools
   enabled. Once built, run "make host-python-setuptools"

Ideally, we should have test cases for these 4 situations. But the
testing infrastructure doesn't yet allow to easily invoke custom make
targets.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
