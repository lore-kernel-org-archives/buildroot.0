From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Oct 2012 19:36:20 +0200
Subject: [Buildroot] [PATCH 02/47] package/libfdt: new package
In-Reply-To: <5089B564.4090500@mind.be>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
 <1351113973-17237-3-git-send-email-yann.morin.1998@free.fr>
 <5089B564.4090500@mind.be>
Message-ID: <201210261936.20493.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Thursday 25 October 2012 Arnout Vandecappelle wrote:
>   The package is called dtc, not libfdt.

Gah... Yes.

> On 24/10/12 23:25, Yann E. MORIN wrote:
> > libfdt allows one to manipulate a Flat Device Tree.
> 
>   Flattened Device Tree

Yep.

[--SNIP--]
> > diff --git a/package/Config.in b/package/Config.in
> > index 1650c71..c9cb3ed 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -396,6 +396,7 @@ source "package/libaio/Config.in"
> >   source "package/libraw1394/Config.in"
> >   source "package/tslib/Config.in"
> >   source "package/libfreefare/Config.in"
> > +source "package/dtc/Config.in"
> 
>   Alphabetical order.

Yep.

>   Also, even if for now it only installs libftd, I guess it shouldn't be
> a problem to install dtc as well.  In that case it fits more in
> Development tools or Hardware handling.

"Hardware handling" sounds like the proper place, IMHO.

> >   source "package/libftdi/Config.in"
> >   source "package/libhid/Config.in"
> >   source "package/libiqrf/Config.in"
> > diff --git a/package/dtc/Config.in b/package/dtc/Config.in
> > new file mode 100644
> > index 0000000..7b86c60
> > --- /dev/null
> > +++ b/package/dtc/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_DTC
> > +	bool "dtc"
> > +	help
> > +	  dtc is the Device Tree Compiler, to generate Device Trees.
> 
>   dtc generates Flattened Device Trees (i.e. it flattens the device
> tree).

From Documentation/manual.txt:

---8<---
The currently supported Input Formats are:
    - "dtb": "blob" format.  A flattened device-tree block with
        header in one binary blob.
    - "dts": "source" format.  A text file containing a "source"
        for a device-tree.
    - "fs" format.  A representation equivalent to the output of
        /proc/device-tree  where nodes are directories and
        properties are files.

The currently supported Output Formats are:
     - "dtb": "blob" format
     - "dts": "source" format
     - "asm": assembly language file.  A file that can be sourced
        by gas to generate a device-tree "blob".  That file can
        then simply be added to your Makefile.  Additionally, the
        assembly file exports some symbols that can be used.
---8<---

So, dtc does not /generate/ flattened, it uses them as _input_.
What about this formulation (also from the same manual.txt) :

    The Device Tree Compiler, dtc, takes as input a device-tree in
    a given format and outputs a device-tree in another format.


> > +	  Note that only the library is installed for now.
>   Why?  Build failures in the binaries?

Because I do not need it in my use-case, so I did not test it, so
I did not install it.

Also, this package could probably also be a host package. This patch
only adds dtc as a target package.

[--SNIP--]
> > ++++ dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef/Makefile	2012-10-22 22:03:21.151047833 +0200
> > +@@ -18,7 +18,7 @@
> > + CPPFLAGS = -I libfdt -I .
> > + WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
> > + 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
> > +-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
> > ++CFLAGS = -g -Os -fPIC -Werror $(WARNINGS) $(EXTRA_CFLAGS)
> 
>   Why not CFLAGS += ...?
> 
>   And maybe CPPFLAGS should also be fixed.

I'll look again at this.

[--SNIP--]
> > diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> > new file mode 100644
> > index 0000000..d53e78a
> > --- /dev/null
> > +++ b/package/dtc/dtc.mk
> > @@ -0,0 +1,36 @@
> > +#############################################################
> > +#
> > +# libcurl

dtc, not libcurl. Sigh...

> > +#
> > +#############################################################
> > +
> > +DTC_VERSION         = e4b497f367a3b2ae99cc52089a14a221b13a76ef
> > +DTC_SITE            = git://git.jdl.com/software/dtc.git
> > +DTC_LICENSE         = GPLv2+/BSD-2c
> > +DTC_LICENSE_FILES   = README.license GPL
> > +# Note: the dual-license only applies to the library.
> > +#       The DT compiler (dtc) is GPLv2+, but we do not install it.
> > +DTC_INSTALL_STAGING = YES
> > +
> > +# Need -fPIC for x86-64
>   ???

Probably left-over from debugging?...

> > +define DTC_BUILD_CMDS
> > +	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)                          \
>   Looking at the Makefile, I don't see why parallel builds would fail...

I will investigate again.

> > +	                                  EXTRA_CFLAGS="$(TARGET_CFLAGS)"   \
> > +	                                  PREFIX=/usr                       \
>   It's nicer to put these two options in DTC_MAKE_OPTS.

OK, I'll see to it.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
