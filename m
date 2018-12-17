From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 17 Dec 2018 20:08:58 +0000
Subject: [Buildroot] [PATCH RESEND] core: enhance printvars for
 variables with newlines
In-Reply-To: <20181216161430.1752d2f0@windsurf.home>
References: <CAOJ2eMdEHvZeJ6rECyRkzMZN0UYJ2CYK4yMgR9d89P%2B-tWYJYw@mail.gmail.com>
 <20180416115855.26762-1-chemobejk@gmail.com>
 <fc8f1cc6-e9ba-9cfe-df4a-4b80792d6434@mind.be>
 <CAOJ2eMc+3Bx40nWF=VALh6JzeaNVWPekyCGXAL2=a_YX4yJWug@mail.gmail.com>
 <20181216145427.0274aed5@windsurf.home>
 <CAOJ2eMcWOj2gvGWHNoZm3ofz2O=LjGj7F02Gy73RyiYP7Pvcmg@mail.gmail.com>
 <20181216161430.1752d2f0@windsurf.home>
Message-ID: <1545077337.22930.33.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2018-12-16 at 16:14 +0100, Thomas Petazzoni wrote:
> 
> > Understandable from the PoV of monolithic meta build system advocates
> > like buildroot, yocto, Android, ...
> > 
> > As it became clear that this patch would not be accepted any time
> > soon, I reverted it and implemented a different approach based on
> > quoted var printout and sed post-processing. While not 100%
> > fool-proof, it does work for the few build variables that are required
> > for the modular build approach.
> 
> You did not answer my question: why didn't you use features of
> Buildroot such as "make <pkg>-build" or "make <pkg>-rebuild" ?

I am also using buildroot with modern style CI.  While I find <pkg>-
rebuild works great for manual developer workflow, there are issues
with CI integration.

In the CI system, we have many many git branches active at any time. 
They come and go frequently and don't start at the same branch point. 
There are also many build agents (themselves VMs) which perform the
actual build.

So say we have a new branch we wish to test.  The agent it is
dispatched to happens to have the output tree from the last successful
build on that agent (this is in itself very problematic!).  That last
build might be from anything in the git tree.  The head of a different
branch.  An ancestor commit but from months ago.  A commit from the
future w.r.t. the branch we are building now.

The chance of <pkg>-rebuild working correctly is quite small.  There
will undoubtedly be many other packages which have changed between the
last build on this agent and the once being attempted.

In addition to the above, preserving the build tree between jobs on a
agent ends up being a major obstacle in Bamboo.  Trying to archive and
restore the multi-gigabyte output is very slow.

And given two git hashes to a tree with a buildroot + br-extern, what
packages exactly must be rebuilt with <pkg>-rebuild to go from one hash
to the other?  This is also not so easy to find automatically.

So, my latest attempt to solve this problem - getting back quicker CI
feedback - was done another way.

What I do is build an SDK with buildroot.  This is part of a nightly
build process that also produces a firmware image and runs system tests
against real hardware, in addition to making an SDK.  Two SDKs in fact,
one for the real ARM target and another for an x86_64 target.

Each internal package has a CI job which fetches the latest SDK and
builds the package, pointing cmake or autoconf or whatever build system
the package uses at the SDK.  Since only the package is built, it can
produce feedback quickly.  The toolchain and libraries and so on is 
all from the SDK and so the same as in the actual buildroot build of
the entire firmware image.

The x86_64 SDK has the same package versions as the ARM firmware, made
via the same buildroot.  Because the target is x86_64, the binaries it
produces can be run locally on the x86_64 build agents.  I do this to
allow running the unit tests of a package quickly in CI, with needing
to use real hardware or qemu to run an ARM unit test suite.

I make a new package infra for our packages to try to handle them all
in a consistent way.  A complete .mk file for one might look like this:

TRANSPORT_PROXY_DEPENDENCIES = zeromq lttng-libust
$(eval $(impinj-cmake-package))

Given the SDK, there's really nothing else I need from buildroot, and
the above .mk file, to build this package in CI.
