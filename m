From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 18 Dec 2018 01:19:30 +0000
Subject: [Buildroot] [PATCH RESEND] core: enhance printvars for
 variables with newlines
In-Reply-To: <174226636.18960599.1545092646786.JavaMail.zimbra@datacom.com.br>
References: <CAOJ2eMdEHvZeJ6rECyRkzMZN0UYJ2CYK4yMgR9d89P%2B-tWYJYw@mail.gmail.com>
 <20180416115855.26762-1-chemobejk@gmail.com>
 <fc8f1cc6-e9ba-9cfe-df4a-4b80792d6434@mind.be>
 <CAOJ2eMc+3Bx40nWF=VALh6JzeaNVWPekyCGXAL2=a_YX4yJWug@mail.gmail.com>
 <20181216145427.0274aed5@windsurf.home>
 <CAOJ2eMcWOj2gvGWHNoZm3ofz2O=LjGj7F02Gy73RyiYP7Pvcmg@mail.gmail.com>
 <20181216161430.1752d2f0@windsurf.home>
 <1545077337.22930.33.camel@impinj.com>
 <174226636.18960599.1545092646786.JavaMail.zimbra@datacom.com.br>
Message-ID: <1545095970.22930.45.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2018-12-17 at 22:24 -0200, Carlos Santos wrote:
> > 
> > What I do is build an SDK with buildroot.  This is part of a nightly
> > build process that also produces a firmware image and runs system tests
> > against real hardware, in addition to making an SDK.  Two SDKs in fact,
> > one for the real ARM target and another for an x86_64 target.
> > 
> > Each internal package has a CI job which fetches the latest SDK and
> > builds the package, pointing cmake or autoconf or whatever build system
> > the package uses at the SDK.  Since only the package is built, it can
> > produce feedback quickly.  The toolchain and libraries and so on is
> > all from the SDK and so the same as in the actual buildroot build of
> > the entire firmware image.
> > 
> > The x86_64 SDK has the same package versions as the ARM firmware, made
> > via the same buildroot.  Because the target is x86_64, the binaries it
> > produces can be run locally on the x86_64 build agents.  I do this to
> > allow running the unit tests of a package quickly in CI, with needing
> > to use real hardware or qemu to run an ARM unit test suite.
> > 
> > I make a new package infra for our packages to try to handle them all
> > in a consistent way.  A complete .mk file for one might look like this:
> > 
> > TRANSPORT_PROXY_DEPENDENCIES = zeromq lttng-libust
> > $(eval $(impinj-cmake-package))
> > 
> > Given the SDK, there's really nothing else I need from buildroot, and
> > the above .mk file, to build this package in CI.
> 
> If you need an SDK perhaps you should try Yocto, which in its turn also
> has some drawbacks. We (DATACOM) attempted to use it years ago and gave
> up because the development process was too complicated and slow.

I'm familiar with yocto, but chose buildroot for similar reasons. 
Buildroot has an SDK feature and it works pretty well for what I want. 
It's not an alternative to using buildroot, where you make a binary
BSP, check it into a repository, and the forever use and patch the
binary BSP and never use buildroot again.  I am not a fan of that
design.

> The main drawback of an SDK is that as you integrate new packages and
> change the base system the SDK becomes outdated. It may work for a few
> packages but as we started adding modules (currently there are 295) it
> became impossible to build and publish new SDK versions at the same pace
> without going crazy updating our development environments every day.

The key here is that the SDK is created by buildroot from the very same
repository that creates the firmware.  If your buildroot build is up to
date, then your SDK is up to date too.

What the SDK really is, is a way to make binary artifact of an entire
buildroot build, then use that artifact to rebuild one single package
without rebuilding the rest of buildroot.
