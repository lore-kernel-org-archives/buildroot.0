From: Tomas V. Arredondo <surf_fanatico@yahoo.com>
Date: Thu, 16 Jul 2020 05:56:33 +0000 (UTC)
Subject: [Buildroot] audit2allow BR support
References: <5696376.2474933.1594878993118.ref@mail.yahoo.com>
Message-ID: <5696376.2474933.1594878993118@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,
New to buildroot... I am trying to add selinux to a working linux-5.1.9 build, so far i have added the following packages:

+BR2_PACKAGE_REFPOLICY=y+BR2_PACKAGE_SETOOLS=y+BR2_PACKAGE_POLICYCOREUTILS=y+BR2_PACKAGE_SELINUX_PYTHON=y+BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW=y?
The build completes with the kernel, rootfs and dtb.? SELinux support is seen in that the Z option works with ps, ls and labels etc are seen.But some errors are observed:

1- selinux module not found in audit2allow
$ audit2allow -aTraceback (most recent call last):File "/usr/bin/audit2allow", line 25, in <module>import sepolgen.audit as auditFile "usr/lib/python3.7/sepolgen/audit.py", line 23, in <module>File "usr/lib/python3.7/sepolgen/refpolicy.py", line 21, in <module>ModuleNotFoundError: No module named 'selinux'
buildroot/package/selinux-python$ cat selinux-python.hash# https://github.com/SELinuxProject/selinux/wiki/Releasessha256 3650b5393b0d1790cac66db00e34f059aa91c23cfe3c2559676594e295d75fde selinux-python-2.9.tar.gz
# ls__init__.pyc? ? ? interfaces.pyc? ? output.pyc? ? ? ? util.pycaccess.pyc? ? ? ? lex.pyc? ? ? ? ? ?policygen.pyc? ? ?yacc.pycaudit.pyc? ? ? ? ?matching.pyc? ? ? refparser.pycclassperms.pyc? ? module.pyc? ? ? ? refpolicy.pycdefaults.pyc? ? ? objectmodel.pyc? ?sepolgeni18n.pyc# pwd/usr/lib/python3.7/sepolgen
==> I do see selinux.py in the build directory but not in the target rootfs as a pyc or otherwise:
buildroot/output/build/host-libselinux-2.9/src/selinux.pybuildroot/output/build/libselinux-2.9/src/selinux.py
2- /var/lib/selinux directory missing
$ semodule -llibsemanage.semanage_create_store: Could not create module store at /var/lib/selinux/targeted. (No such file or directory).libsemanage.semanage_direct_connect: could not establish direct connection (No such file or directory).semodule: Could not connect to policy handler
ls /var/lib/selinuxls: /var/lib/selinux: No such file or directory
==> looks like the directory can just be added
mkdir /var/lib/selinux
semodule -lNo modules.
sestatus | grep LoadedLoaded policy name: targeted
ls -alZ /etc/selinuxtotal 8drwxr-xr-x 3 root root system_u:object_r:root_t 0 Jul 13 2020 .drwxr-xr-x 18 root root system_u:object_r:root_t 0 Jan 1 00:00 ..-rwxr-xr-x 1 root root system_u:object_r:root_t 311 Jul 13 2020 configrw-rr- 1 root root system_u:object_r:root_t 1904 Jul 13 2020 semanage.confdrwxr-xr-x 5 root root system_u:object_r:root_t 0 Jul 13 2020 targeted
Should this work as is or am I missing any packages or patches for this to work??Any reference, tips or comments much appreciated.
Thanks,Tomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200716/13889cee/attachment.html>
