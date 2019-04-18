From: Nylon Chen <nylon7@andestech.com>
Date: Thu, 18 Apr 2019 16:39:10 +0800
Subject: [Buildroot] [PATCH v5 0/4] Add prebuilt nds32 toolchain,
 ae3xx board and autobuild configs support
In-Reply-To: <20190417212209.09ef3182@windsurf>
References: <20190416072545.17633-1-nylon7@andestech.com>
 <20190417212209.09ef3182@windsurf>
Message-ID: <20190418083910.GA20517@app09>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas:

Thanks for your question
On Thu, Apr 18, 2019 at 03:22:09AM +0800, Thomas Petazzoni wrote:
> Hello Nylon,
> 
> On Tue, 16 Apr 2019 15:25:41 +0800
> Nylon Chen <nylon7@andestech.com> wrote:
> 
> > Nylon Chen (4):
> >   arch: add support for Andes 32-bit(nds32)
> >   configs/andes_nds32_ae3xx: new defconfig
> >   toolchain-external-andes-nds32: new package
> >   support/config-fragments/autobuild: test the Andes nds32 toolchain
> 
> Following the merge of the nds32 architecture, two types of build
> failures started to appear:
> 
>  - The target binutils package failed to build, because binutils does
>    not yet have support for nds32. I tried with the latest binutils
>    release, 2.32, and it was the same. So for now, I have disabled
>    binutils on nds32. However, in binutils source, I see that
>    bfd/elf-nds32.c is present, so there at least the beginning of some
>    support. Could you comment on the status of nds32 support in
>    binutils upstream ?
> 
>    Build failure: http://autobuild.buildroot.net/results/1b1/1b18acb11db4d6c4198deb7385aff3d4d524c37e/build-end.log
>    Commit to disable binutils on nds32: https://git.buildroot.org/buildroot/commit/?id=b45a703078e6f3be096f24ac63848490d32d0d29
> 
I got two methods can resolve this problem

1.package/binutils/binutils.mk

+ifeq ($(BR2_nds32),y)
+GNU_TARGET_NAME=nds32le-linux
+endif
+

2.package/Makefile.in

+ifeq ($(BR2_nds32),y)
+GNU_TARGET_NAME=$(ARCH)le-$(TARGET_OS)
+else
GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
+endif

In addition to these methods, do you have any suggest?
>  - The libffi library does not have support for nds32 as well, so I
>    made sure that we don't try to build configurations that include
>    libffi on nds32. Are you planning on adding nds32 support to libffi
>    upstream ?
>
We have no plans at the moment. 
>    Build failure: http://autobuild.buildroot.net/results/128/12803a705586e82fdfb49013da2eb3b9879ccd45/build-end.log
>    Commit to disable libffi on nds32: https://git.buildroot.org/buildroot/commit/?id=2e1f98d9509d869352080331e168abe5f1452e1a
> 
> Best regards,
> 
> Thomas Petazzoni
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
