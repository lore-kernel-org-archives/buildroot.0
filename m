From: Joerg Rebenstorf <Joerg.Rebenstorf@GiN.de>
Date: Wed, 27 Jun 2012 16:29:05 +0200
Subject: [Buildroot] Avahi build failed with BR2_STRIP_none=y and
 BR2_ENABLE_DEBUG=n
In-Reply-To: <1340800887.3122.113.camel@jr-ThinkCentre-A57>
References: <1340800887.3122.113.camel@jr-ThinkCentre-A57>
Message-ID: <1340807345.3122.117.camel@jr-ThinkCentre-A57>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

the same is true for libdaemon package itself:

Index: /usr/cross/GL4200/buildroot-2009.11/package/libdaemon/libdaemon.mk
===================================================================
--- /usr/cross/GL4200/buildroot-2009.11/package/libdaemon/libdaemon.mk
(revision 13)
+++ /usr/cross/GL4200/buildroot-2009.11/package/libdaemon/libdaemon.mk
(working copy)
@@ -10,6 +10,11 @@
 LIBDAEMON_AUTORECONF:=no
 LIBDAEMON_INSTALL_STAGING:=YES
 LIBDAEMON_INSTALL_TARGET:=YES
+ifeq ($(BR2_STRIP_none),y)
+LIBDAEMON_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
+else
+LIBDAEMON_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
+endif
 LIBDAEMON_CONF_ENV:=ac_cv_func_setpgrp_void=no
 LIBDAEMON_CONF_OPT:=--disable-lynx 

If anybody knows an even more buildroot compliant way to fix the bug in
this specific buildroot release I certainly would be interested to know.

Cheers,
J?rg

On Mi, 2012-06-27 at 14:41 +0200, Joerg Rebenstorf wrote:
> Hello,
> 
> I just want to let the community know that I've found a bug and fixed it
> in buildroot-2009.11.
> 
> Bugfix: Fix avahi build breakage with BR2_STRIP_none=y and
> BR2_ENABLE_DEBUG=n 
> The fix works like this:
> Look at BR2_STRIP_none to decide whether to strip avahi binaries.
> This avoids bad quoting in avahi Makefile.in when $STRIP is set to:
> true Not_stripping
> 
> Index: /usr/cross/GL4200/buildroot-2009.11/package/avahi/avahi.mk
> ===================================================================
> --- /usr/cross/GL4200/buildroot-2009.11/package/avahi/avahi.mk	(revision
> 7)
> +++ /usr/cross/GL4200/buildroot-2009.11/package/avahi/avahi.mk	(working
> copy)
> @@ -16,6 +16,12 @@
>  AVAHI_INSTALL_STAGING = YES
>  AVAHI_INSTALL_TARGET = YES
>  
> +ifeq ($(BR2_STRIP_none),y)
> +AVAHI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
> +else
> +AVAHI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
> +endif
> +
>  AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
>  		ac_fsusage_space=yes \
>  		fu_cv_sys_stat_statfs2_bsize=yes \
> 
> Without this fix you get the following output:
> 
> >>> libdaemon 0.13 Installing to target
> /usr/bin/make -j8
> DESTDIR=/usr/cross/GL4200/buildroot-2009.11/output/target  install-strip
> -C /usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13/
> make[1]: Entering directory
> `/usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13'
> /usr/bin/make
> INSTALL_PROGRAM="/bin/bash /usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13/install-sh -c -s" \
> 
> install_sh_PROGRAM="/bin/bash /usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13/install-sh -c -s" INSTALL_STRIP_FLAG=-s \
> 	  `test -z 'true Not_stripping' || \
> 	    echo "INSTALL_PROGRAM_ENV=STRIPPROG='true Not_stripping'"` install
> make[2]: *** make[2]: Entering directory
> `/usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13'
> No rule to make target `Not_stripping''.  Stop.
> make[2]: Leaving directory
> `/usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13'
> make[1]: *** [install-strip] Error 2
> make[1]: Leaving directory
> `/usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13'
> make: ***
> [/usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13/.stamp_target_installed] Error 2
> 
> 
> Any comments are welcome.
> 
> Cheers,
> J?rg
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
G.i.N. Gesellschaft f?r industrielle Netzwerke GmbH
Dipl.-Inform. J?rg Rebenstorf
Raiffeisenstr. 15
D-64347 Griesheim
Telefon: +49 6155 - 8259 - 0
Telefax: +49 6155 - 8259 - 11
E-Mail:   joerg.rebenstorf at gin.de
Internet: http://www.gin.de
Sitz: Griesheim
Registergericht: Amtsgericht Darmstadt, HRB 5068
Gerichtsstand: Darmstadt
USt.-ID-Nr. DE 111633284
WEEE-Reg.-Nr. DE 20824942
Gesch?ftsf?hrer:
Dipl.-Ing. Wolfgang Bassenauer
Dipl.-Inform. Andreas Schoenberg
Dipl.-Ing. (FH) Kay Wuttke

IMPORTANT NOTICE:
This message is intended only for the use of the individual or entity to which it is addressed, and may contain information that is privileged, confidential and exempt from disclosure under applicable law. If the reader of this message is not the intended recipient, or the employee or agent responsible for delivering the message to the intended recipient, you are hereby notified that any dissemination, distribution or copying of this communication is strictly prohibited. If you have received this communication in error, please notify the sender immediately by email.
The above information is automatically added to this e-mail. This addition does not constitute a representation that the content of this e-mail is legally relevant and/or is intended to be legally binding upon G.i.N. mbH.
Thank you.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120627/fe73a4d5/attachment.asc>
