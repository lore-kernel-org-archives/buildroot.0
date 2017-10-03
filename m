From: Joel Stanley <joel@jms.id.au>
Date: Tue, 3 Oct 2017 21:31:58 +0930
Subject: [Buildroot] [PATCH] pdbg: bump version to latest
In-Reply-To: <20171002215935.125438c2@windsurf.home>
References: <20170927021547.19421-1-joel@jms.id.au>
 <20171002215935.125438c2@windsurf.home>
Message-ID: <CACPK8Xd5h64mnbvdcWmT69Tpg1vmzaD5bYf5dyE2vPNaPYGevw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 3, 2017 at 5:29 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 27 Sep 2017 11:45:47 +0930, Joel Stanley wrote:
>> I got this error when attempting to build:
>>
>>  aclocal: error: couldn't open directory 'm4': No such file or directory
>>
>> So we now have the post patch hook to ensure the m4 directory is
>> present.
>>
>> In addition, the package now sets a variable with the Git SHA1 so that
>> the binary contians the expected output for --version.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> It doesn't build here:
>
>>>> pdbg 77158819158d1d7053a737ac090d04fdfbfe9265 Building
> PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/home/thomas/.rvm/bin:/usr/local/sbin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin"  /usr/bin/make -j5 "GIT_SHA1=\"77158819158d1d7053a737ac090d04fdfbfe9265\"" -C /home/thomas/projets/buildroot/output/build/pdbg-77158819158d1d7053a737ac090d04fdfbfe9265/
> /usr/bin/make  all-am
> dtc -i./ -I dts fake.dts -O dtb > fake.dtb.o.tmp
> m4 -I./ p8-fsi.dts.m4 > p8-fsi.dts
> m4 -I./ p8-i2c.dts.m4 > p8-i2c.dts
> dd if=fake.dtb.o.tmp of=fake.dtb.o ibs=16 conv=sync
> m4 -I./ p9-fsi.dtsi.m4 > p9-fsi.dtsi
> 23+1 records in
> 0+1 records out
> 384 bytes copied, 5.8961e-05 s, 6.5 MB/s
> rm fake.dtb.o.tmp
> m4 -I./ p8-host.dts.m4 > p8-host.dts
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-objcopy -I binary -O elf32-littlearm -B arm  fake.dtb.o fake.dtb.o
> m4 -I./ p9-kernel.dts.m4 > p9-kernel.dts
> m4 -I./ p9-host.dts.m4 > p9-host.dts
>   CC       libpdbg/libpdbg_la-host.lo
>   CC       libpdbg/libpdbg_la-kernel.lo
>   CC       libpdbg/libpdbg_la-fake.lo
>   CC       libpdbg/libpdbg_la-chip.lo
>   CC       libpdbg/libpdbg_la-p8chip.lo
> In file included from /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:71:0,
>                  from libpdbg/fake.c:17:
> /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/uClibc_stdio.h:149:16: error: expected identifier or ?(? before ?;? token
>   void *__unused;    /* Placeholder for codeset binding. */

Oops. I tested with uclibc, but it must have had a different
configuration. I think that symbol is defined when locale support is
enabled.

I created a patch to resolve the issue.

>> +PDBG_MAKE_OPTS = "GIT_SHA1=\"${PDBG_VERSION}\""
>
> Please use $() and not ${} when referencing make variables.

Fixed in v2.

Thanks for the review!

Cheers,

Joel
