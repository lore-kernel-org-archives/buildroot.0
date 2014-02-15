From: Frank Bergmann <bergmann@rosho.de>
Date: Sat, 15 Feb 2014 18:29:49 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAEAJfBHZ_4hSWN+boCRCvxJbFC1+T_WN=Dv3oVM2yz0z=t5JQ@mail.gmail.com>
References: <20140214073009.1D7E6102637@stock.ovh.net>
 <20140214101241.27857b9e@skate>
 <CAAEAJfBHZ_4hSWN+boCRCvxJbFC1+T_WN=Dv3oVM2yz0z=t5JQ@mail.gmail.com>
Message-ID: <52FFA40D.1040100@rosho.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 14.02.2014 14:15, Ezequiel Garc?a wrote:
>>>       nios2 |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/70a47bd7392560cbc1c64769c8357c0b4c91ca3b/
>>
>> Another missing syscall on NIOS II ? Ezequiel ?
>>
>> ../lib/libext2fs.so: undefined reference to `fallocate64'
>> collect2: error: ld returned 1 exit status
>>
>
> Ah, yes. We have lots of packages failing with this issue. I think
> it's some issue
> with the toolchain. fallocate64 is not a system call (only fallocate
> exists, AFAICS),
> so this should be some libc issue.
>
> Anybody knows better? Who implements fallocate64? What can we do to fix this
> in Buildroot (using an external toolchain)?

No, sorry. But after dig a little bit:
e2fsprogs using

   _FILE_OFFSET_BITS=64

while compiling the source. In this case the fallocate system call will 
be silently replaced by fallocate64 (see: 
https://lists.debian.org/debian-glibc/2010/02/msg00088.html). But 
fallocate64 is unfortunately not available on nios2 toolchain at the moment.

The only solution that works appears to be completely disable the 
fallocate system call(s) by providing

   ac_cv_func_fallocate=no

to the configure script. The effect in e2fsprogs will be that 
unix_discard() in ext2fs/unix_io.c will return with the "UNIMPLEMENTED" 
return code. I'm not sure for the moment if the whole packages or only a 
couple of functions gets unusable with this.

With regards,
Frank Bergmann.
