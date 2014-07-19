From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Jul 2014 16:16:48 +0200
Subject: [Buildroot] [PATCH] perl-gd: fix broken patches
Message-ID: <1405779408-29494-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

in each patch, the 3 trailing lines are lost

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-gd/perl-gd-01-getoptions.patch | 3 +++
 package/perl-gd/perl-gd-02-lgd.patch        | 3 +++
 package/perl-gd/perl-gd-03-force.patch      | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/package/perl-gd/perl-gd-01-getoptions.patch b/package/perl-gd/perl-gd-01-getoptions.patch
index 7bd7f4f..74f055b 100644
--- a/package/perl-gd/perl-gd-01-getoptions.patch
+++ b/package/perl-gd/perl-gd-01-getoptions.patch
@@ -38,3 +38,6 @@
 -			"lib_xpm_path=s"  => \$lib_xpm_path,
 -			"lib_zlib_path=s" => \$lib_zlib_path,
 -		       );
+ unless ($result) {
+   print STDERR <<END;
+ Usage: perl Makefile.PL [options]
diff --git a/package/perl-gd/perl-gd-02-lgd.patch b/package/perl-gd/perl-gd-02-lgd.patch
index bc6cdfc..4a69c2a 100644
--- a/package/perl-gd/perl-gd-02-lgd.patch
+++ b/package/perl-gd/perl-gd-02-lgd.patch
@@ -23,3 +23,6 @@
    @$LIBS         = split /\s+/,$libs;
  
 -  push @$LIBS,"-lgd";
+   push @$LIBPATH,"-L$libdir";
+   ($$lib_gd_path = $libdir) =~ s!/[^/]+$!!;
+   $$options      = $features;
diff --git a/package/perl-gd/perl-gd-03-force.patch b/package/perl-gd/perl-gd-03-force.patch
index 3524865..0a121a9 100644
--- a/package/perl-gd/perl-gd-03-force.patch
+++ b/package/perl-gd/perl-gd-03-force.patch
@@ -27,3 +27,6 @@
 +    my @libs64 = map {my $a = $_; $a=~ s/lib$/lib64/; $a} @LIBPATH;
 +    @LIBPATH = (@LIBPATH,@libs64);
 +  }
+ }
+ 
+ #############################################################################################
-- 
1.9.1
