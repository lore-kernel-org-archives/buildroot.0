From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 1 Jul 2016 11:00:57 -0300 (BRT)
Subject: [Buildroot] Unable to compile uboot v2012.10 on Buildroot
 2016.05
In-Reply-To: <20160701151804.61f389e9@free-electrons.com>
References: <1249010753.7483898.1467378648497.JavaMail.zimbra@datacom.ind.br>
 <20160701151804.61f389e9@free-electrons.com>
Message-ID: <1572014322.7513168.1467381657827.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Julien Boibessot" <julien.boibessot@armadeus.com>
> Sent: Friday, July 1, 2016 10:18:04 AM
> Subject: Re: [Buildroot] Unable to compile uboot v2012.10 on Buildroot 2016.05

> Hello,
> 
> On Fri, 1 Jul 2016 10:10:48 -0300 (BRT), Carlos Santos wrote:
> 
>> /usr/bin/make -C tools all
>> gcc -O2 -I/work/bcm95615x/host/usr/include   -o img2srec.o img2srec.c -c
>> In file included from img2srec.c:55:0:
>> os_support.h:22:22: fatal error: compiler.h: No such file or directory
> 
> What is your host gcc version ? This failure smells like building an
> old U-Boot, with gcc 5.x as the host gcc version.

The problem happens on CentOS 7 (GCC 4.8.3) and Ubuntu 16.04 (GCC 5.3.1).

>> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
>> index a2274ee..5d171dd 100644
>> --- a/boot/uboot/uboot.mk
>> +++ b/boot/uboot/uboot.mk
>> @@ -92,9 +92,7 @@ endif
>>  
>>  UBOOT_MAKE_OPTS += \
>>  	CROSS_COMPILE="$(TARGET_CROSS)" \
>> -	ARCH=$(UBOOT_ARCH) \
>> -	HOSTCFLAGS="$(HOST_CFLAGS)" \
>> -	HOSTLDFLAGS="$(HOST_LDFLAGS)"
> 
> I'm not sure to see why this would fix the problem you're reporting.

It prevents overriding HOSTCFLAGS and HOSTLDFLAGS on targets that don't need OpenSSL, so older versions of U-Boot will compile successfully.

Carlos Santos (Casantos)
DATACOM, P&D
