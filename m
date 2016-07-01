From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 1 Jul 2016 12:28:42 -0300 (BRT)
Subject: [Buildroot] Unable to compile uboot v2012.10 on Buildroot
 2016.05
In-Reply-To: <20160701161556.5e65b3df@free-electrons.com>
References: <1249010753.7483898.1467378648497.JavaMail.zimbra@datacom.ind.br>
 <20160701151804.61f389e9@free-electrons.com>
 <1572014322.7513168.1467381657827.JavaMail.zimbra@datacom.ind.br>
 <20160701161556.5e65b3df@free-electrons.com>
Message-ID: <1533419985.7541395.1467386922132.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Julien Boibessot" <julien.boibessot@armadeus.com>
> Sent: Friday, July 1, 2016 11:15:56 AM
> Subject: Re: [Buildroot] Unable to compile uboot v2012.10 on Buildroot 2016.05

> Hello,
> 
> On Fri, 1 Jul 2016 11:00:57 -0300 (BRT), Carlos Santos wrote:
> 
>> > What is your host gcc version ? This failure smells like building an
>> > old U-Boot, with gcc 5.x as the host gcc version.
>> 
>> The problem happens on CentOS 7 (GCC 4.8.3) and Ubuntu 16.04 (GCC 5.3.1).
> 
> I think the failure with GCC 5.3.x is normal, but I don't understand
> why it would fail with gcc 4.8.
> 
>> >>  UBOOT_MAKE_OPTS += \
>> >>  	CROSS_COMPILE="$(TARGET_CROSS)" \
>> >> -	ARCH=$(UBOOT_ARCH) \
>> >> -	HOSTCFLAGS="$(HOST_CFLAGS)" \
>> >> -	HOSTLDFLAGS="$(HOST_LDFLAGS)"
>> > 
>> > I'm not sure to see why this would fix the problem you're reporting.
>> 
>> It prevents overriding HOSTCFLAGS and HOSTLDFLAGS on targets that don't need
>> OpenSSL, so older versions of U-Boot will compile successfully.
> 
> Yes, but I don't understand why not setting HOSTCFLAGS/HOSTLDFLAGS
> fixes the build issue you mentioned.
> 

Without setting HOSTCFLAGS/HOSTLDFLAGS the command line is this

gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /work/bcm95615x/build/uboot-2012.10/include -idirafter /work/bcm95615x/build/uboot-2012.10/include2 -idirafter /work/bcm95615x/build/uboot-2012.10/include -I /work/bcm95615x/build/uboot-2012.10/lib/libfdt -I /work/bcm95615x/build/uboot-2012.10/tools -DCONFIG_SYS_TEXT_BASE=0x80800000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic   -o img2srec.o img2srec.c -c

Setting HOSTCFLAGS/HOSTLDFLAGS the command line becomes

gcc -O2 -I/work/bcm95615x/host/usr/include   -o img2srec.o img2srec.c -c

Because the value of HOSTCFLAGS set in U-Boot's config.mk is overwritten. 

Carlos Santos (Casantos)
DATACOM, P&D
