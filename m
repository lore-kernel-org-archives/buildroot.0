From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Tue, 19 May 2015 16:00:31 -0300
Subject: [Buildroot] [PATCH v2 5/6] nommu/flat: don't add -elf2flt for
 some toolchains
In-Reply-To: <20150518215841.2926908a@free-electrons.com>
References: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
 <1431959088-15257-6-git-send-email-guido@vanguardiasur.com.ar>
 <20150518215841.2926908a@free-electrons.com>
Message-ID: <20150519190030.GA27380@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 18, 2015 at 09:58:41PM +0200, Thomas Petazzoni wrote:
> Dear Guido Mart?nez,
> 
> On Mon, 18 May 2015 11:24:47 -0300, Guido Mart?nez wrote:
> 
> >  ifeq ($(BR2_BINFMT_FLAT),y)
> > +# Don't add any flags for toolchains that don't require it
> > +ifneq ($(BR2_TOOLCHAIN_DONT_ELF2FLT),y)
> 
> An option named "DONT_<something>" really isn't nice.
> 
> >  TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
> >  	-Wl$(comma)-elf2flt)
> >  TARGET_CXXFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
> >  	-Wl$(comma)-elf2flt)
> >  TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-elf2flt)
> 
> But the Blackfin toolchain also doesn't need -elf2flt as far as I know,
> the FLAT toolchain also directly produces FLAT binaries without
> specifying any flags.
Hm, that's right. In that case I don't know why -elf2flt is specified
when there's no $(PKG)_FLAT_STACKSIZE. For this particular toolchain it
causes the linker to explode while building U-boot, which doesn't happen
with other toolchains.

Removing "-Wl$(comma)-elf2flt" from the else-part fixes it too.

I'll into it some more.

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
