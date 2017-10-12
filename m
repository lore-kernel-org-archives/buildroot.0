From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 12 Oct 2017 18:22:14 +0200
Subject: [Buildroot] [PATCH] lua: add patch to fix pkg-config file for
 version 5.1.x
In-Reply-To: <20171012074518.14902-1-joerg.krause@embedded.rocks>
References: <20171012074518.14902-1-joerg.krause@embedded.rocks>
Message-ID: <CAB0FRsvyQfc3E2oCkH7-pOfbMVus_-q6LXkBs0E5a9AGA6m8-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jorg,

please look the patch http://patchwork.ozlabs.org/patch/804094/
which fix lua.pc for all version of Lua.

Fran?ois

2017-10-12 9:45 GMT+02:00 J?rg Krause <joerg.krause@embedded.rocks>:

> This patch applies the fix added in commit
> 8d845683e37640d33c186c0091ccce6ae3ef0777 to Lua version 5.1.x.
>
> When Lua is linked with additional libraries, these libraries should go
> into the pkg-config file as well.
>
> Otherwise, linking swupdate with the lua library (version 5.1.x) fails:
>
> ```
> /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so:
> undefined reference to `dlopen'
> /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so:
> undefined reference to `dlclose'
> /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so:
> undefined reference to `dlerror'
> /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so:
> undefined reference to `dlsym'
> ```
>
> The build error was detected when building the package swupdate from
> upstream with Lua 5.1 compatibility support [1] enabled.
>
> [1] https://groups.google.com/forum/#!topic/swupdate/cBvq27-zuvs
>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/lua/5.1.5/0003-add-MYLIBS-to-Libs-in-lua-pc.patch | 12
> ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 package/lua/5.1.5/0003-add-
> MYLIBS-to-Libs-in-lua-pc.patch
>
> diff --git a/package/lua/5.1.5/0003-add-MYLIBS-to-Libs-in-lua-pc.patch
> b/package/lua/5.1.5/0003-add-MYLIBS-to-Libs-in-lua-pc.patch
> new file mode 100644
> index 0000000000..8a5a0d85be
> --- /dev/null
> +++ b/package/lua/5.1.5/0003-add-MYLIBS-to-Libs-in-lua-pc.patch
> @@ -0,0 +1,12 @@
> +diff -purN lua-5.1.5.orig/etc/lua.pc lua-5.1.5/etc/lua.pc
> +--- lua-5.1.5.orig/etc/lua.pc  2017-10-12 09:25:20.339277165 +0200
> ++++ lua-5.1.5/etc/lua.pc       2017-10-12 09:26:37.272796305 +0200
> +@@ -25,7 +25,7 @@ Name: Lua
> + Description: An Extensible Extension Language
> + Version: ${R}
> + Requires:
> +-Libs: -L${libdir} -llua -lm
> ++Libs: -L${libdir} -llua -lm @MYLIBS@
> + Cflags: -I${includedir}
> +
> + # (end of lua.pc)
> --
> 2.14.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171012/4e8048a3/attachment.html>
