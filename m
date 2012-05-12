From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 May 2012 21:07:55 +0200
Subject: [Buildroot] [PATCH] gnutls: Fix search path for libgcrypt
In-Reply-To: <1336847275-21899-1-git-send-email-arnout@mind.be>
References: <1336847275-21899-1-git-send-email-arnout@mind.be>
Message-ID: <20120512210755.672039a4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sat, 12 May 2012 20:27:55 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> In some configurations, the --with-libgcrypt-prefix configure option
> causes the default library search path to be disabled completely,
> so the compiler can't find libc etc.
> 
> Fixes http://autobuild.buildroot.net/results/52a227e8a8723b7914a37d9b3519da5fd2a2844a/
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Are you sure it fixes the problem?

Last WE, I started investigating the problem, and found out that just
compiling gnutls wasn't enough to reproduce the problem. The problem
was starting to occur when libintl was built before libgcrypt. In this
case, libgcrypt.la had -lintl in its dependencies, and in turn,
libintl.la had -lc in its dependencies. Then, libtool expands this -lc
into the full path to libc.so.

However, libc.so is a linker script which contains a reference
to /lib/libc.so.0. And unfortunately, there is a binutils bug that
makes it behave differently:

 * If a linker script is referenced using -lc, then it correctly
   prepends the paths in the linker script by the sysroot path;

 * If a linker script is referenced using its full path (as is done by
   libtool), then binutils do not prepend the paths in the linker
   script by the sysroot path, which leads the gnutls ./configure to
   try to link against /lib/libc.so.0, which obviously doesn't exist.

Gustavo has patches for binutils that solve this bug, but the problem
remains for external toolchains. I am not sure how to fix the problem
properly.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
