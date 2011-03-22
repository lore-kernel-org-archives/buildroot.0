From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 22 Mar 2011 11:38:53 -0400
Subject: [Buildroot] Add Package: htop
In-Reply-To: <4D88BDC8.6080002@AdTran.com>
References: <4D88BDC8.6080002@AdTran.com>
Message-ID: <AANLkTin3jGmmJfRXAa7VHS0ZdcE76V8DVmuEvEZn4XeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 22, 2011 at 11:18 AM, Andy Kennedy wrote:
> --- a/package/htop/htop-alloc-not-void.patch ? ?1969-12-31 18:00:00.000000000 -0600
> +++ b/package/htop/htop-alloc-not-void.patch ? ?2011-03-21 18:09:45.000000000 -0500
> @@ -0,0 +1,21 @@
> +diff -Naur a/configure b/configure
> +--- a/configure ? ? ? ?2010-11-23 10:33:53.000000000 -0600
> ++++ b/configure ? ? ? ?2011-03-21 18:05:46.000000000 -0500
> +@@ -12363,7 +12363,7 @@
> + #if defined STDC_HEADERS || defined HAVE_STDLIB_H
> + # include <stdlib.h>
> + #else
> +-char *malloc ();
> ++void *malloc ();
> + #endif
> +
> + int
> +@@ -12598,7 +12598,7 @@
> + #if defined STDC_HEADERS || defined HAVE_STDLIB_H
> + # include <stdlib.h>
> + #else
> +-char *realloc ();
> ++void *realloc ();
> + #endif

why do you need to patch this ?  HAVE_STDLIB_H should be defined, or
something else is broken.

> +--- a/configure
> ++++ b/configure

so you patch configure ...

> +--- a/configure.ac
> ++++ b/configure.ac

then you patch configure.ac ...

> +HTOP_POST_CONFIGURE_HOOKS = HTOP_RETOUCH_CONFIGURE_AC
> +
> +define HTOP_RETOUCH_CONFIGURE_AC
> + ? ? ? touch -r $(@D)/missing $(@D)/configure.ac
> +endef

and then you manually touch configure.ac, but dont invoke autotools
anywhere.  what is going on here ?

you should only be patching generated files, or only the source
autotool files.  and if you do the latter, you should be re-running
autotools via HTOP_AUTORECONF=yes, not manually mucking with
timestamps and letting the build system figure things out.
-mike
