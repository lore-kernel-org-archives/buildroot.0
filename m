From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 27 Aug 2013 15:05:10 +0200
Subject: [Buildroot] [PATCH 1 of 2 v3] infra: introduce
	suitable-extractor helper function
In-Reply-To: <CAAXf6LXEMg_avKNgDpsX=VM8Lmn1e4FccunFyBytW_6NFLS5ew@mail.gmail.com>
References: <patchbomb.1375434313@BEANTN0L019720>
 <bb19f03cbc968ff3c2a4.1375434314@BEANTN0L019720>
 <CAAXf6LXEMg_avKNgDpsX=VM8Lmn1e4FccunFyBytW_6NFLS5ew@mail.gmail.com>
Message-ID: <CAAXf6LVfA8KDVC4d7J+3S1idP+ZYAtXbbhCurZkcHx2nKR47Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Aug 17, 2013 at 9:59 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> On Fri, Aug 2, 2013 at 11:05 AM, Thomas De Schampheleire
> <patrickdepinguin+buildroot@gmail.com> wrote:
>> In order to simplify determining the right extractor tool for a given
>> file type, this patch introduces a make function 'suitable-extractor'.
>> Its usage is $(call suitable-extractor,filename), and it returns the
>> path to the suitable extractor.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>> v3: Correct $(firstword) usage
>> (v2): new patch in series
>>
>> Note: one remaining direct usage of the INFLATE variables is in
>> package/pkg-generic.mk, but it's in the inner block where dollar signs
>> are thrown around your ears. I'm not sure if it's possible to use the
>> function there...
>>
>>  package/lsof/lsof.mk                     |  2 +-
>>  package/perl/perl.mk                     |  2 +-
>>  package/pkg-generic.mk                   |  4 +++-
>>  package/pkg-utils.mk                     |  2 ++
>>  package/tar/tar.mk                       |  2 +-
>>  toolchain/toolchain-external/ext-tool.mk |  6 +++---
>>  6 files changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
>> --- a/package/lsof/lsof.mk
>> +++ b/package/lsof/lsof.mk
>> @@ -41,7 +41,7 @@ endif
>>
>>  # The .tar.bz2 contains another .tar, which contains the source code.
>>  define LSOF_EXTRACT_CMDS
>> -        $(INFLATE.bz2) $(DL_DIR)/$(LSOF_SOURCE) | \
>> +        $(call suitable-extractor,$(LSOF_SOURCE)) $(DL_DIR)/$(LSOF_SOURCE) | \
>>                  $(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
>>          $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
>>  endef
>> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
>> --- a/package/perl/perl.mk
>> +++ b/package/perl/perl.mk
>> @@ -30,7 +30,7 @@ endef
>>  PERL_POST_DOWNLOAD_HOOKS += PERL_CROSS_DOWNLOAD
>>
>>  define PERL_CROSS_EXTRACT
>> -       $(INFLATE$(suffix $(PERL_CROSS_SOURCE))) $(DL_DIR)/$(PERL_CROSS_SOURCE) | \
>> +       $(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(DL_DIR)/$(PERL_CROSS_SOURCE) | \
>>         $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
>>  endef
>>  PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -539,7 +539,9 @@ else ifeq ($$($(2)_SITE_METHOD),hg)
>>  DL_TOOLS_DEPENDENCIES += hg
>>  endif # SITE_METHOD
>>
>> -DL_TOOLS_DEPENDENCIES += $(firstword $(INFLATE$(suffix $($(2)_SOURCE))))
>> +# $(firstword) is used here because the extractor can have arguments, like
>> +# ZCAT="gzip -d -c", and to check for the dependency we only want 'gzip'.
>> +DL_TOOLS_DEPENDENCIES += $(firstword $(call suitable-extractor,$($(2)_SOURCE)))
>>
>>  endif # $(2)_KCONFIG_VAR
>>  endef # inner-generic-package
>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -62,6 +62,8 @@ INFLATE.tbz2 = $(BZCAT)
>>  INFLATE.tgz  = $(ZCAT)
>>  INFLATE.xz   = $(XZCAT)
>>  INFLATE.tar  = cat
>> +# suitable-extractor(filename): returns extractor based on suffix
>> +suitable-extractor = $(INFLATE$(suffix $(1)))
>>
>>  # MESSAGE Macro -- display a message in bold type
>>  MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
>> diff --git a/package/tar/tar.mk b/package/tar/tar.mk
>> --- a/package/tar/tar.mk
>> +++ b/package/tar/tar.mk
>> @@ -23,7 +23,7 @@ HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpi
>>  define HOST_TAR_EXTRACT_CMDS
>>         mkdir -p $(@D)
>>         cd $(@D) && \
>> -               $(INFLATE.gz) $(DL_DIR)/$(HOST_TAR_SOURCE) | cpio -i
>> +               $(call suitable-extractor,$(HOST_TAR_SOURCE)) $(DL_DIR)/$(HOST_TAR_SOURCE) | cpio -i
>>         mv $(@D)/tar-$(TAR_VERSION)/* $(@D)
>>         rmdir $(@D)/tar-$(TAR_VERSION)
>>  endef
>> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
>> --- a/toolchain/toolchain-external/ext-tool.mk
>> +++ b/toolchain/toolchain-external/ext-tool.mk
>> @@ -337,9 +337,9 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_
>>
>>  $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2)
>>         mkdir -p $(@D)
>> -       $(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_1))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) | \
>> +       $(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE_1)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) | \
>>                 $(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
>> -       $(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_2))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2) | \
>> +       $(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE_2)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2) | \
>>                 $(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
>>         $(Q)touch $@
>>  else
>> @@ -349,7 +349,7 @@ else
>>
>>  $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
>>         mkdir -p $(@D)
>> -       $(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | \
>> +       $(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE)) $^ | \
>>                 $(TAR) $(TAR_STRIP_COMPONENTS)=1 --exclude='usr/lib/locale/*' -C $(@D) $(TAR_OPTIONS) -
>>         $(TOOLCHAIN_EXTERNAL_FIXUP_CMDS)
>>         $(Q)touch $@
>
> As the next branch has been opened now, could we apply this series now?

ping?
