From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 23:23:35 +0200
Subject: [Buildroot] [PATCH] package/libunwind: disable for x86 with musl
In-Reply-To: <20170417173722.20719-1-romain.naour@gmail.com>
References: <20170417173722.20719-1-romain.naour@gmail.com>
Message-ID: <20170504232335.6cc82d1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Apr 2017 19:37:22 +0200, Romain Naour wrote:
> libunwind use sigreturn() and setcontext() while building for x86 [1]
> but this function is not available with musl [2].
> 
> This throw a warning during libunwind build:
> In file included from x86/Los-linux.c:4:0:
> x86/Gos-linux.c: In function ?_ULx86_local_resume?:
> x86/Gos-linux.c:298:7: warning: implicit declaration of function ?sigreturn? [-Wimplicit-function-declaration]
>       sigreturn (sc);
>       ^
> But any program trying to link against libunwind-generic.so or
> libunwind.so fail to build:
> [...]/usr/lib/libunwind-generic.so: undefined reference to `sigreturn'
> [...]/usr/lib/libunwind-generic.so: undefined reference to `setcontext'
> collect2: error: ld returned 1 exit status
> 
> Disable libunwind for x86 target when musl is used.
> 
> Reported upstream by Waldemar [3]
> 
> [1] http://git.savannah.gnu.org/gitweb/?p=libunwind.git;a=blob;f=src/x86/Gos-linux.c;h=17aebc2974af50eb0bf8292689b2ed22a4c97866;hb=HEAD#l299
> [2] http://openwall.com/lists/musl/2016/02/04/3
> [3] http://lists.nongnu.org/archive/html/libunwind-devel/2017-04/msg00030.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> ---
> Patch rebased after http://patchwork.ozlabs.org/patch/751402/
> ---
>  package/libunwind/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
