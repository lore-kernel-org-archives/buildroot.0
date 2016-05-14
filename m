From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 May 2016 01:54:07 +0200
Subject: [Buildroot] How to choose C library dependencies
In-Reply-To: <9f06d929-7f0c-7461-d6b2-c85b46515c4d@yandex.ru>
References: <5731B0DD.1080201@gmail.com>
 <9f06d929-7f0c-7461-d6b2-c85b46515c4d@yandex.ru>
Message-ID: <4904ae0d-f790-063e-a365-675596985f02@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/14/16 05:59, ???? ?????? wrote:
> Hello!
> I want to compile ejabberd and run it on my router. I choose erlang package with
> SMP support and all modules and ejabberd package, does not configure defconfig.
> Then I run /make ejabberd/, copy ejabberd, erlang and busybox from /target/
> folder to router and run it.

  Buildroot in't really meant for that kind of scenario. That said, it should be 
possible to do it. Basically you must create a toolchain that matches exactly 
with what is already installed on the target.


> I found that at least ejabberd compiled with glibc dependence and won't run
> without it. Running /cd /path/to/ejabberd && ./ejabberdctl start/ ends with
>> /opt/lib/erlang/bin/erl: exec: line 29: /usr/lib/erlang/erts-7.3/bin/erlexec
> As I found before, it's because erlexec want glibc which missing in router.
> Than I enable Linux kernel, set defconfig to bcm and try to run /make/ and copy
> these programms from rootfs image to router with same result.
>
> How can I compile these programms (ejabberd, erlang and busybox) with uClibc
> dependence?

  The config file you attached indeed selects uClibc, so I don't see how it 
could possibly link against glibc. How do you know it links with glibc?

  To verify something like that, do:

readelf -d output/target/usr/lib/erlang/erts-7.3/bin/erlexec

and check that all the libraries mentioned there exist on the target.


  Regards,
  Arnout

>
> *Buildroot:* snapshot from 2016.05.13
> *C library in menuconfig:* uClibc with C++ support
> *defconfig:* bcm
> *Target Architecture:* ARM (little endian)
> *Target Architecture Variant:* cortex-A9
> *System running buildroot:* Debian 8 x64
> *Router:* Broadcom BCM4708A0, 2xARM Cortex A9, asuswrt-merlin 380.58_0
> *.config:* in attach
>
> --
> ????????????? ????????? ?????: 1D38C8C9
> ?????????: 6210 01B6 A34E E490 A9E4  87DD 841D 0ABE 1D38 C8C9
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
