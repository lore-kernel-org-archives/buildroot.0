From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Nov 2015 22:48:49 +0100
Subject: [Buildroot] [PATCH v1] valgrind: fix musl compile
In-Reply-To: <56437591.1090806@openwide.fr>
References: <1446317942-18726-1-git-send-email-ps.report@gmx.net>
 <56437591.1090806@openwide.fr>
Message-ID: <20151112224849.6d683112@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Wed, 11 Nov 2015 18:06:25 +0100, Romain Naour <romain.naour@openwide.fr> wrote:

[...]

> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -1066,8 +1066,9 @@ case "${GLIBC_VERSION}" in
> > + 	;;
> > +      2.0|2.1|*)
> > + 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
> > +-	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later,])
> > +-	AC_MSG_ERROR([Darwin libc, Bionic libc or Solaris libc])
> > ++	AC_MSG_WARN([Valgrind requires glibc version 2.2 or later,])
> > ++	AC_MSG_WARN([Darwin libc, Bionic libc or Solaris libc])
> > ++	GLIBC_VERSION=musl
> 
> This part of this patch break the glibc check for unsupported version 2.0 and 2.1.

Yes I know, its only a workaround for the buildroot build...

> 
> If you want to upstream the patch, maybe you can check if GLIBC_VERSION is empty
> and use the toolchain tuple instead ?
> 
> Something like:
> 
> # GLIBC_VERSION is empty if a musl libc is used, so use the toolchain tuple
> # in this case.
> if test x$GLIBC_VERSION = x; then
>     TUPLE=`$CC -dumpmachine | grep musl`
>     if test -n $TUPLE; then
>         GLIBC_VERSION=musl
>     fi
> fi
> 
> AC_MSG_CHECKING([the glibc version])
> 
> case "${GLIBC_VERSION}" in
> ...
>     musl)
> 	AC_MSG_RESULT(Musl)
> 	;;
> ...
> 
> Thoughts?
>

Many thanks for the suggestion, will try to cook up a patch...

Regards,
Peter

> Best regards,
> Romain Naour
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
