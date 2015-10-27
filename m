From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 27 Oct 2015 08:54:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: broken with musl on x86
In-Reply-To: <20151027075207.51f35d1d@free-electrons.com>
References: <1445374313-30804-1-git-send-email-joerg.krause@embedded.rocks>
 <20151021135029.4b4b9e42@free-electrons.com>
 <20151027075207.51f35d1d@free-electrons.com>
Message-ID: <1445932453.18019.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Di, 2015-10-27 at 07:52 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 21 Oct 2015 13:50:29 +0200, Thomas Petazzoni wrote:
> 
> > On Tue, 20 Oct 2015 22:51:53 +0200, J?rg Krause wrote:
> > > This patch replaces a previous submission made by Bernd Kuhls
> > > some while ago
> > > [1].
> > > 
> > > The posix_memalign declaration is incompatible with musl for C++,
> > > because of
> > > the exception specification [2]. Note, the referenced patch is
> > > part of the a
> > > patch series to "Add musl support to GCC".
> > > 
> > > Instead of patching gcc in Buildroot we disable jsoncpp and any
> > > reverse
> > > dependendy with the musl toolchain on x86.
> > > 
> > > [1] https://patchwork.ozlabs.org/patch/505425/
> > > [2] https://gcc.gnu.org/ml/gcc-patches/2015-04/msg01084.html
> > 
> > It is indeed not very practical to fix gcc, since external
> > toolchains
> > would continue to be affected. But isn't there a way of working
> > around
> > the problem inside jsoncpp itself, so that we don't have to do this
> > complicated reverse-dependency propagation ?
> 
> There is indeed a solution: remove the -pedantic flags from
> 
> set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion
> -Wshadow -Wextra -pedantic")
> 
> line in CMakeLists.txt. And it builds just fine. It seems a lot
> simpler
> than propagating the reverse dependencies.
> 
> Could you submit a patch doing this ?

Indeed, this is much simpler. Many thanks for investigation ... I did
not had the time. I'll prepare a patch for this soon!

Best regards
J?rg Krause
