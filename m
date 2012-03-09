From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 09 Mar 2012 09:51:19 +0100
Subject: [Buildroot] [RFC v2 01/31] legal-info: infrastructure to
 collect legally-relevant material
In-Reply-To: <CAAXf6LU5uXpuYqaFdwek4NrB2J9P4sx3CZwk4Jaq2Q3y8-LWyg@mail.gmail.com>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
 <1331153911-22277-2-git-send-email-luca@lucaceresoli.net>
 <CAAXf6LU5uXpuYqaFdwek4NrB2J9P4sx3CZwk4Jaq2Q3y8-LWyg@mail.gmail.com>
Message-ID: <4F59C487.1040401@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire wrote:
> On Wed, Mar 7, 2012 at 9:58 PM, Luca Ceresoli<luca@lucaceresoli.net>  wrote:
>> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
>> ---
>>   Makefile                                  |   52 ++++++++++++++++++++++++-
>>   package/Makefile.package.in               |   59 +++++++++++++++++++++++++++++
>>   support/legal-info/README.header          |   24 ++++++++++++
>>   support/legal-info/README.warnings-header |    4 ++
>>   4 files changed, 136 insertions(+), 3 deletions(-)
>>   create mode 100644 support/legal-info/README.header
>>   create mode 100644 support/legal-info/README.warnings-header
>>
>> diff --git a/Makefile b/Makefile
>> index d508888..b78aaf8 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -284,6 +284,15 @@ TARGET_DIR:=$(BASE_DIR)/target
>>   TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
>>   TARGET_SKELETON=$(TOPDIR)/fs/skeleton
>>
>> +LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
>> +REDIST_SOURCES_DIR=$(LEGAL_INFO_DIR)/sources
>> +LICENSE_FILES_DIR=$(LEGAL_INFO_DIR)/licenses
>> +LEGAL_MANIFEST_CSV=$(LEGAL_INFO_DIR)/manifest.csv
>> +LEGAL_LICENSES_TXT=$(LEGAL_INFO_DIR)/licenses.txt
>> +LEGAL_WARNINGS=$(LEGAL_INFO_DIR)/.warnings
> I'm not sure if this should be a hidden file, as it is quite important
> for a user to really see this.

But at the end it's copied into the final README, where it is visible.
 From Makefile:

legal-info: legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
                 $(TARGETS_LEGAL_INFO)
         @cat support/legal-info/README.header>>$(LEGAL_REPORT)
	@if [ -r $(LEGAL_WARNINGS) ]; then \
                 cat support/legal-info/README.warnings-header \
                         $(LEGAL_WARNINGS)>>$(LEGAL_REPORT); \
                 cat $(LEGAL_WARNINGS); fi
         @echo "Legal info produced in $(LEGAL_INFO_DIR)"
         @rm -f $(LEGAL_WARNINGS)


>> +LEGAL_REPORT=$(LEGAL_INFO_DIR)/README
>> +LEGAL_INFO_SEPARATOR="::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
>> +
>>   ifeq ($(BR2_CCACHE),y)
>>   CCACHE:=$(HOST_DIR)/usr/bin/ccache
>>   CCACHE_CACHE_DIR=$(HOME)/.buildroot-ccache
>> @@ -362,6 +371,10 @@ HOST_DEPS = $(sort $(foreach dep,\
>>                 $($(dep))))
>>   HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
>>
>> +TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
>> +               $(filter-out host-makedevs,\
>> +               $(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
>> +
>>   # all targets depend on the crosscompiler and it's prerequisites
>>   $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
>>
>> @@ -395,8 +408,9 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>>         ">  $@
>>
>>   .PHONY: all world dirs clean distclean source outputmakefile \
>> +       legal-info legal-info-prepare legal-info-clean \
>>         $(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
>> -       $(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
>> +       $(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
>>         $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>>         $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
>>
>> @@ -406,7 +420,7 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>>   # dependencies anywhere else
>>   #
>>   #############################################################
>> -$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR):
>> +$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR):
>>         @mkdir -p $@
>>
>>   $(STAGING_DIR):
>> @@ -513,6 +527,37 @@ source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
>>   external-deps:
>>         @$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
>>
>> +legal-info-clean:
>> +       @rm -fr $(LEGAL_INFO_DIR)
>> +
>> +legal-info-prepare: $(LEGAL_INFO_DIR)
>> +       @echo "package,version,license,license files,source archive" \
>> +>>$(LEGAL_MANIFEST_CSV)
>> +       @mkdir -p $(LICENSE_FILES_DIR)/buildroot
>> +       @cp COPYING $(LICENSE_FILES_DIR)/buildroot/COPYING
>> +       @echo -e "$(LEGAL_INFO_SEPARATOR)\n\t buildroot:" \
>> +               "COPYING file\n$(LEGAL_INFO_SEPARATOR)\n\n" \
>> +>>$(LEGAL_LICENSES_TXT)
>> +       @cat COPYING>>$(LEGAL_LICENSES_TXT)
>> +       @echo>>$(LEGAL_LICENSES_TXT)
>> +       @echo "buildroot,$(BR2_VERSION_FULL),GPLv2,COPYING,not saved" \
>> +>>$(LEGAL_MANIFEST_CSV)
>> +       @echo "WARNING: The Buildroot source code has not be saved" \
> s/be/been
> This should be fixed in a few places in the patchset.

Fixed, thanks.

>> +>>$(LEGAL_WARNINGS)
>> +       @echo "WARNING: The toolchain has not be saved" \
>> +>>$(LEGAL_WARNINGS)
>> +       @cp $(CONFIG_DIR)/.config $(LEGAL_INFO_DIR)/buildroot.config
>> +
>> +legal-info: legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
>> +               $(TARGETS_LEGAL_INFO)
>> +       @cat support/legal-info/README.header>>$(LEGAL_REPORT)
>> +       @if [ -r $(LEGAL_WARNINGS) ]; then \
>> +               cat support/legal-info/README.warnings-header \
>> +                       $(LEGAL_WARNINGS)>>$(LEGAL_REPORT); \
>> +               cat $(LEGAL_WARNINGS); fi
>> +       @echo "Legal info produced in $(LEGAL_INFO_DIR)"
>> +       @rm -f $(LEGAL_WARNINGS)
>> +
> I think the readability of this can be improved by creating a set of
> functions to produce a warning, to add a line to the csv, etc.
> Moreover, the details about the format of these files will be grouped
> in one place.
> For example (untested):
>
> define legal-add-warning # (pkg, warning)
> @echo "WARNING: $(1): $(warning)">>$(LEGAL_WARNINGS)
> endef
> define legal-add-csv-line # (pkg, version, license, license file, source file)
> @echo "$(1),$(2),$(3),$(4),$(5)">>$(LEGAL_MANIFEST_CSV)
> endef
> Example calls would be:
> $(call legal-add-warning,buildroot,source code has not been saved)
> $(call legal-add-csv-line,$$($(3)_NAME),$$($(3)_VERSION),$$($(3)_LICENSE),not
> saved,not saved)
>
> These functions can be used in Makefile, in Makefile.package.in below,
> and even for packages that do not follow gentargets but still want to
> hook into the legal infrastructure.

It would definitely improve things, but I'm not sure about the add-csv-line. In
fact such lines are currently generated in pieces:  pkg, version, license in a
common place, license files in another, source files in yet another one. But I
might define constants in these same places, then call the function passing these
constants.

I'll try to code something.

Luca
