From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 13 May 2014 22:35:13 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: Remove ldconfig calls
Message-ID: <1400013313-2281-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ldconfig breaks links created by gpu-viv-bin-mx6q.

fixes
http://autobuild.buildroot.net/results/ab5/ab57dd3729d529366808cbfc802f49360b2ec2b9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/netsnmp/netsnmp-002-no_ldconfig.patch |   50 +++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/netsnmp/netsnmp-002-no_ldconfig.patch

diff --git a/package/netsnmp/netsnmp-002-no_ldconfig.patch b/package/netsnmp/netsnmp-002-no_ldconfig.patch
new file mode 100644
index 0000000..10f33d8
--- /dev/null
+++ b/package/netsnmp/netsnmp-002-no_ldconfig.patch
@@ -0,0 +1,50 @@
+Running ldconfig breaks links created by gpu-viv-bin-mx6q
+
+patch inspired by
+https://dev.openwrt.org/browser/packages/libs/net-snmp/patches/160-no_ldconfig.patch?rev=17091
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr net-snmp-5.7.2.1.org/configure net-snmp-5.7.2.1/configure
+--- net-snmp-5.7.2.1.org/configure	2014-02-20 01:36:50.000000000 +0100
++++ net-snmp-5.7.2.1/configure	2014-05-13 22:26:31.239549325 +0200
+@@ -13873,7 +13873,6 @@
+   need_version=no
+   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
+   soname_spec='${libname}${release}${shared_ext}$major'
+-  finish_cmds='PATH="\$PATH:/sbin" ldconfig $libdir'
+   shlibpath_var=LD_LIBRARY_PATH
+   sys_lib_search_path_spec="/shlib /usr/lib /usr/X11/lib /usr/contrib/lib /lib /usr/local/lib"
+   sys_lib_dlsearch_path_spec="/shlib /usr/lib /usr/local/lib"
+@@ -14196,7 +14195,6 @@
+   need_version=no
+   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
+   soname_spec='${libname}${release}${shared_ext}$major'
+-  finish_cmds='PATH="\$PATH:/sbin" ldconfig -n $libdir'
+   shlibpath_var=LD_LIBRARY_PATH
+   shlibpath_overrides_runpath=no
+ 
+@@ -14260,7 +14258,6 @@
+   need_version=no
+   if echo __ELF__ | $CC -E - | $GREP __ELF__ >/dev/null; then
+     library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${shared_ext}$versuffix'
+-    finish_cmds='PATH="\$PATH:/sbin" ldconfig -m $libdir'
+     dynamic_linker='NetBSD (a.out) ld.so'
+   else
+     library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major ${libname}${shared_ext}'
+@@ -14301,7 +14298,6 @@
+     *)				need_version=no  ;;
+   esac
+   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${shared_ext}$versuffix'
+-  finish_cmds='PATH="\$PATH:/sbin" ldconfig -m $libdir'
+   shlibpath_var=LD_LIBRARY_PATH
+   if test -z "`echo __ELF__ | $CC -E - | $GREP __ELF__`" || test "$host_os-$host_cpu" = "openbsd2.8-powerpc"; then
+     case $host_os in
+@@ -14357,7 +14353,6 @@
+ sunos4*)
+   version_type=sunos
+   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${shared_ext}$versuffix'
+-  finish_cmds='PATH="\$PATH:/usr/etc" ldconfig $libdir'
+   shlibpath_var=LD_LIBRARY_PATH
+   shlibpath_overrides_runpath=yes
+   if test "$with_gnu_ld" = yes; then
-- 
1.7.10.4
