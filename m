From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jun 2016 22:04:28 +0200
Subject: [Buildroot] [PATCH 2/5] readline: fix installed libraries
 permission
In-Reply-To: <1465917079-30473-2-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465917079-30473-2-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160614200427.GE3759@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2016-06-14 17:11 +0200, Gilles Chanteperdrix spake thusly:
> In order to avoid strip failing to strip the library.

I just tried to build readline, and the two libraries that are installed
are already 755:

    -rwxr-xr-x 1 ymorin ymorin  33K Jun 14 21:59 target/usr/lib/libhistory.so.6.3*
    -rwxr-xr-x 1 ymorin ymorin 261K Jun 14 21:59 target/usr/lib/libreadline.so.6.3*

And after some inspection, we already fix that in our readline.mk:

    # libraries get installed read only, so strip fails
    define READLINE_INSTALL_FIXUPS_SHARED
        chmod +w $(addprefix $(TARGET_DIR)/usr/lib/,libhistory.so.* libreadline.so.*)
    endef
    READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_FIXUPS_SHARED

Regards,
Yann E. MORIN.

> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> ---
>  package/readline/0009-avoid-strip-perm-issue.patch | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 package/readline/0009-avoid-strip-perm-issue.patch
> 
> diff --git a/package/readline/0009-avoid-strip-perm-issue.patch b/package/readline/0009-avoid-strip-perm-issue.patch
> new file mode 100644
> index 0000000..55d5166
> --- /dev/null
> +++ b/package/readline/0009-avoid-strip-perm-issue.patch
> @@ -0,0 +1,14 @@
> +Avoid libreadline to be installed read-only, as it makes stripping fail.
> +
> +Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> +--- readline-6.3/support/shlib-install~	2012-07-10 21:58:08.000000000 +0200
> ++++ readline-6.3/support/shlib-install	2016-02-27 01:19:09.878310797 +0100
> +@@ -73,7 +73,7 @@ fi
> + case "$host_os" in
> + hpux*|darwin*|macosx*|linux*|solaris2*)
> + 	if [ -z "$uninstall" ]; then
> +-		chmod 555 ${INSTALLDIR}/${LIBNAME}
> ++		chmod 755 ${INSTALLDIR}/${LIBNAME}
> + 	fi ;;
> + cygwin*|mingw*)
> + 	IMPLIBNAME=`echo ${LIBNAME} \
> -- 
> 2.8.2
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
