From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Mon, 28 Oct 2013 21:29:34 +0100
Subject: [Buildroot] Problems with Python ctypes on Raspberry Pi
 platfform - Was: Re: [PATCH v2 1/1] python-pyusb: new package
In-Reply-To: <20131028204723.458fbe10@skate>
References: <CAMduVEcp4u0Xb5tSK=LV_s5E2jGF501R_eKjWFnOUWtcTZ4URw@mail.gmail.com>
 <20131028204723.458fbe10@skate>
Message-ID: <CAMduVEdhYBbk_ZskuRukDifYbEgxC_0y7-6vK5WkcPYvFLFEpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

The simplest Python session which shows the problem:

# python
Python 2.7.3 (default, Oct 26 2013, 16:39:49)
[GCC 4.7.3] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import ctypes.util
>>> print ctypes.util.find_library('m')
None
>>>

Then I have copied the output/build/python-2.7.3/Lib/ctypes/util.py
to /usr/lib/python2.7/ctypes/util.py

And modified the function  _findSoname_ldconfig(name):
modifying the mach_map dictionary:

           mach_map = {
                'x86_64-64': 'libc6,x86-64',
                'ppc64-64': 'libc6,64bit',
                'sparc64-64': 'libc6,64bit',
                's390x-64': 'libc6,64bit',
                'ia64-64': 'libc6,IA-64',
                'armv6l-32':'libc0', # Added by WZab for ctypes support
                }
            abi_type = mach_map.get(machine, 'libc6')

(OK. I was wrong, I must yet add "-32" at the end).

After that my session looks as below:

Python 2.7.3 (default, Oct 26 2013, 16:39:49)
[GCC 4.7.3] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import ctypes.util
>>> print ctypes.util.find_library('m')
libm.so.0
>>>

It is important that this is a small embedded system without
development tools implemented.
Otherwise  _findLib_gcc(name) will provide  the correct library name
even if _findSoname_ldconfig fails.
(the line:
def find_library(name):
            return _findSoname_ldconfig(name) or _get_soname(_findLib_gcc(name))
)


Regards,
Wojtek

-- 
Wojciech M. Zabo?otny
My GPG/PGP keys:
8192R/4569D119 - for standard messages
16384R/1312D8F8 - for confidential messages
