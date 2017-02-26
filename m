From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 26 Feb 2017 10:12:18 +0100
Subject: [Buildroot] [PATCH 0/4] package/cmake: revert the bump to 3.7
In-Reply-To: <20170226085938.GA4043@free.fr>
References: <cover.1488048682.git.yann.morin.1998@free.fr>
 <1488098694.10882.1.camel@embedded.rocks> <20170226085938.GA4043@free.fr>
Message-ID: <1488100338.10882.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, 2017-02-26 at 09:59 +0100, Yann E. MORIN wrote:
> J?rg, All,
> 
> On 2017-02-26 09:44 +0100, J?rg Krause spake thusly:
> > On Sat, 2017-02-25 at 19:51 +0100, Yann E. MORIN wrote:
> > > Hello All!
> > > 
> > > cmake 3.7 causes serious regressions in some cmake-based
> > > packages,
> > > related to how RPATH is handled.
> > 
> > For an explanation what's going wrong please have a look at [1].
> > [1] http://lists.busybox.net/pipermail/buildroot/2017-February/1835
> > 79.html
> 
> Are you sure this is related? The code you point to in this mail
> should
> not be executed in cross-compilation:
> 
> ????if(NOT CMAKE_CROSSCOMPILING AND EXISTS "/etc/debian_version")
> ??????set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB32_PATHS
> FALSE)
> ??????set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS
> FALSE)
> ????endif()
> 
> So, if this code is indeed the culprit, then it eans that
> CMAKE_CROSSCOMPILING is not set, and that in turn is probably the
> real
> issue.

By default `FIND_LIBRARY_USE_LIB32_PATHS` is set to TRUE [1], but is
set to FALSE if NOT cross-compiling AND building on a Debian host.

> (But I only had one coffee since I woke up, so I may have missed
> something...)

Me, too :-)

[1] https://cmake.org/gitweb?p=cmake.git;a=blob;f=Modules/Platform/Unix
Paths.cmake;h=d6c3d41f3112207ee11b42be18db438103e771f7;hb=896ad251#l97
