From: Tomas V. Arredondo <surf_fanatico@yahoo.com>
Date: Thu, 16 Jul 2020 20:49:38 +0000 (UTC)
Subject: [Buildroot] audit2allow BR support
In-Reply-To: <20200716094540.27274cf4@windsurf.home>
References: <5696376.2474933.1594878993118.ref@mail.yahoo.com>
 <5696376.2474933.1594878993118@mail.yahoo.com>
 <20200716094540.27274cf4@windsurf.home>
Message-ID: <1558948696.2854913.1594932578236@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,
Quick question inline marked with [TA]... Thanks a lot, Tomas
    On Thursday, July 16, 2020, 03:45:45 AM EDT, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:  
 
 Hello,

I am adding a few folks with SELinux/Buildroot knowledge in Cc. See
below some comments as well.

On Thu, 16 Jul 2020 05:56:33 +0000 (UTC)
"Tomas V. Arredondo" <surf_fanatico@yahoo.com> wrote:

> +BR2_PACKAGE_REFPOLICY=y+BR2_PACKAGE_SETOOLS=y+BR2_PACKAGE_POLICYCOREUTILS=y+BR2_PACKAGE_SELINUX_PYTHON=y+BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW=y?
> The build completes with the kernel, rootfs and dtb.? SELinux support is seen in that the Z option works with ps, ls and labels etc are seen.But some errors are observed:
> 
> 1- selinux module not found in audit2allow
> $ audit2allow -aTraceback (most recent call last):File "/usr/bin/audit2allow", line 25, in <module>import sepolgen.audit as auditFile "usr/lib/python3.7/sepolgen/audit.py", line 23, in <module>File "usr/lib/python3.7/sepolgen/refpolicy.py", line 21, in <module>ModuleNotFoundError: No module named 'selinux'
> buildroot/package/selinux-python$ cat selinux-python.hash# https://github.com/SELinuxProject/selinux/wiki/Releasessha256 3650b5393b0d1790cac66db00e34f059aa91c23cfe3c2559676594e295d75fde selinux-python-2.9.tar.gz
> # ls__init__.pyc? ? ? interfaces.pyc? ? output.pyc? ? ? ? util.pycaccess.pyc? ? ? ? lex.pyc? ? ? ? ? ?policygen.pyc? ? ?yacc.pycaudit.pyc? ? ? ? ?matching.pyc? ? ? refparser.pycclassperms.pyc? ? module.pyc? ? ? ? refpolicy.pycdefaults.pyc? ? ? objectmodel.pyc? ?sepolgeni18n.pyc# pwd/usr/lib/python3.7/sepolgen
> ==> I do see selinux.py in the build directory but not in the target rootfs as a pyc or otherwise:? 
> buildroot/output/build/host-libselinux-2.9/src/selinux.pybuildroot/output/build/libselinux-2.9/src/selinux.py

This file is from host-libselinux, which is not relevant here.
[TA] Correct, would this be the one?: ./buildroot/output/build/libselinux-2.9/src/selinux.py??As a temp workaround do you think that just adding this selinux.py might work?? Just thinking about what a temporary workaround might look like in the mean time.? Thanks!
Which Python version have you chosen ? Python 3.x or Python 2.x, i.e
BR2_PACKAGE_PYTHON=y or BR2_PACKAGE_PYTHON3=y ?

> 2- /var/lib/selinux directory missing
> $ semodule -llibsemanage.semanage_create_store: Could not create module store at /var/lib/selinux/targeted. (No such file or directory).libsemanage.semanage_direct_connect: could not establish direct connection (No such file or directory).semodule: Could not connect to policy handler
> ls /var/lib/selinuxls: /var/lib/selinux: No such file or directory
> ==> looks like the directory can just be added? 

On this one, I'm not sure, would need testing. I don't immediately see
anything creating /var/lib/selinux in Buildroot, so if it's not done by
the build system of one the SELinux packages, indeed /var/lib/selinux
will be missing.

Antoine: you are working on building systems with SELinux supports, did
you face the /var/lib/selinux missing problem ? Or perhaps because
you're testing with systemd, the situation is different ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200716/f7e4fd88/attachment.html>
