From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Jan 2009 19:48:42 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libsexy
In-Reply-To: <20090123174850.A9B52769CC@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Fri\, 23 Jan 2009 17\:48\:50 +0000 \(UTC\)")
References: <20090123174850.A9B52769CC@busybox.osuosl.org>
Message-ID: <87mydhkgdx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-23 17:48:49 +0000 (Fri, 23 Jan 2009)
 ulf> New Revision: 24982

 ulf> Log:
 ulf> Disable libsexy (with comment) if X is not available

 ulf> Modified:
 ulf>    trunk/buildroot/package/libsexy/Config.in

 ulf> Changeset:
 ulf> Modified: trunk/buildroot/package/libsexy/Config.in
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/libsexy/Config.in	2009-01-23 13:12:57 UTC (rev 24981)
 ulf> +++ trunk/buildroot/package/libsexy/Config.in	2009-01-23 17:48:49 UTC (rev 24982)
 ulf> @@ -1,6 +1,7 @@
 ulf>  config BR2_PACKAGE_LIBSEXY
 ulf>  	bool "libsexy"
 ulf>  	depends on BR2_PACKAGE_LIBGTK2
 ulf> +	depends on !BR2_PACKAGE_XSERVER_none

According to the makefile it seems like there's a:

select BR2_PACKAGE_XLIB_LIBX11

missing.

But from doing a quick grep in the libsexy sources I don't see
any X includes, so are you sure it doesn't work with
gtk-over-directfb?

From a quick look at configure.ac, it seems to check for:

pango >= 1.4.0, glib-2.0 >= 2.4.0, gtk+-2.0 >= 2.4.0, libxml-2.0

The first 3 are covered by the gtk2 dependency, but libxml2 isn't.

 ulf>  	help
 ulf>  	  libsexy is a collection of GTK+ widgets that extend the
 ulf>  	  functionality of such standard widgets as GtkEntry and
 ulf> @@ -8,3 +9,7 @@
 ulf>  	  limitations of the widgets.
 
 ulf>  	  http://www.chipx86.com/wiki/Libsexy
 ulf> +
 ulf> +comment "libsexy       - disabled (requires X-Windows)"
 ulf> +	depends on BR2_PACKAGE_XSERVER_none
 ulf> +

We don't normally do that for X-only stuff. Long term, we should
probably move X apps to a seperate menu.

-- 
Bye, Peter Korsgaard
