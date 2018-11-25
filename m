From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Nov 2018 09:48:13 +0100
Subject: [Buildroot] [PATCH 3/3] package: hide golang packages for
 toolchains with binutils bug 20006
In-Reply-To: <20181124225601.4e592936@windsurf>
References: <cover.1543096295.git.yann.morin.1998@free.fr>
 <3eaf225466a426cf89218531a5c9d685c2224a18.1543096295.git.yann.morin.1998@free.fr>
 <20181124225601.4e592936@windsurf>
Message-ID: <20181125084813.GA28830@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-24 22:56 +0100, Thomas Petazzoni spake thusly:
> On Sat, 24 Nov 2018 22:52:01 +0100, Yann E. MORIN wrote:
> > Fixes:
> >     http://autobuild.buildroot.org/results/020/02039969b16534d4020ecd4574bae71b91c1e6b8/ (flannel)
> >     http://autobuild.buildroot.org/results/e95/e9528b06b350ef84c1e2cb59fba87b4db77b4660/ (docker-engine)
> >     [...]
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Romain Naour <romain.naour@gmail.com>
> > ---
> >  package/docker-containerd/Config.in | 4 ++++
> >  package/docker-engine/Config.in     | 4 ++++
> >  package/docker-proxy/Config.in      | 4 ++++
> >  package/flannel/Config.in           | 4 ++++
> >  package/mender/Config.in            | 4 ++++
> >  package/runc/Config.in              | 4 ++++
> >  6 files changed, 24 insertions(+)
> > 
> > diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
> > index 851345f73e..39f6ea8ee8 100644
> > --- a/package/docker-containerd/Config.in
> > +++ b/package/docker-containerd/Config.in
> > @@ -4,6 +4,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
> >  	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS
> >  	depends on BR2_USE_MMU # util-linux
> > +	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
> >  	select BR2_PACKAGE_RUNC # runtime dependency
> >  	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
> >  	select BR2_PACKAGE_UTIL_LINUX_BINARIES
> > @@ -32,3 +33,6 @@ comment "docker-containerd needs a toolchain w/ threads"
> >  	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
> >  	depends on BR2_USE_MMU
> >  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> > +
> > +comment "docker-containerd needs a toolchain not affected by binutils bug 20006"
> > +	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
> 
> This comment should not appear on architecture not supported by go, so
> you should replicate at least:
> 
>   	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
>   	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
> 
> However, overall, I'm wondering if we shouldn't keep it simple and
> stupid, and simply make BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS depend on
> BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006.

ACK, good idea.

> Yes, there won't be comments in
> each and every package, but do we really need that for such a corner
> case ?

I don't care, at least.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
