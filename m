From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 May 2018 19:57:22 +0200
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <20180502090508.12893-1-chemobejk@gmail.com>
References: <20180502090508.12893-1-chemobejk@gmail.com>
Message-ID: <20180502175722.GA31449@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2018-05-02 12:05 +0300, Stefan Becker spake thusly:
> crypt() is an optional glibc feature. Some distros, like Fedora 28, are
> phasing it out to be replaced with libxcrypt [1]. Unfortunately this
> change is only ABI compatible, not source code compatible, i.e. the code
> will compile with warnings about undefined crypt(), but the resulting
> binary will crash.
> 
> Follow the guidance in the Fedora bug and include crypt.h when
> _XOPEN_CRYPT is not defined.
> 
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=1566464
> 
> Signed-off-by: Stefan Becker <chemobejk@gmail.com>
> ---
>  package/mkpasswd/mkpasswd.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/mkpasswd/mkpasswd.c b/package/mkpasswd/mkpasswd.c
> index 5820f32501..fd16230468 100644
> --- a/package/mkpasswd/mkpasswd.c
> +++ b/package/mkpasswd/mkpasswd.c
> @@ -44,6 +44,11 @@
>  #include <sys/time.h>
>  #endif
>  
> +/* glibc without crypt() */
> +#ifndef _XOPEN_CRYPT
> +#include <crypt.h>
> +#endif

But what if the libxcrypt package is not installed? Since crypt is only
optional in POSIX, there is no guarantee that libxcrypt is even present
on a system, especially now that glibc has decided to no longer provide
it by default, and given that even --enable-obsolete-crypt does not even
declare _XOPEN_CRYPT...

However, until we have another distribution with the new glibc version,
this fix is good enough since it is at least working as-is on a stock
Fedora 28.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  /* Application-specific */
>  #include "utils.h"
>  
> -- 
> 2.17.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
