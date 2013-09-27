From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 27 Sep 2013 16:21:26 +0200
Subject: [Buildroot] [RFCv1 10/11] toolchain-external: convert to the
 package infrastructure
In-Reply-To: <CAAXf6LUnjxUhx44Cg-NnwuzQq+L33KM9P-HjacDcEKwgT8-0ng@mail.gmail.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LUnjxUhx44Cg-NnwuzQq+L33KM9P-HjacDcEKwgT8-0ng@mail.gmail.com>
Message-ID: <52459466.60707@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire wrote:
> Hi Thomas,
>
> On Thu, Sep 5, 2013 at 11:27 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> This commit converts the 'toolchain-external' logic to the package
>> infrastructure.
>>
>> The TOOLCHAIN_EXTERNAL_DIR variable (which points to where the
>> toolchain is located) is renamed to TOOLCHAIN_EXTERNAL_INSTALL_DIR,
>> because the former conflicts with the package infrastructure (which
>> defines the <pkg>_DIR variable for each package as pointing to its
>> build directory).
>>
>> The new _SOURCE_ADDONS mechanism is used for Blackfin toolchains.
>>
>> The extract, configuration and installation steps are converted inside
>> the <pkg>_EXTRACT_CMDS, <pkg>_CONFIGURE_CMDS and
>> <pkg>_INSTALL_STAGING_CMDS.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
> [..]
>
>> +TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
>> +
>> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
>>   # Special handling for Blackfin toolchain, because of the split in two
>>   # tarballs, and the organization of tarball contents. The tarballs
>>   # contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
>>   # which themselves contain the toolchain. This is why we strip more
>>   # components than usual.
>> -ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
>> -$(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1):
>> -       $(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1:/=)/$(TOOLCHAIN_EXTERNAL_SOURCE_1))
>> -
>> -$(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2):
>> -       $(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2:/=)/$(TOOLCHAIN_EXTERNAL_SOURCE_2))
>> -
>> -$(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2)
>> -       mkdir -p $(@D)
>> -       $(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_1))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) | \
>> -               $(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
>> -       $(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_2))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2) | \
>> -               $(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
>> -       $(Q)touch $@
>> -else
>> -# Download and extraction of a toolchain
>> -$(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE):
>> -       $(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE)$(TOOLCHAIN_EXTERNAL_SOURCE),$(TOOLCHAIN_EXTERNAL_SOURCE))
>> -
>> -$(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
>> -       mkdir -p $(@D)
>> -       $(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | \
>> -               $(TAR) $(TAR_STRIP_COMPONENTS)=1 --exclude='usr/lib/locale/*' -C $(@D) $(TAR_OPTIONS) -
>> +define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
>> +       mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
>> +       $(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
>> +               $(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
>> +       $(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_ADDONS))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_ADDONS) | \
>> +               $(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
>> +endef
>> +else ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
>> +# Normal handling of toolchain tarball extraction.
>> +define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
>> +       mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
>> +       $(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
>> +               $(TAR) $(TAR_STRIP_COMPONENTS)=1 --exclude='usr/lib/locale/*' -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
>>          $(TOOLCHAIN_EXTERNAL_FIXUP_CMDS)
>> -       $(Q)touch $@
>> +endef
>>   endif
> Given that the extract commands are now very similar between blackfin
> and non-blackfin, wouldn't it make more sense to define it once and
> tweak it based on a variable?
> Something like (quick and untested):
>
> ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
> TOOLCHAIN_EXTERNAL_TAR_OPTIONS = $(TAR_STRIP_COMPONENTS)=3 --hard-dereference
> else
> TOOLCHAIN_EXTERNAL_TAR_OPTIONS = $(TAR_STRIP_COMPONENTS)=1
> --exclude='usr/lib/locale/*'
> endif
>
> define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
>         mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
>         $(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE)))
> $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
>                 $(TAR) $(TOOLCHAIN_EXTERNAL_TAR_OPTIONS) -C
> $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
>         if [ -n "$(TOOLCHAIN_EXTERNAL_SOURCE_ADDONS)" ]; then \
>             $(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_ADDONS)))
> $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_ADDONS) | \
>                     $(TAR) $(TOOLCHAIN_EXTERNAL_TAR_OPTIONS) -C
> $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) - \
>         fi
> endef
>
>
> One can even wonder why the 'exclude=' couldn't be used for blackfin,
> and why the --hard-dereference couldn't be used for non-blackfin. This
> would make the only difference the strip-components.

I agree this and other cleanups would make this file cleaner.
However Thomas is proposing a rather substantial change to a quite core
piece of Buildroot. So I would keep things as they are at a first step.

This allows to make the change to the package system withthe minimum
diffs, thus making it easier to spot any problems that might ariseif
the patches are committed to master.

When the whole thing will be tested for at least a few days by the
autobuilders, I think it would be ok to start cleanup and refactoring.

Just my two cents.

-- 
Luca
