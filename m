From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 18:36:41 +0100
Subject: [Buildroot] [PATCH v2] uboot-tools: Allow users to use uboot's
 sources
In-Reply-To: <CAGduivzyTAPQDOhf8jHAjJEqcNwBBu3P-UJ-m1qWBB9+m_cF7Q@mail.gmail.com>
References: <1391385955-13166-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20140203225829.67dae85b@skate>
 <CAGduivzyTAPQDOhf8jHAjJEqcNwBBu3P-UJ-m1qWBB9+m_cF7Q@mail.gmail.com>
Message-ID: <52F276A9.8060906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/02/14 23:01, Maxime Hadjinlian wrote:
> On Mon, Feb 3, 2014 at 10:58 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Maxime Hadjinlian,
>>
>> On Mon,  3 Feb 2014 01:05:55 +0100, Maxime Hadjinlian wrote:
>>
>>> diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
>>> index 7c8f17c..29580dd 100644
>>> --- a/package/uboot-tools/Config.in
>>> +++ b/package/uboot-tools/Config.in
>>> @@ -7,6 +7,24 @@ config BR2_PACKAGE_UBOOT_TOOLS
>>>
>>>  if BR2_PACKAGE_UBOOT_TOOLS
>>>
>>> +if BR2_TARGET_UBOOT
>>> +
>>> +choice
>>> +     prompt "version"
>>> +     default BR2_PACKAGE_UBOOT_TOOLS_LATEST_VERSION
>>> +     help
>>> +       Select the specific uboot-tools version you want to use
>>> +
>>> +config BR2_PACKAGE_UBOOT_TOOLS_LATEST_VERSION
>>> +     bool "Use latest upstream version"
>>> +
>>> +config BR2_PACKAGE_UBOOT_TOOLS_USE_UBOOT_VERSION
>>> +     bool "Use the same version as the uboot package"
>>
>> Shouldn't this option only be available if the U-Boot package has been
>> enabled in the configuration?
> It is already in this patch.
>>
>>> +ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_USE_UBOOT_VERSION),y)
>>> +# We have to use the BR2_TARGET_UBOOT_VERSION because of the order of inclusion
>>> +# of the mk files.
>>> +UBOOT_TOOLS_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
>>
>> That's more of a question for Arnout, but does the order of .mk files
>> inclusion matter since we're using '=' and not ':=' ?
> Arnout will confirm (or not, if I misunderstood) with much more
> detail, but I found that the inclusion did matter, even with the use
> of '='.

 Indeed it does. The _VERSION is evaluated in generic-package and set to
'undefined' if it is empty. Since UBOOT_VERSION is only assigned later,
when uboot.mk is included, UBOOT_TOOLS_VERSION is empty at the time it is
evaluated. So it would always be undefined.

>>
>>> +UBOOT_TOOLS_SOURCE = $(UBOOT_SOURCE)

 This statement is useless, for the same reason that you cannot use
UBOOT_TOOLS_VERSION = $(UBOOT_VERSION). In generic-package,
UBOOT_TOOLS_SOURCE is evaluated to be empty so it will be set to the
default $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz. The default is OK in
most cases, however, that's why you didn't notice.

>>> +UBOOT_TOOLS_SITE = $(UBOOT_SITE)
>>> +ifneq ($(UBOOT_SITE_METHOD),)

 Since UBOOT_SITE_METHOD is not defined yet, this condition will never be
used.

>>> +UBOOT_TOOL_SITE_METHOD = $(UBOOT_SITE_METHOD)
>>> +endif
>>> +UBOOT_TOOLS_LICENSE = $(UBOOT_LICENSE)

 This one happens to work because generic-package uses a ?= for this one.
However, it will _not_ work for host-uboot-tools, because there an ifdef
is used.


 As you can see, all of this is extremely fragile. In essence, you need
to repeat all the logic from uboot.mk to derive these variables - or you
have to check really really carefully if it works in all cases, for both
uboot-tools and host-uboot-tools.

 Bottom line: I don't think this is the way to do it. I mentioned it
briefly in the developer days: there should be infrastructural support
for a shared-source package like this, so that the problem can be solved
fundamentally and it never depends on the order of evaluation, and it
doesn't break when a ?= in the package-generic is replaced with an ifndef.

 The generic structure of the shared source support would be something
like this:

if shared source

 assign VERSION, SOURCE, SITE, SITE_METHOD, LICENSE, LICENSE_FILES
according to the base package (with ?= so the derived package can still
override it).

else

 use the current way of assigning these variables

endif

 There are some more manipulations required. E.g., the legal-info
infrastructure makes very heavy use of conditions, so that has to be
rewritten as shell conditions.


 Have fun with that :-)


 Regards,
 Arnout


>>> +UBOOT_TOOLS_LICENSE_FILES = $(UBOOT_LICENSE_FILES)
>>> +else
>>>  UBOOT_TOOLS_VERSION = 2014.01
>>> -UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
>>> -UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
>>> +UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
>>> +UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
>>>  UBOOT_TOOLS_LICENSE = GPLv2+
>>>  UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
>>> +endif
>>>
>>>  define UBOOT_TOOLS_BUILD_CMDS
>>>       $(MAKE) -C $(@D)                        \
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
