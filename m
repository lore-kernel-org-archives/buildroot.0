From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Aug 2015 23:38:16 +0200
Subject: [Buildroot] [PATCH] package/canfestival: fix build with musl
In-Reply-To: <1440279318-19132-1-git-send-email-yann.morin.1998@free.fr>
References: <1440279318-19132-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150822213815.GA3861@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

On 2015-08-22 23:35 +0200, Yann E. MORIN spake thusly:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Damn, I forgot the autobuilder refs:

Fixes:
    http://autobuild.buildroot.org/results/8eb/8ebb38f4b1ab4d1eadf7139e3467ed59ccb10646/
    http://autobuild.buildroot.org/results/0da/0dac4c0639d75540e004d0fdd0ac6cd9fb9c7ef0/
    http://autobuild.buildroot.org/results/75a/75aa6e7e4f3dcd74e4b65496060328ec7bd0e747/
    ...

Regards,
Yann E. MORIN.

> ---
>  package/canfestival/0003-sigval-musl.patch | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/canfestival/0003-sigval-musl.patch
> 
> diff --git a/package/canfestival/0003-sigval-musl.patch b/package/canfestival/0003-sigval-musl.patch
> new file mode 100644
> index 0000000..7a4dadf
> --- /dev/null
> +++ b/package/canfestival/0003-sigval-musl.patch
> @@ -0,0 +1,20 @@
> +timers/unix: fix build with musl
> +
> +sigval_t is a glibcism, which is not defined in musl.
> +
> +Use the union instead.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +diff -durN a/drivers/timers_unix/timers_unix.c b/drivers/timers_unix/timers_unix.c
> +--- a/drivers/timers_unix/timers_unix.c	2014-06-12 14:07:16.000000000 +0200
> ++++ b/drivers/timers_unix/timers_unix.c	2015-08-22 23:12:26.921455179 +0200
> +@@ -33,7 +33,7 @@
> + 	}
> + }
> + 
> +-void timer_notify(sigval_t val)
> ++void timer_notify(union sigval val)
> + {
> + 	if(gettimeofday(&last_sig,NULL)) {
> + 		perror("gettimeofday()");
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
