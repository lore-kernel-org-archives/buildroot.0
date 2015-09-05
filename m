From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 5 Sep 2015 23:50:33 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdb (7.9): fix doc build when
 makeinfo is missing
In-Reply-To: <20150905200930.7e018f2a@free-electrons.com>
References: <1441463443-9335-1-git-send-email-romain.naour@openwide.fr>
 <20150905200930.7e018f2a@free-electrons.com>
Message-ID: <55EB63A9.8000104@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 05/09/2015 20:09, Thomas Petazzoni a ?crit :
> Romain,
> 
> On Sat,  5 Sep 2015 16:30:42 +0200, Romain Naour wrote:
> 
>> + gdb/index.html: ${GDB_DOC_FILES}
>> +-	$(MAKEHTML) $(MAKEHTMLFLAGS) $(READLINE_TEXI_INCFLAG) -I ${GDBMI_DIR} -I $(srcdir) $(srcdir)/gdb.texinfo
>> ++	$(MAKEHTML) $(MAKEHTMLFLAGS) $(READLINE_TEXI_INCFLAG) -I ${GDBMI_DIR} -I $(srcdir) $(srcdir)/gdb.texinfo | true
> 
> Can you try instead to just prepend a - at the beginning of the line?
> 
> 	-$(MAKEHTML) ....
> 

It doesn't work. What's the meaning of a - in this case ?

> Or better yet, for a properly upstreamable solution, a --enable-doc
> option to explicitly enable or disable the doc. Or something that
> detects if makeinfo is available, and if it isn't, that doesn't try to
> generate the documentation.

It's not easy to add a new options in configure.ac since a specific version of
autoconf is needed. Also it prevent to use GDB_AUTORECONF...

configure.ac:34: error: Please use exactly Autoconf 2.64 instead of 2.69.

Another solution is to remove "doc" directory from SUBDIRS in gdb/Makefile.in:
-SUBDIRS = doc @subdirs@ data-directory $(GNULIB_BUILDDIR)
+SUBDIRS = @subdirs@ data-directory $(GNULIB_BUILDDIR)

Thoughts ?

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
