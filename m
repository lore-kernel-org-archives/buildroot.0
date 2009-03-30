From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 09:22:50 +0200
Subject: [Buildroot] svn commit: [25880] trunk/buildroot/package:
	automake libtool pkgconfig
In-Reply-To: <20090330082442.34a53123@surf> (Thomas Petazzoni's message of
	"Mon\, 30 Mar 2009 08\:24\:42 +0200")
References: <20090329191026.8F79877487@busybox.osuosl.org>
	<20090330082442.34a53123@surf>
Message-ID: <871vsfcw51.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> I must admit I'm far from being a auto* expert, and I'm quite
 Thomas> confused by the host vs. target auto* difference. So please
 Thomas> excuse my silly questions.

 Thomas> With your version, when a package sets FOO_AUTORECONF=YES, it
 Thomas> will use the autotools of the host (installed in
 Thomas> $(HOST_DIR)), but these autotools will be told to use the
 Thomas> aclocal files in $(STAGING_DIR), and therefore will only see
 Thomas> the aclocal files for libtool and pkgconfig. Is this what we
 Thomas> want ?

That and all the .m4 files installed by the various
packages - E.G. from a build with X support:

ls build_arm/staging_dir/usr/share/aclocal
codeset.m4       intl.m4          longdouble.m4    ulonglong.m4
freetype2.m4     intmax.m4        longlong.m4      visibility.m4
gettext.m4       inttypes_h.m4    ltdl.m4          wchar_t.m4
glib-2.0.m4      inttypes-pri.m4  nls.m4           wint_t.m4
glibc21.m4       lcmessage.m4     pkg.m4           xaw.m4
glibc2.m4        lib-ld.m4        po.m4            xorg-macros.m4
glib-gettext.m4  lib-link.m4      printf-posix.m4  xorg-server.m4
gtk-2.0.m4       lib-prefix.m4    progtest.m4      xorgversion.m4
iconv.m4         libtool.m4       size_max.m4      xsize.m4
intdiv0.m4       libxml.m4        stdint_h.m4      xtrans.m4
intldir.m4       lock.m4          uintmax_t.m4

The point is to not mix up stuff (in this case .m4 files) between host
and target builds. Our staging dir used to be a big mix of stuff for
the host and the target, and this is part of a cleanup of it.

-- 
Bye, Peter Korsgaard
