From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 10 Jun 2013 15:08:05 +0100
Subject: [Buildroot] problem with external toolchain with hard float
In-Reply-To: <51ADA9AA.4060506@carallon.com>
References: <51ADA9AA.4060506@carallon.com>
Message-ID: <51B5DDC5.1000709@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/06/2013 09:47, Will Wagner wrote:
> Hello All,
>
> I'm trying to update a project to 2013.05. I have an external toolchain
> (build with ct-ng 1.18) for arm that is hard float.
>
> The problem I have is that the elf files being built for the target do
> not run. This is because in each elf file the program interpreter is set
> as /lib/ld-linux.so.3 but if I look in the target filesystem that is
> generated it has /lib/ld-linux-armhf.so.3
>
> So it seems like my toolchain is somehow building elf files that won't
> run with the toolchain which has me pretty confused. Do I just need  a
> suitable sym link in my target fs or is this something wrong with how
> things are being built. Could it be that the toolchain wrapper is
> somehow forcing soft float?
>
> Thanks
> Will
>

Hello,

I have sorted my problem, was more a bug with the toolchain ct-ng was 
building. In case anyone else runs into this problem, this is how I 
fixed the issue.

I could work around the problem by settings:

BR2_TARGET_OPTIMIZATION="-pipe -Wl,-dynamic-linker=/lib/ld-linux-armhf.so.3"

The better fix is to patch the building of GCC, see this page with 
details, including patch at the bottom.

https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2012

Thanks
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7471 9224
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
