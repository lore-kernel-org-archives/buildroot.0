From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Sat, 26 Oct 2013 17:30:16 +0200
Subject: [Buildroot] Problems with Python ctypes on Raspberry Pi platfform -
 Was: Re: [PATCH v2 1/1] python-pyusb: new package
Message-ID: <CAMduVEcp4u0Xb5tSK=LV_s5E2jGF501R_eKjWFnOUWtcTZ4URw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Testing the newly created python-pyusb on a Raspberry Pi platform, I
have found, that it doesn't work.
Investigating the problem more thoroughly, I have found that it is
associated with Python ctypes package, which is not able to locate the
libraries.
Analyzing the Python-2.7.3/Lib/ctypes/util.py file, I have found, that
on that platform, when neither gcc nor binutils are installed on
target (which is typical for small systems), locating of the library
relies on output of the "ldconfig -p" command.
Unfortunately, this command returns simply:

# /sbin/ldconfig -p
Library cache disabled

I'm afraid that this problem may affect many other programs and
packages relying on Python ctypes... (and probably not only on
Raspberry Pi platform)

I have solved this problem by doing
make uclibc-menuconfig
and here: General Library Settings->[*]   Enable library loader cache
(ld.so.conf)

However I don't know if that can be somehow included in package dependencies?
It is also unclear how can it affect systems with unwritable /etc (my
test system runs from initramfs,
so that's not a problem)

Additionally in the Python-2.7.3/Lib/ctypes/util.py it is necessary to
set the abi_type to 'libc0' for Raspberry Pi in the function below
(lines 185-210):

        def _findSoname_ldconfig(name):
            import struct
            if struct.calcsize('l') == 4:
                machine = os.uname()[4] + '-32'
            else:
                machine = os.uname()[4] + '-64'
            mach_map = {
                'x86_64-64': 'libc6,x86-64',
                'ppc64-64': 'libc6,64bit',
                'sparc64-64': 'libc6,64bit',
                's390x-64': 'libc6,64bit',
                'ia64-64': 'libc6,IA-64',
                'armv6l','libc0', # Added by WZab for ctypes support
on Raspberry Pi
                }
            abi_type = mach_map.get(machine, 'libc6')

            # XXX assuming GLIBC's ldconfig (with option -p)
            expr = r'\s+(lib%s\.[^\s]+)\s+\(%s' % (re.escape(name), abi_type)
            f = os.popen('/sbin/ldconfig -p 2>/dev/null')
            try:
                data = f.read()
            finally:
                f.close()
            res = re.search(expr, data)
            if not res:
                return None
            return res.group(1)

It is also not clear how it will work with other embedded platforms :-(.

So even though the python-pyusb package seems to be ready, there is a
bigger problem with ctypes module in Python itself...

-- 
TIA & Regards,
Wojtek
