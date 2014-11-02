From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Sun, 02 Nov 2014 22:03:51 +0100
Subject: [Buildroot] [git commit] avahi: fix avahi-ui build with libgtk3
In-Reply-To: <87ppd55pf0.fsf@dell.be.48ers.dk>
References: <20141031115353.56D52B23C4@busybox.osuosl.org>
 <1414799165.15213.1.camel@posteo.de> <20141101191304.GG10189@free.fr>
 <1414959095.1061.1.camel@posteo.de> <87ppd55pf0.fsf@dell.be.48ers.dk>
Message-ID: <1414962231.1061.3.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On So, 2014-11-02 at 21:16 +0100, Peter Korsgaard wrote:
> >>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:
> 
> Hi,
> 
>  > Yann, Peter, All,
> 
>  >> It seems it requires gettext.
>  >> 
>  >> J?rg, care to test adding this to avahi.mk (just below AUTORECONF):
>  >> 
>  >> AVAHI_GETTEXTIZE = YES
> 
>  > this doesn't help. The problem is the AM_GLIB_GNU_GETTEXT macro at
>  > configure.ac:419. If I enable glibc avahi builds without errors.
> 
> glib, not glibc.

You're right, it's glib, of course.

> 
>  > I've also found some old posts about this issue, e.g:
>  > http://blogs.gnome.org/jjardon/2010/10/08/use-upstream-gettext-instead-the-glib-one/
> 
>  > I followed this suggestions and replaced AM_GLIB_GNU_GETTEXT with:
>  >         AM_GNU_GETTEXT_VERSION([0.19.3])
>  >         AM_GNU_GETTEXT([external])
>  > and it works for me.
> 
>  > I am not sure about the version number I should use for gettext. The
>  > most recent one?
> 
> Sorry, don't know.

There is also another solution which works: Updating intltool and
removing AM_GLIB_GNU_GETTEXT:

        diff --git a/configure.ac b/configure.ac
        index 9debce2..9222c6f 100644
        --- a/configure.ac
        +++ b/configure.ac
        @@ -413,11 +413,10 @@ if test "x$have_kqueue" = "xyes" ; then
             AC_DEFINE([HAVE_KQUEUE], 1, [Enable BSD kqueue() usage])
         fi
        
        -IT_PROG_INTLTOOL([0.35.0])
        +IT_PROG_INTLTOOL([0.50.2])
         GETTEXT_PACKAGE=avahi
         AC_SUBST([GETTEXT_PACKAGE])
        
        AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE],["$GETTEXT_PACKAGE"],[Gettext package])
        -AM_GLIB_GNU_GETTEXT
        
         avahilocaledir='${prefix}/${DATADIRNAME}/locale'
         AC_SUBST(avahilocaledir)
        --

I got this from:
https://mail.gnome.org/archives/commits-list/2014-April/msg04208.html
https://mail.gnome.org/archives/commits-list/2014-April/msg04208.html

> 
>  > I am not an expert about autotools. So what do you think about this? May
>  > I submit a patch for this issue?
> 
> Either that, or we simply forget about patching Makefile.am / running
> autoreconf and just strip the CFLAGS arguments in Makefile.in instead.
> 

Since I've already created a patch I can submit it. I was just wondering
about the patch name policy in avahi and unsure how to name?
