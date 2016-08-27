From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sat, 27 Aug 2016 20:01:36 +0200
Subject: [Buildroot] [PATCH] package/protobuf: uses fork(),
 not available on no-MMU platforms
In-Reply-To: <20160827151211.3984639c@free-electrons.com>
References: <20160827001703.18155-1-joerg.krause@embedded.rocks>
 <20160827151211.3984639c@free-electrons.com>
Message-ID: <1472320896.3953.4.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sa, 2016-08-27 at 15:12 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 27 Aug 2016 02:17:03 +0200, J?rg Krause wrote:
> > 
> > Propagate the dependency to the packages mosh and ola.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/2c1/2c151e84d7854a810465dc16
> > 869023e0ada2d586/
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> At first, I was a bit surprised as to why we're seeing this only now,
> so I investigated a bit, and came to the following conclusion, which
> I
> added to the commit log:
> 
> """
> ????This was not noticed until now because:
> ????
> ?????1/ The older Blackfin toolchain doesn't have libatomic, so it
> didn't
> ????????provide the atomic operations that protobuf needs, so
> protobuf was
> ????????never built.
> ????
> ?????2/ The ARM Cortex-M toolchain is static-only, and protobuf
> requires
> ????????dynamic library support.
> ????
> ????So it's only with the new Blackfin toolchain, which is based on
> gcc
> ????6.x (and therefore provides libatomic) and is FDPIC-based (and
> therefore
> ????has dynamic library support) that this problem appeared.
> 
> """
> 
> 
> > 
> > diff --git a/package/protobuf/Config.in
> > b/package/protobuf/Config.in
> > index 3215a07..4a8d1ef 100644
> > --- a/package/protobuf/Config.in
> > +++ b/package/protobuf/Config.in
> > @@ -33,6 +33,7 @@ config BR2_PACKAGE_PROTOBUF
> > ?	depends on BR2_INSTALL_LIBSTDCPP
> > ?	depends on BR2_TOOLCHAIN_HAS_THREADS
> > ?	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> > +	depends on BR2_USE_MMU # fork()
> > ?	depends on !BR2_STATIC_LIBS
> > ?	help
> > ?	??Protocol buffers are Google's language-neutral,
> > platform-neutral,
> 
> When you add a new dependency, you must also propagate it to the
> Config.in comment so that those comments don't appear on no-MMU
> platforms.
> 
> *However*, in this specific case, there was already a
> BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS, to which it makes a lot of sense
> to
> add the BR2_USE_MMU dependency: it's an architecture dependency, and
> by
> doing so, it's automatically propagated to the existing comments and
> reverse dependencies.

Many thanks for improving the commit! However, there a some packages
which have an architecture dependency where the no-MMU dependency is
not added to the architecture dependency, e.g. gauche. Should those
packages be revised, too?

J?rg
