From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 23:35:28 +0100
Subject: [Buildroot] [PATCH v4] package/python-pillow: new package
In-Reply-To: <CA+TH9Vmri=sS5e0gacaoRMxwxNT_evmC9=-ERFvxS86H3NnpKQ@mail.gmail.com>
References: <1455962149-29459-1-git-send-email-angelo.compagnucci@gmail.com>
 <20160221152621.52c42acd@free-electrons.com>
 <CA+TH9Vmri=sS5e0gacaoRMxwxNT_evmC9=-ERFvxS86H3NnpKQ@mail.gmail.com>
Message-ID: <20160223233528.4016ea2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Feb 2016 23:18:47 +0100, Angelo Compagnucci wrote:

> Right.
> 
> I actually implemented something lie this in pkg-python.mk
> 
> [...]
> $(2)_BUILD_TARGET ?= build
> [...]
> $(2)_BASE_BUILD_TGT   = $$($(2)_BUILD_TARGET)
> [...]
> 
> and seems to work and not breaking other packages.
> This way I can add:
> 
> PYTHON_PILLOW_BUILD_TARGET = build_ext
> 
> What do you think?

Since it's the first package to require this, I would rather suggest to
override PYTHON_PILLOW_BUILD_CMDS in python-pillow.mk, so that this
hack is limited to this package.

Should more packages need this in the future, we can add better
support in the infrastructure.

But a Python package that needs to pass options only to build_ext is
IMO broken, and should allow them to be passed to the "build" target.
build_ext is more or less an internal step, which we shouldn't have to
worry about.


> >> +Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> >
> > Can you submit this patch upstream or at least report the issue?
> 
> I don't think so. That piece of code is used to guess the platform on
> which your are compiling with the assumption that host arch == target
> arch. Probably, pillow is not originally designed to be cross compiled
> and the build system would require a rewrite for a more structured
> approach.
> The only way to let buildroot passing the appropriate options to build
> and setup is to remove that piece of code.

Well, you can make it upstreamable by making it understand some
environment variable, or better some option, to indicate that we are
cross-compiling.

So yes, your patch is not acceptable upstream as is, but my comment is
precisely that is should ideally be in a form that can potentially be
accepted upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
