From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 22:20:51 +0200
Subject: [Buildroot] [PATCH] ccache: fix explicit build 'make clean
 host-ccache'
In-Reply-To: <CAAXf6LWxP-Z-aonTSkjsOn0sGq6zhsB2gYta6K1AQYSK3DwmoQ@mail.gmail.com>
References: <1461952973-20054-1-git-send-email-patrickdepinguin@gmail.com>
 <20160501143931.7f767fb8@free-electrons.com>
 <CAAXf6LWxP-Z-aonTSkjsOn0sGq6zhsB2gYta6K1AQYSK3DwmoQ@mail.gmail.com>
Message-ID: <20160501222051.33f7dda9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 1 May 2016 22:11:18 +0200, Thomas De Schampheleire wrote:

> > I think this means that the CC/CXX assignments in
> > support/dependencies/dependencies.mk are useless, no? If you do "make
> > clean host-tar", or "make clean host-xz" or "make clean host-sstrip",
> > it will fail the same way, no? Doesn't this mean that those "special"
> > package should be fixed to define CC=$(HOSTCC_NOCCACHE)
> > CXX=$(HOSTCXX_NOCCACHE) in their environment ?  
> 
> After some quick checking, it seems to depend which packages are in
> DEPENDENCIES_HOST_PREREQ: 'make clean host-foo' will fail if host-foo
> is in DEPENDENCIES_HOST_PREREQ but will succeed if it is not. This is
> because packages that all packages get 'dependencies' as dependency,
> except packages that are itself in DEPENDENCIES_HOST_PREREQ.
> 
> So, on my system, 'make clean host-xz' worked fine because I have a
> suitable xzcat already and hence host-xz is not put in
> DEPENDENCIES_HOST_PREREQ. Similar for host-tar. If I cheat and add
> host-xz in DEPENDENCIES_HOST_PREREQ unconditionally, 'make clean
> host-xz' indeed fails.
> 
> This difference depending on the host system also means that a
> solution where e.g. host-xz is changed to set CC and CXX to
> no-ccache-versions is suboptimal: in case host-xz is not in
> DEPENDENCIES_HOST_PREREQ, the package would be built without ccache
> even if it were available. One could argue that there's no need to
> build host-xz in this scenario, but I can imagine other packages that
> can be mandatory in some situations and optional in others.
> Maybe this is nothing to worry about and we should keep things simple:
> don't use ccache for host packages that are potentially a core
> dependency for buildroot.
> 
> What are your thoughts?

I think we should be simple, and indeed build those few packages always
without ccache. I don't think we have any package that depends on
"host-tar". Regarding host-xz, I'm not that sure, but it's a small
package, so building it without ccache is not a big deal.

Alternatively, we could try to make those packages depend on
host-ccache. But I'm really not sure it's worth it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
