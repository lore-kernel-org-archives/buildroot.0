From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 18:11:04 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-03-17
In-Reply-To: <D78902DE-4A4B-47A9-8F74-6FB30E882AE3@openadk.org>
References: <20170318072841.AF04B20775@mail.free-electrons.com>
 <124f5fc5-6307-f72f-f1be-8f2139dffced@mind.be>
 <20170318160225.GL23128@waldemar-brodkorb.de>
 <39f7b32b-2620-70a4-b9b0-d208a00628f4@mind.be>
 <D78902DE-4A4B-47A9-8F74-6FB30E882AE3@openadk.org>
Message-ID: <4edbc99a-8b90-3969-6ed7-e25ae84f36cf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-03-17 17:33, Waldemar Brodkorb wrote:
> Hi,
> 
>> Am 18.03.2017 um 17:19 schrieb Arnout Vandecappelle <arnout@mind.be>:
>>
>>
>>
>>> On 18-03-17 17:02, Waldemar Brodkorb wrote:
>>> Hi Arnout,
>>> Arnout Vandecappelle wrote,
>>>
>>>>
>>>>
>>>>> On 18-03-17 08:28, Thomas Petazzoni wrote:
>>>>> microblazeel |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/240cfb0497b1dd7b5b33b8f64635cca435d49f05
>>>>
>>>> I looked at this one and I'm a bit stumped. This is the error:
>>>> .../sysroot/usr/lib/libc.a(clnt_simple.os): In function `callrpc':
>>>> (.text+0x0): multiple definition of `callrpc'
>>>> .../sysroot/usr/lib/libtirpc.a(libtirpc_la-rpc_soc.o):(.text+0x784): first
>>>> defined here
>>>> (and many more like that).
>>>>
>>>> It's a bit weird that this object file from the C library even gets linked in.
>>>> The Map file says:
>>>>
>>>> .../sysroot/usr/lib/libc.a(rpc_thread.os)
>>>>    .../sysroot/usr/lib/libc.a(cancel.os) (__rpc_thread_destroy)
>>>> (skipping a few levels of indirection here).
>>>>
>>>> So somehow the pthread library is pulling in the RPC support from uClibc, which
>>>> obviously conflicts with tirpc.
>>>
>>> But if BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y is active, isn't uClibc-ng
>>> build with RPC support? If this is the case, you end up with two RPC
>>> implememtations. That should be handled by Buildroot.
>>>
>>> Do you have support for use either libtirpc or uClibc-ng internal
>>> RPC support?
>>
>> rpcbind need libtirpc for RPC support, it can't use the toolchain RPC for some
>> reason. That's why both implementations are there.
> 
> What does rpcbind use? ipv6 stuff?

 I have no idea, I just see that rpcbind selects libtirpc.


>> Normally it shouldn't be an issue to have two implementations. Since the one
>> from libtirpc is linked in before libc is linked in, the one from libc isn't
>> going to be used. This works for musl AFAICS.
> 
> Musl does not implement RPC. Gnu Libc deprecated it for a while.

 Hm, we still seem to enable RPC in glibc in Buildroot, and all our external
toolchains except Codescape have it enabled as well. So the world doesn't seem
to have caught on yet to that deprecation :-)

> 
>> The problem is that with uClibc-ng on microblaze, RPC from libc is linked in
>> unconditionally (from pthreads, AFAICS). Check e.g. busybox, it has
>> rpc_thread.os, rpc_commondata.os, rpc_prot.os and rpc_dtablesize.os. uClibc-ng
>> on ARC, for example, doesn't seem to have this.
>>
>> So it's the __rpc_thread_destroy in cancel.os that seems to be the problem here.
> 
> When Rpc is activated it will be included in libc.a since 1.0.18...
> 
> Arc external toolchain uses the old uclibc, where the combined libc isn't made.

 D'oh, silly me...

 So then I wonder, why don't we see this nfs-utils build failure on ARM? I just
tested, and nfs-utils actually does succeed to build on arm-static.

 Hang on, microblaze has linuxthreads instead of NPTL... That's why it behaves
differently.

 So, either this is fixed somehow in the linuxthreads implementation of uClibc,
or we make libtirpc depend on !linuxthreads (nothreads is OK since the RPC stuff
is pulled in by cancel.os - and anyway libtirpc depends on threads).

> Should uclibc-ng drop rpc support?

 I don't think that that's needed.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
