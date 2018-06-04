From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Mon, 4 Jun 2018 10:40:43 +0200
Subject: [Buildroot] Include Host Architecture in LLVM_TARGETS_TO_BUILD
In-Reply-To: <CAMWSM7ibg=mXZdcWopiHA7zUUAubyredT2o=3-N_uEyATQ1bMA@mail.gmail.com>
References: <CAMWSM7ibg=mXZdcWopiHA7zUUAubyredT2o=3-N_uEyATQ1bMA@mail.gmail.com>
Message-ID: <ec6add44-61d1-6518-8bbb-8138343201e0@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joseph,

On 01/06/2018 21:28, Joseph Kogut wrote:
> Hi Valentin,
>
> I'm using the Clang compiler frontend to LLVM that you added to
> Buildroot (thanks!), and the package that I'm working on building
> requires Clang to support the host architecture, as well as the
> target.

We currently don't support using Clang as a toolchain component.
libLLVM and libclang are instaled on the target so they can be used
by other packages. Buildroot does not provide a way to choose between
gcc or clang to compile a package, so your packaging should search
for host-clang explicitly.

This topic was discussed during the meeting in February:

https://elinux.org/Buildroot:DeveloperDaysFOSDEM2018#LLVM.2FClang

> I was wondering if you knew of a way to detect and enable the host
> architecture for LLVM, as I think enabling all supported architectures
> would be wasteful.

As you say, we control the backends that are going to be built in
lib/Target by using LLVM_TARGETS_TO_BUILD. In your case you could
append $(call qstrip,$(BR2_HOSTARCH)) in HOST_LLVM_CONF_OPTS.
However, be careful because if your host architecture is x86_64 you'll
need to pass "X86" as both backends share the code in lib/Target/X86.

> Best regards,
> Joseph

Best regards,

Valentin
