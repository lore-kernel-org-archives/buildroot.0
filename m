From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Sep 2016 00:11:29 +0200
Subject: [Buildroot] [PATCH] qt5: Disable passing of -isystem flag in
 CXXFLAGS
In-Reply-To: <1474642729-40702-1-git-send-email-abrodkin@synopsys.com>
References: <1474642729-40702-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <81ddd556-d7fd-2378-d8da-2f2d73091fa3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Alexey,

 Excellent commit log!

On 23-09-16 16:58, Alexey Brodkin wrote:
> Some Qt5 sub-projects as well as 3rd-party apps written on Qt
> are failing to compile with gcc 6.x like that:
> ---------------------------->8-------------------------
> In file included from XXX/output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/bits/stl_algo.h:59:0,
>                  from XXX/output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/algorithm:62,
>                  from XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/qt5/QtCore/qglobal.h:88,
>                  from XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/qt5/QtCore/qpair.h:37,
>                  from qmediametadata.h:37,
>                  from qmediametadata.cpp:28:
> XXX/output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/cstdlib:75:25: fatal error: stdlib.h: No such file or directory
>  #include_next <stdlib.h>
>                          ^
> compilation terminated.
> ---------------------------->8-------------------------
> 
> That happens because qmake trying to play smart passes some
> include paths in Makefile with "-isystem" prefix.
> Which in some cases lead to build failure well described in [1].
> 
> A little bit more details below on what really happens:
> 
> 1. In "configure" script Qt determines default include paths of the
>    toolchain and stores them in DEFAULT_INCDIRS variable, see [2].
> 
> 2. On qmake execution when it creates Makefile out of .pro-file
>    it parses headers in INCLUDEPATH variable and if a path matches
>    one in DEFAULT_INCDIRS then in CXXFLAGS that path is written
>    with $QMAKE_CFLAGS_ISYSTEM prefix, otherwise non-matching include
>    path ends up in CXXFLAGS with normal "-I" prefix.
> 
> 3. By default for gcc "QMAKE_CFLAGS_ISYSTEM = -isystem", see [3].
> 
> 4. gcc fails to find stdlib.h, again refer to J?rg's explanation in [1].

 There is one difference here, however: In J?rg's explanation, it's about
headers which really aren't system headers (protobuf). But in this case, the
headers really are system headers.

> 
> What we do here we force set QMAKE_CFLAGS_ISYSTEM to "" and so qmake
> won't use "-isystem" any longer instead expected "-I" will be used for
> all headers, see [4].

 Another option would be to set it to -idirafter, which puts the directory at
the end of the default search path and I think it also still treats it as a
system directory. But that would possibly lead to even worse side effects, so
maybe not such a good idea.

 I still don't understand how the -I$(STAGING_DIR)/usr/include gets added, by
the way. Isn't pkg-config supposed to suppress those, because they already are
in the default search path? For instance, on my system I have a xf86dgaproto.pc
which contains Cflags: -I${includedir}, but pkg-config --cflags xf86dgaproto
gives empty.


 But in the end it will probably come down to this patch anyway, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

However, I propose to wait another week or so to see if someone else comes up
with a better idea.


 Regards,
 Arnout

> 
> That fixes building of Qt5Webkit on ARM with gcc 6.x and a number of
> autobuilder failures for ARC (the an arch that uses gcc 6 by default) like:
> http://autobuild.buildroot.net/results/56a/56a6700774af692e7f5a99b452b15e4e8592310f
> http://autobuild.buildroot.net/results/697/697412b29bf031bf8f246cc3af97ebcbf6bf6d1b
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=e79272fa7ff3d66c18de3514b912cd9d68d121a4
> [2] http://code.qt.io/cgit/qt/qtbase.git/tree/configure?h=5.6.1#n3660
> [3] http://code.qt.io/cgit/qt/qtbase.git/tree/mkspecs/common/gcc-base.conf?h=5.6.1#n47
> [4] http://code.qt.io/cgit/qt/qtbase.git/tree/qmake/generators/unix/unixmake2.cpp?&h=5.6.1#n193
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/qt5/qt5base/qmake.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qt5/qt5base/qmake.conf b/package/qt5/qt5base/qmake.conf
> index 2152d3c..49cf898 100644
> --- a/package/qt5/qt5base/qmake.conf
> +++ b/package/qt5/qt5base/qmake.conf
> @@ -19,6 +19,7 @@ QMAKE_CXXFLAGS_RELEASE += -O3
>  CONFIG                 += nostrip
>  
>  QMAKE_LIBS             += -lrt -lpthread -ldl
> +QMAKE_CFLAGS_ISYSTEM   =
>  
>  include(../common/linux_device_post.conf)
>  load(qt_config)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
