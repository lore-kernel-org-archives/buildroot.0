From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2012 10:38:42 +0100
Subject: [Buildroot] External Toolchain: Calculation of SYSROOT_DIR in
 toolchain/toolchain-external/ext-tool.mk wrong?
In-Reply-To: <4666169C600DD24C84F509DC90790D5007629FD2B5@DEMCHP99E75MSX.ww902.siemens.net>
References: <4666169C600DD24C84F509DC90790D5007629FD2B5@DEMCHP99E75MSX.ww902.siemens.net>
Message-ID: <20120201103842.546e6eb8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christof,

Le Wed, 1 Feb 2012 09:35:06 +0100,
"Warlich, Christof" <christof.warlich@siemens.com> a ?crit :

> I have an issue with the integration of an external toolchain into buildroot. When I do this,
> buildroot complains "Incorrect selection of the C library".
> 
> Digging for the root case of the problem, I found that SYSROOT_DIR is not calculated correctly
> in toolchain/toolchain-external/ext-tool.mk. To fix the problem, I had to replace line 272 of that file:
> 
> SYSROOT_DIR=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;'` ; \
> 
> with
> 
> SYSROOT_DIR=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a) |sed -r -e 's:lib/libc\.a::;'` ; \

Interesting. In all external toolchains I have seen until now, the
dynamic version of libc is in lib/, but the static version is in
usr/lib/.

If we just do your change, then it will basically break the support for
all other external toolchains. We need to be a little bit smarter.

> and my PATH / PREFIX setting in menuconfig is: /someDirectory/linux_tools / $(ARCH)-v42 with $(ARCH) == i686.
> 
> Can anyone help in telling me if I found (and fixed? :-)) a bug in buildroot or if something is wrong with my toolchain,
> and if so, what's wrong?

The directory organization of the various external toolchains available
is such that Buildroot does not necessarily support any random
toolchain.

Would it be possible to get your external toolchain, so that I could do
some testing, and integrate it in my set of external toolchains, so
that we keep it working in the future?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
