From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Jun 2014 21:00:48 -0500
Subject: [Buildroot] [PATCH 3/3] fmc: new package
In-Reply-To: <20140610222148.3ad9a8e7@free-electrons.com>
References: <1402412526-24844-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1402412526-24844-4-git-send-email-matthew.weber@rockwellcollins.com>
 <20140610222148.3ad9a8e7@free-electrons.com>
Message-ID: <CANQCQpbvOgFhcOpu2V3UWnvDaYhjctydGY4yrLVf4Q8p1vzT4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Jun 10, 2014 at 3:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Matt Weber,
>
> On Tue, 10 Jun 2014 08:02:06 -0700, Matt Weber wrote:
>
>> diff --git a/package/fmc/Config.in b/package/fmc/Config.in
>> new file mode 100644
>> index 0000000..9530756
>> --- /dev/null
>> +++ b/package/fmc/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_FMC
>> +     bool "fmc"
>> +     depends on BR2_powerpc_e500mc
>> +     select BR2_PACKAGE_TCLAP
>
> Propagate the C++ dependency of tclap here.

Agreed.

>
>> +     select BR2_PACKAGE_LIBXML2
>> +     select BR2_PACKAGE_FMLIB
>> +     help
>> +       The Frame Manager Configuration tool is a software package whose primary
>> +       purpose is converting Parse-Classify-Police-Distribute (PCD) descriptions of
>> +       network packets flow into hardware configuration. The tool provides an
>> +       abstraction layer between the end customer's vision of the PCD task
>> +       definition and real hardware implementation.
>
> Length of lines too long. It would be good to mention that it's
> specific to Freescale PowerPC machines at the beginning of the
> description.

Agreed.

>
>> +
>> +       http://cache.freescale.com/files/32bit/doc/app_note/AN4760.pdf
>> diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
>> new file mode 100644
>> index 0000000..513a8ef
>> --- /dev/null
>> +++ b/package/fmc/fmc.mk
>> @@ -0,0 +1,31 @@
>> +###############################################################################
>> +#
>> +# fmc
>> +#
>> +###############################################################################
>> +
>> +FMC_VERSION = fsl-sdk-v1.5-rc3
>> +FMC_SITE = git://git.freescale.com/ppc/sdk/fmc.git
>> +FMC_LICENSE = MIT
>> +FMC_LICENSE_FILES = COPYING
>> +FMC_DEPENDENCIES = libxml2 tclap fmlib
>> +
>> +FMC_MAKE_OPTS = \
>> +     CC="$(TARGET_CC)" \
>> +     CXX="$(TARGET_CXX)" \
>> +     FMD_USPACE_HEADER_PATH="$(STAGING_DIR)/usr/include/fmd" \
>> +     FMD_USPACE_LIB_PATH="$(STAGING_DIR)/usr/lib" \
>> +     LIBXML2_HEADER_PATH="$(STAGING_DIR)/usr/include/libxml2" \
>> +     TCLAP_HEADER_PATH="$(STAGING_DIR)/usr/include"
>> +
>> +define FMC_BUILD_CMDS
>> +     # The linking step has dependency issues so using MAKE1
>> +     $(TARGET_MAKE_ENV) $(MAKE1) $(FMC_MAKE_OPTS) -C $(@D)/source
>> +endef
>> +
>> +define FMC_INSTALL_TARGET_CMDS
>> +     $(INSTALL) -D -m 0755 $(@D)/source/fmc $(TARGET_DIR)/usr/sbin/fmc
>> +     cp -dr --no-preserve=ownership $(@D)/etc/fmc $(TARGET_DIR)/etc/
>
> Do we need this --no-preserve=ownership here? We usually use:

No, will update to cp -dpfr.

<snip>

-- 
Matthew L Weber / Sr Software Engineer / Platform Software
matthew.weber at rockwellcollins.com
www.rockwellcollins.com
