From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 May 2010 11:17:21 +0200
Subject: [Buildroot] [PATCH 2/3] libxcb: fix path to Python modules
In-Reply-To: <87vdb19zix.fsf@macbook.be.48ers.dk>
References: <cover.1273096504.git.thomas.petazzoni@free-electrons.com>
	<cover.1273096504.git.thomas.petazzoni@free-electrons.com>
	<ea5d9f4196b6fdcd1fc55428c058b1d83b430591.1273096504.git.thomas.petazzoni@free-electrons.com>
	<87vdb19zix.fsf@macbook.be.48ers.dk>
Message-ID: <20100506111721.3a74f00a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 06 May 2010 10:59:18 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> So we depend on python being available on the host?

Yes, we do.

> Shouldn't we just use the hostpython stuff we already have and E.G
> $(PYTHON_VERSION_MAJOR)?

Well, the hostpython stuff we already have only makes Python on the
host available to build Python on the target. It isn't a normal host
package in that it doesn't install anything in $(HOST_DIR). That could
be changed, of course.

So, you think we should consider not Python as being a mandatory system
dependency, just as Perl is already ?

I have no strong opinion on this, but Python is nowadays installed on
virtually every system, and rebuilding it from the host will probably
take quite some time.

> Alternatively we should probably add a check in libxcb.mk and print an
> $(error if it isn't there.

Yes, we could do that as well.

The other ugly thing is that we are running a Python program on the
host, while using modules installed in
$(STAGING_DIR)/usr/lib/pythonX.Y/site-packages.

BTW, I have another question regarding dependencies. For the moment,
the X.org font packages do not build on a host were some X.org
utilities are not available (mkfontdir, mkfontscale, pdftopcf and so
on). I've fixed some of them already, but I'm now facing the problem of
xapp_bdftopcf, which needs to be built for the host. Unfortunately,
this tool depends on xlib_libXfont for the host, which itself would
depend on freetype xlib_libfontenc xlib_xtrans xproto_fontcacheproto
xproto_fontsproto xproto_xproto xfont_encodings.

Do we build all these things for the host ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
