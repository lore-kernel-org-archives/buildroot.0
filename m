From: Mickael Chazaux <mickael.chazaux@etictelecom.com>
Date: Thu, 9 Jun 2016 15:35:54 +0200
Subject: [Buildroot] Python standard library files missing from rootfs
Message-ID: <575970BA.7080407@etictelecom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build a rootfs with python 2.7. using buildroot version 2016.05. On the target here is what I get:

Welcome to Buildroot
buildroot login: root
login[1338]: root login on 'console'
# python
Could not find platform independent libraries <prefix>
Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
ImportError: No module named site
# export PYTHONHOME=/usr
# python
ImportError: No module named site
# ls /usr/lib/python2.7/
LICENSE.txt       encodings         logging           sysconfigdata
compiler          ensurepip         multiprocessing   unittest
config            hotshot           pdb.doc           wsgiref
ctypes            importlib         plat-linux2       wsgiref.egg-info
distutils         json              site-packages
email             lib-dynload       sqlite3

all the standard library files are missing, including site.py.
Digging in the build process, I believe there is an error in the install process :

>>> python 2.7.11 Installing to staging directory
PATH="/home/mc/buildroot/buildroot-2016.05/output/host/bin:/home/mc/buildroot/buildroot-2016.05/output/host/sbin:/home/mc/buildroot/buildroot-2016.05/output/host/usr/bin:/home/mc/buildroot/buildroot-2016.05/output/host/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/mc/node/node-v4.2.2-linux-x86/bin/"  /usr/bin/make  DESTDIR=/home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot install -C /home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/
make[1]: Entering directory '/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11'
/usr/bin/install -c python /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/python2.7
if test -f libpython2.7.so; then \
         if test -n "" ; then \
                 /usr/bin/install -c -m 555  /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/bin; \
         else \
                 /usr/bin/install -c -m 555 libpython2.7.so /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpython2.7.so.1.0; \
                 if test libpython2.7.so != libpython2.7.so.1.0; then \
                         (cd /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib; ln -sf libpython2.7.so.1.0 libpython2.7.so) \
                 fi \
         fi; \
else    true; \
fi
/usr/bin/install -c -m 644 ./Misc/python.man \
         /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/share/man/man1/python2.7.1
/usr/bin/install -c -m 644 ./Include/abstract.h /usr/include/python2.7
rm -f /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/share/man/man1/python2.1

... Lots and lots of stuff ...


PYTHONPATH=/home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/python2.7   \
         _PYTHON_PROJECT_BASE=/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11 _PYTHON_HOST_PLATFORM=linux2-arm PYTHONPATH=/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/build/lib.linux2-arm-2.7/sysconfigdata:./Lib:./Lib/plat-linux2 python2.7 -Wi -t /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/python2.7/compileall.py \
         -d /usr/lib/python2.7/site-packages -f \
         -x badsyntax /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/python2.7/site-packages
Listing /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/python2.7/site-packages ...
PYTHONPATH=/home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/python2.7  \
         _PYTHON_PROJECT_BASE=/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11 _PYTHON_HOST_PLATFORM=linux2-arm PYTHONPATH=/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/build/lib.linux2-arm-2.7/sysconfigdata:./Lib:./Lib/plat-linux2 python2.7 -m lib2to3.pgen2.driver /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/python2.7/lib2to3/Grammar.txt
Generating grammar tables from /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/python2.7/lib2to3/Grammar.txt
Traceback (most recent call last):
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/runpy.py", line 162, in _run_module_as_main
     "__main__", fname, loader, pkg_name)
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/runpy.py", line 72, in _run_code
     exec code in run_globals
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/lib2to3/pgen2/driver.py", line 157, in <module>
     sys.exit(int(not main()))
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/lib2to3/pgen2/driver.py", line 153, in main
     load_grammar(gt, save=True, force=True)
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/lib2to3/pgen2/driver.py", line 121, in load_grammar
     g = pgen.generate_grammar(gt)
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/lib2to3/pgen2/pgen.py", line 385, in generate_grammar
     p = ParserGenerator(filename)
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/lib2to3/pgen2/pgen.py", line 15, in __init__
     stream = open(filename)
IOError: [Errno 2] No such file or directory: '/home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/python2.7/lib2to3/Grammar.txt'
Makefile:1075: recipe for target 'libinstall' failed
make[1]: [libinstall] Error 1 (ignor?e)
PYTHONPATH=/home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/python2.7  \
         _PYTHON_PROJECT_BASE=/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11 _PYTHON_HOST_PLATFORM=linux2-arm PYTHONPATH=/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/build/lib.linux2-arm-2.7/sysconfigdata:./Lib:./Lib/plat-linux2 python2.7 -m lib2to3.pgen2.driver /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/python2.7/lib2to3/PatternGrammar.txt
Generating grammar tables from /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/python2.7/lib2to3/PatternGrammar.txt
Traceback (most recent call last):
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/runpy.py", line 162, in _run_module_as_main
     "__main__", fname, loader, pkg_name)
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/runpy.py", line 72, in _run_code
     exec code in run_globals
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/lib2to3/pgen2/driver.py", line 157, in <module>
     sys.exit(int(not main()))
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/lib2to3/pgen2/driver.py", line 153, in main
     load_grammar(gt, save=True, force=True)
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/lib2to3/pgen2/driver.py", line 121, in load_grammar
     g = pgen.generate_grammar(gt)
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/lib2to3/pgen2/pgen.py", line 385, in generate_grammar
     p = ParserGenerator(filename)
   File "/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/Lib/lib2to3/pgen2/pgen.py", line 15, in __init__
     stream = open(filename)
IOError: [Errno 2] No such file or directory: '/home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/python2.7/lib2to3/PatternGrammar.txt'
Makefile:1075: recipe for target 'libinstall' failed
make[1]: [libinstall] Error 1 (ignor?e)
if test "xno" != "xno"  ; then \
         case no in \
                 upgrade) ensurepip="--upgrade" ;; \
                 install|*) ensurepip="" ;; \
         esac; \
          _PYTHON_PROJECT_BASE=/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11 _PYTHON_HOST_PLATFORM=linux2-arm PYTHONPATH=/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11/build/lib.linux2-arm-2.7/sysconfigdata:./Lib:./Lib/plat-linux2 python2.7 -m ensurepip \
                 $ensurepip --root=/home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/ ; \
fi
make[1]: Leaving directory '/home/mc/buildroot/buildroot-2016.05/output/build/python-2.7.11'
ln -sf python2-config /home/mc/buildroot/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/python-config
>>> python 2.7.11 Fixing libtool files
>>> python 2.7.11 Installing to target

... Same kind of error in this phase too.




-- 
Mickael Chazaux
Software Engineer
Tel : (33) 476 042 009
Fax : (33) 476 042 001

ETIC TELECOM
13, Chemin du Vieux Ch?ne
38240 MEYLAN
Tel: 33 4 76 04 20 00
fax : 33 4 76 04 20 01
