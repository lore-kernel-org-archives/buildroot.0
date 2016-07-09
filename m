From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 9 Jul 2016 22:48:25 +0200
Subject: [Buildroot] [Patch v2 3/3] rust: new package
In-Reply-To: <20160709142533.5d4e34b6@itchy>
References: <1466797592-5565-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1466797592-5565-4-git-send-email-eric.le.bihan.dev@free.fr>
 <78101ffb-56d4-75be-465a-69b1a236798c@gmail.com>
 <20160709142533.5d4e34b6@itchy>
Message-ID: <d3d8e020-e7e1-3c27-0fd9-078710f1292c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

Le 09/07/2016 ? 14:25, Eric Le Bihan a ?crit :
> Hi!
> 
> Le Tue, 5 Jul 2016 12:11:13 +0200,
> Romain Naour <romain.naour@gmail.com> a ?crit :
> 
>> Le 24/06/2016 ? 21:46, Eric Le Bihan a ?crit :
>>> This new package provides the compiler for the Rust programming
>>> language.
>>>
>>> Currently, only the host variant is built.
>>>
>>> The internal build process is as follows:
>>>
>>>  1. rustc-stage0, provided by rust-bootstrap, is used to build
>>>     rustc-stage1.
>>>  2. rust-stage1 builds the final Rust compiler (rust-stage2)
>>>     and the standard library for the host architecture.
>>>  3. the standard library for the target architecture is build.
>>>
>>> The Rust compiler uses LLVM as its backend, compiled with support
>>> for x86, ARM, PowerPC and MIPS architectures.  
>>
>> rust build it's own bundled copy of llvm if it's not available on the
>> host. If host-rust require a llvm compiler we need to add llvm
>> support in Buildroot first.
>>
>> I have some WIP patches about llvm/clang, if you want to take a look:
>> https://github.com/RomainNaour/buildroot/tree/clang-llvm
> 
> Indeed, having host-rust depends on host-llvm may be added later.

I don't think it's a good idea to use the LLVM bundled in Rust since the
dependency on Rust and LLVM will be mixed in the rust package. It will be
difficult to maintain the package in the future.

For example, LLVM needs to be build with gcc >= 4.7 on the host, so the rust
package must depends on BR2_HOST_GCC_AT_LEAST_4_7.

> AFAIK, the copy of LLVM bundled in Rust only contains optimizations.

Do you know if there is some custom patch in LLVM bundled by Rust and if an
external LLVM compiler can be used ?

> In any case, a version of LLVM/clang will have to be built and this takes a
> very long time... Maybe disabling support for some architectures
> will speed it up (I haven't checked). I'll try your patch.

This is the responsibility to the host-llvm package to enable the required
optimizations on which host-rust must depends on. Also it would be possible to
build LLVM only for the architecture selected in Buildroot.

In the end, I think LLVM should be part of the toolchain package, that way it
would be possible to use a prebuild toolchain and only rebuild rust.

Best regards,
Romain

> 
> Regards,
> 
