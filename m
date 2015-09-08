From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Sep 2015 17:24:17 +0200
Subject: [Buildroot] EOVERFLOW fstat() error on cortex-A9 android when
 trying to load shared library
In-Reply-To: <CAF5aO=+gjgRuocbAvLicJWPkEkiiuUMFtTG6mDV-roq0cz-_fQ@mail.gmail.com>
References: <CAF5aO=Ko183BGatMakjXot=EsnXbaodOHZPRmnMa8nqH=vZkEw@mail.gmail.com>
 <55EDA03A.2070302@mind.be>
 <CAF5aO=LYm6GYVXv0gJW9fS3A8JXMAeZwnEokG0Htpac4SZuJVQ@mail.gmail.com>
 <CAF5aO=LiY_3XBn+HgA8-nwJk51GQkgGQqbnpmdQoyS64zxDTWA@mail.gmail.com>
 <55EDAA89.20809@mind.be>
 <CAF5aO=+dvVTzhdJW7D7udiEmomAU_ZWTCSXF5OP0zcmhuHcUqQ@mail.gmail.com>
 <55EDF64F.7020707@mind.be> <20150908090719.GA14056@waldemar-brodkorb.de>
 <CAF5aO=+gjgRuocbAvLicJWPkEkiiuUMFtTG6mDV-roq0cz-_fQ@mail.gmail.com>
Message-ID: <55EEFDA1.6070104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-09-15 16:59, Alex Potapenko wrote:
[snip]
>     I would like to know if your nano configure says something like
>     this:
>     checking for _FILE_OFFSET_BITS value needed for large files... 64
>     Is your filesystem on the Android device bigger than 2 GB?
>     (where /opt and nano + libraries lives in)
> 
> 
> Yes, looking at nano config.log reveals this:
> 
>     configure:5147: checking for _FILE_OFFSET_BITS value needed for large files
>     ...
>     configure:5204: result: 64
> 
> 
> And /data partition that contains /opt is exactly 2 GB. Does this mean that it
> is a 32 bit file system, while the toolchain uses 64 bit file system interface?

 The -EOVERFLOW suggests the reverse: it's a large filesystem and we're making a
32-bit syscall.

 However, since we're building with LARGEFILE (which is forced in current
buildroot), all syscalls should be largefile syscalls so this issue should not
occur...

 However, in your 2015.08 config, I see you're using a custom uClibc config.
You're not turning off any largefile options there, are you?


 Regards,
 Arnout


> Will it work if I create an ext2 partition larger than 2 GB on my memory card
> and mount it as /opt?
> 
>      It would help if you would have your phone's kernel config. Do you have it?
> 
> 
> Unfortunately, no, I don't have the exact config used to build the kernel. I
> know it was compiled from this source:
> https://github.com/CyanogenMod/android_kernel_samsung_smdk4412 
> 
> I ran `make exynos4_defconfig`, then manually selected arch (exynos4) and mach
> (not sure I selected right, but that probably doesn't matter here). See the
> result attached.
> 
> Thanks a lot!
> 
> -- 
> Best regards,
> Alex Potapenko

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
