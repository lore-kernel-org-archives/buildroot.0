From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Apr 2014 23:01:06 +0200
Subject: [Buildroot] [PATCH 3/4] evemu: build python2 binding only if
 target python2 is enabled
In-Reply-To: <trinity-762da3ea-6aba-47ae-a357-a99fefce562b-1398718427870@3capp-gmx-bs30>
References: <1398711632-5831-1-git-send-email-ps.report@gmx.net>
 <1398711632-5831-4-git-send-email-ps.report@gmx.net>,
 <535EB079.4040604@mind.be>
 <trinity-762da3ea-6aba-47ae-a357-a99fefce562b-1398718427870@3capp-gmx-bs30>
Message-ID: <535EC192.2090806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/04/14 22:53, Peter Seiderer wrote:
> Hello Arnout,
> 
>> Gesendet: Montag, 28. April 2014 um 21:48 Uhr
>> Von: "Arnout Vandecappelle" <arnout@mind.be>
>> An: "Peter Seiderer" <ps.report@gmx.net>, buildroot at busybox.net
>> Cc: "Peter Korsgaard" <jacmet@uclibc.org>
>> Betreff: Re: [Buildroot] [PATCH 3/4] evemu: build python2 binding only if target python2 is enabled
>>
>> On 28/04/14 21:00, Peter Seiderer wrote:
>>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>>> ---
>>>  ...gure.ac-add-disable-python-binding-option.patch | 46 ++++++++++++++++++++++
>>>  package/evemu/evemu.mk                             |  8 ++++
>>>  2 files changed, 54 insertions(+)
>>>  create mode 100644 package/evemu/evemu-0006-configure.ac-add-disable-python-binding-option.patch
>>>
>>> diff --git a/package/evemu/evemu-0006-configure.ac-add-disable-python-binding-option.patch b/package/evemu/evemu-0006-configure.ac-add-disable-python-binding-option.patch
>>> new file mode 100644
>>> index 0000000..f100b2e
>>> --- /dev/null
>>> +++ b/package/evemu/evemu-0006-configure.ac-add-disable-python-binding-option.patch
>>> @@ -0,0 +1,46 @@
>>> +From 44f42cfa6b58a256d3b89bce1043b0efed7eeaeb Mon Sep 17 00:00:00 2001
>>> +From: Peter Seiderer <ps.report@gmx.net>
>>> +Date: Sun, 27 Apr 2014 13:23:41 +0200
>>> +Subject: [PATCH 6/8] configure.ac: add '--disable-python-binding' option
>>
>>  Same remark about avoiding 6/8 (the reasoning is: if later on patches 7
>> and 8 disappear and patch 9 is added, it looks strange to have the /8 there).
>>
> 
> O.k, will fix...
> 
>>> +
>>> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>>> +---
>>> + Makefile.am  |  2 +-
>>> + configure.ac | 11 +++++++++++
>>> + 2 files changed, 12 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/Makefile.am b/Makefile.am
>>> +index a83b35f..446ec4c 100644
>>> +--- a/Makefile.am
>>> ++++ b/Makefile.am
>>> +@@ -1,4 +1,4 @@
>>> +-SUBDIRS = src tools python $(SUBDIR_TESTS)
>>> ++SUBDIRS = src tools $(SUBDIR_PYTHON_BINDING) $(SUBDIR_TESTS)
>>> + 
>>> + pkgconfigdir = $(libdir)/pkgconfig
>>> + pkgconfig_DATA = evemu.pc
>>> +diff --git a/configure.ac b/configure.ac
>>> +index 4e0c3b8..bb49bbc 100644
>>> +--- a/configure.ac
>>> ++++ b/configure.ac
>>> +@@ -52,6 +52,17 @@ AS_IF([test "x$enable_tests" != "xno"], [
>>> + 
>>> + AC_SUBST([SUBDIR_TESTS])
>>> + 
>>> ++AC_ARG_ENABLE([python-binding],
>>> ++	AS_HELP_STRING([--disable-python-binding],
>>> ++		 [Disable generation of python binding]))
>>
>>  bindings is typically used in plural. And actually, most packages will
>> call it --enable-python or --with-python.
>>
> 
> O.k, will fix the s/binding/bindings/. Used '--disable-python-binding' because of
> the analogy to '--disable-tests' and I did not want to change the default behaviour
> of the original evemu source package...

 Sorry, I didn't formulate that correctly. I meant --disable-python or
--without-python, i.e. most packages don't add -bindings to it. Though I
have to say, it's probably more correct with the -bindings.

> 
>>
>>> ++
>>> ++AS_IF([test "x$enable_python_binding" != "xno"], [
>>> ++	SUBDIR_PYTHON_BINDING=python
>>> ++])
>>> ++
>>> ++AC_SUBST([SUBDIR_PYTHON_BINDING])
>>> ++
>>> ++
>>> + AC_SUBST(AM_CFLAGS,
>>> +          "-Wall -Wextra -pedantic")
>>> + 
>>> +-- 
>>> +1.8.1.4
>>> +
>>> diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
>>> index 07ad6f6..44b8b89 100644
>>> --- a/package/evemu/evemu.mk
>>> +++ b/package/evemu/evemu.mk
>>> @@ -27,6 +27,14 @@ EVEMU_DEPENDENCIES = host-pkgconf libevdev
>>>  # Needs Python for header file generation
>>>  EVEMU_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
>>>  
>>> +# Check for target python (python3 binding disabled because
>>> +# of build/byte-compile problems)
>>> +ifeq ($(BR2_PACKAGE_PYTHON),y)
>>> +	EVEMU_DEPENDENCIES += python
>>
>>  We normally put an explicit --enable-python-binding(s) here.
> 
> ... see above, enabled is the default....

 Even though it is the default, we add it explicitly. This makes it
easier to keep things consistent if e.g. the default behaviour changes
after an upgrade.


 Regards,
 Arnout

> 
>>
>>  Also, we don't normally indent inside conditions in .mk files
>> (indentation is reserved for commands and for continuation lines of
>> assignments).
> 
> O.k, will fix...
> 
> Regards,
> Peter
> 
>>
>>  Regards,
>>  Arnout
>>
>>> +else
>>> +	EVEMU_CONF_OPT += --disable-python-binding
>>> +endif
>>> +
>>>  # package source code coming from git, so it doesn't have generated
>>>  # configure and Makefile.in
>>>  EVEMU_AUTORECONF = YES
>>>
>>
>>
>> -- 
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
