From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 13 Jul 2014 20:45:57 +0200
Subject: [Buildroot] [PATCH 0/3] toolchain: Add support for Sourcery
	Codebench Standard
Message-ID: <1405277160-4686-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The purpose of this series is to provide support for Sourcery Codebench
Standard (licenced) edition in Buildroot.

Since these toolchain can't be downloaded, we need to use the custom toolchain
backend to import them into Buildroot.

In Toolchain menu, select:
  Toolchain type (External toolchain)
  Toolchain (Custom toolchain)
  Toolchain origin (Pre-installed toolchain)

Then set all toolchain settings (kernel headers, libc, rpc, c++ etc...)

I'm using the Sourcery Codebench 2014.05 for IA32 GNU/Linux, here is the
settings:

(i686-pc-linux-gnu) Toolchain prefix
  External toolchain kernel headers series (3.13.x)
  External toolchain C library (glibc/eglibc)
[*] Toolchain has RPC support
[*] Toolchain has C++ support?
(-pipe -msgxx-glibc) Target Optimizations

The "-msgxx-glibc" flag in "Target Optimizations" is mandatory otherwise the
toolchain won't work.

The toolchain-external infra need to be modified to handle a special case where
all the libraries and headers are in the arch sysroot (sgxx-glibc).

Romain Naour (3):
  toolchain-external: handle a special case where kernel headers check
    needs TOOLCHAIN_EXTERNAL_CFLAGS
  toolchain-external: handle a special case where glibc check needs
    TOOLCHAIN_EXTERNAL_CFLAGS
  toolchain-external: fix Sourcery Codebench symlink

 toolchain/toolchain-external/toolchain-external.mk | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

-- 
1.9.3
