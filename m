From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jul 2008 21:57:43 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080705092238.AB5163C65B@busybox.net> (ulf@uclibc.org's message
	of "Sat\, 5 Jul 2008 02\:22\:38 -0700 \(PDT\)")
References: <20080705092238.AB5163C65B@busybox.net>
Message-ID: <87bq1ag4zs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-07-05 02:22:38 -0700 (Sat, 05 Jul 2008)
 ulf> New Revision: 22652

 ulf> Log:
 ulf> Add configuration possibility for host Gnome Lib installation

 ulf> Modified:
 ulf>    trunk/buildroot/Config.in
 ulf>    trunk/buildroot/Makefile


 ulf> Changeset:
 ulf> Modified: trunk/buildroot/Config.in
 ulf> ===================================================================
 ulf> --- trunk/buildroot/Config.in	2008-07-05 09:18:54 UTC (rev 22651)
 ulf> +++ trunk/buildroot/Config.in	2008-07-05 09:22:38 UTC (rev 22652)
 ulf> @@ -78,6 +78,17 @@
 
 ulf>  	  The default is $(BASE_DIR)/dl
 
 ulf> +config BR2_HOST_GLIB
 ulf> +	string "Location of host Gnome library"
 ulf> +	default "/usr"
 ulf> +	help
 ulf> +	  Directory where Gnome is installed on the host
 ulf> +	  Gnome applications is installed in $(BR2_HOST_LIB)/bin 
 ulf> +	  This is needed to build libgtk etc.
 ulf> +	  The default is /usr
 ulf> +	  It can be overridden by the BUILDROOT_HOST_GLIB
 ulf> +	  shell variable
 ulf> +
 ulf>  source	"target/device/Config.in.mirrors"
 
 ulf>  config BR2_STAGING_DIR

 ulf> Modified: trunk/buildroot/Makefile
 ulf> ===================================================================
 ulf> --- trunk/buildroot/Makefile	2008-07-05 09:18:54 UTC (rev 22651)
 ulf> +++ trunk/buildroot/Makefile	2008-07-05 09:22:38 UTC (rev 22652)
 ulf> @@ -36,7 +36,7 @@
 ulf>  ifneq ($(BUILDROOT_LOCAL),)
 ulf>  BR2_LOCAL:=$(BUILDROOT_LOCAL)
 ulf>  else
 ulf> -BR2_LOCAL:=$(TOPDIR)/local
 ulf> +BR2_LOCAL:=$(TOPDIR)local
 ulf>  endif

Why?

 ulf>  # $(shell find . -name *_defconfig |sed 's/.*\///')
 ulf> @@ -57,6 +57,12 @@
 ulf>  endif
 ulf>  LOCAL:=$(BR2_LOCAL)
 
 ulf> +ifneq ($(BUILDROOT_HOST_GLIB),)
 ulf> +HOST_GLIB:=$(BUILDROOT_HOST_GLIB)
 ulf> +else
 ulf> +HOST_GLIB:=$(BR2_HOST_GLIB)
 ulf> +endif
 ulf> +
 ulf>  # To put more focus on warnings, be less verbose as default
 ulf>  # Use 'make V=1' to see the full commands
 ulf>  ifdef V
 ulf> @@ -511,4 +517,8 @@
 
 ulf>  .PHONY: dummy subdirs release distclean clean config oldconfig \
 ulf>  	menuconfig tags check test depend defconfig help
 ulf> -	
 ulf> +
 ulf> +status:
 ulf> +	@echo LOCAL=$(LOCAL)
 ulf> +	@echo BR2_DL_DIR=$(BR2_DL_DIR)
 ulf> +	@echo HOST_GLIB=$(HOST_GLIB)

And why?

-- 
Bye, Peter Korsgaard
