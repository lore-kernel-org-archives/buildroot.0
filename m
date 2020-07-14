From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Jul 2020 15:09:25 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/cups-filters: fix build without dejavu font
In-Reply-To: <20200714144735.56a11bb9@windsurf.home>
References: <20200714112308.3264764-1-fontaine.fabrice@gmail.com>
 <20200714144735.56a11bb9@windsurf.home>
Message-ID: <CAPi7W81nhSFN09_=mR2g8A5kHL1vHzYCzCjarZWWtrAMEDvLCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le mar. 14 juil. 2020 ? 14:47, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Tue, 14 Jul 2020 13:23:07 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > +-AS_IF([test -f "$with_test_font_path"],
> > +-    [AC_DEFINE_UNQUOTED([TESTFONT], ["$with_test_font_path"], [Path to font used in tests])],
> > ++AS_IF([test "x$cross_compiling" != "xyes" && ! test -f "$with_test_font_path"],
> > +     [AC_MSG_ERROR(DejaVuSans.ttf font file is missing. Please install a package providing it.)]
> > + )
> > ++AC_DEFINE_UNQUOTED([TESTFONT], ["$with_test_font_path"], [Path to font used in tests])
>
> While I understand this is "fixing" the build issue, I don't understand
> how it makes sense. The ttfread program, built from fontembed/main.c,
> will use the TESTFONT macro.
>
> So it means that your program on the target will point to a font on the
> target that may not exists as its path was detected on the build
> machine.
>
> This doesn't seem right. Am I missing something here ?
This font is only used for test programs and Yann even suggested me to
point to /dev/null in the first review of this patch.
In particular, TESTFONT is used by fontembed/main.c only if the user
does not provide any arguments:

const char *fn=TESTFONT;
if (argc==2) {
fn=argv[1];
}

However, if you think it's better to use --with-test-font-path to set
the test font path to /usr/share/fonts/dejavu/DejaVuSans.ttf (i.e. the
default value when cups-filters does not find it on the build
machine), I can send a v3.
But this does not seem better to hardcode this path without adding a
dependency on dejavu ...
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
