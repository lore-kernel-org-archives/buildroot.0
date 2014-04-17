From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 17 Apr 2014 11:17:47 +0200
Subject: [Buildroot] [PATCH v4 3/4] Makefile: let show-targets prints
 also the dependencies
In-Reply-To: <20140416194932.2b8f31c0@skate>
References: <1396864610-8426-1-git-send-email-fabio.porcedda@gmail.com>
 <1396864610-8426-4-git-send-email-fabio.porcedda@gmail.com>
 <20140416194932.2b8f31c0@skate>
Message-ID: <CAHkwnC--PbP42R6BtLsGc1rv2=mRCXwtFSy=CU=6t9NMH0s-zQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 16, 2014 at 7:49 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Mon,  7 Apr 2014 11:56:49 +0200, Fabio Porcedda wrote:
>> Because the show-targets target print the targets that will be build,
>
> "will be built"

Fixed, thanks.

>> print also the dependencies.
>> Also refactor source and legal-info targets in order to cleanup the code
>> by creating a new variable TARGETS_ALL that contains all the targets the
>
> the targets the -> the targets that

Fixed, thanks.

>> will be built.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
>>  Makefile | 21 ++++++++++-----------
>>  1 file changed, 10 insertions(+), 11 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index e0831b6..f063bef 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -409,9 +409,6 @@ endif
>>
>>  include fs/common.mk
>>
>> -TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
>> -TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
>> -
>>  # host-* dependencies have to be handled specially, as those aren't
>>  # visible in Kconfig and hence not added to a variable like TARGETS.
>>  # instead, find all the host-* targets listed in each <PKG>_DEPENDENCIES
>> @@ -429,10 +426,12 @@ TARGETS_HOST_DEPS = $(sort $(filter host-%,$(foreach dep,\
>>  HOST_DEPS = $(sort $(foreach dep,\
>>               $(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS_HOST_DEPS))),\
>>               $($(dep))))
>> -HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
>>
>> -TARGETS_LEGAL_INFO := $(patsubst %,%-legal-info,\
>> -             $(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
>> +TARGETS_ALL := $(sort $(TARGETS) $(TARGETS_HOST_DEPS)) \
>> +               $(HOST_DEPS) $(TARGETS_ROOTFS)
>> +TARGETS_ALL_SOURCES := $(addsuffix -source,$(TARGETS_ALL))
>
> Is this actually going to work? The targets in TARGETS_ROOTFS, do they
> all support <name>-source ?

Not at all, but because they are declared as phony targets it works.
Bear in mind that such handling is already in place and working even
without my patch.
For a better explanation please read further.

>> +TARGETS_ALL_LEGAL_INFO := $(addsuffix -legal-info,$(TARGETS_ALL))
>
> And do they all support <name>-legal-info ?

Ditto.

>> +TARGETS_ALL_DIRCLEAN := $(addsuffix -dirclean,$(TARGETS_ALL))
>>
>>  dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>>       $(HOST_DIR) $(BINARIES_DIR)
>> @@ -451,8 +450,8 @@ world: target-post-image
>>  .PHONY: all world toolchain dirs clean distclean source outputmakefile \
>>       legal-info legal-info-prepare legal-info-clean printvars \
>>       target-finalize target-post-image \
>> -     $(TARGETS) $(TARGETS_ROOTFS) \
>> -     $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
>> +     $(TARGETS_ALL) $(TARGETS_ALL_SOURCE) \
>> +     $(TARGETS_ALL_LEGAL_INFO) $(TARGETS_ALL_DIRCLEAN)  \
>
> I actually find this handling of phony targets a bit weird. If package
> "foo" is enabled, then "foo", "foo-dirclean", "foo-legal-info" and
> "foo-source" are phony targets, but when the package is disabled they
> are not phony targets. Also, what about "foo-patch", "foo-extract" and
> so on? So my question is really whether it shouldn't be the role of the
> package infrastructure itself to declare the targets of each package as
> phony.

Sure, i think it's better for the package infrastructure to declare
all those targets as phony targets, i will cook a patch for doing
that, thanks to such a patch we can get rid off the TARGETS_DIRCLEAN
in the main Makefile.
But even if the packages infrastructure add those phony targets we
still need to add phony targets in the main Makefile because not all
targets in the TARGETS variable are using the package infrastructure,
e.g.:
 - targets declared in "Makefile" such "target-purgelocales"
"target-generatelocales" ...
 - targets declared in fs/*
- targets declared in system/system.mk
only a part of these targets implements foo-legal-info, foo-source,
FOO_DEPENDENCIES so to be able to handle all the targets uniformly by
the legal-info and source target they are all declared as phony
target.
I don't see an easy solution to avoid that.

>>       $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>>       $(HOST_DIR) $(BINARIES_DIR)
>>
>> @@ -626,7 +625,7 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
>>  toolchain-eclipse-register:
>>       ./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
>>
>> -source: $(TARGETS_SOURCE) $(HOST_SOURCE)
>> +source: $(TARGETS_ALL_SOURCE)
>>
>>  external-deps:
>>       @$(MAKE1) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
>> @@ -644,7 +643,7 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
>>       @$(call legal-warning,the toolchain has not been saved)
>>       @cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
>>
>> -legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
>> +legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_ALL_LEGAL_INFO) \
>>               $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)
>>       @cat support/legal-info/README.header >>$(LEGAL_REPORT)
>>       @if [ -r $(LEGAL_WARNINGS) ]; then \
>> @@ -655,7 +654,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
>>       @rm -f $(LEGAL_WARNINGS)
>>
>>  show-targets:
>> -     @echo $(TARGETS) $(TARGETS_ROOTFS)
>> +     @echo $(TARGETS_ALL)
>>
>>  graph-build: $(O)/build/build-time.log
>>       @install -d $(O)/graphs

Thanks and regards.
-- 
Fabio Porcedda
