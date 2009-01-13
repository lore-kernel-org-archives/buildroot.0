From: Eric <rocketman110@gmail.com>
Date: Mon, 12 Jan 2009 22:52:49 -0600
Subject: [Buildroot] external toolchain --sysroot
In-Reply-To: <eaeb93bb0901122046g2ed61992n672221d163c74971@mail.gmail.com>
References: <20090113043014.GA5238@cloud.net.au>
	<eaeb93bb0901122045p6e653f67of6172a11f28010d8@mail.gmail.com>
	<eaeb93bb0901122046g2ed61992n672221d163c74971@mail.gmail.com>
Message-ID: <eaeb93bb0901122052o16f639f8nbc8c25d989fdb876@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also I did build my tool chain with sysroot support ... so you would have to
do the same to get that to work.

Eric

On Mon, Jan 12, 2009 at 10:46 PM, Eric <rocketman110@gmail.com> wrote:

> I have had to patch a few other .mk files to work properly .. I can submit
> those as I get a chance .. util-linux is one that needed work.
>
> Eric
>
>   On Mon, Jan 12, 2009 at 10:45 PM, Eric <rocketman110@gmail.com> wrote:
>
>> I had to change it to be --sysroot= and then sysroot support works.
>>
>> Eric
>>
>>   On Mon, Jan 12, 2009 at 10:30 PM, Hamish Moffatt <hamish@cloud.net.au>wrote:
>>
>>> Hi Thomas,
>>>
>>> Firstly:
>>>
>>> The external toolchain --sysroot change in CFLAGS has broken my builds.
>>> (I only just merged into into my tree and tried it, so sorry for the
>>> delayed feedback).
>>>
>>> configure scripts are failing to compile any test program, with the
>>> error:
>>>
>>> configure:2909: checking for C compiler default output file name
>>> configure:2936:
>>> /home/hamish/work/xyz/buildroot/build_armeb/staging_dir/usr/bin/armeb-linux-uclibcgnu-gcc
>>> -Os  -I/home/hamish/work/xyz/buildroot/build_armeb/staging_dir/include
>>> -I/home/hamish/work/xyz/buildroot/build_armeb/staging_dir/usr/include
>>> -I/home/hamish/work/xyz/buildroot/build_armeb/staging_dir/usr/armeb-linux-uclibcgnu/include
>>> --sysroot /home/hamish/work/xyz/buildroot/build_armeb/staging_dir/ -Os
>>>  -I/home/hamish/work/xyz/buildroot/build_armeb/staging_dir/include
>>> -I/home/hamish/work/xyz/buildroot/build_armeb/staging_dir/usr/include
>>> -I/home/hamish/work/xyz/buildroot/build_armeb/staging_dir/usr/armeb-linux-uclibcgnu/include
>>> --sysroot /home/hamish/work/xyz/buildroot/build_armeb/staging_dir/
>>>  -L/home/hamish/work/xyz/buildroot/build_armeb/staging_dir/lib
>>> -L/home/hamish/work/xyz/buildroot/build_armeb/staging_dir/usr/lib conftest.c
>>>  >&5
>>> /home/hamish/work/xyz/buildroot/build_armeb/staging_dir/usr/bin/armeb-linux-uclibcgnu-ld:
>>> cannot find
>>> /home/hamish/work/xyz/buildroot/build_armeb/staging_dir/lib/libc.so.0 inside
>>> /home/hamish/work/xyz/buildroot/build_armeb/staging_dir/
>>> collect2: ld returned 1 exit status
>>> configure:2939: $? = 1
>>>
>>> The library does exist at that location, I guess it doesn't like the
>>> combination of the sysroot and the full path in -L.../lib.
>>>
>>> [ 2:49PM] hamish at bach:work/xyz/buildroot $ ls -l
>>> /home/hamish/work/xyz/buildroot/build_armeb/staging_dir/lib/libc.so.0
>>> lrwxrwxrwx 1 hamish hamish 19 2008-11-10 17:15
>>> /home/hamish/work/xyz/buildroot/build_armeb/staging_dir/lib/libc.so.0 ->
>>> libuClibc-0.9.29.so <http://libuclibc-0.9.29.so/>
>>>
>>> [ 2:54PM] hamish at bach:work/xyz/buildroot $ ls -l
>>> /home/hamish/work/xyz/buildroot/build_armeb/staging_dir/lib/
>>> libuClibc-0.9.29.so <http://libuclibc-0.9.29.so/>
>>> -rw-r--r-- 1 hamish hamish 293315 2008-11-10 17:15
>>> /home/hamish/work/xyz/buildroot/build_armeb/staging_dir/lib/
>>> libuClibc-0.9.29.so <http://libuclibc-0.9.29.so/>
>>>
>>> My gcc is 4.1.2. This might work with newer versions.
>>>
>>> I removed the --sysroot in package/Makefile.in and it works again.
>>>
>>> What is the purpose of using the --sysroot flag? It's used even if gcc
>>> is configured without it.
>>>
>>>
>>> Secondly:
>>>
>>> The change to toolchain/external-toolchain/ext-tool.mk seems to copy the
>>> sysroot into $(STAGING_DIR) as a side-effect of copying the libs to the
>>> $(TARGET_DIR), not as an explicit dependency.
>>>
>>> And in my case, the sysroot IS the $(STAGING_DIR)... but my gcc is not
>>> configured with sysroot so it doesn't do any copying anyway.
>>>
>>> I did a fresh checkout of my tree and built the toolchain and then my
>>> board, and it failed as above. gcc has a hardcoded path to libc in it,
>>> so it doesn't expect to get --sysroot as well.
>>>
>>> Hamish
>>> --
>>> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
>>
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090112/71673478/attachment.htm 
