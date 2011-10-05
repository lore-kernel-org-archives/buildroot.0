From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 20:02:55 +0200
Subject: [Buildroot] [PATCH 3/5] mesa3d: add patch to fix build on
	!locale toolchains
In-Reply-To: <f08b73124ef8e797878851102a0f915e06dc4fd1.1316465857.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 19 Sep 2011 22:57:39 +0200")
References: <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
 <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
 <f08b73124ef8e797878851102a0f915e06dc4fd1.1316465857.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8762k3pb8w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Fixes bug #3313.
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  .../x11r7/mesa3d/mesa3d-7.6.1-fix-no-locale.patch  |   14 ++++++++++++++
 Thomas>  1 files changed, 14 insertions(+), 0 deletions(-)
 Thomas>  create mode 100644 package/x11r7/mesa3d/mesa3d-7.6.1-fix-no-locale.patch

 Thomas> diff --git a/package/x11r7/mesa3d/mesa3d-7.6.1-fix-no-locale.patch b/package/x11r7/mesa3d/mesa3d-7.6.1-fix-no-locale.patch
 Thomas> new file mode 100644
 Thomas> index 0000000..6b481d2
 Thomas> --- /dev/null
 Thomas> +++ b/package/x11r7/mesa3d/mesa3d-7.6.1-fix-no-locale.patch
 Thomas> @@ -0,0 +1,14 @@
 Thomas> +Index: Mesa-7.6.1/src/mesa/main/imports.c
 Thomas> +===================================================================
 Thomas> +--- Mesa-7.6.1.orig/src/mesa/main/imports.c
 Thomas> ++++ Mesa-7.6.1/src/mesa/main/imports.c
 Thomas> +@@ -915,7 +915,8 @@
 Thomas> + double
 Thomas> + _mesa_strtod( const char *s, char **end )
 Thomas> + {
 Thomas> +-#ifdef _GNU_SOURCE
 Thomas> ++  /* We need either a glibc/eglibc library, or uClibc with locales */
 Thomas> ++#if defined(_GNU_SOURCE) && (!defined(__UCLIBC__) || defined(__UCLIBC_HAS_LOCALE__))

I didn't look at the mesa sources, but are you sure this does the right
thing on uClibc w/locales? Normally you need to #include <features.h>
for the __UCLIBC_* defines - E.G.

./output/host/usr/bin/arm-linux-gcc -dM -E - < /dev/null |grep -c UCLIBC
0

echo '#include <features.h>' > dummy.c
./output/host/usr/bin/arm-linux-gcc -dM -E dummy.c |grep -c UCLIBC
76

-- 
Bye, Peter Korsgaard
