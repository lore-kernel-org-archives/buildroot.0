From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  8 Jun 2017 09:03:44 +0200
Subject: [Buildroot] [PATCH] intltool: add patch to fix compatibility with
	Perl 5.26
Message-ID: <20170608070344.30718-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../intltool/0001-perl-5.26-compatibility.patch    | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/intltool/0001-perl-5.26-compatibility.patch

diff --git a/package/intltool/0001-perl-5.26-compatibility.patch b/package/intltool/0001-perl-5.26-compatibility.patch
new file mode 100644
index 0000000000..ab39d46821
--- /dev/null
+++ b/package/intltool/0001-perl-5.26-compatibility.patch
@@ -0,0 +1,53 @@
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
\ No newline@end of file
-- 
2.13.1
