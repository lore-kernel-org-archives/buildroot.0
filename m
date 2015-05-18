From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 21:58:41 +0200
Subject: [Buildroot] [PATCH v2 5/6] nommu/flat: don't add -elf2flt for
 some toolchains
In-Reply-To: <1431959088-15257-6-git-send-email-guido@vanguardiasur.com.ar>
References: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
 <1431959088-15257-6-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150518215841.2926908a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Mon, 18 May 2015 11:24:47 -0300, Guido Mart?nez wrote:

>  ifeq ($(BR2_BINFMT_FLAT),y)
> +# Don't add any flags for toolchains that don't require it
> +ifneq ($(BR2_TOOLCHAIN_DONT_ELF2FLT),y)

An option named "DONT_<something>" really isn't nice.

>  TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
>  	-Wl$(comma)-elf2flt)
>  TARGET_CXXFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
>  	-Wl$(comma)-elf2flt)
>  TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-elf2flt)

But the Blackfin toolchain also doesn't need -elf2flt as far as I know,
the FLAT toolchain also directly produces FLAT binaries without
specifying any flags. Maybe we should instead adjust the logic here
instead of working around it?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
