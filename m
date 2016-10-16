From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 12:09:49 +0200
Subject: [Buildroot] [git commit] dependencies: check for Math BigInt/BigRat
	Perl module
Message-ID: <20161016101033.7F0F18004B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2c70577ceb5c4c5812a096274efee953ab03b0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As for MakeMaker Perl module, add a check for Math BigInt/BigRat Perl
Core module, which are needed by mpv.

Fixes:
Waf: Entering directory `output/build/mpv-0.17.0/build'
[  1/198] Compiling version.sh
[ 12/198] Processing ebml_types.h: demux/ebml.c demux/demux_mkv.c -> build/ebml_types.h
[ 13/198] Compiling demux/ebml.c
Can't locate Math/BigRat.pm in @INC (you may need to install the Math::BigRat module)

Waf: Entering directory `output/build/mpv-0.17.0/build'
[  1/198] Compiling version.sh
[  2/198] Compiling TOOLS/osxbundle/mpv.app/Contents/Resources/icon.icns
[  3/198] Compiling video/out/x11_icon.bin
[  4/198] Compiling etc/input.conf
[  5/198] Compiling sub/osd_font.otf
[  6/198] Compiling video/out/opengl/nnedi3_weights.bin
[  7/198] Compiling player/lua/defaults.lua
[  8/198] Compiling player/lua/assdraw.lua
[  9/198] Compiling player/lua/options.lua
[ 10/198] Compiling player/lua/osc.lua
[ 11/198] Compiling player/lua/ytdl_hook.lua
[ 12/198] Processing ebml_types.h: demux/ebml.c demux/demux_mkv.c -> build/ebml_types.h
[ 13/198] Compiling demux/ebml.c
[ 14/198] Compiling DOCS/man/mpv.rst
Can't locate Math/BigInt.pm in @INC (you may need to install the Math::BigInt module)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fran??ois Perrad <francois.perrad@gadz.org>
[Thomas et al.: make those perl modules only required when mpv is enabled.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 5832cf3..e632a14 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -241,6 +241,11 @@ required_perl_modules="Data::Dumper" # Needed to build host-autoconf
 required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by host-libxml-parser-perl
 required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
 
+if grep -q ^BR2_PACKAGE_MPV=y $BR2_CONFIG ; then
+    required_perl_modules="$required_perl_modules Math::BigInt"
+    required_perl_modules="$required_perl_modules Math::BigRat"
+fi
+
 # This variable will keep the modules that are missing in your system.
 missing_perl_modules=""
 
