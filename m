From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Thu, 23 Apr 2009 10:24:30 +0200
Subject: [Buildroot] [PATCH] Add host-libglib2 dependencie to dbus-glib
In-Reply-To: <87zle8oiz4.fsf@macbook.be.48ers.dk>
References: <49CB469A.5080404@eclis.ch>	<20090422124829.GA28316@cbg.dyndns.org>
	<1240404749.7072.1.camel@sven>	<49EF2669.7010607@eclis.ch>
	<87zle8oiz4.fsf@macbook.be.48ers.dk>
Message-ID: <49F025BE.3020606@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard a ?crit :
>>>>>> "Jean-Christian" == Jean-Christian de Rivaz <jc@eclis.ch> writes:
> 
>  >> We are using libxml2, so I can't tell for sure if compiling dbus with
>  >> expat is working or not. But it looks as if the dependencies are
>  >> correct.
> 
>  Jean-Christian> Interesting. On ARM I can only build dbus with expat.
> 
>  Jean-Christian> BR2_PACKAGE_DBUS=y
>  Jean-Christian> BR2_DBUS_EXPAT=y
>  Jean-Christian> # BR2_DBUS_LIBXML2 is not set
>  Jean-Christian> BR2_PACKAGE_DBUS_GLIB=y
> 
> What happens when you try building it with libxml2? I fixed a build
> issue with libxml2 in February.
> 

Well, it take me some time to do the test because my original buildroot
folder was not clean enough. I have checked out the revision 26186 from
the buildroot SVN and I have copied it into 4 folders in order to test
without and with the patch and using expat or libxml2. The short answer
is that for my configuration only the folder with the patch and using
expat do the build successfully.


Without the patch, using expat or libxml2, let the build fail with this
error into the make of dbus-1.2.12-host:

[...]
checking for gmsgfmt... /usr/bin/msgfmt
checking for xgettext... /usr/bin/xgettext
checking for XML_ParserCreate_MM in -lexpat... yes
checking expat.h usability... yes
checking expat.h presence... yes
checking for expat.h... yes
checking pkg-config is at least version 0.9.0... yes
checking for DBUS... yes
checking for DBUS_GLIB... no
checking for DBUS_GLIB_THREADS... no
configure: error: GLib development libraries not found
make: *** [/home/jcdr/try/buildroot-svn-expat/build_arm/stamps/host_dbusglib_configured] Erreur 1

It worth noticed that even if libxml2 is used, the dbus-1.2.12-host
configure log the same messages about expat and no one about libxml2.


The two others folders have this patch applyed:
------------------------------------------------
Index: package/dbus-glib/dbus-glib.mk
===================================================================
--- package/dbus-glib/dbus-glib.mk      (r?vision 26188)
+++ package/dbus-glib/dbus-glib.mk      (copie de travail)
@@ -23,7 +23,7 @@
                --disable-doxygen-docs \
                --enable-asserts=yes
 
-DBUS_GLIB_DEPENDENCIES = uclibc host-pkgconfig dbus host-dbus host-dbus-glib libglib2
+DBUS_GLIB_DEPENDENCIES = uclibc host-pkgconfig dbus host-dbus host-libglib2 host-dbus-glib libglib2
 
 $(eval $(call AUTOTARGETS,package,dbus-glib))
 
------------------------------------------------


Now using libxml2 let the build fail with this error into the make of
dbus-glib:

[...]
checking for ngettext in -lintl... yes
checking for dgettext in -lintl... yes
checking for bind_textdomain_codeset... yes
checking for msgfmt... /usr/bin/msgfmt
checking for dcgettext... yes
checking if msgfmt accepts -c... yes
checking for gmsgfmt... /usr/bin/msgfmt
checking for xgettext... /usr/bin/xgettext
checking for XML_ParserCreate_MM in -lexpat... no
configure: error: expat library not found, check config.log for failed attempts
make: *** [/home/jcdr/try/buildroot-svn-dep-libxml2/build_arm/dbus-glib-0.80/.stamp_configured] Erreur 1

 
Jean-Christian de Rivaz
