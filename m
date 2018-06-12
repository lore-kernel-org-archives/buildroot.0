From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Tue, 12 Jun 2018 15:46:05 +0200
Subject: [Buildroot] [RFC PATCH v3 5/9] llvm: add config to build
 backend for host arch
In-Reply-To: <CAMWSM7gUGDSrtqfNXkmBEGF_vw_75x22LyVzX8jx9s86pQkVdA@mail.gmail.com>
References: <20180610204449.13646-1-joseph.kogut@gmail.com>
 <20180610205417.13963-1-joseph.kogut@gmail.com>
 <20180610205417.13963-6-joseph.kogut@gmail.com>
 <2deecd74-3cb2-e397-551c-263765682c8d@smile.fr>
 <CAMWSM7gUGDSrtqfNXkmBEGF_vw_75x22LyVzX8jx9s86pQkVdA@mail.gmail.com>
Message-ID: <f12fb8bf-7918-9026-07ed-73c5ec9a9f1c@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joseph,

On 11/06/2018 19:54, Joseph Kogut wrote:
> Hi Valentin,
>
> On Mon, Jun 11, 2018 at 2:06 AM, Valentin Korenblit
> <valentin.korenblit@smile.fr> wrote:
>> Hi Joseph,
>>
>> On 10/06/2018 22:54, Joseph Kogut wrote:
> <snip>
>
>>>    +# Build backend for host architecture
>>> +ifeq ($(BR2_PACKAGE_LLVM_ENABLE_HOST_ARCH),y)
>>> +LLVM_TARGETS_TO_BUILD += $(call qstrip,$(BR2_PACKAGE_LLVM_HOST_ARCH))
>>> +endif
>>> +
>>
>> The only problem I see here is that we are going to build the backend for
>> the host architecture also for the target, which is not necessary. Maybe
>> we can use another variable like HOST_LLVM_TARGETS_TO_BUILD. This will
>> break the compatibility of llvm-config for host and target when passing
>> --targets-built but I don't think this should be a problem.
>>
> Looking at the Makefile again, it seems to me that
> HOST_LLVM_TARGETS_TO_BUILD would always be a superset of
> LLVM_TARGETS_TO_BUILD. What do you think about naming it
> HOST_LLVM_ADDTL_TARGETS_TO_BUILD, appending only additional
> architecture backends to be built for host-llvm, and and appending it
> to LLVM_TARGETS_TO_BUILD in HOST_LLVM_CONF_OPTS?
>
> That way, if a backend is enabled for the target, it's also always
> enabled for the host, but the host package can enable additional backends
> that the target package will not build.

Yes, actually I meant that. I would do something like this:

LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
HOST_LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)

ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
LLVM_TARGETS_TO_BUILD += AMDGPU
HOST_LLVM_TARGETS_TO_BUILD += AMDGPU
endif

# Build backend for host architecture
ifeq ($(BR2_PACKAGE_LLVM_ENABLE_HOST_ARCH),y)
HOST_LLVM_TARGETS_TO_BUILD += $(call qstrip,$(BR2_PACKAGE_LLVM_HOST_ARCH))
endif

and finally:

HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(HOST_LLVM_TARGETS_TO_BUILD))"

And in Config.in:

config BR2_PACKAGE_LLVM_ENABLE_HOST_ARCH
	bool "Build backend for host architecture"
	help
	  Build code generator for host machine.

>>>    # Use native llvm-tblgen from host-llvm (needed for cross-compilation)
>>>    LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
>>>
Best regards,

Valentin
