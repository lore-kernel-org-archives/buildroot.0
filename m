From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Feb 2010 08:44:21 +0100
Subject: [Buildroot] libglib2 build failure
In-Reply-To: <20100210085118.4501eb2c@surf>
References: <20100210004822.5cc69bd2@surf> <1265783166.2185.17.camel@coalu.atr>
	<20100210082659.63d38b8c@surf> <20100210085118.4501eb2c@surf>
Message-ID: <20100211084421.307d30e6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Feb 2010 08:51:18 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> `Makefile.decl' included from here gtk-doc.make:53:
> GTK_DOC_BUILD_HTML does not appear in AM_CONDITIONAL
> docs/reference/glib/Makefile.am:73:   `gtk-doc.make' included from
> here gtk-doc.make:58: GTK_DOC_BUILD_PDF does not appear in
> AM_CONDITIONAL docs/reference/glib/Makefile.am:73:   `gtk-doc.make'
> included from here gtk-doc.make:26: EXTRA_DIST multiply defined in
> condition TRUE ... docs/reference/glib/Makefile.am:73:
> `gtk-doc.make' included from here Makefile.decl:8: ... `EXTRA_DIST'
> previously defined here docs/reference/glib/Makefile.am:2:
> `Makefile.decl' included from here
> docs/reference/glib/Makefile.am:92: `%'-style pattern rules are a GNU
> make extension gtk-doc.make:53: GTK_DOC_BUILD_HTML does not appear in
> AM_CONDITIONAL docs/reference/gobject/Makefile.am:61:
> `gtk-doc.make' included from here gtk-doc.make:58: GTK_DOC_BUILD_PDF
> does not appear in AM_CONDITIONAL
> docs/reference/gobject/Makefile.am:61:   `gtk-doc.make' included from
> here gtk-doc.make:26: EXTRA_DIST multiply defined in condition
> TRUE ... docs/reference/gobject/Makefile.am:61:   `gtk-doc.make'
> included from here Makefile.decl:8: ... `EXTRA_DIST' previously
> defined here docs/reference/gobject/Makefile.am:2:   `Makefile.decl'
> included from here docs/reference/gobject/Makefile.am:74: `%'-style
> pattern rules are a GNU make extension autoreconf: automake failed
> with exit status: 1 make: ***
> [/work/build/thomas/br-test1/build/libglib2-2.22.4/.stamp_patched]
> Error 1

For the record, I've been able to fix this issue by using a more recent
gtk-doc.m4 version than the one I had in my repo. So now, libglib2
build with LIBTOOL_PATCH=YES and AUTORECONF=YES works.

However, without these, the build breaks for me,
with /usr/lib/libgobject-2.0.so: file not recognized: File format not
recognized. What's odd is that in the same conditions (same Buildroot
version, same version of libtool on the host, libglib-dev installed on
the host), the build doesn't break for Lionel.

I've also tried importing the OpenWRT way of handling libtool problems
into Buildroot, but it fails. For the record, the OpenWRT way is :

 * Compile libtool for the host, with a few patches

  https://dev.openwrt.org/browser/trunk/package/libtool/patches

 * When a package asks for a libtool fixup, do :

  cp $(HOST_DIR)/usr/share/libtool/ltmain.sh $$($$(PKG)_SRCDIR)
  cp $(HOST_DIR)/usr/share/aclocal/libtool.m4 $$($$(PKG)_SRCDIR)
  cp $(HOST_DIR)/usr/bin/libtool $$($$(PKG)_SRCDIR)

It fails with :

 ../../libtool: line 841: X--tag=CC: command not found
 ../../libtool: line 874: libtool: ignoring unknown tag : command not found
 [... many more issues ...]

Which, according to quick Google searches, seems to indicate that the
version of libtool.m4 doesn't match the one bundled into aclocal.m4. Or
something like this.

This libtool thing is really driving me crazy.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
