From: Qais Yousef <qais.yousef@arm.com>
Date: Sat, 3 Oct 2020 21:39:02 +0100
Subject: [Buildroot] [RFC PATCH 2/4] Add BPF Compiler Collection (BCC)
 Package
In-Reply-To: <eddf7b1a-51c7-4084-a864-83ae8766c1fa@gmail.com>
References: <20200929102618.28571-1-qais.yousef@arm.com>
 <20200929102618.28571-3-qais.yousef@arm.com>
 <eddf7b1a-51c7-4084-a864-83ae8766c1fa@gmail.com>
Message-ID: <20201003203751.7uqwi5mdujpykjod@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain

On 09/29/20 22:33, Romain Naour wrote:

[...]

> > diff --git a/package/bcc/0001-fix-dlinfo.patch b/package/bcc/0001-fix-dlinfo.patch
> > new file mode 100644
> > index 0000000000..b3aed784fc
> > --- /dev/null
> > +++ b/package/bcc/0001-fix-dlinfo.patch
> > @@ -0,0 +1,17 @@
> > +Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> 
> BCC use git as VCS, so we prefer if a patch is generated using git format-patch
> command. Doing so, the file will contain all metadata such the commit author,
> the commit log etc.
> 
> We recommend to try to upstream any patches as much as possible.
> 
> What was the issue you get?

Sorry the quality is not as I'd like them to be. But this work was something
I was doing on the side and wasn't keeping good track of it. I use buildroot
root as my rootfs while testing and felt like having BCC and bpftrace would be
nice, so started seeing what it takes to add them.

I will improve the quality in the next submission and do things properly.

> > +	depends on BR2_PACKAGE_LLVM_BPF
> > +	select BR2_PACKAGE_ZLIB
> > +	select BR2_PACKAGE_TAR
> 
> We identified some other dependencies (flex, audit, iperf3, netperf and xz).

I do add host-flex dependency on bcc.mk. xz is unnecessary if we use tar (see
below). audit, iperf3 and netperf dependencies do look strange to me. Certainly
I didn't need them.

Let me try to play with that.


> I'm not sure about tar dependency. OK to select zlib, it seem we also need
> BR2_PACKAGE_PYTHON3_ZLIB for test_uprobes.py.

As you noted below, now the kernel provides the headers in a tar file. BCC
automatically detect the presence of this file and performs the untarring.
Busybox tar was failing to work, hence adding the dependency on proper tar
package. No need for xz dependency then or any manual handling to extract the
headers.

> 
> 
> > +	help
> > +	  BPF Compiler Collection
> > +
> > +	  BCC is a toolkit for creating efficient kernel tracing and
> > +	  manipulation programs, and includes several useful tools and
> > +	  examples.
> > +
> > +	  BCC makes BPF programs easier to write, with kernel
> > +	  instrumentation in C (and includes a C wrapper around LLVM),
> > +	  and front-ends in Python and lua. It is suited for many tasks,
> > +	  including performance analysis and network traffic control.
> > +
> > +	  https://www.github.com/iovisor/bcc
> > +
> > +comment "bcc supported on aarch64 and x86_64"
> > +	depends on !(BR2_aarch64 || BR2_aarch64_be || BR2_x86_64)
> > +
> > +comment "bcc requires glibc on aarch64"
> > +	depends on !BR2_TOOLCHAIN_USES_GLIBC && (BR2_aarch64 || BR2_aarch64_be)
> > +
> > +comment "bcc needs a toolchain w/ C++, elfutils, python, clang, llvm, llvm-bpf"
> > +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_ELFUTILS || (!BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3) || !BR2_PACKAGE_CLANG || !BR2_PACKAGE_LLVM || !BR2_PACKAGE_LLVM_BPF
> > diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
> > new file mode 100644
> > index 0000000000..b83924aa93
> > --- /dev/null
> > +++ b/package/bcc/bcc.mk
> > @@ -0,0 +1,25 @@
> > +################################################################################
> > +#
> > +# BPF Compiler Collection (BCC)
> > +#
> > +################################################################################
> > +
> > +BCC_VERSION = v0.15.0
> 
> Jugurtha submitted a patch adding bcc version 0.16.0.

v0.15.0 was the latest then. Should have checked for an update before posting.

> 
> > +BCC_SITE = https://github.com/iovisor/bcc
> > +BCC_SITE_METHOD = git
> > +BCC_GIT_SUBMODULES = YES
> > +BCC_LICENSE = Apache-2.0
> > +BCC_LICENSE_FILES = LICENSE.txt
> > +BCC_INSTALL_STAGING = YES
> > +BCC_DEPENDENCIES = host-bison host-flex host-zlib zlib tar elfutils clang llvm
> > +
> > +ifeq ($(BR2_PACKAGE_PYTHON),y)
> > +BCC_DEPENDENCIES += python
> > +else
> > +BCC_DEPENDENCIES += python3
> > +endif
> > +
> > +BCC_CONF_OPTS += \
> > +	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -isystem $(HOST_DIR)/include"
> 
> Here you are mixing host headers and target headers.
> 
> What about python-bcc module ? Can you review this part ?

I didn't need to do that. I will remove it and see if one of my patches has
fixed it.

> 
> BCC requires the linux kernel sources on the target to build bpf code or a 5.2
> kernel with CONFIG_IKHEADERS (among other kernel options).

IMHO the instructions to build the kernel shouldn't be coupled with this
package. BCC provides good instructions on how to configure the kernel for BPF
support. And it is a fast moving target. There's now CONFIG_DEBUG_INFO_BTF
which AFAICT removes the need for the headers. Which config is more suitable
should be up to the user to decide.

Besides I build the kernel separately, so forcing the dependency is not
friendly for this class of users :-)

Thanks!

--
Qais Yousef
