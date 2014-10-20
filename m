From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Oct 2014 22:43:18 +0000 (UTC)
Subject: [Buildroot] [Bug 7478] Multiple chosen python modules are not built
 due to missing header files in include path
In-Reply-To: <bug-7478-163@https.bugs.busybox.net/>
References: <bug-7478-163@https.bugs.busybox.net/>
Message-ID: <20141020224318.C0372AFFBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7478

--- Comment #9 from Christian Abegg <cma@vtxnet.ch> 2014-10-20 22:43:18 UTC ---
Hi Thomas,

thanks for the hints and sorry for the delay.

I adapted my config file with your options and still got the same errors. I
also tried glibc and uclib and gcc4.8/4.9 but the sqlite extension is still not
built. As soon as I switch to an external toolchain, it works correctly.

For the include paths, I added some print statements in the
Lib/distutils/command/build_ext.py and the setup.py file (see
br-python-2.7.8-setup-py.patch attachment). As seen below, the sysroot include
dir isn't received by the python setup script (setup.py):

# With buildroot internal toolchain
inc_dirs =  ['.', 'Include', './Include',
'/tmp/buildroot-internal/output/build/python-2.7.8/Include',
'/tmp/buildroot-internal/output/build/python-2.7.8']

# Using an external toolchain
inc_dirs =  ['.', 'Include', './Include',
'/tmp/buildroot-external/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include',
'/tmp/buildroot-external/output/build/python-2.7.8/Include',
'/tmp/buildroot-external/output/build/python-2.7.8']
and from the build_ext.py file:
ext.include_dirs = ['Modules/_sqlite',
'/tmp/buildroot-external/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include']

So somehow the required include dir
('/tmp/buildroot-external/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include')
isn't forwarded to the python setup.py script who builds the extensions.

From that point, I'm a bit clueless why the sysroot include dir isn't in the
dir list when an internal toolchain is used. Where is the next place to look ?
Maybe something with the python configure options ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
