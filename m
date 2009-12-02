From: Joachim Pihl <jpihl@nevion.com>
Date: Wed, 2 Dec 2009 10:04:31 +0100
Subject: [Buildroot] Shared objects, load order?
In-Reply-To: <4d28d4b50912020059t6ae52e8bx7b0f76db774e4cdd@mail.gmail.com>
References: <op.u4auhacnyqa4qb@jap>
	<4d28d4b50912020059t6ae52e8bx7b0f76db774e4cdd@mail.gmail.com>
Message-ID: <op.u4azhtyjyqa4qb@jap-lappis.nevion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 02 Dec 2009 09:59:07 +0100, Lionel Landwerlin  
<llandwerlin@gmail.com> wrote:

> Hi Joachim,
>
> Did you try to run gdb on one of your application to see where it  
> crashes ?

No useful info found when running gdbserver on target, I believe it hasn't  
even reached main() yet when it crashes.

> I recently had a similar problem
> (http://sourceware.org/ml/crossgcc/2009-11/msg00120.html).
> In my case, my applications where crashing in a weak symbol in
> libdl.so which should had been
> replaced by the strong symbol of libpthread.so. Though, my
> applications were linked using -ldl -lpthread,
> libdl was loaded first and its weak symbol for the pthread_once
> function was still valid even after the
> libpthread load's.
> From my first investigations, it seems to be a problem with the way
> libraries are built (I had this problem
> with directfb-1.0, not with directfb-1.4).

I suspect libboost_thread-mt.so is referencing libpthread.so.0 without  
actually loading it, but right now I don't have the time to investigate.  
Critical bug fix time...

>
>>
>> Works:
>>
>> # ldd /multicon/gyda
>>        libxml2.so.2 => /usr/lib/libxml2.so.2 (0x4000e000)
>>        libgd.so.2 => /usr/lib/libgd.so.2 (0x4012b000)
>>        libpng12.so.0 => /usr/lib/libpng12.so.0 (0x4016b000)
>>        libpthread.so.0 => /lib/libpthread.so.0 (0x40191000)
>>        libz.so.1 => /usr/lib/libz.so.1 (0x401ab000)
>>        libboost_thread-mt.so => /usr/lib/libboost_thread-mt.so  
>> (0x401c4000)
>>        libspread.so.2 => /usr/lib/libspread.so.2 (0x401d8000)
>>        libcrypt.so.0 => /lib/libcrypt.so.0 (0x4023f000)
>>        libsqlite3.so.0 => /usr/lib/libsqlite3.so.0 (0x4025c000)
>>        libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x402c5000)
>>        libm.so.0 => /lib/libm.so.0 (0x40376000)
>>        libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x40390000)
>>        libc.so.0 => /lib/libc.so.0 (0x403a3000)
>>        libdl.so.0 => /lib/libdl.so.0 (0x40401000)
>>        librt.so.0 => /lib/librt.so.0 (0x4040c000)
>>        libnsl.so.0 => /lib/libnsl.so.0 (0x40415000)
>>        ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0x40000000)
>>
>>
>> Crashes:
>>
>> # ldd /multicon/phy
>>        libboost_thread-mt.so => /usr/lib/libboost_thread-mt.so  
>> (0x4000e000)
>>        libspread.so.2 => /usr/lib/libspread.so.2 (0x40022000)
>>        libcrypt.so.0 => /lib/libcrypt.so.0 (0x40089000)
>>        libsqlite3.so.0 => /usr/lib/libsqlite3.so.0 (0x400a6000)
>>        libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x4010f000)
>>        libm.so.0 => /lib/libm.so.0 (0x401c0000)
>>        libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x401da000)
>>        libc.so.0 => /lib/libc.so.0 (0x401ed000)
>>        libpthread.so.0 => /lib/libpthread.so.0 (0x4024b000)
>>        librt.so.0 => /lib/librt.so.0 (0x40265000)
>>        libnsl.so.0 => /lib/libnsl.so.0 (0x4026e000)
>>        libdl.so.0 => /lib/libdl.so.0 (0x40277000)
>>        ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0x40000000)
>>
>>


-- 
Joachim Pihl
Senior R&D Engineer
Nevion

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

-----------------------------------
The Global Video Transport Leader
-----------------------------------
