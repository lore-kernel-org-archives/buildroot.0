From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 09:26:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/luv: fix build with gcc 4.8
In-Reply-To: <20200222213328.366748-1-fontaine.fabrice@gmail.com>
References: <20200222213328.366748-1-fontaine.fabrice@gmail.com>
Message-ID: <20200223082643.GF8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-22 22:33 +0100, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/83b34e606b128546da8a70836d039090e334a1ec
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after markign the patch as accepted upstream. Thanks!

Regards,
Yann E. MORIN.

> ---
>  ...01-src-lreq.c-fix-build-with-gcc-4.8.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/luv/0001-src-lreq.c-fix-build-with-gcc-4.8.patch
> 
> diff --git a/package/luv/0001-src-lreq.c-fix-build-with-gcc-4.8.patch b/package/luv/0001-src-lreq.c-fix-build-with-gcc-4.8.patch
> new file mode 100644
> index 0000000000..e9fd6430fb
> --- /dev/null
> +++ b/package/luv/0001-src-lreq.c-fix-build-with-gcc-4.8.patch
> @@ -0,0 +1,43 @@
> +From d05134115ec8fcfc87188899cec336a8b4df7e62 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 22 Feb 2020 22:17:19 +0100
> +Subject: [PATCH] src/lreq.c: fix build with gcc 4.8
> +
> +Since commit 3e34390cc15101d7fc46ea26f5adf9ac022c2029, build fails with
> +gcc 4.8.3 on:
> +
> +In file included from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output/build/luv-1.34.1-1/src/luv.c:27:0:
> +/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output/build/luv-1.34.1-1/src/lreq.c: In function 'luv_cleanup_req':
> +/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output/build/luv-1.34.1-1/src/lreq.c:70:5: error: 'for' loop initial declarations are only allowed in C99 mode
> +     for (int i = 0; ((int*)(data->data))[i] != LUA_NOREF; i++) {
> +     ^
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/83b34e606b128546da8a70836d039090e334a1ec
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/luvit/luv/pull/456]
> +---
> + src/lreq.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/lreq.c b/src/lreq.c
> +index c8e07eb..b12ec4f 100644
> +--- a/src/lreq.c
> ++++ b/src/lreq.c
> +@@ -64,10 +64,11 @@ static void luv_fulfill_req(lua_State* L, luv_req_t* data, int nargs) {
> + }
> + 
> + static void luv_cleanup_req(lua_State* L, luv_req_t* data) {
> ++  int i;
> +   luaL_unref(L, LUA_REGISTRYINDEX, data->req_ref);
> +   luaL_unref(L, LUA_REGISTRYINDEX, data->callback_ref);
> +   if (data->data_ref == LUV_REQ_MULTIREF) {
> +-    for (int i = 0; ((int*)(data->data))[i] != LUA_NOREF; i++) {
> ++    for (i = 0; ((int*)(data->data))[i] != LUA_NOREF; i++) {
> +       luaL_unref(L, LUA_REGISTRYINDEX, ((int*)(data->data))[i]);
> +     }
> +   }
> +-- 
> +2.25.0
> +
> -- 
> 2.25.0
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
