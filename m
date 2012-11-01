From: Eial Czerwacki <eial@scalemp.com>
Date: Thu, 01 Nov 2012 09:05:37 +0200
Subject: [Buildroot] cannot compile a program within a uclibc build
	chroot
In-Reply-To: <20121101065835.GC17989@sapphire.tkos.co.il>
References: <50913F89.3000802@scalemp.com> <5091A1B2.7060407@mind.be>
 <50921057.2080606@scalemp.com> <20121101061028.GA17989@sapphire.tkos.co.il>
 <5092141C.8030100@scalemp.com> <20121101065835.GC17989@sapphire.tkos.co.il>
Message-ID: <50921F41.6040502@scalemp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On 11/01/2012 08:58 AM, Baruch Siach wrote:
> Hi Eial,
>
> On Thu, Nov 01, 2012 at 08:18:04AM +0200, Eial Czerwacki wrote:
>> On 11/01/2012 08:10 AM, Baruch Siach wrote:
>>> Hi Eial,
>>>
>>> On Thu, Nov 01, 2012 at 08:01:59AM +0200, Eial Czerwacki wrote:
>>>> On 11/01/2012 12:09 AM, Arnout Vandecappelle wrote:
>>>>> On 10/31/12 16:11, Eial Czerwacki wrote:
>>>>>> '/usr/lib/gcc/i686-unknown-linux-uclibc/4.6.0/../../../../i686-unknown-linux-uclibc/bin/as':
>>>>>>
>>>>>> execv: No such file or directory
>>>>>  This is probably because one of the libraries against which as is linked
>>>>> cannot be found.  It's probably linked with the host libc instead of the
>>>>> target libc.  You can verify that with 'readelf -d': if you see libc.so.6
>>>>> in there, it's been linked with the host's glibc.
>>>>>
>>>>>  Regards,
>>>>>  Arnout
>>>> ok, that is stranger, I cannot run readelf from within the chroot
>>>> although it is there, see:
>>> Well, you don't need to. You can use your host's readelf on your target's 
>>> binaries to get the same information.
>>>
>>>> sh: can't execute 'readelf': No such file or directory
>>>> ~ # which readelf
>>>> /usr/bin/readelf
>>>> ~ # /usr/bin/readelf
>>>> sh: can't execute '/usr/bin/readelf': No such file or directory
>>> You may get a "No such file or directory" error when one of your NEEDED shared 
>>> libraries are missing. Run 'readelf -d' on your terget's readelf, to see your 
>>> dependencies.
>>>
>>> baruch
>>>
>> Hello Baruch,
>>
>> thanks for the tip, I think I found my issue, when I configured the
>> image, I've enabled BR2_PREFER_STATIC_LIB as I'm going to use it to
>> create static bins, I guess that if I remove it, it will work, question
>> is, will removing this can prevent me from creating static bins?
> I'm not sure what PREFER_STATIC_LIB has to do with you original problem.
>
> As to creating static binaries when PREFER_STATIC_LIB is disabled, according 
> to package/Makefile.in --enable-static is always present in 
> $(SHARED_STATIC_LIBS_OPTS). Only when PREFER_STATIC_LIB is enabled 
> --disable-shared is also added. In short, you can always build static 
> binaries; but enabling PREFER_STATIC_LIB prevents shared binaries building.
>
> baruch
>
this is why:
09:02:59 $ readelf -d
root//usr/lib/gcc/i686-unknown-linux-uclibc/4.6.0/../../../../i686-unknown-linux-uclibc/bin/as

Dynamic section at offset 0xfc488 contains 17 entries:
  Tag        Type                         Name/Value
_ 0x00000001 (NEEDED)                     Shared library: [libc.so.0]_
 0x0000000c (INIT)                       0x804911c
 0x0000000d (FINI)                       0x80c4414
 0x00000004 (HASH)                       0x8048128
 0x00000005 (STRTAB)                     0x8048ac0
 0x00000006 (SYMTAB)                     0x8048450
 0x0000000a (STRSZ)                      827 (bytes)
 0x0000000b (SYMENT)                     16 (bytes)
 0x00000015 (DEBUG)                      0x0
 0x00000003 (PLTGOT)                     0x8145568
 0x00000002 (PLTRELSZ)                   656 (bytes)
 0x00000014 (PLTREL)                     REL
 0x00000017 (JMPREL)                     0x8048e8c
 0x00000011 (REL)                        0x8048dfc
 0x00000012 (RELSZ)                      144 (bytes)
 0x00000013 (RELENT)                     8 (bytes)
 0x00000000 (NULL)                       0x0

09:03:00 $ find root -name "libc*"
find: root/lost+found: Permission denied
root/usr/include/bits/libc-lock.h
_root/usr/lib/libc.a_
root/usr/lib/libcrypt_pic.a
root/usr/lib/libc_pic.a
root/usr/lib/libcurses.a
root/usr/lib/libcrypt.a

from what I can understand, although I've marked it to be static as
possible, not all packages can be linked to static libs, gcc is an
example as it needs libc.so.0 rather than libc.a
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121101/9b07e8a7/attachment.html>
