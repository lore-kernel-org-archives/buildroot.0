From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Mar 2015 11:39:15 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/mesa3d: bump version to
	10.5.1
References: <1426435802-14030-1-git-send-email-bernd.kuhls@t-online.de>
 <1426435802-14030-2-git-send-email-bernd.kuhls@t-online.de>
 <20150321095905.0e24d32c@free-electrons.com>
Message-ID: <XnsA464768CCAFDBberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20150321095905.0e24d32c at free-electrons.com: 

> This is apparently not working well in some cases, see
> http://autobuild.buildroot.net/results/1ce/1ce2509c8abb7483397c7d0f21c299
> 095e94a254/. 

Hi Thomas,

this seems to be a python2 <-> python3 problem:

$ grep -i "ge_python \|ge_python3=" .config
# BR2_PACKAGE_PYTHON is not set
BR2_PACKAGE_PYTHON3=y

host-python is compiled as

$ ls -la output/build/ | grep host-py
drwxr-xr-x 17 fli4l fli4l  4096 M?r 21 10:48 host-python3-3.4.2
drwxr-xr-x  9 fli4l fli4l  4096 M?r 21 10:48 host-python-mako-1.0.1

but mesa3d checks for python2 first which picks up /usr/bin/python on my
machine 

$ grep PYTHON2 output/build/mesa3d-10.5.1/config.log
ac_cv_prog_PYTHON2=python2
PYTHON2='python2'

due to "AC_CHECK_PROGS([PYTHON2], [python2 python])" in
mesa3d/configure.ac 

Adding

MESA3D_CONF_ENV += ac_cv_prog_PYTHON2=$(HOST_DIR)/usr/bin/python

to mesa3d.mk forcing the usage of host-python3 does not help either:

checking if module mako in python is installed... Traceback (most recent
call last): 
  File "<stdin>", line 10, in <module>
TypeError: unorderable types: map() > map()
configure: error: mako 0.3.4 or later is required.
make: *** [/home/fli4l/br3/output/build/mesa3d-10.5.1/.stamp_configured]
Fehler 1 

Please note that mesa3d does not need the target version of python, only
host-python 2.x. 

Is it possible to compile host-python2 parallel to host-python3 or should
I add a "depends on !BR2_PACKAGE_PYTHON3" to mesa3d/Config.in? 

Regards, Bernd
