From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 27 Sep 2014 22:49:40 +0000 (UTC)
Subject: [Buildroot] [Bug 7478] New: Multiple chosen python modules are not
 built due to missing header files in include path
Message-ID: <bug-7478-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7478

           Summary: Multiple chosen python modules are not built due to
                    missing header files in include path
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cma at vtxnet.ch
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Python doesn't build some of the requested modules because the setup.py script
is unable to locate the respective header files. The affected modules are
sqlite3, ssl, zlib and bsddb. The build completes successfully and the target
images are correctly generated, but these modules will not work in python.

Buildroot target is i686. Buildroot version is 2014.11-git-00330-g6712213.

Chosen modules in .config:
BR2_PACKAGE_PYTHON_BZIP2=y
BR2_PACKAGE_PYTHON_BSDDB=y
BR2_PACKAGE_PYTHON_CODECSCJK=y
BR2_PACKAGE_PYTHON_CURSES=y
BR2_PACKAGE_PYTHON_PYEXPAT=y
BR2_PACKAGE_PYTHON_READLINE=y
BR2_PACKAGE_PYTHON_SSL=y
BR2_PACKAGE_PYTHON_UNICODEDATA=y
BR2_PACKAGE_PYTHON_UCS2=y
# BR2_PACKAGE_PYTHON_UCS4 is not set
BR2_PACKAGE_PYTHON_SQLITE=y
BR2_PACKAGE_PYTHON_ZLIB=y
BR2_PACKAGE_PYTHON_HASHLIB=y

BR2_PACKAGE_SQLITE=y
# BR2_PACKAGE_SQLITE_READLINE is not set
# BR2_PACKAGE_SQLITE_STAT3 is not set
# BR2_PACKAGE_SQLITE_ENABLE_FTS3 is not set
# BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY is not set
# BR2_PACKAGE_SQLITE_SECURE_DELETE is not set
# BR2_PACKAGE_SQLITE_NO_SYNC is not set


Relevant build log snippet (python-2.7.8-build.log:2878):
Python build finished, but the necessary bits to build these modules were not
found:
_bsddb             _sqlite3           _ssl            
_tkinter           bsddb185           dbm             
dl                 gdbm               imageop         
linuxaudiodev      nis                ossaudiodev     
sunaudiodev        zlib                     
To find the necessary bits, look in setup.py in detect_modules() for the
module's name.


After booting the target, importing these modules will result in an
ImportError:
# python -c "import sqlite3"
Traceback (most recent call last):
  File "<string>", line 1, in <module>
  File "/usr/lib/python2.7/sqlite3/__init__.py", line 24, in <module>
    from dbapi2 import *
  File "/usr/lib/python2.7/sqlite3/dbapi2.py", line 28, in <module>
    from _sqlite3 import *
ImportError: No module named _sqlite3

Note: sqlite3 library is installed on the target and the sqlite3 shell is
working as excepted.

# python -c "import ssl"
Traceback (most recent call last):
  File "<string>", line 1, in <module>
  File "/usr/lib/python2.7/ssl.py", line 60, in <module>
    import _ssl             # if we can't import it, let the error propagate
ImportError: No module named _ssl


As a temporary workaround, copying the sqlite header file in the python include
directory before building python permits the module compilation (here for
sqlite): 
$ cp output/build/sqlite-3080500/sqlite3.h output/build/python-2.7.8/Include/
For the other modules, I haven't tested.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
