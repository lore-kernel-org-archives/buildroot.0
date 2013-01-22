From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 22 Jan 2013 02:34:11 +0200
Subject: [Buildroot] [PATCH 3/3] initramfs: add support for LZO and XZ
 compression methods
In-Reply-To: <50FDD2DC.8050004@zacarias.com.ar>
References: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
 <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
 <50FDD171.60804@petroprogram.com> <50FDD2DC.8050004@zacarias.com.ar>
Message-ID: <50FDDE83.6080206@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

22.1.2013 1:44, Gustavo Zacarias kirjoitti:
> On 01/21/2013 08:38 PM, Stefan Fr?berg wrote:
>
>> You will probably need --check=crc32 with that xz-compression.
>> I have had difficulties booting linux 3.3.1 kernel (don't know about
>> later versions)
>> with xz-compressed initramfs without that option.
> You are 100% correct.
> It didn't fail me during testing because buildroot is never using any
> compressed cpio archive, thus the previous options (gzip, bzip2) were
> never used.

Yeah.
It really doesn't make sense to compress if the initramfs file in
question is embedded directly into
kernel (which at least version 2012.05 and earlier buildroot did)
because usually the kernel
itself would be also compressed. So in that specific case doing double
compression
(once for the initramfs file embedded into kernel and then again for the
whole kernel+initramfs thing)
would be waste of time.

But for initramfs files *outside* kernel these two new compression
methods are very usefull.

lzo being just barely better in compression than gzip but fastest
decompression of all,
while xz being the best compression.
(So lzo replaces gzip and xz replaces bzip2 and lzma)

I use xz for kernel itself and also for outside initramfs

> I noticed when checking the bzImage size in a tweaked qemu_x86_defconfig
> test run that it never changed much.
> New patchset will follow that fixes this and the previous issue.
> Regards.

Stefan
