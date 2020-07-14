From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 14:47:35 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/cups-filters: fix build without dejavu font
In-Reply-To: <20200714112308.3264764-1-fontaine.fabrice@gmail.com>
References: <20200714112308.3264764-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714144735.56a11bb9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 13:23:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +-AS_IF([test -f "$with_test_font_path"],
> +-	[AC_DEFINE_UNQUOTED([TESTFONT], ["$with_test_font_path"], [Path to font used in tests])],
> ++AS_IF([test "x$cross_compiling" != "xyes" && ! test -f "$with_test_font_path"],
> + 	[AC_MSG_ERROR(DejaVuSans.ttf font file is missing. Please install a package providing it.)]
> + )
> ++AC_DEFINE_UNQUOTED([TESTFONT], ["$with_test_font_path"], [Path to font used in tests])

While I understand this is "fixing" the build issue, I don't understand
how it makes sense. The ttfread program, built from fontembed/main.c,
will use the TESTFONT macro.

So it means that your program on the target will point to a font on the
target that may not exists as its path was detected on the build
machine.

This doesn't seem right. Am I missing something here ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
