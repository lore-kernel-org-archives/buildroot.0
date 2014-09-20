From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 14:32:05 +0200
Subject: [Buildroot] [PATCHv2] sudo: don't use hardening flags on host
 tools
In-Reply-To: <1411211370-9756-1-git-send-email-gustavo@zacarias.com.ar>
References: <1411211370-9756-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140920123205.GB3949@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-09-20 08:09 -0300, Gustavo Zacarias spake thusly:
> Don't use hardening (SSP_CFLAGS & PIE_CFLAGS) flags on host tools since
> the host compiler may differ wildly from the tests run on the cross
> compiler and they might not work. Fixes:
> http://autobuild.buildroot.net/results/b10/b1091bd04ab988744548b74fb48c64bf291fed2f/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...udo-0002-drop-sspcflags-piecflags-for-host.patch | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 package/sudo/sudo-0002-drop-sspcflags-piecflags-for-host.patch
> 
> diff --git a/package/sudo/sudo-0002-drop-sspcflags-piecflags-for-host.patch b/package/sudo/sudo-0002-drop-sspcflags-piecflags-for-host.patch
> new file mode 100644
> index 0000000..9f09656
> --- /dev/null
> +++ b/package/sudo/sudo-0002-drop-sspcflags-piecflags-for-host.patch
> @@ -0,0 +1,21 @@
> +Don't use SSP_CFLAGS and PIE_CFLAGS for host tools.
> +http://www.sudo.ws/bugs/show_bug.cgi?id=662
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +
> +diff -Nura sudo-1.8.10p3.orig/compat/Makefile.in sudo-1.8.10p3/compat/Makefile.in
> +--- sudo-1.8.10p3.orig/compat/Makefile.in	2014-03-07 18:51:19.000000000 -0300
> ++++ sudo-1.8.10p3/compat/Makefile.in	2014-09-20 07:29:30.913108029 -0300
> +@@ -96,10 +96,10 @@
> + 	./mksigname > $@
> + 
> + mksiglist: $(srcdir)/mksiglist.c $(srcdir)/mksiglist.h $(incdir)/missing.h $(top_builddir)/config.h
> +-	$(CC) $(CPPFLAGS) $(CFLAGS) $(PIE_CFLAGS) $(SSP_CFLAGS) $(DEFS) $(srcdir)/mksiglist.c -o $@
> ++	$(CC) $(CPPFLAGS) $(CFLAGS) $(DEFS) $(srcdir)/mksiglist.c -o $@
> + 
> + mksigname: $(srcdir)/mksigname.c $(srcdir)/mksigname.h $(incdir)/missing.h $(top_builddir)/config.h
> +-	$(CC) $(CPPFLAGS) $(CFLAGS) $(PIE_CFLAGS) $(SSP_CFLAGS) $(DEFS) $(srcdir)/mksigname.c -o $@
> ++	$(CC) $(CPPFLAGS) $(CFLAGS) $(DEFS) $(srcdir)/mksigname.c -o $@
> + 
> + fnm_test: fnm_test.o libreplace.la
> + 	$(LIBTOOL) --mode=link $(CC) -o $@ fnm_test.o libreplace.la $(PIE_LDFLAGS) $(SSP_LDFLAGS)
> -- 
> 1.8.5.5
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
