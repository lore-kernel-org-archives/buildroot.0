From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Aug 2016 16:13:56 +0200
Subject: [Buildroot] [git commit] package/fbterm: fix C++11 compliance with
	gcc-6
Message-ID: <20160814141408.0029581D72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbe01f67560945606bab8c2185c002ec8a171983
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc-6 has enabled more warnings by default, and turned some existing
warnings into errors.

Fixes (all on arc or arm):
    http://autobuild.buildroot.org/results/8c4/8c4a6cf492bccf4e1b99897bd9658e21b89b31ab/
    http://autobuild.buildroot.org/results/875/875a9deb15d47d348bb53dafdbb7ed2f2bbd3da8/
    http://autobuild.buildroot.org/results/af4/af4935f0ad2054b7dc2443e2d126fe8e50996f66/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fbterm/0003-C++11-compliance.patch | 93 ++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/package/fbterm/0003-C++11-compliance.patch b/package/fbterm/0003-C++11-compliance.patch
new file mode 100644
index 0000000..1a06da3
--- /dev/null
+++ b/package/fbterm/0003-C++11-compliance.patch
@@ -0,0 +1,93 @@
+lib/vterm_states: fix C++11 compliance
+
+In C++11, narrowing a type is no longer allowed in structure
+initializers:
+
+    struct foo { u16 u; };
+    foo f[] = { {0}, {-1} };
+
+results in the gcc-6 to whine out loudly, and fail:
+
+    error: narrowing conversion of ???-1??? from ???int??? to ???u16 {aka short unsigned int}??? inside { } [-Wnarrowing]
+     };
+     ^
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN fbterm-1.7.0.orig/src/lib/vterm_states.cpp fbterm-1.7.0/src/lib/vterm_states.cpp
+--- fbterm-1.7.0.orig/src/lib/vterm_states.cpp	2010-10-06 06:23:08.000000000 +0200
++++ fbterm-1.7.0/src/lib/vterm_states.cpp	2016-08-13 16:54:29.495451127 +0200
+@@ -22,6 +22,7 @@
+ #include "vterm.h"
+ 
+ #define ADDSAME(len) ((len) << 8)
++#define ENDSEQ  { ((u16)-1) }
+ 
+ const VTerm::Sequence VTerm::control_sequences[] = {
+ 	{ 0,	0,	ESkeep },
+@@ -39,14 +40,14 @@
+ 	{ 0x1B, 0,	ESesc },
+ 	{ 0x7F, 0,	ESkeep },
+ 	{ 0x9B, 0,	ESsquare },
+-	{ -1}
++	ENDSEQ
+ };
+ 
+ const VTerm::Sequence VTerm::escape_sequences[] = {
+ 	{   0, 0, ESnormal },
+ 
+ 	// ESnormal
+-	{ -1 },
++	ENDSEQ,
+ 
+ 	// ESesc
+ 	{ '[', &VTerm::clear_param,	ESsquare },
+@@ -65,7 +66,7 @@
+ 	{ '8', &VTerm::restore_cursor,	ESnormal },
+ 	{ '>', &VTerm::keypad_numeric,	ESnormal },
+ 	{ '=', &VTerm::keypad_application,	ESnormal },
+-	{ -1 },
++	ENDSEQ,
+ 
+ 	// ESsquare
+ 	{ '[', 0,	ESfunckey },
+@@ -104,7 +105,7 @@
+ 	{ '`', &VTerm::cursor_position_col,	ESnormal },
+ 	{ ']', &VTerm::linux_specific, ESnormal },
+ 	{ '}', &VTerm::fbterm_specific, ESnormal },
+-	{ -1 },
++	ENDSEQ,
+ 
+ 	// ESnonstd
+ 	{ '0' | ADDSAME(9), &VTerm::set_palette,    ESkeep },
+@@ -112,25 +113,25 @@
+ 	{ 'a' | ADDSAME(5), &VTerm::set_palette,    ESkeep },
+ 	{ 'P', &VTerm::begin_set_palette, ESkeep },
+ 	{ 'R', &VTerm::reset_palette, ESnormal },
+-	{ -1 },
++	ENDSEQ,
+ 
+ 	// ESpercent
+ 	{ '@', &VTerm::clear_utf8,	ESnormal },
+ 	{ 'G', &VTerm::set_utf8,	ESnormal },
+ 	{ '8', &VTerm::set_utf8,	ESnormal },
+-	{ -1 },
++	ENDSEQ,
+ 
+ 	// EScharset
+ 	{ '0', &VTerm::set_charset, ESnormal },
+ 	{ 'B', &VTerm::set_charset, ESnormal },
+ 	{ 'U', &VTerm::set_charset, ESnormal },
+ 	{ 'K', &VTerm::set_charset, ESnormal },
+-	{ -1 },
++	ENDSEQ,
+ 
+ 	// EShash
+ 	{ '8', &VTerm::screen_align,	ESnormal },
+-	{ -1 },
++	ENDSEQ,
+ 
+ 	// ESfunckey
+-	{ -1 },
++	ENDSEQ,
+ };
