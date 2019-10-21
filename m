From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 21 Oct 2019 19:08:35 +0000
Subject: [Buildroot] [Bug 12271] New: python-iptables runtime dependencies
Message-ID: <bug-12271-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12271

            Bug ID: 12271
           Summary: python-iptables runtime dependencies
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: matthew.weber at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When integrating the python iptables wrapper I found two missing pieces.  

The first piece is the naming of the c library so that iptc/xtables can find
it.  I've just pasted my post_build fixup here but it probably would find a
home in the toolchain package.
pushd ${DEST_DIR}/lib
ln -sf libc.so.6 libc.so
popd

The second item is for the xtables c wrapper to find the library, a
/etc/profile.d/python-iptc.sh or similar needs added with the following.

#!/bin/sh
export PYTHON_IPTABLES_XTABLES_VERSION=12
export XTABLES_LIBDIR=/usr/lib/python2.7/site-packages/:/usr/lib/xtables
# The interactive console doesn't require the following, however
# direct scripting use does
export IPTABLES_LIBDIR=/lib:/usr/lib



Here's a basic build were these changes can be observed.

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_IPTABLES=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set




Here's the output before setting up the lib link.

Welcome to Buildroot
buildroot login: root
# python
Python 2.7.17 (default, Oct 21 2019, 13:54:55) 
[GCC 8.3.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import iptc
random: fast init done
random: python: uninitialized urandom read (2500 bytes read)
random: python: uninitialized urandom read (2500 bytes read)
random: python: uninitialized urandom read (2500 bytes read)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "usr/lib/python2.7/site-packages/iptc/__init__.py", line 10, in <module>
  File "usr/lib/python2.7/site-packages/iptc/ip4tc.py", line 13, in <module>
  File "usr/lib/python2.7/site-packages/iptc/xtables.py", line 796, in <module>
AttributeError: 'NoneType' object has no attribute '_handle'



Here's the output after setting up the lib link

# cd /lib
# ln -sf libc.so.6 libc.so
# python
Python 2.7.17 (default, Oct 21 2019, 13:54:55) 
[GCC 8.3.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import iptc
random: python: uninitialized urandom read (2500 bytes read)
random: python: uninitialized urandom read (2500 bytes read)
random: python: uninitialized urandom read (2500 bytes read)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "usr/lib/python2.7/site-packages/iptc/__init__.py", line 10, in <module>
  File "usr/lib/python2.7/site-packages/iptc/ip4tc.py", line 13, in <module>
  File "usr/lib/python2.7/site-packages/iptc/xtables.py", line 812, in <module>
  File "usr/lib/python2.7/subprocess.py", line 394, in __init__
  File "usr/lib/python2.7/subprocess.py", line 1047, in _execute_child
OSError: [Errno 2] No such file or directory



Here's the output after setting up the profile env script.

# vi /etc/profile.d/python-iptc.sh  # paste in the above script then 
# python 
Python 2.7.17 (default, Oct 21 2019, 13:54:55) 
[GCC 8.3.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import iptc
random: python: uninitialized urandom read (2500 bytes read)
random: python: uninitialized urandom read (2500 bytes read)
random: python: uninitialized urandom read (2500 bytes read)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "usr/lib/python2.7/site-packages/iptc/__init__.py", line 10, in <module>
  File "usr/lib/python2.7/site-packages/iptc/ip4tc.py", line 13, in <module>
  File "usr/lib/python2.7/site-packages/iptc/xtables.py", line 812, in <module>
  File "usr/lib/python2.7/subprocess.py", line 394, in __init__
  File "usr/lib/python2.7/subprocess.py", line 1047, in _execute_child
OSError: [Errno 2] No such file or directory
>>> 

^^^^^^^^^^^^^^^ above failed since we didn't restart the shell, so exit

# exit

Welcome to Buildroot
buildroot login: root
# python
Python 2.7.17 (default, Oct 21 2019, 13:54:55) 
[GCC 8.3.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import iptc
>>>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
