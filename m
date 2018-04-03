From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Tue, 3 Apr 2018 14:27:16 +0200
Subject: [Buildroot] [PATCH v4 09/11] package/libclc: new package
In-Reply-To: <20180401232953.5277ede2@windsurf>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-10-valentin.korenblit@smile.fr>
 <20180401232953.5277ede2@windsurf>
Message-ID: <1d61763d-41c6-351e-c2f1-d57dbe657ccf@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 01/04/2018 23:29, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 29 Mar 2018 13:33:44 +0200, Valentin Korenblit wrote:
>> This patch provides libclc, an open source implementation of the
>> library requirements of the OpenCL C programming language, as
>> specified by the OpenCL 1.1 Specification. It is intended to be used
>> with Mesa Clover.
>>
>> It needs to be compiled with Clang, as it generates LLVM IR bitcode
>> files containing device builtin functions for each target.
>>
>> Currently, libclc supports AMDGCN, R600 and NVPTX targets.
>>
>> As OpenCL kernels are built dynamically on the target using libClang and
>> libLLVM, it is necessary to copy /usr/include/clc from STAGING_DIR to the
>> target manually, as Buildroot doesn't include this directory.
> I don't see where your .mk file is doing this. And it wouldn't work
> because Buildroot removes $(TARGET_DIR)/usr/include entirely in its
> target-finalize step.
>
> When you say "manually", do you mean that you have to
> copy /usr/include/clc from your build machine to your target once the
> target has booted ? If that's the case, then we really have a problem
> here, the target should just work.

Exactly, I was doing it manually after booting. Mesa uses pkg-config to
get the includedir of libclc: https://pastebin.com/adzL8vd4

Do you think it is ok to override configure.ac from Mesa to specify
another path? And in that case, where should I place all these headers?

>
>> +LIBCLC_VERSION = 00236279a293b3737dee08c14f25923a889d2795
>> +LIBCLC_SITE = https://git.llvm.org/git/libclc
>> +LIBCLC_SITE_METHOD = git
> I assume they don't have a stable release you could use ?

There is release_38, but the last commit is from 2 years ago. Master
has some recent activity.

>
> This lacks LICENSE and LICENSE_FILES.
>
>> +LIBCLC_DEPENDENCIES = host-clang host-llvm
>> +LIBCLC_INSTALL_STAGING = YES
>> +
>> +# C++ compiler is used to build a small tool (prepare-builtins) for the host.
>> +# It must be built with the C++ compiler from the host, simply use
>> +# HOSTCXX_NOCCACHE.
> Why not HOSTCXX ?
>
>> +LIBCLC_CONF_OPTS = --with-llvm-config=$(HOST_DIR)/usr/bin/llvm-config \
> Why are you using the version in HOST_DIR, and not the one in
> STAGING_DIR ?

I will check this.

>
> Best regards,
>
> Thomas

Best regards,

Valentin
