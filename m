From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Sep 2016 21:35:07 +0200
Subject: [Buildroot] [PATCH] package/libupnpp: add patch to fix build
 issue
In-Reply-To: <20160913133502.2586-1-joerg.krause@embedded.rocks>
References: <20160913133502.2586-1-joerg.krause@embedded.rocks>
Message-ID: <20160913213507.77f05a1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Sep 2016 15:35:02 +0200, J?rg Krause wrote:
> Bumping libupnpp to version 0.15.0 introduced a build error for some
> architectures:
> 
> ```
> ./libupnpp/workqueue.h:308:29: error: field 'res' has incomplete type
>          std::future<void *> res;
>                              ^
> ./libupnpp/workqueue.h: In member function 'bool
> WorkQueue<T>::start(int, void* (*)(void*), void*)':
> ./libupnpp/workqueue.h:81:25: error: invalid use of incomplete type
> 'class std::packaged_task<void*(void*)>'
>              w.res = task.get_future();
> ```
> 
> The problem is that `std::future` is not available for all
> architectures, e.g. it is missing for ARMv5 (soft-float). libstdc++
> enables `std::future` only if `ATOMIC_INT_LOCK_FREE > 1`, which
> according the the libstdc++ documentation means that operations on
> atomic ints are guaranteed to be lock-free.
> 
> This check is not true for some target, e.g. the toolchain for the
> ARMv5 target defines:
> 
> ```
> $ echo | /usr/bin/arm-linux-g++ -dM -E - | grep ATOMIC_INT_LOCK_FREE
> #define __GCC_ATOMIC_INT_LOCK_FREE 1
> 
> ```
> 
> We add a patch from upstream which detects if `std::future` is available
> and opts-out the functionality for unsupported targets.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f8eb38ef79160e1f646dae0be19f27fae82a58bc
> http://autobuild.buildroot.net/results/158e0ceeff009146b78a0d2bb278c76479bafc34
> http://autobuild.buildroot.net/results/1760cf53c77e16bb2b5bc795bd0ce5eb65f258f2
> http://autobuild.buildroot.net/results/5b73e52495aa1bbb2c704492237da784b9d74bc2
> http://autobuild.buildroot.net/results/6d922a1bbace024fcf040beb49bbb119036865ef
> http://autobuild.buildroot.net/results/bebb8983e7579ee4b4bcf18f037c7797ab86f8db
> http://autobuild.buildroot.net/results/0f1a5832ced2a6ec2e18f9f14197446fda6af692
> http://autobuild.buildroot.net/results/94a9cc349f23a47246b06619a019bcb917493415
> http://autobuild.buildroot.net/results/19fba094098af5c1ce1e1371e5e88393c4a6ac9c
> http://autobuild.buildroot.net/results/578935b5c04005d1f096059387d16911f953ec6f
> http://autobuild.buildroot.net/results/2ad698f1665b7b886141672181cb76ec3c40a743
> 
> and more...
> 
> Note, that we enable autoreconf as the patch touches configure.ac.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libupnpp/0001-Check-for-std-future.patch | 127 +++++++++++++++++++++++
>  package/libupnpp/libupnpp.mk                     |   2 +
>  2 files changed, 129 insertions(+)
>  create mode 100644 package/libupnpp/0001-Check-for-std-future.patch

To me, this really should be fixed in gcc, but this it's a very
complicated thing to do, I've applied your patch to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
