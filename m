From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 15:38:56 +0200
Subject: [Buildroot] [PATCH] collectd: fix parallel build issues
In-Reply-To: <559A83B4.1010902@zacarias.com.ar>
References: <1436188343-11234-1-git-send-email-gustavo@zacarias.com.ar>
 <20150706152250.54ec1b86@free-electrons.com>
 <559A83B4.1010902@zacarias.com.ar>
Message-ID: <20150706153856.78ab447d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 06 Jul 2015 10:33:40 -0300, Gustavo Zacarias wrote:

> > """
> > If _DEPENDENCIES is not supplied, it is computed by Automake. The
> > automatically-assigned value is the contents of _LDADD or _LIBADD, with
> > most configure substitutions, -l, -L, -dlopen and -dlpreopen options
> > removed. The configure substitutions that are left in are only
> > ?$(LIBOBJS)? and ?$(ALLOCA)?; these are left because it is known that
> > they will not cause an invalid value for _DEPENDENCIES to be generated.
> > """
> >
> > Best regards,
> 
> Hi.
> That won't work in this case since it's added upon later (if 
> BUILD_WITH_OWN_LIBOCONFIG ... ).

That same addition should be useless I believe:

collectd_LDADD += $(LIBLTDL) $(top_builddir)/src/liboconfig/liboconfig.la
collectd_DEPENDENCIES += $(top_builddir)/src/liboconfig/liboconfig.la

So LDADD already contains $(top_builddir)/src/liboconfig/liboconfig.la,
and LIBLTDL will be -lltdl, which will be ignored for foo_DEPENDENCIES.

But oh, well, maybe you don't want to fix the entire collectd build system :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
