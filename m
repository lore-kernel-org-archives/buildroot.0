From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Oct 2019 15:47:00 +0200
Subject: [Buildroot] [PATCH 2/3] pkgconf: Add pkgconf system lib and
 include path
In-Reply-To: <20191001124132.107700-2-thomas.preston@codethink.co.uk>
References: <20191001124132.107700-1-thomas.preston@codethink.co.uk>
 <20191001124132.107700-2-thomas.preston@codethink.co.uk>
Message-ID: <20191001154700.59312b4c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  1 Oct 2019 13:41:31 +0100
Thomas Preston <thomas.preston@codethink.co.uk> wrote:

> Buildroot does not reconfigure pkgconf system library and system include
> dirs to STAGING_DIR. This means that pkgconf prints the sysroot system
> library and system include dirs instead of letting the compiler handle
> the logical sysroot. This breaks the -isystem compiler flag, as it
> increases the priority of the system library and system include
> directories. For example:
> 
> 	$ output/host/bin/pkg-config --cflags glib-2.0
> 	-Ioutput/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0
> 	-Ioutput/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/lib/glib-2.0/include
> 	-Ioutput/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include
> 
> A header in `.../sysroot/usr/include` will be included before a header
> in any directory specified with -isystem flags. Specifically, this
> breaks the Chromium build system, which expects a C++ math.h in a
> bundled LLVM C++ library, and gets a GNU C math.h instead.
> 
> Fix this by telling pkgconf about the sysroot's system library and
> system include directories, so that it doesn't accidentally print them.
> 
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>

I am wondering if this would not solve
https://bugs.busybox.net/show_bug.cgi?id=11776 which is also related to
-isystem causing problems. I think
https://bugs.busybox.net/show_bug.cgi?id=12131 and
https://bugs.busybox.net/show_bug.cgi?id=12231 are the same issue.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
