From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Fri, 11 Oct 2013 13:58:46 +0200
Subject: [Buildroot] =?utf-8?q?=5BRFC_PATCH_0/7=5D_add_lava-test_package_a?=
	=?utf-8?q?nd_its_dependencies?=
Message-ID: <1381492733-24280-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Hello,

Here is a set of patches to add lava-test package. Yes it's bigger than the
single patch I sent previously!

In fact, I have encountered several issue with it...

It seems that target python stuff is not 'hostproof'. I mean I had python
modules needed on my computer in ~/.local directory and they have been used
for the target. So I have removed them in order to start from a clean state.
Then I had to add all dependencies.


There are some issues I couldn't solve:

1. simplejson module has an extension which was compiled with the host compiler
instead of the cross-compiler. I have solved it but I still have an issue:

--8<--
>>> python-simplejson 3.3.1 Installing to target
(cd /home/ldesroches/workspace/buildroot/output/build/python-simplejson-3.3.1; CC="/home/ldesroches/workspace/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc" LD="/home/ldesroches/workspac
e/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld" CFLAGS="" PYTHONPATH="/home/ldesroches/workspace/buildroot/output/target/usr/lib/python2.7/site-packages" /home/ldesroches/workspace/build
root/output/host/usr/bin/python setup.py install --prefix=/usr --root=/home/ldesroches/workspace/buildroot/output/target)
running install
running build
running build_py
running build_ext
building 'simplejson._speedups' extension
/home/ldesroches/workspace/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -I/home/ldesroches/workspace/buildroot/output/host/usr/in
clude/python2.7 -c simplejson/_speedups.c -o build/temp.linux-x86_64-2.7/simplejson/_speedups.o
In file included from /home/ldesroches/workspace/buildroot/output/host/usr/include/python2.7/Python.h:58:0,
                 from simplejson/_speedups.c:2:
		 /home/ldesroches/workspace/buildroot/output/host/usr/include/python2.7/pyport.h:849:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
simplejson/_speedups.c: In function ?scan_once_str?:
simplejson/_speedups.c:2194:17: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
simplejson/_speedups.c:2204:17: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
simplejson/_speedups.c: In function ?scan_once_unicode?:
simplejson/_speedups.c:2307:17: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
simplejson/_speedups.c:2321:17: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
simplejson/_speedups.c: In function ?moduleinit?:
simplejson/_speedups.c:3277:5: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
simplejson/_speedups.c:3279:5: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
***************************************************************************
WARNING: The C extension could not be compiled, speedups are not enabled.
Failure information, if any, is above.
I'm retrying the build without the C extension now.
***************************************************************************
-->8--

It doesn't prevent from using simplejson package but we won't have the speedups
extension.

2. I also have an issue if I select BR2_PACKAGE_PYTHON_PYC_ONLY. If I start a
build from scratch, no issue but I remove this package and try to compile it:

creating dist
creating 'dist/lava_test-0.14-py2.7.egg' and adding 'build/bdist.linux-x86_64/egg' to it
removing 'build/bdist.linux-x86_64/egg' (and everything under it)
error: /home/ldesroches/workspace/buildroot/output/target/usr/lib/python2.7/site-packages/site.py: No such file or directory
make: *** [/home/ldesroches/workspace/buildroot/output/build/lava-test-0.14/.stamp_target_installed] Error 1

How to manage this case in a proper way? By putting a select
BR2_PACKAGE_PYTHON_PY_PYC or BR2_PACKAGE_PYTHON_PY_ONLY? I am not sure it is a
proper solution to let a package configuring this setting...

By the way we can see there is still some confusion between host and target:
build/bdist.linux-x86_64/egg.


Regards


Ludovic Desroches (7):
  python-versiontools: new package
  python-keyring: new package
  python-simplejson: new package
  python-json-schema-validator: new package
  python-linaro-dashboard-bundle: new package
  lava-tool: new package
  lava-test: new package

 package/Config.in                                  |  7 +++++++
 package/lava-test/Config.in                        | 11 +++++++++++
 package/lava-test/lava-test.mk                     | 21 +++++++++++++++++++++
 package/lava-tool/Config.in                        |  8 ++++++++
 package/lava-tool/lava-tool.mk                     | 21 +++++++++++++++++++++
 package/python-json-schema-validator/Config.in     |  6 ++++++
 .../python-json-schema-validator.mk                | 20 ++++++++++++++++++++
 package/python-keyring/Config.in                   |  7 +++++++
 package/python-keyring/python-keyring.mk           | 22 ++++++++++++++++++++++
 package/python-linaro-dashboard-bundle/Config.in   | 10 ++++++++++
 .../python-linaro-dashboard-bundle.mk              | 19 +++++++++++++++++++
 package/python-simplejson/Config.in                |  6 ++++++
 package/python-simplejson/python-simplejson.mk     | 22 ++++++++++++++++++++++
 package/python-versiontools/Config.in              |  6 ++++++
 package/python-versiontools/python-versiontools.mk | 18 ++++++++++++++++++
 15 files changed, 204 insertions(+)
 create mode 100644 package/lava-test/Config.in
 create mode 100644 package/lava-test/lava-test.mk
 create mode 100644 package/lava-tool/Config.in
 create mode 100644 package/lava-tool/lava-tool.mk
 create mode 100644 package/python-json-schema-validator/Config.in
 create mode 100644 package/python-json-schema-validator/python-json-schema-validator.mk
 create mode 100644 package/python-keyring/Config.in
 create mode 100644 package/python-keyring/python-keyring.mk
 create mode 100644 package/python-linaro-dashboard-bundle/Config.in
 create mode 100644 package/python-linaro-dashboard-bundle/python-linaro-dashboard-bundle.mk
 create mode 100644 package/python-simplejson/Config.in
 create mode 100644 package/python-simplejson/python-simplejson.mk
 create mode 100644 package/python-versiontools/Config.in
 create mode 100644 package/python-versiontools/python-versiontools.mk

-- 
1.7.11.3
