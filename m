From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 Jan 2011 20:02:45 +0100
Subject: [Buildroot] [git commit master 1/1] pkg-config: add
	--with-sysroot option for compiled in default sysroot setting
In-Reply-To: <20110130152358.436fc691@surf> (Thomas Petazzoni's message of
	"Sun, 30 Jan 2011 15:23:58 +0100")
References: <20110129234038.9CB708E076@busybox.osuosl.org>
	<20110130152358.436fc691@surf>
Message-ID: <8739oaxlii.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Similar to the --with-pc-path option. It works just like the existing
 >> PKG_CONFIG_SYSROOT_DIR environment variable, but compiled in.
 >> The environment variable overrides this default setting if set.
 >> 
 >> This way we don't need to pass PKG_CONFIG_SYSROOT_DIR in the environment
 >> when building for the target, and it is easier to reuse pkg-config outside
 >> BR (E.G. for the SDK) without having to setup special environment
 >> variables.

 Thomas> I am not a big fan of this: we compile a single pkg-config to handle
 Thomas> both target and host packages. So I don't see why this pkg-config
 Thomas> should be specifically configured to handle packages and not for host
 Thomas> packages. I know it was already configured specifically for target
 Thomas> packages with --with-pc-path, but I wasn't a fan of this.

Well, lets look at the situation (I know you probably know all of this,
but might be interesting for others). Like you say, we need pkg-config
both for target packages and host packages (+ possibly to run on the
target). We cannot just rely on pkg-config being available on the host,
as until very recently sysroot support was broken (and for some things,
like --variable it still is).

So we need to build it. For the 2 use cases we need:

- target: sysroot set to staging, look for .pc files in
  staging/usr/lib/pkgconfig

- host: no sysroot, look for .pc files in host/usr/lib/pkgconfig

We could build 2 different versions, but it's simpler to use the same
binary (faster to build, AUTOTARGETS can only build 1 host
version). This is not really a problem as you can set sysroot
(PKG_CONFIG_SYSROOT_DIR) and pkgconfig dir (PKG_CONFIG_LIBDIR) at
runtime through environment variable.

The situation before this commit was a bit of a mix. We configured
pkg-config with prefix=hosr/usr, but changed the default pkgconfig dir
to staging/usr/lib/pkconfig. This combination is not really useful as
you'll need to set environment variables for both use cases.

Now, the 2 usecases are imho not of the same importance. We build a lot
more packages for the target than for the host (the host ones are just
the ones needed to be able to build for the target), and people using
the buildroot toolchain outside BR are typically only interested in
building for the target - So I think it makes sense to optimize for this
usecase - Hence the change to use the staging sysroot by default.

So with this change pkg-config works for target packages without setting
any environment variables, which is bound to lead to less bugs (E.G. see
the recent change to dnsmasq.mk), and for host packages we have to pass
PKG_CONFIG_SYSROOT_DIR in addition to PKG_CONFIG_LIBDIR that we're
already passing.

-- 
Bye, Peter Korsgaard
