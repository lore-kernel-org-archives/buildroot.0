From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 18:26:25 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/opencv3: fix build with atomic
In-Reply-To: <20201017134623.3457333-1-fontaine.fabrice@gmail.com>
References: <20201017134623.3457333-1-fontaine.fabrice@gmail.com>
Message-ID: <20201017162625.GQ3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-10-17 15:46 +0200, Fabrice Fontaine spake thusly:
> Restore the atomic workaround that was wrongly removed when bumping to
> version 3.4.9 in commit f6fb2cae0691d25b034b12a16261ee26096db7d1 as it
> seems that opencv3 still needs help to detect atomic library
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9162b29725f8d9b891eb74fcb8078f211140a841
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after tweaking the commit title to match the other
related commits 'link with libatomic if needed'. Thanks!

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Restore workaround instead of setting -DHAVE_CXX_ATOMICS_WITHOUT_LIB
> 
>  package/opencv3/opencv3.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
> index de89aebca4..648cc66af3 100644
> --- a/package/opencv3/opencv3.mk
> +++ b/package/opencv3/opencv3.mk
> @@ -13,6 +13,11 @@ OPENCV3_SUPPORTS_IN_SOURCE_BUILD = NO
>  
>  OPENCV3_CXXFLAGS = $(TARGET_CXXFLAGS)
>  
> +# Uses __atomic_fetch_add_4
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +OPENCV3_CXXFLAGS += -latomic
> +endif
> +
>  # Fix c++11 build with missing std::exception_ptr
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
>  OPENCV3_CXXFLAGS += -DCV__EXCEPTION_PTR=0
> -- 
> 2.28.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
