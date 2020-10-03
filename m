From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2020 08:57:56 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-aenum: drop test_v3.py
 file for python 2.x to fix pycompile issue
In-Reply-To: <20201002134048.24473-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 2 Oct 2020 15:40:47 +0200")
References: <20201002134048.24473-1-peter@korsgaard.com>
Message-ID: <878scnyex7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/4ca459d54545c0e20b0f0cdc63bd81844ecd7f36/

 > aenum has conditional logic to load python 3.x code located in test_v3.py:

 > if pyver >= 3.0:
 >     from aenum.test_v3 import TestEnumV3, TestOrderV3, TestNamedTupleV3

 > And contains logic in setup.py to drop that file during setup.py install if
 > building for python 2.x:

 > py3_only = ('aenum/test_v3.py', )
 > ..
 > if __name__ == '__main__':
 >     if 'install' in sys.argv:
 >         import os, sys
 > 	..
 >         if sys.version_info[0] != 3:
 >             for file in py3_only:
 >                 try:
 >                     os.unlink(file)

 > But this doesn't work in Buildroot as pkg-python.dk first does setup.py
 > build (which copies test_v3.py to the build directory) before setup.py
 > install, so test_v3.py gets installed, leading to errors from pycompile:

 > error:   File "/usr/lib/python2.7/site-packages/aenum/test_v3.py", line 12
 >     class MagicAutoNumberEnum(Enum, settings=AutoNumber):
 >                                             ^
 > SyntaxError: invalid syntax

 > As a workaround, add a hook to drop it from the target directory when
 > building for python 2.x.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
