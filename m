From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 14:00:56 +0200
Subject: [Buildroot] pkg-golang: host package not supported
In-Reply-To: <CADHdJwDuaeDU_G0ePRPRrWw+3Vo4W0mSx45OuEDnqrgnsKgZQA@mail.gmail.com>
References: <CADHdJwDuaeDU_G0ePRPRrWw+3Vo4W0mSx45OuEDnqrgnsKgZQA@mail.gmail.com>
Message-ID: <20180810140056.5cf7d9ed@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mirza,

On Fri, 10 Aug 2018 13:34:06 +0200, Mirza Krak wrote:

> I have recently started doing some work with Buildroot and
> specifically I am building packages that are based on golang.
> 
> Build packages for "target" works just fine. But I noticed that the
> pkg-golang.mk [1] does not support "host" target yet [2] which is
> required for one my packages.
> 
> Buildroot is new to me but looking at pkg-golang.mk it does _not_ seem
> that a lot of needs to change to support "host" packages as well.
> 
> So two questions:
> - Any specific reason "host" target is not supported?

Because it wasn't needed until now.

> - Any hints on to add host-golang-package support?

The first question is whether the existing host-go package installs a
Go compiler that can do native compilation in addition to
cross-compilation.

If that is the case, then pkg-golang.mk can be extended a bit like
pkg-cmake.mk, with a host-golang-package macro, which expands to:

$(call inner-golang-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),host)

and then, in the inner-golang-package macro, do some ifeq
($(5),target) ... else ... endif to define the configure/build/install
commands differently depending on whether the package is a target
package or a host package. Again, see pkg-cmake.mk for an example.

Hope this helps!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
