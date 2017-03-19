From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 20:50:52 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-03-18
In-Reply-To: <6AAECB0035080A468CD3789966C9E874B280D849@WRMAIL01.wr.imgtec.org>
References: <20170319072840.640CD207D9@mail.free-electrons.com>
 <6AAECB0035080A468CD3789966C9E874B280D849@WRMAIL01.wr.imgtec.org>
Message-ID: <20170319205052.0730638d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Mar 2017 19:06:19 +0000, Marcin Nowakowski wrote:

> These failures are actually failures while building a host app in a
> target package ... but this isn't happening for any arch so I'm
> wondering if there are different host compiler variations across
> build machines?

I'm not sure what you mean by "this isn't happening for any arch". The
failure is while building something with the host compiler, so the
target architecture doesn't really matter.

> Unfortunately the flag that is causing the failure is checked for the
> target compiler only (and isn't really needed for the host anyway),
> so I'll prepare a patch that removes it from the host build as
> unnecessary, but the variations across build targets that don't
> depend on the target itself have surprised me

Indeed, the problem comes from the configure.ac script that tests if
the target compiler supports -fstack-protector-strong and if it does,
uses it in AM_CFLAGS. Unfortunately, this AM_CFLAGS also gets used when
building the host tool for the documentation.

Since anyway Buildroot will already be passing -fstack-protector in
CFLAGS if enabled in the Buildroot configuration, I believe a patch to
configure.ac to add a --enable/--disable option to enable/disable the
addition of -fstack-protector-strong would be nice.

Or alternatively: fix the real problem, and make sure it doesn't use
AM_CFLAGS for the host build.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
