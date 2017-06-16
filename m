From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 16 Jun 2017 12:50:51 +0200
Subject: [Buildroot] cffi backend issue
Message-ID: <CAGm1_kumYa-ze88cvwmwCtpABBEvN1aFMJHeeA3JSXhMPabSXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recent autobuilder errors [1] show issues with cffi based python packages:

ImportError: /accts/mlweber1/instance-2/output/target/usr/lib/python2.7/site-packages/_cffi_backend.so:
wrong ELF class: ELFCLASS32

According to this error target library will be linked instead of host
one. Removing _cffi_backend.so enables the packages to be built
successfully. This happens only for Python 2.x. Python 3 names
libraries according to its origin arch, in Python 2 build all *.so
files have the same name:

user at debian9:~/Documents/versioned/buildroot$ find bsp-barebox/ -name _cffi*.so
bsp-barebox/target/usr/lib/python3.6/site-packages/_cffi_backend.cpython-36m-arm-linux-gnueabihf.so
bsp-barebox/build/host-python-cffi-1.10.0/build/lib.linux-x86_64-3.6/_cffi_backend.cpython-36m-x86_64-linux-gnu.so
bsp-barebox/build/python-cffi-1.10.0/build/lib.linux-x86_64-3.6/_cffi_backend.cpython-36m-arm-linux-gnueabihf.so
bsp-barebox/host/usr/lib/python3.6/site-packages/cffi-1.10.0-py3.6-linux-x86_64.egg/_cffi_backend.cpython-36m-x86_64-linux-gnu.so

So far I can imagine only one dirty workaround:

- remove output/target/usr/lib/python2.7/site-packages/_cffi_backend.so
every time a python package is built
- copy _cffi_backend.so to target during the rootfs finalization

Any other idea?

[1] http://autobuild.buildroot.net/results/911/9117c3e0380c6a921ee6abd89be3e2b37e5343c7/build-end.log

Regards,
Yegor
