From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 19:27:08 +0200
Subject: [Buildroot] [PATCH v3 2/3] toolchain: add bfin support
In-Reply-To: <20160704174853.59af47cd@free-electrons.com>
References: <20160603040531.GA31560@waldemar-brodkorb.de>
 <20160704110849.28f815fc@free-electrons.com>
 <20160704174853.59af47cd@free-electrons.com>
Message-ID: <20160705192708.1e62ed0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jul 2016 17:48:53 +0200, Thomas Petazzoni wrote:

> Also, the default Blackfin core in Buildroot is bf609, and there's no
> support for it in the upstream gcc, which causes a build failure when
> building uClibc-ng because -mcpu=bf609 is not valid.
> 
> It looks like we will need to:
> 
>  1/ Change the default Blackfin core to something that the internal
>     toolchain backend support
> 
>  2/ Make the internal toolchain backend only available if the selected
>     Blackfin core is supported

Another problem:

  CC utils/ldconfig
In file included from ../ldso/include/dl-defs.h:78:0,
                 from ../utils/porting.h:41,
                 from ../utils/ldconfig.c:29:
../ldso/ldso/bfin/dl-sysdep.h: In function 'elf_machine_relative':
../ldso/ldso/bfin/dl-sysdep.h:96:9: warning: 'return' with a value, in function returning void
  return 0;
         ^
../ldso/ldso/bfin/dl-sysdep.h:93:1: note: declared here
 elf_machine_relative (DL_LOADADDR_TYPE load_off, const Elf32_Addr rel_addr,
 ^~~~~~~~~~~~~~~~~~~~

This is due to:

config BR2_UCLIBC_INSTALL_UTILS
        bool "Compile and install uClibc utilities"
        default y

Before 6b0baf14cefd19d3902b43db0ab58709ef70e641, we had a dependency
on !BR2_bfin for this option. I'm not sure !BR2_bfin is the best
solution. Isn't it something like "supports shared library" or
something like that?

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
