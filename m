From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 2 Dec 2009 14:04:34 +0100
Subject: [Buildroot] Shared objects, load order?
In-Reply-To: <op.u4a94vs8yqa4qb@jap>
References: <op.u4auhacnyqa4qb@jap>
	<4d28d4b50912020059t6ae52e8bx7b0f76db774e4cdd@mail.gmail.com>
	<op.u4azhtyjyqa4qb@jap-lappis.nevion.com> <op.u4a94vs8yqa4qb@jap>
Message-ID: <4d28d4b50912020504v40e0faccn86cb4983f20b2036@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yeah using LD_PRELOAD=/lib/libpthread.so solved my problems too...


On Wed, Dec 2, 2009 at 1:54 PM, Joachim Pihl <jpihl@nevion.com> wrote:
> On Wed, 02 Dec 2009 10:04:31 +0100, Joachim Pihl <jpihl@nevion.com> wrote:
>>
>> I suspect libboost_thread-mt.so is referencing libpthread.so.0 without
>> actually loading it, but right now I don't have the time to investigate.
>
> I have now confirmed that the problem is related to the specified order of
> the libraries when linking. I changed the order for the failing applications
> to match the one app that worked and voil?! - they came back to life. I
> don't think this is good, cross development is hard enough as it is without
> these kinds of gotchas.
>
>>
>>>
>>>>
>>>> Works:
>>>>
>>>> # ldd /multicon/gyda
>>>> ? ? ? libxml2.so.2 => /usr/lib/libxml2.so.2 (0x4000e000)
>>>> ? ? ? libgd.so.2 => /usr/lib/libgd.so.2 (0x4012b000)
>>>> ? ? ? libpng12.so.0 => /usr/lib/libpng12.so.0 (0x4016b000)
>>>> ? ? ? libpthread.so.0 => /lib/libpthread.so.0 (0x40191000)
>>>> ? ? ? libz.so.1 => /usr/lib/libz.so.1 (0x401ab000)
>>>> ? ? ? libboost_thread-mt.so => /usr/lib/libboost_thread-mt.so
>>>> (0x401c4000)
>>>> ? ? ? libspread.so.2 => /usr/lib/libspread.so.2 (0x401d8000)
>>>> ? ? ? libcrypt.so.0 => /lib/libcrypt.so.0 (0x4023f000)
>>>> ? ? ? libsqlite3.so.0 => /usr/lib/libsqlite3.so.0 (0x4025c000)
>>>> ? ? ? libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x402c5000)
>>>> ? ? ? libm.so.0 => /lib/libm.so.0 (0x40376000)
>>>> ? ? ? libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x40390000)
>>>> ? ? ? libc.so.0 => /lib/libc.so.0 (0x403a3000)
>>>> ? ? ? libdl.so.0 => /lib/libdl.so.0 (0x40401000)
>>>> ? ? ? librt.so.0 => /lib/librt.so.0 (0x4040c000)
>>>> ? ? ? libnsl.so.0 => /lib/libnsl.so.0 (0x40415000)
>>>> ? ? ? ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0x40000000)
>>>>
>>>>
>>>> Crashes:
>>>>
>>>> # ldd /multicon/phy
>>>> ? ? ? libboost_thread-mt.so => /usr/lib/libboost_thread-mt.so
>>>> (0x4000e000)
>>>> ? ? ? libspread.so.2 => /usr/lib/libspread.so.2 (0x40022000)
>>>> ? ? ? libcrypt.so.0 => /lib/libcrypt.so.0 (0x40089000)
>>>> ? ? ? libsqlite3.so.0 => /usr/lib/libsqlite3.so.0 (0x400a6000)
>>>> ? ? ? libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x4010f000)
>>>> ? ? ? libm.so.0 => /lib/libm.so.0 (0x401c0000)
>>>> ? ? ? libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x401da000)
>>>> ? ? ? libc.so.0 => /lib/libc.so.0 (0x401ed000)
>>>> ? ? ? libpthread.so.0 => /lib/libpthread.so.0 (0x4024b000)
>>>> ? ? ? librt.so.0 => /lib/librt.so.0 (0x40265000)
>>>> ? ? ? libnsl.so.0 => /lib/libnsl.so.0 (0x4026e000)
>>>> ? ? ? libdl.so.0 => /lib/libdl.so.0 (0x40277000)
>>>> ? ? ? ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0x40000000)
>>>>
>>>>
>>
>>
>
>
> --
> Joachim Pihl
> Senior R&D Engineer
> Nevion Europe
>
> Tel: +47 33 48 94 66
> Fax: +47 33 48 99 98
> Mobile: +47 91 33 98 91
> jpihl at nevion.com
> www.nevion.com
>
> ------------------------------------------------------
> The Global Video Transport Leader
> ------------------------------------------------------
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
