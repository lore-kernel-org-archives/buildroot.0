From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:44:12 +0200
Subject: [Buildroot] [PATCH v2] package/xmlstarlet: fix host build
In-Reply-To: <20170902200741.2878-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 2 Sep 2017 22:07:41 +0200")
References: <20170902200741.2878-1-romain.naour@gmail.com>
Message-ID: <87vajewyxf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Provide the path to HOST_DIR for libxml, libxslt and libiconv like for
 > the target variant to avoid a build issue on host where /bin is a
 > symlink to /usr/bin.

 > Indeed, the configure script use a custom m4 macro XSTAR_LIB_CHECK to
 > find xml2-config:

 > XSTAR_LIB_CHECK([LIBXML], [xml2-config])

 > This macro come from a local m4 file m4/xstar-check-libs.m4 where it
 > use:

 > AC_PATH_PROG(LIBXXX()_CONFIG, xxx_config(),
 >                [], [$LIBXXX()_PREFIX/bin$PATH_SEPARATOR$PATH]

 > Since no prefix seems to be defined by $LIBXXX()_PREFIX, AC_PATH_PROG
 > look by itself at /bin/ for xml2-config. So the PATH variable set
 > by Buildroot containing HOST_DIR/bin is ignored.

 > The wrong xml2-config is used during the build and the build fail
 > when no xml2 headers are installed on the host.

 > Fixes:
 > src/xml_C14N.c:12:31: erreur fatale?: libxml/xmlversion.h : No such file or directory
 >  #include <libxml/xmlversion.h>
 >                                ^
 > In file included from src/trans.c:4:0:
 > src/trans.h:32:30: erreur fatale?: libxml/xmlmemory.h : No such file or directory
 >  #include <libxml/xmlmemory.h>

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: improve the commit message (ThomasP)

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
