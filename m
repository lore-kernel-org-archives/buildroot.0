From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 21 Oct 2019 22:35:01 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/jitterentropy-library: new
 package
In-Reply-To: <CANQCQpYgP0v8we24Qn5zTFgodQKoD9+0S9kPOYCwH7zrRE5e7w@mail.gmail.com>
References: <20190911162030.19418-1-matthew.weber@rockwellcollins.com>
 <38b0d548-b3a1-1fdd-19b7-aea997ae3a15@smile.fr>
 <CANQCQpYgP0v8we24Qn5zTFgodQKoD9+0S9kPOYCwH7zrRE5e7w@mail.gmail.com>
Message-ID: <12a46221-e207-31a6-b8e2-f525a9d4bd99@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 21/10/2019 ? 22:27, Matthew Weber a ?crit?:
> Romain,
> 
> 
> On Sun, Sep 22, 2019 at 7:41 AM Romain Naour <romain.naour@smile.fr> wrote:
>>
>> Hi Matt,
>>
>> Le 11/09/2019 ? 18:20, Matt Weber a ?crit :
>>> New library to support rng-tools using a CPU source as a backup entropy
>>> source when a kernel provided rng isn't present.
>>>
>>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>>
>> I had a build issue with this package due to optimizations:
>>
>> itterentropy-base.c:60:4: error: "The CPU Jitter random number generator must
>> not be compiled with optimizations. See documentation. Use the compiler switch
>> -O0 for compiling
>>       jitterentropy-base.c."
>>   #error "The CPU Jitter random number generator must not be compiled with
>> optimizations. See documentation. Use the compiler switch -O0 for compiling
>> jitterentropy-base.c."
>>    ^
> 
> I can't seem to trigger this case.  Was this with Clang?  I assume
> "#pragma GCC optimize ("O0")" handles it for GCC?

Indeed, it was with Clang used as cross-compiler.

Best regards,
Romain

