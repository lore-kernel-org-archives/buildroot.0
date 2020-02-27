From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu, 27 Feb 2020 14:15:05 -0600
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: add PPC64BE ELFv2
 support
Message-ID: <20200227201505.8109-1-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vincent Fazio <vfazio@gmail.com>

musl libc uses ELFv2 by default for all PPC64 targets.

Now, OpenSSL libraries built with musl targeting PPC64BE should build
and function as expected.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 ...Fv2-ABI-on-some-ppc64-big-endian-sys.patch | 35 +++++++++++
 ...m-ppc-xlate.pl-add-linux64v2-flavour.patch | 63 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
 create mode 100644 package/libopenssl/0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch

diff --git a/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
new file mode 100644
index 0000000000..3d6eaf49d2
--- /dev/null
+++ b/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -0,0 +1,35 @@
+From b57cc2e4ee21babacbffc243626de72c248068ea Mon Sep 17 00:00:00 2001
+From: Andy Polyakov <appro@openssl.org>
+Date: Sun, 5 May 2019 18:30:55 +0200
+Subject: [PATCH] Configure: use ELFv2 ABI on some ppc64 big endian systems
+
+If _CALL_ELF is defined to be 2, it's an ELFv2 system.
+Conditionally switch to the v2 perlasm scheme.
+
+Reviewed-by: Paul Dale <paul.dale@oracle.com>
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/8883)
+[vfazio: fixup for 1.1.1d]
+Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
+---
+ Configure | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Configure b/Configure
+index 5a699836f3..f9152b1702 100755
+--- a/Configure
++++ b/Configure
+@@ -1413,6 +1413,10 @@ my %predefined_CXX = $config{CXX}
+     ? compiler_predefined($config{CROSS_COMPILE}.$config{CXX})
+     : ();
+ 
++if ($target eq "linux-ppc64" && !$disabled{asm}) {
++       $target{perlasm_scheme} = "linux64v2" if ($predefined_C{_CALL_ELF} == 2);
++}
++
+ # Check for makedepend capabilities.
+ if (!$disabled{makedepend}) {
+     if ($config{target} =~ /^(VC|vms)-/) {
+-- 
+2.25.0
+
diff --git a/package/libopenssl/0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch b/package/libopenssl/0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch
new file mode 100644
index 0000000000..26c31ab521
--- /dev/null
+++ b/package/libopenssl/0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch
@@ -0,0 +1,63 @@
+From 07a0bbdd179a52907485fd793f0df31c097447af Mon Sep 17 00:00:00 2001
+From: Andy Polyakov <appro@openssl.org>
+Date: Sun, 5 May 2019 18:25:50 +0200
+Subject: [PATCH] crypto/perlasm/ppc-xlate.pl: add linux64v2 flavour
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This is a big endian ELFv2 configuration. ELFv2 was already being
+used for little endian, and big endian was traditionally ELFv1
+but there are practical configurations that use ELFv2 with big
+endian nowadays (Ad?lie Linux, Void Linux, possibly Gentoo, etc.)
+
+Reviewed-by: Paul Dale <paul.dale@oracle.com>
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/8883)
+---
+ crypto/perlasm/ppc-xlate.pl | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/crypto/perlasm/ppc-xlate.pl b/crypto/perlasm/ppc-xlate.pl
+index d220c6245b..eec82b8d48 100755
+--- a/crypto/perlasm/ppc-xlate.pl
++++ b/crypto/perlasm/ppc-xlate.pl
+@@ -49,7 +49,7 @@ my $globl = sub {
+ 	/osx/		&& do { $name = "_$name";
+ 				last;
+ 			      };
+-	/linux.*(32|64le)/
++	/linux.*(32|64(le|v2))/
+ 			&& do {	$ret .= ".globl	$name";
+ 				if (!$$type) {
+ 				    $ret .= "\n.type	$name,\@function";
+@@ -80,7 +80,7 @@ my $globl = sub {
+ };
+ my $text = sub {
+     my $ret = ($flavour =~ /aix/) ? ".csect\t.text[PR],7" : ".text";
+-    $ret = ".abiversion	2\n".$ret	if ($flavour =~ /linux.*64le/);
++    $ret = ".abiversion	2\n".$ret	if ($flavour =~ /linux.*64(le|v2)/);
+     $ret;
+ };
+ my $machine = sub {
+@@ -186,7 +186,7 @@ my $vmr = sub {
+ 
+ # Some ABIs specify vrsave, special-purpose register #256, as reserved
+ # for system use.
+-my $no_vrsave = ($flavour =~ /aix|linux64le/);
++my $no_vrsave = ($flavour =~ /aix|linux64(le|v2)/);
+ my $mtspr = sub {
+     my ($f,$idx,$ra) = @_;
+     if ($idx == 256 && $no_vrsave) {
+@@ -318,7 +318,7 @@ while($line=<>) {
+ 	if ($label) {
+ 	    my $xlated = ($GLOBALS{$label} or $label);
+ 	    print "$xlated:";
+-	    if ($flavour =~ /linux.*64le/) {
++	    if ($flavour =~ /linux.*64(le|v2)/) {
+ 		if ($TYPES{$label} =~ /function/) {
+ 		    printf "\n.localentry	%s,0\n",$xlated;
+ 		}
+-- 
+2.25.0
+
-- 
2.25.1
