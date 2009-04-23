From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Apr 2009 10:40:39 +0200
Subject: [Buildroot] [PATCH] Add host-libglib2 dependencie to dbus-glib
In-Reply-To: <49F025BE.3020606@eclis.ch> (Jean-Christian de Rivaz's message of
	"Thu\, 23 Apr 2009 10\:24\:30 +0200")
References: <49CB469A.5080404@eclis.ch>
	<20090422124829.GA28316@cbg.dyndns.org> <1240404749.7072.1.camel@sven>
	<49EF2669.7010607@eclis.ch> <87zle8oiz4.fsf@macbook.be.48ers.dk>
	<49F025BE.3020606@eclis.ch>
Message-ID: <87d4b3oj94.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christian" == Jean-Christian de Rivaz <jc@eclis.ch> writes:

Hi,

 Jean-Christian> Without the patch, using expat or libxml2, let the
 Jean-Christian> build fail with this error into the make of
 Jean-Christian> dbus-1.2.12-host:

I take it you mean dbus-glib-host from the below.

 Jean-Christian> [...]
 Jean-Christian> checking for gmsgfmt... /usr/bin/msgfmt
 Jean-Christian> checking for xgettext... /usr/bin/xgettext
 Jean-Christian> checking for XML_ParserCreate_MM in -lexpat... yes
 Jean-Christian> checking expat.h usability... yes
 Jean-Christian> checking expat.h presence... yes
 Jean-Christian> checking for expat.h... yes
 Jean-Christian> checking pkg-config is at least version 0.9.0... yes
 Jean-Christian> checking for DBUS... yes
 Jean-Christian> checking for DBUS_GLIB... no
 Jean-Christian> checking for DBUS_GLIB_THREADS... no
 Jean-Christian> configure: error: GLib development libraries not found
 Jean-Christian> make: *** [/home/jcdr/try/buildroot-svn-expat/build_arm/stamps/host_dbusglib_configured] Erreur 1

Ahh, I thought you had a problem building dbus for the target, not
dbus-glib for the host. I see the missing dependency on host-glib and
will fix shortly.

 Jean-Christian> It worth noticed that even if libxml2 is used, the
 Jean-Christian> dbus-1.2.12-host configure log the same messages
 Jean-Christian> about expat and no one about libxml2.

Yes, we always build the host dbus version with expat support for
simplicity.

 Jean-Christian> The two others folders have this patch applyed:
 Jean-Christian> ------------------------------------------------
 Jean-Christian> Index: package/dbus-glib/dbus-glib.mk
 Jean-Christian> ===================================================================
 Jean-Christian> --- package/dbus-glib/dbus-glib.mk      (r?vision 26188)
 Jean-Christian> +++ package/dbus-glib/dbus-glib.mk      (copie de travail)
 Jean-Christian> @@ -23,7 +23,7 @@
 Jean-Christian>                --disable-doxygen-docs \
 Jean-Christian>                --enable-asserts=yes

 Jean-Christian> -DBUS_GLIB_DEPENDENCIES = uclibc host-pkgconfig dbus host-dbus host-dbus-glib libglib2
 Jean-Christian> +DBUS_GLIB_DEPENDENCIES = uclibc host-pkgconfig dbus host-dbus host-libglib2 host-dbus-glib libglib2

That's wrong, it's the host-dbus-glib which needs the host-glib, not
the target dbus-glib (but it'll work as well). I'll fix it in svn.

 Jean-Christian> Now using libxml2 let the build fail with this error
 Jean-Christian> into the make of dbus-glib:

 Jean-Christian> [...]
 Jean-Christian> checking for ngettext in -lintl... yes
 Jean-Christian> checking for dgettext in -lintl... yes
 Jean-Christian> checking for bind_textdomain_codeset... yes
 Jean-Christian> checking for msgfmt... /usr/bin/msgfmt
 Jean-Christian> checking for dcgettext... yes
 Jean-Christian> checking if msgfmt accepts -c... yes
 Jean-Christian> checking for gmsgfmt... /usr/bin/msgfmt
 Jean-Christian> checking for xgettext... /usr/bin/xgettext
 Jean-Christian> checking for XML_ParserCreate_MM in -lexpat... no
 Jean-Christian> configure: error: expat library not found, check config.log for failed attempts
 Jean-Christian> make: *** [/home/jcdr/try/buildroot-svn-dep-libxml2/build_arm/dbus-glib-0.80/.stamp_configured] Erreur 1
