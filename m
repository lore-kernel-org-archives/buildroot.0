From: kjn <kirby@kjn.com.au>
Date: Tue, 17 Nov 2020 21:34:50 -0600 (CST)
Subject: [Buildroot] [Bug] Python3 "_sqlite3" module cannot be found at
 build time.
Message-ID: <1605670490553-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

           Product: buildroot
           Version: 2020.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other

Seems similar to https://bugs.busybox.net/show_bug.cgi?id=7478

Correct dependencies are selected for build, however the build fails looking
for "_sqlite3".

However can confirm that if the offending package requiring is deselected,
_sqlite3 is available on the target.

/Traceback (most recent call last):
  File "setup.py", line 5, in <module>
    import diskcache
  File
"/home/buildroot-2020.05.1/output/build/python-diskcache-5.1.0/diskcache/__init__.py",
line 9, in <module>
    from .core import (
  File
"/home/buildroot-2020.05.1/output/build/python-diskcache-5.1.0/diskcache/core.py",
line 15, in <module>
    import sqlite3
  File
"/home/buildroot-2020.05.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/python3.8/sqlite3/__init__.py",
line 23, in <module>
    from sqlite3.dbapi2 import *
  File
"/home/buildroot-2020.05.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/python3.8/sqlite3/dbapi2.py",
line 27, in <module>
    from _sqlite3 import *
ModuleNotFoundError: No module named '_sqlite3'
make[1]: *** [package/pkg-generic.mk:269:
/home/buildroot-2020.05.1/output/build/python-diskcache-5.1.0/.stamp_built]
Error 1
make: *** [Makefile:84: _all] Error 2/

Both the host and target are setup with python 3.8.5 (and also python 2.7 in
case of the host -- ubuntu 20.04).
Sqlite3 is installed and functional on both as a core module of 3.8.

*From the target (ARM-Cortex A7 Board - compiled sans diskcache):*

/# python
Python 3.8.5 (default, Nov 13 2020, 21:11:28)
[GCC 8.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import sqlite3
>>> import _sqlite3
>>>/

*From the host (Ubuntu 20.04 - VM):*

/kjn at ubuntu:~/buildroot-2020.05.1$ python3
Python 3.8.5 (default, Jul 28 2020, 12:59:40) 
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import _sqlite3
>>> import sqlite3
>>>
/






--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
