From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Dec 2012 18:32:20 +0100
Subject: [Buildroot] [PATCH v3] usbip: new package
In-Reply-To: <defa5c66-81f8-43bf-b529-5d890db965d4@zimbra2.corp.accelance.fr>
References: <20121226163521.GL11946@sapphire.tkos.co.il>
 <defa5c66-81f8-43bf-b529-5d890db965d4@zimbra2.corp.accelance.fr>
Message-ID: <20121226183220.2cf4b9c7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

On Wed, 26 Dec 2012 17:49:57 +0100 (CET), Jeremy Rosen wrote:

> I would be interested too, more and more tools are distributed with
> the kernel that we might want to build... I'm thinking of the perf
> tools in particular
> 
> is there an example somewhere on how to handle these ?

Unfortunately, there isn't a really good and nice way of handling these
in Buildroot for now.

I see two options:

 * Add sub-options to the "Linux kernel" package, to allow the
   installation of perf, usbip or other userspace packages whose source
   code is bundled with the kernel source code. This is the easiest
   solution, since the kernel version, sources and al. is already
   defined. But it also has major drawbacks: 1/ it makes those tools
   available only if you build your kernel with Buildroot and 2/ it
   puts the configuration options to install those tools inside the
   "Linux kernel" menu, which is not very intuitive.

 * Add separate packages for each of those tools in package/, with
   those packages depending on the "linux" package. The extract step of
   those packages could copy the source code of these tools from the
   Linux kernel source tree into their build directory, or simply build
   then directly from within the Linux kernel source tree. It solves
   drawback (2) described above, but not drawback (1).

 * Add separate packages for each of those tools in package/, and make
   them independent from the Linux package. They would for example
   download the latest stable version of the Linux kernel source code,
   and use that as a source. The extract step could be customized to
   only extract the part of the kernel sources that are actually
   relevant for this package. This would solve both drawbacks (1) and
   (2), but adds different drawbacks: it's another place where we have
   to bump the kernel version regularly, and people may want to
   configure the version of the kernel sources used to build those
   tools: the primary reason why those tools are bundled with the
   kernel sources is because the userspace-to-kernel ABI specific to
   those tools gets changed from time to time, and therefore there may
   be compatibility issues in running those tools from kernel version X
   under a system running kernel version Y.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
