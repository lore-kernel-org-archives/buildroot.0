From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 May 2018 15:55:32 +0200
Subject: [Buildroot] [PATCH 1/1] snort: fix build on sparc v8
In-Reply-To: <20180510111748.26293-1-fontaine.fabrice@gmail.com>
References: <20180510111748.26293-1-fontaine.fabrice@gmail.com>
Message-ID: <20180513135532.GA22130@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2018-05-10 13:17 +0200, Fabrice Fontaine spake thusly:
> Add patch to remove -mcpu=v9 before checking sparc architecture
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/59625daa154e3136171dcb89bdc3b8b31dc85021
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/snort/0005-fix-sparc.patch | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/snort/0005-fix-sparc.patch
> 
> diff --git a/package/snort/0005-fix-sparc.patch b/package/snort/0005-fix-sparc.patch
> new file mode 100644
> index 0000000000..14792d2c59
> --- /dev/null
> +++ b/package/snort/0005-fix-sparc.patch
> @@ -0,0 +1,28 @@
> +When checking if the architecture supports the %time register
> +instruction, do not force -mcpu to v9 while doing so. Otherwise it's
> +like "let's see if this v9 instruction exists when I force the compiler
> +to think I'm using v9", which is non-sensical.
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +
> +diff -Naurp ./snort-2.9.11.1-orig/configure.in snort-2.9.11.1/configure.in
> +--- ./snort-2.9.11.1-orig/configure.in	2018-05-10 12:20:19.253510678 +0200
> ++++ snort-2.9.11.1/configure.in	2018-05-10 12:40:18.547584998 +0200

I was goign to request a git-formatted patch, but snort-2 is not
maintained in the open... Only snort-3 is on github...

Regards,
Yann E. MORIN.

> +@@ -942,8 +942,6 @@ fi
> + 
> + # check for sparc %time register
> + if eval "echo $host_cpu|grep -i sparc >/dev/null"; then
> +-    OLD_CFLAGS="$CFLAGS"
> +-    CFLAGS="$CFLAGS -mcpu=v9 "
> +     AC_MSG_CHECKING([for sparc %time register])
> +     AC_RUN_IFELSE(
> +     [AC_LANG_PROGRAM(
> +@@ -957,8 +955,6 @@ if eval "echo $host_cpu|grep -i sparc >/
> +     AC_MSG_RESULT($sparcv9)
> +     if test "x$sparcv9" = "xyes"; then
> +         AC_DEFINE([SPARCV9],[1],[For sparc v9 with %time register])
> +-    else
> +-        CFLAGS="$OLD_CFLAGS"
> +     fi
> + fi
> + 
> -- 
> 2.14.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
