From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 8 May 2014 23:48:50 +0300
Subject: [Buildroot] [PATCH v3] protobuf: fix build for some unsupported
	architectures
In-Reply-To: <871tw4cauk.fsf@dell.be.48ers.dk>
References: <7785bef8562b61c25931c80386ab9a60fe80459f.1399554410.git.baruch@tkos.co.il>
 <871tw4cauk.fsf@dell.be.48ers.dk>
Message-ID: <20140508204850.GO3861@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, May 08, 2014 at 09:46:27PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Add patches for making use of generic gcc atomic operations for unknown
>  > architectures. Patches taken from
>  > http://code.google.com/p/protobuf/issues/detail?id=488 .
> 
>  > Disable build for architectures that are not supported.
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/7e5/7e5791225334096206887de8a38fd947e1f8e9a2/
>  > http://autobuild.buildroot.net/results/cf1/cf147b9188d6787a6a1a6072bf9bc6f7ddf5e5ae/
> 
>  > Cc: Phil Eichinger <phil.eichinger@gmail.com>
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Thanks, but a quick test with powerpc and the default external toolchain
> doesn't build:
> 
> BR2_powerpc=y
> BR2_powerpc_603e=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_PROTOBUF=y
> 
> In file included from ./google/protobuf/stubs/atomicops.h:188:0,
>                  from ./google/protobuf/stubs/once.h:81,
>                  from google/protobuf/stubs/once.cc:38:
> ./google/protobuf/stubs/atomicops_internals_generic_gcc.h: In function 'google::protobuf::internal::Atomic32 google::protobuf::internal::NoBarrier_CompareAndSwap(volatile google::protobuf::internal::Atomic32*, google::protobuf::internal::Atomic32, google::protobuf::internal::Atomic32)':
> ./google/protobuf/stubs/atomicops_internals_generic_gcc.h:44:31: error: '__ATOMIC_RELAXED' was not declared in this scope
> ./google/protobuf/stubs/atomicops_internals_generic_gcc.h:44:65: error: '__atomic_compare_exchange_n' was not declared in this scope
> ./google/protobuf/stubs/atomicops_internals_generic_gcc.h: In function 'google::protobuf::internal::Atomic32 google::protobuf::internal::NoBarrier_AtomicExchange(volatile google::protobuf::internal::Atomic32*, google::protobuf::internal::Atomic32)':
> 
> So it looks like we need to tweak the arch list a bit.

The generic internal atomic ops implementation (which is used to fix powerpc 
build) is using the gcc feature of "memory model aware atomic operations". 
These were introduced in gcc 4.7, while the Sourcery toolchain is gcc 4.5. I 
don't see a straightforward way to depend on gcc version like we have for 
kernel headers. Any ideas?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
