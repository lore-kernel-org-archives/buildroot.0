From: Paul Gildea <gildeap@tcd.ie>
Date: Fri, 8 Sep 2017 15:18:23 +0100
Subject: [Buildroot] Issue adding subprocess32 python package to buildroot
Message-ID: <CAP3D3ge8ZXFXuB4_V5eSxnKAN=5hKWwYcxT2xRqM6HUOp39pUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to install subprocess32 with my python 2.7 installation
via buildroot. It's an older version of buildroot and doesn't have
python-package, subprocess32 appeared to install correctly but when I
import it on the embedded system I get an error:

>>> import subprocess32
/usr/lib/python2.7/site-packages/subprocess32.py:472: RuntimeWarning:
The _posixsubprocess module is not being used. Child process
reliability may suffer if your pro
gram uses threads.
  "program uses threads.", RuntimeWarning)
Following this path I tried to import _posixsubprocess


>>>import _posixsubprocess
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ImportError: dynamic module does not define init function (init_posixsubprocess)

 _posixsubprocess does have init_posixsubprocess https://
github.com/google/python-subprocess32/blob/master/_posixsubprocess.c#L879

I can use subprocess32 otherwise, I tested out it's basic
functionality.It seems to me like something in my build system is not
doing the right thing, any ideas?


Output from building:

^[[7m>>> python-subprocess32 3.2.7 Extracting^[[27m
^[[7m>>> python-subprocess32 3.2.7 Patching package/python-subprocess32^[[27m
^[[7m>>> python-subprocess32 3.2.7 Configuring^[[27m
^[[7m>>> python-subprocess32 3.2.7 Building^[[27m
(cd /media/vmpart/5.1.0_x86/buildroot/output/build/python-subprocess32-3.2.7;
/media/vmpart/5.1.0_x86/buildroot/output/host/usr/bin/python setup.py
build)
running build
running build_py
creating build
creating build/lib.linux-x86_64-2.7
copying subprocess32.py -> build/lib.linux-x86_64-2.7
running build_ext
building '_posixsubprocess' extension
creating build/temp.linux-x86_64-2.7
copying subprocess32.py -> build/lib.linux-x86_64-2.7
running build_ext
building '_posixsubprocess' extension
creating build/temp.linux-x86_64-2.7
/media/vmpart/5.1.0_x86/buildroot/output/host/usr/bin/ccache
/usr/bin/gcc -pthread -fno-strict-aliasing -O2
-I/media/vmpart/5.1.0_x86/buildroot/output/host/include
-I/media/vmpart/5.1.0_x86/buildroot/output/host/usr/include -DNDEBUG
-g -O3 -Wall -Wstrict-prototypes -fPIC
-I/media/vmpart/5.1.0_x86/buildroot/output/host/usr/include/python2.7
-c _posixsubprocess.c -o
build/temp.linux-x86_64-2.7/_posixsubprocess.o
/media/vmpart/5.1.0_x86/buildroot/output/host/usr/bin/ccache
/usr/bin/gcc -pthread -shared
-L/media/vmpart/5.1.0_x86/buildroot/output/host/lib
-L/media/vmpart/5.1.0_x86/buildroot/output/host/usr/lib
-Wl,-rpath,/media/vmpart/5.1.0_x86/buildroot/output/host/usr/lib
build/temp.linux-x86_64-2.7/_posixsubprocess.o
-L/media/vmpart/5.1.0_x86/buildroot/output/host/usr/lib -lpython2.7 -o
build/lib.linux-x86_64-2.7/_posixsubprocess.so
^[[7m>>> python-subprocess32 3.2.7 Installing to target^[[27m
(cd /media/vmpart/5.1.0_x86/buildroot/output/build/python-subprocess32-3.2.7;
/media/vmpart/5.1.0_x86/buildroot/output/host/usr/bin/python setup.py
install --prefix=/media/vmpart/5.1.0_x86/buildroot/output/target/usr)
running install
running build
running build_py
running build_ext
running install_lib
copying build/lib.linux-x86_64-2.7/_posixsubprocess.so ->
/media/vmpart/5.1.0_x86/buildroot/output/target/usr/lib/python2.7/site-packages
running install_egg_info
Removing /media/vmpart/5.1.0_x86/buildroot/output/target/usr/lib/python2.7/site-packages/subprocess32-3.2.7-py2.7.egg-info
Writing /media/vmpart/5.1.0_x86/buildroot/output/target/usr/lib/python2.7/site-packages/subprocess32-3.2.7-py2.7.egg-info



My makefile:


#############################################################
#
# Subprocess32 module for python
#
#############################################################

PYTHON_SUBPROCESS32_VERSION = 3.2.7
PYTHON_SUBPROCESS32_SOURCE = subprocess32-$(PYTHON_SUBPROCESS32_VERSION).tar.gz
PYTHON_SUBPROCESS32_SITE = https://pypi.python.org/pypi/subprocess32

PYTHON_SUBPROCESS32_DEPENDENCIES = python

define PYTHON_SUBPROCESS32_BUILD_CMDS
        (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
endef

define PYTHON_SUBPROCESS32_INSTALL_TARGET_CMDS
        (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install
--prefix=$(TARGET_DIR)/usr)
endef

$(eval $(call GENTARGETS,package,python-subprocess32))
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170908/e0ee29e4/attachment.html>
