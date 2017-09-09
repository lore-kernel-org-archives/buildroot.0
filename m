From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Sep 2017 18:14:01 +0200
Subject: [Buildroot] Issue adding subprocess32 python package to
	buildroot
In-Reply-To: <CAP3D3ge8ZXFXuB4_V5eSxnKAN=5hKWwYcxT2xRqM6HUOp39pUg@mail.gmail.com>
References: <CAP3D3ge8ZXFXuB4_V5eSxnKAN=5hKWwYcxT2xRqM6HUOp39pUg@mail.gmail.com>
Message-ID: <20170909161401.GC2850@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2017-09-08 15:18 +0100, Paul Gildea spake thusly:
> I am trying to install subprocess32 with my python 2.7 installation via
> buildroot. It's an older version of buildroot and doesn't have
> python-package,

python-package was introduced in December 2013, so appeared in Buildroot
2014.02. This means you are using  version that is almost 4 years old
now.

And below, we can see that you are using the GENTARGETS infrastructure.
This was removed in July 2012, now more than 5 years ago...

We can't help on such an old version.

I would suggest that you upgrade to at least our first LTS version,
2017.02, or to the latest release, 2017.08.

Regards,
Yann E. MORIN.

> subprocess32 appeared to install correctly but when I
> import it on the embedded system I get an error:
> 
> >>> import subprocess32/usr/lib/python2.7/site-
> packages/subprocess32.py:472: RuntimeWarning: The _posixsubprocess module is not being used. Child process reliability may suffer if your pro
> gram uses threads.  "program uses threads.", RuntimeWarning)
> Following this path I tried to import _posixsubprocess
> 
> 
> 
> >>>import _posixsubprocessTraceback (most recent call last):
>   File "<stdin>", line 1, in <module>
> ImportError: dynamic module does not define init function (init_posixsubprocess)
> 
> ?_posixsubprocess does have init_posixsubprocess?
> [1]https://github.com/google/python-
> subprocess32/blob/master/_posixsubprocess.c#L879
> 
> I can use subprocess32 otherwise, I tested out it's basic functionality.It seems to me like something in my build system is not doing the right thing, any ideas?
> 
> 
> 
> Output from building:
> 
> ^[[7m>>> python-subprocess32 3.2.7 Extracting^[[27m
> ^[[7m>>> python-subprocess32 3.2.7 Patching package/python-subprocess32^[[
> 27m^[[7m>>> python-subprocess32 3.2.7 Configuring^[[27m
> ^[[7m>>> python-subprocess32 3.2.7 Building^[[27m
> (cd /media/vmpart/5.1.0_x86/buildroot/output/build/python-
> subprocess32-3.2.7; /media/vmpart/5.1.0_x86/
> buildroot/output/host/usr/bin/python setup.py build)
> running buildrunning build_pycreating build
> creating build/lib.linux-x86_64-2.7copying subprocess32.py -> build/lib.linux-x86_64-2.7
> running build_extbuilding '_posixsubprocess' extension
> creating build/temp.linux-x86_64-2.7copying subprocess32.py -> build/lib.linux-x86_64-2.7
> running build_extbuilding '_posixsubprocess' extension
> creating build/temp.linux-x86_64-2.7/media/vmpart/5.1.0_x86/
> buildroot/output/host/usr/bin/ccache /usr/bin/gcc -pthread -fno-strict-aliasing -O2 -I/media/vmpart/5.1.0_x86/
> buildroot/output/host/include -I/media/vmpart/5.1.0_x86/
> buildroot/output/host/usr/include -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -fPIC -I/media/vmpart/5.1.0_x86/
> buildroot/output/host/usr/include/python2.7 -c _posixsubprocess.c -o build/temp.linux-x86_64-2.7/_
> posixsubprocess.o/media/vmpart/5.1.0_x86/
> buildroot/output/host/usr/bin/ccache /usr/bin/gcc -pthread -shared -L/media/vmpart/5.1.0_x86/
> buildroot/output/host/lib -L/media/vmpart/5.1.0_x86/
> buildroot/output/host/usr/lib -Wl,-rpath,/media/vmpart/5.1.
> 0_x86/buildroot/output/host/usr/lib build/temp.linux-x86_64-2.7/_
> posixsubprocess.o -L/media/vmpart/5.1.0_x86/
> buildroot/output/host/usr/lib -lpython2.7 -o build/lib.linux-x86_64-2.7/_
> posixsubprocess.so^[[7m>>> python-subprocess32 3.2.7 Installing to target^[[27m
> (cd /media/vmpart/5.1.0_x86/buildroot/output/build/python-
> subprocess32-3.2.7; /media/vmpart/5.1.0_x86/
> buildroot/output/host/usr/bin/python setup.py install --prefix=/media/vmpart/5.1.0_
> x86/buildroot/output/target/usr)running install
> running buildrunning build_pyrunning build_ext
> running install_libcopying build/lib.linux-x86_64-2.7/_
> posixsubprocess.so -> /media/vmpart/5.1.0_x86/
> buildroot/output/target/usr/lib/python2.7/site-packages
> running install_egg_infoRemoving /media/vmpart/5.1.0_x86/
> buildroot/output/target/usr/lib/python2.7/site-packages/
> subprocess32-3.2.7-py2.7.egg-infoWriting /media/vmpart/5.1.0_x86/
> buildroot/output/target/usr/lib/python2.7/site-packages/
> subprocess32-3.2.7-py2.7.egg-info
> 
> 
> 
> 
> 
> My makefile:
> 
> 
> 
> ############################################################
> ### Subprocess32 module for python###############################
> ###############################PYTHON_SUBPROCESS32_VERSION = 3.2.7
> PYTHON_SUBPROCESS32_SOURCE = subprocess32-$(PYTHON_
> SUBPROCESS32_VERSION).tar.gzPYTHON_SUBPROCESS32_SITE =
> [2]https://pypi.python.org/pypi/subprocess32
> PYTHON_SUBPROCESS32_DEPENDENCIES = python
> define PYTHON_SUBPROCESS32_BUILD_CMDS        (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
> endefdefine PYTHON_SUBPROCESS32_INSTALL_
> TARGET_CMDS        (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
> endef$(eval $(call GENTARGETS,package,python-
> subprocess32))
> 
> Links:
> 1. https://github.com/google/python-subprocess32/blob/master/_posixsubprocess.c#L879
> 2. https://pypi.python.org/pypi/subprocess32

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
