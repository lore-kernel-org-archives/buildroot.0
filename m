From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 11 Jun 2018 09:24:47 -0700
Subject: [Buildroot] [RFC PATCH v3 5/9] llvm: add config to build
 backend for host arch
In-Reply-To: <2deecd74-3cb2-e397-551c-263765682c8d@smile.fr>
References: <20180610204449.13646-1-joseph.kogut@gmail.com>
 <20180610205417.13963-1-joseph.kogut@gmail.com>
 <20180610205417.13963-6-joseph.kogut@gmail.com>
 <2deecd74-3cb2-e397-551c-263765682c8d@smile.fr>
Message-ID: <CAMWSM7jeS+PB=49wzO9Ruqdx2Y93=A=JNfRQKtUOfMNSy_42gw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Valentin,

On Mon, Jun 11, 2018 at 2:06 AM, Valentin Korenblit
<valentin.korenblit@smile.fr> wrote:
> Hi Joseph,
>
> On 10/06/2018 22:54, Joseph Kogut wrote:
>>
>> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
>> ---
>>   package/llvm/Config.in | 9 +++++++++
>>   package/llvm/llvm.mk   | 5 +++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/package/llvm/Config.in b/package/llvm/Config.in
>> index 83e94660eb..e9c461b92f 100644
>> --- a/package/llvm/Config.in
>> +++ b/package/llvm/Config.in
>> @@ -11,6 +11,15 @@ config BR2_PACKAGE_LLVM_TARGET_ARCH
>>         default "ARM" if BR2_arm || BR2_armeb
>>         default "X86" if BR2_i386 || BR2_x86_64
>>   +config BR2_PACKAGE_LLVM_HOST_ARCH
>> +       string
>> +       default "AArch64" if BR2_HOSTARCH="aarch64"
>> +       default "X86" if BR2_HOSTARCH = "x86" || BR2_HOSTARCH = "x86_64"
>> +       default "ARM" if BR2_HOSTARCH = "arm"
>> +
>> +config BR2_PACKAGE_HOST_LLVM_ENABLE_HOST_ARCH
>> +       bool
>> +
>
>
> I think we could rename this option BR2_PACKAGE_LLVM_ENABLE_HOST_ARCH
> and make it user-selectable:
>

I agree, I'll make these changes.

> config BR2_PACKAGE_LLVM_ENABLE_HOST_ARCH
>         bool "Build backend for host architecture"
>
>>   config BR2_PACKAGE_LLVM
>>         bool "llvm"
>>         depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
>> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
>> index 3abf428989..04e99eb5b4 100644
>> --- a/package/llvm/llvm.mk
>> +++ b/package/llvm/llvm.mk
>> @@ -59,6 +59,11 @@ ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
>>   LLVM_TARGETS_TO_BUILD += AMDGPU
>>   endif
>>   +# Build backend for host architecture
>> +ifeq ($(BR2_PACKAGE_LLVM_ENABLE_HOST_ARCH),y)
>> +LLVM_TARGETS_TO_BUILD += $(call qstrip,$(BR2_PACKAGE_LLVM_HOST_ARCH))
>> +endif
>> +
>
>
> The only problem I see here is that we are going to build the backend for
> the host architecture also for the target, which is not necessary. Maybe
> we can use another variable like HOST_LLVM_TARGETS_TO_BUILD. This will
> break the compatibility of llvm-config for host and target when passing
> --targets-built but I don't think this should be a problem.
>

I'll make these changes and give it a shot.

>>   # Use native llvm-tblgen from host-llvm (needed for cross-compilation)
>>   LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
>>
>
>
> Best regards,
>
> Valentin
>

Thanks for the feedback!

Joseph
