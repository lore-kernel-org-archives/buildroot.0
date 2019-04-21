From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 21:28:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/linknx: fix build without
 cppunit
In-Reply-To: <20190421173935.14990-1-fontaine.fabrice@gmail.com>
References: <20190421173935.14990-1-fontaine.fabrice@gmail.com>
Message-ID: <20190421212830.4ae5b0f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 21 Apr 2019 19:39:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/linknx/0002-configure.ac-always-define-CPPUNIT.patch b/package/linknx/0002-configure.ac-always-define-CPPUNIT.patch
> new file mode 100644
> index 0000000000..7bd0b89d7d
> --- /dev/null
> +++ b/package/linknx/0002-configure.ac-always-define-CPPUNIT.patch
> @@ -0,0 +1,34 @@
> +From 1b4a770af42f7d33ad174524b94ea4d2fc7133da Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 21 Apr 2019 19:31:50 +0200
> +Subject: [PATCH] configure.ac: always define CPPUNIT
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/4b042b7e18425690ec26b4977865516bedcb9edb
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/linknx/linknx/pull/42]
> +---
> + configure.ac | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 779fd6f..51d8ae6 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -145,8 +145,11 @@ if test x"$WITH_CPPUNIT" != xno; then
> +       AC_DEFINE([HAVE_CPPUNIT], [1], [cppunit])
> +       AC_SUBST(CPPUNIT_CFLAGS)
> +       AC_SUBST(CPPUNIT_LIBS)
> +-    ])
> ++      AM_CONDITIONAL([CPPUNIT], true)
> ++    ],[AM_CONDITIONAL([CPPUNIT], false)])
> +   fi
> ++else
> ++  AM_CONDITIONAL([CPPUNIT], false)
> + fi

The way this is normally done is more something like this:

AM_CONDITIONAL([CPPUNIT], [test x"$WITH_CPPUNIT" != xno])

of course, the condition may need to be different, but the idea is that
AM_CONDITIONAL() are not defined within a condition.

From https://www.gnu.org/software/automake/manual/html_node/Usage-of-Conditionals.html:

"""
Note that you must arrange for every AM_CONDITIONAL to be invoked every
time configure is run. If AM_CONDITIONAL is run conditionally (e.g., in
a shell if statement), then the result will confuse automake.
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
