From: Trent Piepho <tpiepho@impinj.com>
Date: Thu, 1 Mar 2018 01:48:30 +0000
Subject: [Buildroot] [master,1/2] uboot: use local fdt headers
In-Reply-To: <20180219155632.30086-2-thomas.de_schampheleire@nokia.com>
References: <20180219155632.30086-2-thomas.de_schampheleire@nokia.com>
Message-ID: <1519868910.25567.259.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2018-02-19 at 16:56 +0100, Thomas De Schampheleire wrote:
> 
> On the expanded compiler command-line, Buildroot's '-I$(HOST_DIR)/include'
> is thus present _before_ any -I to local directories, and thus takes
> precedence.  And that becomes a problem for header files present both
> locally as in the Buildroot host directory, which is the case for libfdt.
> 
> To fix this problem without having to patch u-boot sources, use '-idirafter'
> rather than '-I' to pass the Buildroot host include directory. '-idirafter'
> is basically the same thing, but adds the specified directory at the end
> of the include precedence chain, rather than at the beginning.

This is breaking the build of uboot host tools for me.

My issue is that uboot's build of the host object rsa-sign.o is using
the system installed openssl header files.  One can verify this by
looking at the file build/uboot-<hash>/tools/lib/rsa/.rsa-sign.o.cmd,
which will have the auto-dependency info, and thus shows exactly what
header files were used to compile the object.

buildroot is also compiling host openssl, with headers and libraries in
the buildroot host output tree.  When uboot tries to link the host
programs, it uses the buildroot built openssl library (like it should),
but this doesn't match the headers.

It see the include dir order should be:
u-boot
buildroot host
host os

But this patch gives:
u-boot
host os
buildroot host

Like all "host system's headers" problems, if your host and buildroot
have nearly the same openssl version, or you have no openssl devel on
your host, then you wouldn't see this.

I think the real solution here is to get u-boot's build system to
support building with an external libfdt and do that.
