From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 29 May 2015 00:00:39 +0200
Subject: [Buildroot] [PATCH v2 1/2] libfcgi
 (0003-link-against-math.patch): Do actually link when needed.
In-Reply-To: <1432827404-1096-2-git-send-email-thomas.claveirole@green-communications.fr>
References: <1432827404-1096-1-git-send-email-thomas.claveirole@green-communications.fr>
 <1432827404-1096-2-git-send-email-thomas.claveirole@green-communications.fr>
Message-ID: <55679007.7060401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/28/15 17:36, Thomas Claveirole wrote:
> libfcgi uses frexp() and thus should link with libm, but fails to do
> so.  Thus link errors with programs that use libfcgi (the bug does
> appear only with uClibc, because the GNU libc provides frexp()
> directly in libc.so).  Modify 0003-link-against-math.patch so libfcgi
> links against math, instead of programs that need it.
> 
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

 Looks good, but the patch should still have your Signed-off-by to the patch:

> ---
>  package/libfcgi/0003-link-against-math.patch | 36 +++++++++-------------------
>  1 file changed, 11 insertions(+), 25 deletions(-)
> 
> diff --git a/package/libfcgi/0003-link-against-math.patch b/package/libfcgi/0003-link-against-math.patch
> index 4c87ea6..ccf648a 100644
> --- a/package/libfcgi/0003-link-against-math.patch
> +++ b/package/libfcgi/0003-link-against-math.patch
> @@ -1,28 +1,14 @@
> -Link against math libraries when needed
> +Link libfcgi against the math library.
>  
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Here.

 With that:
  Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> -
> -Index: b/cgi-fcgi/Makefile.am
> -===================================================================
> ---- a/cgi-fcgi/Makefile.am
> -+++ b/cgi-fcgi/Makefile.am
> -@@ -11,5 +11,5 @@
> - LIBDIR      = ../libfcgi
> - LIBFCGI     = $(LIBDIR)/libfcgi.la
> - 
> --LDADD = $(LIBFCGI)
> -+LDADD = $(LIBFCGI) -lm
> - cgi_fcgi_SOURCES = $(INCLUDE_FILES) cgi-fcgi.c
> -Index: b/examples/Makefile.am
> +Index: b/libfcgi/Makefile.am
>  ===================================================================
> ---- a/examples/Makefile.am
> -+++ b/examples/Makefile.am
> -@@ -21,7 +21,7 @@
> - LIBDIR      = ../libfcgi
> - LIBFCGI     = $(LIBDIR)/libfcgi.la
> - 
> --LDADD = $(LIBFCGI)
> -+LDADD = $(LIBFCGI) -lm
> +--- a/libfcgi/Makefile.am
> ++++ b/libfcgi/Makefile.am
> +@@ -18,6 +18,7 @@
> +                      os_ at SYSTEM@.c
> + libfcgi_la_CC      = @PTHREAD_CC@
> + libfcgi_la_CFLAGS  = @PTHREAD_CFLAGS@
> ++libfcgi_la_LIBADD  = -lm
>   
> - echo_SOURCES       = $(INCLUDE_FILES) echo.c
> - echo_x_SOURCES     = $(INCLUDE_FILES) echo-x.c
> + libfcgi___la_SOURCES = $(INCLUDE_FILES)       \
> +                        $(INCLUDEDIR)/fcgio.h  \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
