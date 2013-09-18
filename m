From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 07:00:20 +0200
Subject: [Buildroot] [PATCH v2 13/17] audit: new package
In-Reply-To: <1378936777-28308-14-git-send-email-clshotwe@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378936777-28308-14-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20130918070020.22ff8ca9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 11 Sep 2013 16:59:33 -0500, Clayton Shotwell wrote:

> diff --git a/package/audit/audit-0001-crossCompileHeaderCreationFix.patch b/package/audit/audit-0001-crossCompileHeaderCreationFix.patch
> new file mode 100644
> index 0000000..11ab393
> --- /dev/null
> +++ b/package/audit/audit-0001-crossCompileHeaderCreationFix.patch
> @@ -0,0 +1,1420 @@
> +Rework the build system to generate the required header files using a 
> +Python script rather than compiling executables.  This change has
> +to be made because the executables that are generated are built for
> +the target architecture and are generally not compilable on the host
> +build machine.  
> +
> +Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>

In this patch for 'audit', you are replacing a nice C program by a
Python script, with the argument that it helps cross-compilation. I
must say I quite disagree with that: building a small C program for the
host has always been easier than programs that require executing a
Python script at build time.

Why not keeping the existing C program, and just adjust the way it is
built to get it built by the native compiler?

There is a fairly standardized way of doing that with the autotools,
that consists in using the CC_FOR_BUILD variable instead of CC to build
this tool. In native compilation, CC_FOR_BUILD == CC == gcc, while in
cross-compilation, CC_FOR_BUILD == gcc and CC == <arch-tuple>-gcc.

See http://www.sourceware.org/autobook/autobook/autobook_270.html.

There is apparently even an existing m4 macro to define CC_FOR_BUILD:
http://ac-archive.sourceforge.net/ac-archive/ac_prog_cc_for_build.html.

Or maybe the Python script approach is something that has been agreed
upon with the audit/SELinux community?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
