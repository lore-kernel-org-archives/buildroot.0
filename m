From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 May 2014 21:46:27 +0200
Subject: [Buildroot] [PATCH v3] protobuf: fix build for some unsupported
	architectures
In-Reply-To: <7785bef8562b61c25931c80386ab9a60fe80459f.1399554410.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 8 May 2014 16:06:50 +0300")
References: <7785bef8562b61c25931c80386ab9a60fe80459f.1399554410.git.baruch@tkos.co.il>
Message-ID: <871tw4cauk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add patches for making use of generic gcc atomic operations for unknown
 > architectures. Patches taken from
 > http://code.google.com/p/protobuf/issues/detail?id=488 .

 > Disable build for architectures that are not supported.

 > Fixes:
 > http://autobuild.buildroot.net/results/7e5/7e5791225334096206887de8a38fd947e1f8e9a2/
 > http://autobuild.buildroot.net/results/cf1/cf147b9188d6787a6a1a6072bf9bc6f7ddf5e5ae/

 > Cc: Phil Eichinger <phil.eichinger@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Thanks, but a quick test with powerpc and the default external toolchain
doesn't build:

BR2_powerpc=y
BR2_powerpc_603e=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_PROTOBUF=y

In file included from ./google/protobuf/stubs/atomicops.h:188:0,
                 from ./google/protobuf/stubs/once.h:81,
                 from google/protobuf/stubs/once.cc:38:
./google/protobuf/stubs/atomicops_internals_generic_gcc.h: In function 'google::protobuf::internal::Atomic32 google::protobuf::internal::NoBarrier_CompareAndSwap(volatile google::protobuf::internal::Atomic32*, google::protobuf::internal::Atomic32, google::protobuf::internal::Atomic32)':
./google/protobuf/stubs/atomicops_internals_generic_gcc.h:44:31: error: '__ATOMIC_RELAXED' was not declared in this scope
./google/protobuf/stubs/atomicops_internals_generic_gcc.h:44:65: error: '__atomic_compare_exchange_n' was not declared in this scope
./google/protobuf/stubs/atomicops_internals_generic_gcc.h: In function 'google::protobuf::internal::Atomic32 google::protobuf::internal::NoBarrier_AtomicExchange(volatile google::protobuf::internal::Atomic32*, google::protobuf::internal::Atomic32)':

So it looks like we need to tweak the arch list a bit.

-- 
Bye, Peter Korsgaard
