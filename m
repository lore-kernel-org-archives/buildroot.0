From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Mar 2015 18:40:27 +0100
Subject: [Buildroot] [PATCH] toolchain-external: fix gdbserver copying
 for ARC GNU tools
In-Reply-To: <1427191751.13499.6.camel@synopsys.com>
References: <1426539723-4010-1-git-send-email-abrodkin@synopsys.com>
 <20150316230155.GF4271@free.fr>
 <1427191751.13499.6.camel@synopsys.com>
Message-ID: <20150324174027.GA4023@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2015-03-24 10:09 +0000, Alexey Brodkin spake thusly:
> On Tue, 2015-03-17 at 00:01 +0100, Yann E. MORIN wrote:
> > Alexey, All,
> > 
> > On 2015-03-17 00:02 +0300, Alexey Brodkin spake thusly:
> > > Historically in pre-built ARC GNU tools gdbserver is located in
> > > top-level "target-bin" folder.
> > > 
> > > Because of that fact if BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY is
> > > selected Buildroot won't find gdbserver (it looks within
> > > SYSROOT/ARCH_SYSROOT folder).
> > > 
> > > Simplest solution is to use TOOLCHAIN_EXTERNAL_FIXUP_CMDS where copy
> > > everything from "target-bin" foler into SYSROOT/usr/bin.
> > > 
> > > Reason to copy everything from "target-bin" is to enable possibility in
> > > the future to copy more pre-built target binaries onto target.
> > > 
> > > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> > 
> > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > However, a small suggestion (more of a question, in fact) below...
> > 
> > > ---
> > >  toolchain/toolchain-external/toolchain-external.mk | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> > > index c0429bb..d55b6de 100644
> > > --- a/toolchain/toolchain-external/toolchain-external.mk
> > > +++ b/toolchain/toolchain-external/toolchain-external.mk
> > > @@ -396,6 +396,11 @@ else
> > >  TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS = be
> > >  endif
> > >  TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE)_linux_install.tar.gz
> > > +define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
> > > +	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
> > > +	mkdir -p $${SYSROOT_DIR}/usr/bin ; \
> > > +	cp $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/target-bin/* $${SYSROOT_DIR}/usr/bin
> > 
> > Waht about using 'cp -l' instead? That would create hardlinks instead of
> > actual copies.
> > 
> > I guess we do not really support building on a filesystem that does not
> > support hard links, do we?
> > 
> > Still, this should not be a blocker for inclusion.
> 
> Even though we may indeed create both hard- or synmlink, what do you
> think about use of "install" command?
> 
> Something like that:
> --->8---
> install -m 0755 -D
> $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/target-bin/gdbserver
> $${SYSROOT_DIR}/usr/bin/gdbserver
> --->8---
> 
> Compared to "cp" install with "-D" may create leading path itself, so we
> won't need additional "mkdir -p".

I rev-ed the patch, because it was copying with a glob, and thus doing
the mkdir+cp dance is OK in taht case. However, if gdbserver is the only
thing we need to copy, then using install -D is indeed much better.

So, consider my rev-tag to still be valid if you resubmit with the
install -D dance instead.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
