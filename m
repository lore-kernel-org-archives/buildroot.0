From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 15:51:33 +0200
Subject: [Buildroot] [git commit] intltool: add patch to fix compatibility
	with Perl 5.26
Message-ID: <20170611135158.22BB17FD33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9426d7edf0702d6ce46db45943ae9023a60cc1be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When Perl 5.26 is installed on the host, building some packages like
avahi fail, because of intltool-update:

```
Unescaped left brace in regex is illegal here in regex; marked by <-- HERE in m/^(.*)\${ <-- HERE ?([A-Z_]+)}?(.*)$/ at $BUILDROOT/host/usr/bin/intltool-update line 1065.
```

Apparently, this has been a warning before Perl 5.26, but now it is an
error.

Fetch from:
https://github.com/Alexpux/MSYS2-packages/blob/master/intltool/perl-5.22-compatibility.patch

Reported upstream:
https://bugs.launchpad.net/intltool/+bug/1696658

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../intltool/0001-perl-5.26-compatibility.patch    | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/intltool/0001-perl-5.26-compatibility.patch b/package/intltool/0001-perl-5.26-compatibility.patch
new file mode 100644
index 0000000..a2a7aef
--- /dev/null
+++ b/package/intltool/0001-perl-5.26-compatibility.patch
@@ -0,0 +1,55 @@
+Fix regex errors thrown by Perl 5.26:
+
+Unescaped left brace in regex is illegal here in regex; marked by <-- HERE in m/^(.*)\${ <-- HERE ?([A-Z_]+)}?(.*)$/ at $BUILDROOT/host/usr/bin/intltool-update line 1065.
+
+Fetched from:
+https://github.com/Alexpux/MSYS2-packages/blob/master/intltool/perl-5.22-compatibility.patch
+
+Reported upstream:
+https://bugs.launchpad.net/intltool/+bug/1696658
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+
+--- intltool-0.51.0.orig/intltool-update.in	2015-03-09 02:39:54.000000000 +0100
++++ intltool-0.51.0.orig/intltool-update.in	2015-06-19 01:52:07.171228154 +0200
+@@ -1062,7 +1062,7 @@ 
+ 	}
+     }
+ 
+-    if ($str =~ /^(.*)\${?([A-Z_]+)}?(.*)$/)
++    if ($str =~ /^(.*)\$\{?([A-Z_]+)}?(.*)$/)
+     {
+ 	my $rest = $3;
+ 	my $untouched = $1;
+@@ -1190,10 +1190,10 @@ 
+ 	$name    =~ s/\(+$//g;
+ 	$version =~ s/\(+$//g;
+ 
+-	$varhash{"PACKAGE_NAME"} = $name if (not $name =~ /\${?AC_PACKAGE_NAME}?/);
+-	$varhash{"PACKAGE"} = $name if (not $name =~ /\${?PACKAGE}?/);
+-	$varhash{"PACKAGE_VERSION"} = $version if (not $name =~ /\${?AC_PACKAGE_VERSION}?/);
+-	$varhash{"VERSION"} = $version if (not $name =~ /\${?VERSION}?/);
++	$varhash{"PACKAGE_NAME"} = $name if (not $name =~ /\$\{?AC_PACKAGE_NAME}?/);
++	$varhash{"PACKAGE"} = $name if (not $name =~ /\$\{?PACKAGE}?/);
++	$varhash{"PACKAGE_VERSION"} = $version if (not $name =~ /\$\{?AC_PACKAGE_VERSION}?/);
++	$varhash{"VERSION"} = $version if (not $name =~ /\$\{?VERSION}?/);
+     }
+ 
+     if ($conf_source =~ /^AC_INIT\(([^,\)]+),([^,\)]+)[,]?([^,\)]+)?/m)
+@@ -1219,11 +1219,11 @@ 
+ 	$version =~ s/\(+$//g;
+         $bugurl  =~ s/\(+$//g if (defined $bugurl);
+ 
+-	$varhash{"PACKAGE_NAME"} = $name if (not $name =~ /\${?AC_PACKAGE_NAME}?/);
+-	$varhash{"PACKAGE"} = $name if (not $name =~ /\${?PACKAGE}?/);
+-	$varhash{"PACKAGE_VERSION"} = $version if (not $name =~ /\${?AC_PACKAGE_VERSION}?/);
+-	$varhash{"VERSION"} = $version if (not $name =~ /\${?VERSION}?/);
+-        $varhash{"PACKAGE_BUGREPORT"} = $bugurl if (defined $bugurl and not $bugurl =~ /\${?\w+}?/);
++	$varhash{"PACKAGE_NAME"} = $name if (not $name =~ /\$\{?AC_PACKAGE_NAME}?/);
++	$varhash{"PACKAGE"} = $name if (not $name =~ /\$\{?PACKAGE}?/);
++	$varhash{"PACKAGE_VERSION"} = $version if (not $name =~ /\$\{?AC_PACKAGE_VERSION}?/);
++	$varhash{"VERSION"} = $version if (not $name =~ /\$\{?VERSION}?/);
++        $varhash{"PACKAGE_BUGREPORT"} = $bugurl if (defined $bugurl and not $bugurl =~ /\$\{?\w+}?/);
+     }
+ 
+     # \s makes this not work, why?
