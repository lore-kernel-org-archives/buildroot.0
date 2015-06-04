From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 4 Jun 2015 21:56:57 +0200
Subject: [Buildroot] [PATCH] moarvm: new package
In-Reply-To: <556F8858.7060603@mind.be>
References: <1433351630-22941-1-git-send-email-francois.perrad@gadz.org>
 <556F8858.7060603@mind.be>
Message-ID: <CAB0FRst55uXM+X1nOGPS9YreeUwVwogW=mbniWJaOv7_iWA8aA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-06-04 1:06 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
> On 06/03/15 19:13, Francois Perrad wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/Config.in        |  1 +
>>  package/moarvm/Config.in | 10 ++++++++
>>  package/moarvm/moarvm.mk | 66 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 77 insertions(+)
>>  create mode 100644 package/moarvm/Config.in
>>  create mode 100644 package/moarvm/moarvm.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index e0c2e2a..00c9ce3 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -499,6 +499,7 @@ menu "Lua libraries/modules"
>>       source "package/xavante/Config.in"
>>  endmenu
>>  endif
>> +     source "package/moarvm/Config.in"
>>       source "package/mono/Config.in"
>>       source "package/nodejs/Config.in"
>>       source "package/perl/Config.in"
>> diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
>> new file mode 100644
>> index 0000000..d4c9bbd
>> --- /dev/null
>> +++ b/package/moarvm/Config.in
>> @@ -0,0 +1,10 @@
>> +config BR2_PACKAGE_MOARVM
>> +     bool "moarvm"
>> +     depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
>
>  This seems to use libuv, and our libuv depends on threads, MMU, and !STATIC...

OK for thread,
MMU is implied by BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS

>
>> +     help
>> +       MoarVM (short for Metamodel On A Runtime Virtual Machine) is
>> +       a runtime built for the 6model object system. It is primarily aimed
>> +       at running NQP and Rakudo Perl 6, but should be able to serve as
>> +       a backend for any compilers built using the NQP compiler toolchain.
>> +
>> +       http://github.com/MoarVM/MoarVM
>
>  Isn't it better to refer to http://moarvm.com instead?

OK.

>
>> diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
>> new file mode 100644
>> index 0000000..08f30d7
>> --- /dev/null
>> +++ b/package/moarvm/moarvm.mk
>> @@ -0,0 +1,66 @@
>> +################################################################################
>> +#
>> +# moarvm
>> +#
>> +################################################################################
>> +
>> +MOARVM_VERSION = 2015.05
>> +MOARVM_SITE = $(call github,MoarVM,MoarVM,$(NQP_VERSION))
>
>  If we use http://moarvm.com/releases/MoarVM-2015.05.tar.gz instead, there is no
> need for all the extra downloads.
>

Definitely better.

>  Otherwise, you also have to set MOARVM_SOURCE = 2015.05.tar.gz it seems. github
> is weird.
>
>
>> +MOARVM_LICENSE = Artistic-2.0
>> +MOARVM_LICENSE_FILES = Artistic2.txt
>> +MOARVM_INSTALL_STAGING = YES
>> +
>> +# the tarball does not contain the git submodules
>> +MOARVM_DYNASM_VERSION=12ace5e3a50238f69a3616e65b3e9ca188c41ac5
>> +MOARVM_DYNASM_SITE = $(call github,MoarVM,dynasm,$(MOARVM_DYNASM_VERSION))
>> +MOARVM_DYNASM_SOURCE = moarvm-dynasm-$(MOARVM_DYNASM_VERSION).tar.gz
>> +MOARVM_DYNCALL_VERSION=1dabd7c2fd438920502c85eaf9ca4212d722c4b5
>> +MOARVM_DYNCALL_SITE = $(call github,MoarVM,dyncall,$(MOARVM_DYNCALL_VERSION))
>> +MOARVM_DYNCALL_SOURCE = moarvm-dyncall-$(MOARVM_DYNCALL_VERSION).tar.gz
>> +MOARVM_LIBUV_VERSION=52ae456b0d666f6f4dbb7f52675f4f131855bd22
>> +MOARVM_LIBUV_SITE = $(call github,joyent,libuv,$(MOARVM_LIBUV_VERSION))
>> +MOARVM_LIBUV_SOURCE = moarvm-libuv-$(MOARVM_LIBUV_VERSION).tar.gz
>> +MOARVM_EXTRA_DOWNLOADS = \
>> +$(MOARVM_DYNASM_SITE)/$(MOARVM_DYNASM_SOURCE) \
>> +$(MOARVM_DYNCALL_SITE)/$(MOARVM_DYNCALL_SOURCE) \
>> +$(MOARVM_LIBUV_SITE)/$(MOARVM_LIBUV_SOURCE)
>> +
>> +define MOARVM_SUBMODULES_EXTRACT
>> +     $(call suitable-extractor,$(MOARVM_DYNASM_SOURCE)) $(DL_DIR)/$(MOARVM_DYNASM_SOURCE) | \
>> +     $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D)/3rdparty/dynasm $(TAR_OPTIONS) -
>> +     $(call suitable-extractor,$(MOARVM_DYNCALL_SOURCE)) $(DL_DIR)/$(MOARVM_DYNCALL_SOURCE) | \
>> +     $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D)/3rdparty/dyncall $(TAR_OPTIONS) -
>> +     $(call suitable-extractor,$(MOARVM_LIBUV_SOURCE)) $(DL_DIR)/$(MOARVM_LIBUV_SOURCE) | \
>> +     $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D)/3rdparty/libuv $(TAR_OPTIONS) -
>
>  Can't we use buildroot's libuv? Same for libatomic_ops? I think yes, by passing
> --has-libatomic_ops --has-libuv.
>

These options work for native build, not for cross-compilation (custom
Configure script).

>> +endef
>> +MOARVM_POST_EXTRACT_HOOKS += MOARVM_SUBMODULES_EXTRACT
>> +
>> +MOARVM_CONF_OPTS = \
>> +--build=$(GNU_HOST_NAME) \
>
>  Continuation lines should be indented with a tab.

OK

>
>> +--host=$(GNU_TARGET_NAME) \
>> +--ar=$(TARGET_AR) \
>> +--cc=$(TARGET_CC) \
>
>  Quotes needed for ccache
>

OK

>> +--ld=$(TARGET_CC) \
>
>  Same here
>
>> +--prefix=/usr
>
>  Shouldn't --debug/--no-debug be set as well? And probably --static for static
> builds.
>
>  Regards,
>  Arnout
>
>> +
>> +ifeq ($(BR2_ENDIAN),"BIG")
>> +MOARVM_CONF_OPTS += --big-endian
>> +endif
>> +
>> +define MOARVM_CONFIGURE_CMDS
>> +     (cd $(@D); perl Configure.pl $(MOARVM_CONF_OPTS))
>> +endef
>> +
>> +define MOARVM_BUILD_CMDS
>> +     $(MAKE) -C $(@D)
>> +endef
>> +
>> +define MOARVM_INSTALL_STAGING_CMDS
>> +     $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
>> +endef
>> +
>> +define MOARVM_INSTALL_TARGET_CMDS
>> +     $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
>> +endef
>> +
>> +$(eval $(generic-package))
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
