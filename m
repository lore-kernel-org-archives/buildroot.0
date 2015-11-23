From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 23 Nov 2015 12:57:59 +0200
Subject: [Buildroot] [PATCH] collectd: fix musl builds (ipc module)
In-Reply-To: <20151123105437.GA14445@vostro>
References: <20151123105437.GA14445@vostro>
Message-ID: <20151123105759.GO2177@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex,

On Mon, Nov 23, 2015 at 12:54:37PM +0200, Alex Suykov wrote:

[...]

> diff --git a/package/collectd/0002-ipc-enable-gnu-source.patch b/package/collectd/0002-ipc-enable-gnu-source.patch
> new file mode 100644
> index 0000000..5d8813a
> --- /dev/null
> +++ b/package/collectd/0002-ipc-enable-gnu-source.patch
> @@ -0,0 +1,26 @@
> +https://github.com/collectd/collectd/commit/3e3848349b753d78a0b1d19648fb394866856bda
> +
> +    ipc: enable _GNU_SOURCE to fix build with musl libc
> +
> +    This fixes compile the compile error:
> +
> +    > ipc.c:154:49: error: 'struct shm_info' has no member named 'used_ids'
> +    >    ipc_submit_g("shm", "segments", NULL, shm_info.used_ids);
> +    >                                                   ^
> +
> +    Fixes #1147

Please add you sign-off here.

baruch

> +
> +diff --git a/src/ipc.c b/src/ipc.c
> +index 3763f24..b403847 100644
> +--- a/src/ipc.c
> ++++ b/src/ipc.c
> +@@ -32,6 +32,9 @@
> + #include "configfile.h"
> + 
> + #if KERNEL_LINUX
> ++  /* _GNU_SOURCE is needed for struct shm_info.used_ids on musl libc */
> ++# define _GNU_SOURCE
> ++
> +   /* X/OPEN tells us to use <sys/{types,ipc,sem}.h> for semctl() */
> +   /* X/OPEN tells us to use <sys/{types,ipc,msg}.h> for msgctl() */
> +   /* X/OPEN tells us to use <sys/{types,ipc,shm}.h> for shmctl() */

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
