From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 6 Sep 2015 11:18:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdb (7.9): fix doc build when
 makeinfo is missing
In-Reply-To: <20150906103117.28fb8741@free-electrons.com>
References: <1441463443-9335-1-git-send-email-romain.naour@openwide.fr>
 <20150905200930.7e018f2a@free-electrons.com> <55EB63A9.8000104@openwide.fr>
 <20150906103117.28fb8741@free-electrons.com>
Message-ID: <55EC04EE.4030408@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 06/09/2015 10:31, Thomas Petazzoni a ?crit :
> Romain,
> 
> On Sat, 5 Sep 2015 23:50:33 +0200, Romain Naour wrote:
> 
>>>> + gdb/index.html: ${GDB_DOC_FILES}
>>>> +-	$(MAKEHTML) $(MAKEHTMLFLAGS) $(READLINE_TEXI_INCFLAG) -I ${GDBMI_DIR} -I $(srcdir) $(srcdir)/gdb.texinfo
>>>> ++	$(MAKEHTML) $(MAKEHTMLFLAGS) $(READLINE_TEXI_INCFLAG) -I ${GDBMI_DIR} -I $(srcdir) $(srcdir)/gdb.texinfo | true
>>>
>>> Can you try instead to just prepend a - at the beginning of the line?
>>>
>>> 	-$(MAKEHTML) ....
>>>
>>
>> It doesn't work. What's the meaning of a - in this case ?
> 
> It tells make to ignore the return value of the command, and continue
> executing the Makefile even if the command failed.
> 
> See https://www.gnu.org/software/make/manual/html_node/Errors.html:
> 
> """
> To ignore errors in a recipe line, write a ?-? at the beginning of the
> line?s text (after the initial tab). The ?-? is discarded before the
> line is passed to the shell for execution.
> """

Ok thanks.

> 
>> It's not easy to add a new options in configure.ac since a specific version of
>> autoconf is needed. Also it prevent to use GDB_AUTORECONF...
>>
>> configure.ac:34: error: Please use exactly Autoconf 2.64 instead of 2.69.
>>
>> Another solution is to remove "doc" directory from SUBDIRS in gdb/Makefile.in:
>> -SUBDIRS = doc @subdirs@ data-directory $(GNULIB_BUILDDIR)
>> +SUBDIRS = @subdirs@ data-directory $(GNULIB_BUILDDIR)
>>
>> Thoughts ?
> 
> Argh. So maybe, removing the "doc" directory from SUBDIRS from
> Makefile.in is the easiest solution. In parallel to that, if you are
> brave enough to write a patch for upstream gdb to make building the
> documentation optional, and submit it, it would allow to solve the
> problem for future versions of gdb. Or at least report the bug to the
> gdb folks.

Ok, I'll update my patches to remove the "doc" directory and I'll see what I can
do with upstream.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
