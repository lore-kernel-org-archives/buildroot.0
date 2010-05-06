From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 May 2010 11:55:08 +0200
Subject: [Buildroot] [PATCH 2/3] libxcb: fix path to Python modules
In-Reply-To: <20100506111721.3a74f00a@surf> (Thomas Petazzoni's message of
	"Thu, 6 May 2010 11:17:21 +0200")
References: <cover.1273096504.git.thomas.petazzoni@free-electrons.com>
	<cover.1273096504.git.thomas.petazzoni@free-electrons.com>
	<ea5d9f4196b6fdcd1fc55428c058b1d83b430591.1273096504.git.thomas.petazzoni@free-electrons.com>
	<87vdb19zix.fsf@macbook.be.48ers.dk> <20100506111721.3a74f00a@surf>
Message-ID: <87mxwd9wxv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> On Thu, 06 May 2010 10:59:18 +0200
 Thomas> Peter Korsgaard <jacmet@uclibc.org> wrote:

 >> So we depend on python being available on the host?

 Thomas> Yes, we do.

 >> Shouldn't we just use the hostpython stuff we already have and E.G
 >> $(PYTHON_VERSION_MAJOR)?

 Thomas> Well, the hostpython stuff we already have only makes Python on the
 Thomas> host available to build Python on the target. It isn't a normal host
 Thomas> package in that it doesn't install anything in $(HOST_DIR). That could
 Thomas> be changed, of course.

Yes.

 Thomas> So, you think we should consider not Python as being a
 Thomas> mandatory system dependency, just as Perl is already ?

Not necessarily, but we should check for it (either in dependencies.sh
or in libxcb.mk if it is only needed there) so the user gets a sensible
error message if it isn't available.

 Thomas> I have no strong opinion on this, but Python is nowadays
 Thomas> installed on virtually every system, and rebuilding it from the
 Thomas> host will probably take quite some time.

Our Python stuff is quite weak, I could imagine that we might need a
specific version of host python to build other stuff in the future, but
that's not something we need to fix for 2010.05.

 >> Alternatively we should probably add a check in libxcb.mk and print an
 >> $(error if it isn't there.

 Thomas> Yes, we could do that as well.

 Thomas> The other ugly thing is that we are running a Python program on the
 Thomas> host, while using modules installed in
 Thomas> $(STAGING_DIR)/usr/lib/pythonX.Y/site-packages.

 Thomas> BTW, I have another question regarding dependencies. For the moment,
 Thomas> the X.org font packages do not build on a host were some X.org
 Thomas> utilities are not available (mkfontdir, mkfontscale, pdftopcf and so
 Thomas> on). I've fixed some of them already, but I'm now facing the problem of
 Thomas> xapp_bdftopcf, which needs to be built for the host. Unfortunately,
 Thomas> this tool depends on xlib_libXfont for the host, which itself would
 Thomas> depend on freetype xlib_libfontenc xlib_xtrans xproto_fontcacheproto
 Thomas> xproto_fontsproto xproto_xproto xfont_encodings.

 Thomas> Do we build all these things for the host ?

Argh. How many of these are we already building for a "normal" Xorg
build (E.G. probably most people use gtk as well) - freetype I guess
would be. The *proto packages are tiny, so they shouldn't be a
problem. That leaves the xlib_* stuff - Do you have any idea if they
take significant time to build?

-- 
Bye, Peter Korsgaard
