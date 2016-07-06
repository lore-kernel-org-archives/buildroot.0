From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 17:56:17 +0200
Subject: [Buildroot] Interesting circular dependency, how to solve?
Message-ID: <20160706175617.67b0e1ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Today, Paul (in Cc) reported on IRC an interesting problem: on a
configuration with systemd enabled (and acting as udev provider),
pciutils would fail to build due to libudev.h being missing.

After some investigation, "make graph-depends" revealed the origin of
the problem: a very interesting circular dependency. Here is what make
graph-depends thinks of the situation:

Recursion detected for  : systemd
which is a dependency of: udev
which is a dependency of: pciutils
which is a dependency of: linux
which is a dependency of: cryptodev-linux
which is a dependency of: openssl
which is a dependency of: libcurl
which is a dependency of: systemd

So, starting from the bottom:

 - When libcurl is enabled, systemd depends on it

 - When OpenSSL is enabled, obviously, libcurl will use it for SSL
   support

 - When cryptodev-linux is enabled, OpenSSL will depend on it to use
   crypto accelerators supported in the kernel via cryptodev-linux.

 - cryptodev-linux being a kernel module, it depends on linux

 - linux by itself (the kernel) does not depend on pciutils, but the
   linux tool "cpupower" (managed in linux-tool-cpupower) depends on
   pciutils

 - pciutils depends on udev when available

 - udev is provided by systemd.

So we have a dependency loop. This was not detected in the autobuilders
because it requires the linux package to be enabled to trigger.

I'm not sure where to break the dependency loop here. The real problem
is that cryptodev-linux does *NOT* require cpupower, it only needs the
kernel itself. Does this means that our current architecture for
packaging "tools" whose source code is part of the kernel as part of
the "linux" package is wrong ?

Do you have some suggestions or ideas on how to solve this ? The only
two solutions that I can find is:

 - Arbitrarily break this dependency loop by removing some
   functionality (but I'm not sure where)

 - Moving the cpupower build logic outside of the linux package.

The other question is how we can improve our autobuilder testing to
detect such situations.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
