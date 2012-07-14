From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 01:13:30 +0200
Subject: [Buildroot] [PATCH v2] pkg-infra: make sure cross compiling is
 enabled when host == target
In-Reply-To: <1342301006-3761-1-git-send-email-arnout@mind.be>
References: <20120713225522.62040e4f@skate>
 <1342301006-3761-1-git-send-email-arnout@mind.be>
Message-ID: <20120715011330.7b329324@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 14 Jul 2012 23:23:26 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> When compiling for the same architecture and libc as the host,
> GNU_TARGET_NAME and GNU_HOST_NAME are equal.  configure scripts use
> these to detect cross-compilation, and will decide that we're doing
> native compilation.  This may trigger running of executables,
> which fail because of missing libraries in the host environment.
> 
> To solve this, set the vendor part in GNU_HOST_NAME to buildroot.
> 
> This problem exists for instance in xserver_xorg-server on x86_64.

Hum, after thinking a bit more about this, why would we change
GNU_HOST_NAME? It sounds strange to include "buildroot" in the name of
the build machine tuple. Adding it to the target machine tuple would
seem much more appropriate, no?

I.e:

GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)

changed to:

GNU_TARGET_NAME=$(ARCH)-buildroot-linux-$(LIBC)$(ABI)

No?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