> 
>>
>> I forced -O0 in the CFLAGS to fixes the issue.
>>
>> Best regards,
>> Romain
>>
>>> ---
>>> Changes v1 -> v3
>>>  - No changes
>>> ---
>>>  DEVELOPERS                                    |  1 +
>>>  package/Config.in                             |  1 +
>>>  .../0001-Makefile-cleanup-install.patch       | 41 +++++++++++++++++++
>>>  package/jitterentropy-library/Config.in       |  6 +++
>>>  .../jitterentropy-library.hash                |  5 +++
>>>  .../jitterentropy-library.mk                  | 25 +++++++++++
>>>  6 files changed, 79 insertions(+)
>>>  create mode 100644 package/jitterentropy-library/0001-Makefile-cleanup-install.patch
>>>  create mode 100644 package/jitterentropy-library/Config.in
>>>  create mode 100644 package/jitterentropy-library/jitterentropy-library.hash
>>>  create mode 100644 package/jitterentropy-library/jitterentropy-library.mk
>>>
>>> diff --git a/DEVELOPERS b/DEVELOPERS
>>> index 58d18a36e8..9d5e568e9b 100644
>>> --- a/DEVELOPERS
>>> +++ b/DEVELOPERS
>>> @@ -1523,6 +1523,7 @@ F:      package/iperf/
>>>  F:   package/iperf3/
>>>  F:   package/iputils/
>>>  F:   package/iw/
>>> +F:   package/jitterentropy-library/
>>>  F:   package/kvm-unit-tests/
>>>  F:   package/kvmtool/
>>>  F:   package/libcsv/
>>> diff --git a/package/Config.in b/package/Config.in
>>> index 9336261c5d..4a4d388d52 100644
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -1378,6 +1378,7 @@ menu "Hardware handling"
>>>       source "package/gnu-efi/Config.in"
>>>       source "package/hackrf/Config.in"
>>>       source "package/hidapi/Config.in"
>>> +     source "package/jitterentropy-library/Config.in"
>>>       source "package/lcdapi/Config.in"
>>>       source "package/let-me-create/Config.in"
>>>       source "package/libaio/Config.in"
>>> diff --git a/package/jitterentropy-library/0001-Makefile-cleanup-install.patch b/package/jitterentropy-library/0001-Makefile-cleanup-install.patch
>>> new file mode 100644
>>> index 0000000000..4311d1b201
>>> --- /dev/null
>>> +++ b/package/jitterentropy-library/0001-Makefile-cleanup-install.patch
>>> @@ -0,0 +1,41 @@
>>> +From 21477af2c36df184cb41ba8d34e4f320bb385912 Mon Sep 17 00:00:00 2001
>>> +From: Matt Weber <matthew.weber@rockwellcollins.com>
>>> +Date: Mon, 9 Sep 2019 20:42:14 -0500
>>> +Subject: [PATCH] Makefile: cleanup install
>>> +
>>> +- drop install of man pages
>>> +- don't strip library install
>>> +- force symlink creation
>>> +
>>> +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>>> +---
>>> + Makefile | 10 +++-------
>>> + 1 file changed, 3 insertions(+), 7 deletions(-)
>>> +
>>> +diff --git a/Makefile b/Makefile
>>> +index 5e31276..a8848cc 100644
>>> +--- a/Makefile
>>> ++++ b/Makefile
>>> +@@ -47,16 +47,12 @@ scan:    $(OBJS)
>>> +     scan-build --use-analyzer=/usr/bin/clang $(CC) -shared -Wl,-soname,lib$(NAME).so.$(LIBMAJOR) -o lib$(NAME).so.$(LIBVERSION) $(OBJS) $(LDFLAGS)
>>> +
>>> + install:
>>> +-    install -d -m 0755 $(DESTDIR)$(PREFIX)/share/man/man3
>>> +-    install -m 644 doc/$(NAME).3 $(DESTDIR)$(PREFIX)/share/man/man3/
>>> +-    gzip -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
>>> +     install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
>>> +-    install -m 0755 -s lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
>>> ++    install -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
>>> +     install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
>>> +     install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
>>> +-    $(RM) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
>>> +-    ln -s lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
>>> +-    ln -s lib$(NAME).so.$(LIBMAJOR) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so
>>> ++    ln -sf lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
>>> ++    ln -sf lib$(NAME).so.$(LIBMAJOR) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so
>>> +
>>> + clean:
>>> +     @- $(RM) $(NAME)
>>> +--
>>> +2.17.1
>>> +
>>> diff --git a/package/jitterentropy-library/Config.in b/package/jitterentropy-library/Config.in
>>> new file mode 100644
>>> index 0000000000..02f8ff6164
>>> --- /dev/null
>>> +++ b/package/jitterentropy-library/Config.in
>>> @@ -0,0 +1,6 @@
>>> +config BR2_PACKAGE_JITTERENTROPY_LIBRARY
>>> +     bool "libjitterentropy"
>>> +     help
>>> +       Hardware RNG based on CPU timing jitter.
>>> +
>>> +       https://github.com/smuellerDD/jitterentropy-library
>>> diff --git a/package/jitterentropy-library/jitterentropy-library.hash b/package/jitterentropy-library/jitterentropy-library.hash
>>> new file mode 100644
>>> index 0000000000..5846f2147d
>>> --- /dev/null
>>> +++ b/package/jitterentropy-library/jitterentropy-library.hash
>>> @@ -0,0 +1,5 @@
>>> +# Locally computed
>>> +sha256       38519115c6b750b7fa15547826123a7821b271535c168823259e609b42847223  jitterentropy-library-2.1.2.tar.gz
>>> +sha256       c3352794eff829a3c8097b77e4cbc9f1faf5c3f47a8abed960a0f411cbc6ab9f  COPYING
>>> +sha256       13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  COPYING.bsd
>>> +sha256       e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING.gplv2
>>> diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
>>> new file mode 100644
>>> index 0000000000..e047d506ad
>>> --- /dev/null
>>> +++ b/package/jitterentropy-library/jitterentropy-library.mk
>>> @@ -0,0 +1,25 @@
>>> +################################################################################
>>> +#
>>> +# jitterentropy-library
>>> +#
>>> +################################################################################
>>> +
>>> +JITTERENTROPY_LIBRARY_VERSION = 2.1.2
>>> +JITTERENTROPY_LIBRARY_SITE = $(call github,smuellerDD,$(JITTERENTROPY_LIBRARY_NAME),v$(JITTERENTROPY_LIBRARY_VERSION))
>>> +JITTERENTROPY_LIBRARY_LICENSE = GPL-2.0, BSD-3-Clause
>>> +JITTERENTROPY_LIBRARY_LICENSE_FILES = COPYING COPYING.bsd COPYING.gplv2
>>> +JITTERENTROPY_LIBRARY_INSTALL_STAGING = YES
>>> +
>>> +define JITTERENTROPY_LIBRARY_BUILD_CMDS
>>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
>>> +endef
>>> +
>>> +define JITTERENTROPY_LIBRARY_INSTALL_STAGING_CMDS
>>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install
>>> +endef
>>> +
>>> +define JITTERENTROPY_LIBRARY_INSTALL_TARGET_CMDS
>>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
>>> +endef
>>> +
>>> +$(eval $(generic-package))
>>>
>>
> 
> 
