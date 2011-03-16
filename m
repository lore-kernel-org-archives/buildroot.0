From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 Mar 2011 17:40:21 +0100
Subject: [Buildroot] [PATCH 1/5] mesa3d: fix build failure bug #3313
In-Reply-To: <1299764675-23308-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Thu, 10 Mar 2011 10:44:31 -0300")
References: <1299764675-23308-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ei67m32i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add patch to fix the build failure as reported in bug #3313
 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/x11r7/mesa3d/mesa3d-uclibc.patch |   12 ++++++++++++
 Gustavo>  1 files changed, 12 insertions(+), 0 deletions(-)
 Gustavo>  create mode 100644 package/x11r7/mesa3d/mesa3d-uclibc.patch

 Gustavo> diff --git a/package/x11r7/mesa3d/mesa3d-uclibc.patch b/package/x11r7/mesa3d/mesa3d-uclibc.patch
 Gustavo> new file mode 100644
 Gustavo> index 0000000..37f620b
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/x11r7/mesa3d/mesa3d-uclibc.patch
 Gustavo> @@ -0,0 +1,12 @@
 Gustavo> +diff -Nura Mesa-7.6.1/src/mesa/main/imports.c Mesa-7.6.1.uclibc/src/mesa/main/imports.c
 Gustavo> +--- Mesa-7.6.1/src/mesa/main/imports.c	2009-12-21 23:08:13.000000000 -0300
 Gustavo> ++++ Mesa-7.6.1.uclibc/src/mesa/main/imports.c	2011-03-02 15:09:56.342618892 -0300
 Gustavo> +@@ -915,7 +915,7 @@
 Gustavo> + double
 Gustavo> + _mesa_strtod( const char *s, char **end )
 Gustavo> + {
 Gustavo> +-#ifdef _GNU_SOURCE
 Gustavo> ++#if defined(_GNU_SOURCE) && !defined(__UCLIBC__)
 Gustavo> +    static locale_t loc = NULL;
 Gustavo> +    if (!loc) {
 Gustavo> +       loc = newlocale(LC_CTYPE_MASK, "C", NULL);

Hmm, that looks wrong - uClibc has newlocale() if you have locale
support enabled, so I guess you'll need something like:

#ifdef _GNU_SOURCE
#if !defined(__UCLIBC__) || defined(__UCLIBC_HAS_LOCALE__)
..

-- 
Bye, Peter Korsgaard
