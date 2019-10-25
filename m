From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 18:45:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/runc: add an option to build a
 non-static runc
In-Reply-To: <20191023093431.2220-1-jorgar@gmail.com> (James Peach's message
 of "Wed, 23 Oct 2019 20:34:31 +1100")
References: <20191023093431.2220-1-jorgar@gmail.com>
Message-ID: <87pnikixjm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Peach <jorgar@gmail.com> writes:

 > From: James Peach <jpeach@apache.org>
 > The systemd cgroup driver is compiled out of static builds of
 > runc so some users will need a non-static build.

What does that driver exactly do? What distributions enable this?

 > Add an option to control whether the runc should be static or not,
 > and default it to true for compatibility with existing
 > configurations.

Does this then work when running a different libc inside/outside the
containers?

If yes, what is the advantage of linking runc statically?


 > Signed-off-by: James Peach <jpeach@apache.org>
 > ---
 >  package/runc/Config.in | 11 +++++++++++
 >  package/runc/runc.mk   |  6 +++++-
 >  2 files changed, 16 insertions(+), 1 deletion(-)

 > diff --git package/runc/Config.in package/runc/Config.in
 > index f181ee334f..ea932120b8 100644
 > --- package/runc/Config.in
 > +++ package/runc/Config.in
 > @@ -10,6 +10,17 @@ config BR2_PACKAGE_RUNC
 
 >  	  https://github.com/opencontainers/runc
 
 > +if BR2_PACKAGE_RUNC
 > +
 > +config BR2_PACKAGE_RUNC_STATIC
 > +	bool "static runc binary"
 > +	default y
 > +	help
 > +	  Whether to make a static build of runc. This must be false
 > +	  for runc to be able to use the systemd cgroups driver.
 > +
 > +endif
 > +
 >  comment "runc needs a glibc or musl toolchain w/ threads"
 >  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
 >  		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 > diff --git package/runc/runc.mk package/runc/runc.mk
 > index b858742905..4128afd53a 100644
 > --- package/runc/runc.mk
 > +++ package/runc/runc.mk
 > @@ -13,7 +13,11 @@ RUNC_WORKSPACE = Godeps/_workspace
 
 >  RUNC_LDFLAGS = -X main.gitCommit=$(RUNC_VERSION)
 
 > -RUNC_TAGS = cgo static_build
 > +RUNC_TAGS = cgo
 > +
 > +ifeq ($(BR2_PACKAGE_RUNC_STATIC),y)
 > +RUNC_TAGS += static_build
 > +endif
 
 >  ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 >  RUNC_TAGS += seccomp
 > -- 
 > 2.21.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
