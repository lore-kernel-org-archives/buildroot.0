From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 21 May 2018 18:13:57 -0300 (BRT)
Subject: [Buildroot] [PATCH] modem-manager: remove -Werror from CFLAGS
In-Reply-To: <87603hj97d.fsf@dell.be.48ers.dk>
References: <CAGm1_kuEqW+Mito5P8rMxdM+zrCFAxpu2TzsZa=mvDAK8d1e1w@mail.gmail.com>
 <20180521114529.3513-1-casantos@datacom.ind.br>
 <87603hj97d.fsf@dell.be.48ers.dk>
Message-ID: <1339574338.1832283.1526937237840.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Aleksander
> Morgado" <aleksander@aleksander.es>
> Sent: Monday, May 21, 2018 12:54:14 PM
> Subject: Re: [PATCH] modem-manager: remove -Werror from CFLAGS

>>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:
> 
> > We are aproaching the 2018.05 release and modem-manager is still broken
> > due to warnings like this:
> 
> >   mm-base-manager.c: In function 'handle_set_logging':
> >   mm-base-manager.c:680:15: warning: assignment from incompatible pointer type
> >   [-Wincompatible-pointer-types]
> ctx-> self = g_object_ref (manager);
> >                  ^
> 
> > There is a macro defined in build/libglib2-2.56.1/gobject/gobject.h
> > which leads to the assignment errors:
> 
> >   511 /* Make reference APIs type safe with macros */
> >   512 #define g_object_ref(Obj)      ((__typeof__(Obj)) (g_object_ref) (Obj))
> 
> > The problem can be easily reproduced with this sample code:
> 
> >   $ cat test.c
> >   extern void *g_object_ref(void *);
> >   #define g_object_ref(Obj) ((__typeof__(Obj)) (g_object_ref) (Obj))
> >   extern double *new_double(int *);
> >   double *new_double(int *ip) {
> >     double *dp;
> >     dp = g_object_ref(ip);
> >     return dp;
> >   }
> 
> >   $ gcc -Wall -Werror -c /tmp/test.c -o /tmp/test.o
> >   /tmp/test.c: In function ?new_context?:
> >   /tmp/test.c:19:13: error: assignment from incompatible pointer type
> >   [-Werror=incompatible-pointer-types]
> ctx-> self = g_object_ref(om);
> >                ^
> >   cc1: all warnings being treated as errors
> 
> > Fixing the code would require either changing the 120 ofending calls to
> > g_object_ref or a refactoring to make all types assignment compatible.
> > Let's take a simpler approach, disabling -Werror, and wait for the next
> > release of ModemManager.
> 
> > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> > ---
> >  package/modem-manager/modem-manager.mk | 6 ++++++
> >  1 file changed, 6 insertions(+)
> 
> > diff --git a/package/modem-manager/modem-manager.mk
> > b/package/modem-manager/modem-manager.mk
> > index 100c4a2941..ba4711b6c2 100644
> > --- a/package/modem-manager/modem-manager.mk
> > +++ b/package/modem-manager/modem-manager.mk
> > @@ -19,6 +19,12 @@ else
> >  MODEM_MANAGER_CONF_OPTS += --without-qmi
> >  endif
> 
> > +define MODEM_MANAGER_REMOVE_WERROR
> > +	$(SED) 's: -Werror::' $(@D)/configure
> > +endef
> 
> -Werror seems to come from m4/compiler_warnings.m4:
> 
> AC_ARG_ENABLE(more-warnings,
>        AS_HELP_STRING([--enable-more-warnings], [Maximum compiler warnings]),
>        set_more_warnings="$enableval",set_more_warnings=yes)
> AC_MSG_CHECKING(for more warnings, including -Werror)
> if test "$GCC" = "yes" -a "$set_more_warnings" != "no"; then
>        AC_MSG_RESULT(yes)
>        CFLAGS="-Wall -Werror -std=gnu89 $CFLAGS"
> 
> Wouldn't passing --disable-more-warnings work instead of hacking up
> configure?

Yes, if you don't forget the trailing "s" in --disable-more-warnings,
like I did in my first attempt. :-P

I will send an updated patch.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
