From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 21 Feb 2016 17:34:05 +0100
Subject: [Buildroot] [PATCH] package/util-linux: remove patch for uClibc
 support
In-Reply-To: <20160221151047.70803045@free-electrons.com>
References: <1455920889-14777-1-git-send-email-romain.naour@gmail.com>
 <56C8F75B.7060701@mind.be> <20160221151047.70803045@free-electrons.com>
Message-ID: <56C9E6FD.2070707@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Arnout,

Le 21/02/2016 15:10, Thomas Petazzoni a ?crit :
> Dear Arnout Vandecappelle,
> 
> On Sun, 21 Feb 2016 00:31:39 +0100, Arnout Vandecappelle wrote:
>> On 02/19/16 23:28, Romain Naour wrote:
>>> This patch is not needed anymore since the uClibc support
>>> has been removed from Buildroot.
>>> This patch was needed for uClibc <= 0.9.33 support.
>>>
>>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>>> ---
>>> Build tested with 2014R1 bfin toolchain.
>>
>>  But that toolchain is using uClibc 0.9.33, no? So how come it still works then?
> 
> mkostemp is used in three places:
> 
> lib/fileutils.c:	fd = mkostemp(localtmp, O_RDWR|O_CREAT|O_EXCL|O_CLOEXEC);
> libblkid/src/save.c:			fd = mkostemp(tmp, O_RDWR|O_CREAT|O_EXCL|O_CLOEXEC);
> libmount/src/utils.c:	fd = mkostemp(n, O_RDWR|O_CREAT|O_EXCL|O_CLOEXEC);
> 
> Both libblkid and libmount are "depends on BR2_USE_MMU", so they are
> not built on Blackfin.
> 
> However, I don't see how it can work with lib/fileutils. And indeed, at
> build time I get:
> 
>   CC       lib/libcommon_la-match.lo
> lib/fileutils.c: In function ?xmkstemp?:
> lib/fileutils.c:36: warning: implicit declaration of function ?mkostemp?
> lib/fileutils.c:36: warning: nested extern declaration of ?mkostemp?
> 
> And indeed:
> 
> $ ./output/host/usr/bin/bfin-linux-uclibc-gcc -o foo foo.c -lsmartcols
> /home/thomas/projets/buildroot/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/usr/lib/libsmartcols.so: undefined reference to `_fork'
> /home/thomas/projets/buildroot/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/usr/lib/libsmartcols.so: undefined reference to `_mkostemp'
> collect2: ld returned 1 exit status
> 
> Though it looks like this smartcols library also uses fork(), so it
> anyway cannot work properly.
> 
> Romain, it seems like your patch is not completely correct, so I've
> marked it as Rejected.

Ok no problem, I probably didn't selected the good util-linux option... my bad.

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
