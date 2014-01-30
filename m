From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 30 Jan 2014 23:20:04 +0100
Subject: [Buildroot] i686-buildroot-linux-gnu-as  does not work
In-Reply-To: <52E6DC66.6040105@mind.be>
References: <1848702296.4768001.1390826907232.JavaMail.root@openwide.fr>
 <52E6DC66.6040105@mind.be>
Message-ID: <52EAD014.2070005@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 27/01/2014 23:23, Arnout Vandecappelle a ?crit :
> On 27/01/14 13:48, Romain Naour wrote:
>> I meant that usually in buildroot, Makefile's variables are 
>> overwritten in foo.mk
>>
>> I removed my patch and added AS="$(TARGET_CC) -c" in infozip.mk
>>
>> $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) AS="$(TARGET_CC) -c" -f 
>> unix/Makefile generic
>>
>> infozip compiles fine by doing that.
>
>  Actually there's a deeper cause I'm afraid...
>
>  The make command calls unix/configure to find out some things about 
> the platform, but the configure script sets CPP to /usr/bin/cpp or 
> /lib/cpp if either of these exist. But those host tools obviously have 
> the wrong predefined symbols, so the configure script will test if it 
> is possible to use assembly for the host, not for the target...
>
>  I think there are two possible "right" solutions:
>
> 1. fix unix/configure;
> 2. bypass unix/configure by using the generic_gcc target instead.
>
>  Regards,
>  Arnout
>

Thanks, that's why I had two situations:

At work, I use an i386 system then the test "Check if we can use asm 
code" pass and build fail with:

output/host/usr/bin/i686-buildroot-linux-gnu-as _crc_i386.s
mv _crc_i386.o crc_i386.o
mv: mv _match.o match.o
cannot stat `_crc_i386.o': No such file or directory

At home, I use an x86_64 then the test fail thus there is no build error...

I have send a patch series to fix build issues with infozip package.

Best regards,
Romain Naour
