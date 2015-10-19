From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 23:02:19 +0200
Subject: [Buildroot] [git commit] package/swupdate: add patch to fix build
	issue with some toolchains
Message-ID: <20151019210337.3699681DEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8cc6eeec5a665db5689083312beef14a9afbafa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some toolchains used in Buildroot (x86-64 and mips64) have a problem to compile
a set of object files into one object file as it is done for the
`builtin-target` declared in swupdate's Kbuild Makefile.build. This target
collects all object files from every subdirectory declared in `objs-dir` and
compiles them into a single object file named `build-in.o` using the linker ld.

For the addressed toolchains the default emulation of ld is not the correct one
leading to different kind of relocation errors:

  /usr/bin/i686-pc-linux-gnu-ld: Relocatable linking with relocations from
  format elf64-x86-64 (core/swupdate.o) to format elf32-i386 (core/built-in.o)
  is not supported.

or

  /usr/bin/mips-linux-gnu-ld: handlers/raw_handler.o: endianness incompatible
  with that of the selected emulation

or

  /usr/bin/mips64el-linux-ld: core/swupdate.o: ABI is incompatible with that
  of the selected

As there is no need to have single object file `built-in.o` to be compiled for
the subdirectories core and handlers we can easily allow swupdate to be built
with these toolchains by compiling the source files from core and handlers with
the `lib-target` target by assigning them to the `libs-y` variable as it is done
for all other subdirectories. The `lib-target` compiles a set of object files
into one archive file. With this target we avoid using the ld linker and use the
ar archiver instead.

Add a patch from upstream to fix a whole bunch of autobuild errors.

Fixes:
http://autobuild.buildroot.net/results/de9/de920298075d32f3de83a0cfb7417846eb833425/
http://autobuild.buildroot.net/results/975/975915aa33005806e78260bae385cd4b3e359ca8/
http://autobuild.buildroot.net/results/c54/c54e7a2ea353d95d41a1e966de0dffa7b6ac432e/
http://autobuild.buildroot.net/results/019/0198596ebfed05ab86552b628da2274d55bf42ae/

and many more.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swupdate/swupdate.hash |    1 +
 package/swupdate/swupdate.mk   |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 6d69d66..057cf84 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	1410f8967aad0f4d3b4561110dbfb2c1f8e337bdc332f6b120f4995762c8bf6b  swupdate-2015.07.tar.gz
+sha256	ec633171e6a893506fad6b96fb2b258d60a023c03be5520b968a1d5cc6bafe6e  c3467290925b2a833a68d9db12c198fdca752e32.patch
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 9338fc8..8a20193 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -8,6 +8,7 @@ SWUPDATE_VERSION = 2015.07
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
 SWUPDATE_LICENSE_FILES = COPYING
+SWUPDATE_PATCH = https://github.com/sbabic/swupdate/commit/c3467290925b2a833a68d9db12c198fdca752e32.patch
 
 # swupdate bundles its own version of mongoose (version 3.8) and
 # lsqlite3 (version 0.8)
