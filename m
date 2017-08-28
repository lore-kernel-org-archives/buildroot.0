From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Aug 2017 18:47:34 +0200
Subject: [Buildroot] [PATCH] package/vde2: fix build issue with gcc 7.x
In-Reply-To: <20170827220330.27544-1-romain.naour@gmail.com>
References: <20170827220330.27544-1-romain.naour@gmail.com>
Message-ID: <20170828164734.GA2879@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

romain, All,

On 2017-08-28 00:03 +0200, Romain Naour spake thusly:
> Like for dieharder package [1], add static to inline functions.
> https://git.buildroot.net/buildroot/commit/?id=21133ada326c87627f7bdee4493d8086587c3cca
> 
> Fixes:
> http://autobuild.buildroot.net/results/ed9/ed9abb1aed2ae87971ae119f4bca83cbf9861466
> http://autobuild.buildroot.net/results/2a1/2a1f73bfaf7097d42165d5c5f6c24d1aad72c929
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  .../0002-fstp-Add-static-to-inline-functions.patch | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/vde2/0002-fstp-Add-static-to-inline-functions.patch
> 
> diff --git a/package/vde2/0002-fstp-Add-static-to-inline-functions.patch b/package/vde2/0002-fstp-Add-static-to-inline-functions.patch
> new file mode 100644
> index 0000000..0dbe083
> --- /dev/null
> +++ b/package/vde2/0002-fstp-Add-static-to-inline-functions.patch
> @@ -0,0 +1,44 @@
> +From 67bc8443ac7e8144a78d84dee30a5cac3b5c99a4 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Sun, 27 Aug 2017 23:56:05 +0200
> +Subject: [PATCH] fstp: Add static to inline functions
> +
> +From [1]
> +"This is needed to avoid a link error where the inline functions appear
> +missing at link time.
> +From c99 standard inline function should either be declared static or
> +have an extern instance in a c file for linking.
> +This fix is necessary to build with gcc 7; for some reason it was not
> +trigerred before."
> +
> +[1] https://git.buildroot.net/buildroot/commit/?id=21133ada326c87627f7bdee4493d8086587c3cca
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + src/vde_switch/fstp.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/vde_switch/fstp.c b/src/vde_switch/fstp.c
> +index aab7324..b1e7ee8 100644
> +--- a/src/vde_switch/fstp.c
> ++++ b/src/vde_switch/fstp.c
> +@@ -30,14 +30,14 @@ static int numports;
> + #ifdef FSTP
> + #include <fstp.h>
> + /*********************** sending macro used by FSTP & Core ******************/
> +-void inline ltonstring(unsigned long l,unsigned char *s) {
> ++static void inline ltonstring(unsigned long l,unsigned char *s) {
> + 	s[3]=l; l>>=8;
> + 	s[2]=l; l>>=8;
> + 	s[1]=l; l>>=8;
> + 	s[0]=l;
> + }
> + 
> +-unsigned long inline nstringtol(unsigned char *s) {
> ++static unsigned long inline nstringtol(unsigned char *s) {
> + 	return (s[0]<<24)+(s[1]<<16)+(s[2]<<8)+s[3];
> + }
> + 
> +-- 
> +2.9.5
> +
> -- 
> 2.9.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
