From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Feb 2020 11:55:13 +0100
Subject: [Buildroot] [PATCH] package/libftdi1: fix python support
In-Reply-To: <CAGm1_kvMR9y5FtiAUNcMDT8V4diTFNk=3KSD7twQzkXw0jm-tQ@mail.gmail.com>
 (Yegor Yefremov's message of "Fri, 7 Feb 2020 10:30:17 +0100")
References: <20200206095421.12987-1-yegorslists@googlemail.com>
 <87imkiyd32.fsf@dell.be.48ers.dk>
 <CAGm1_kvMR9y5FtiAUNcMDT8V4diTFNk=3KSD7twQzkXw0jm-tQ@mail.gmail.com>
Message-ID: <875zgiy8dq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > Hi Peter,
 > On Fri, Feb 7, 2020 at 10:13 AM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> >>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:
 >> 
 >> > From: Yegor Yefremov <yegorslists@googlemail.com>
 >> > Add an upstreamed patch that reorders find_package() commands.
 >> > This way Python interpreter will be detected first and based on
 >> > it the Python libraries can be found.
 >> 
 >> > Fixes the following CMake error:
 >> 
 >> > Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS)
 >> 
 >> We don't seem to have any autobuilder failures in libftdi1 for almost 1
 >> year. Any idea why this doesn't trigger on the autobuilders?

 > In the version 1.4 find_package() calls were made without the REQUIRED
 > keyword. Hence, this error wasn't detected by the autobuilders. This
 > is now fixed upstream and I hope a new release will appear soon. But
 > meanwhile let's apply this fix.

Ahh, so you mean that the python module would just not be built?

That is not what I see here using a defconfig with libftdi1 and python3
on a machine with python 2.7 and python 3.7:

-- Could NOT find Boost
-- Could NOT find Doxygen (missing: DOXYGEN_EXECUTABLE)
-- Not generating API documentation
-- Detected git snapshot version: 2019.11-1302-ge5e84823bb
-- Found SWIG: /home/peko/source/buildroot/output-ftdi/host/bin/swig (found version "4.0.1")
-- Found PythonLibs: /home/peko/source/buildroot/output-ftdi/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpython3.8.so (found version "3.8.1")
-- Found PythonInterp: /home/peko/source/buildroot/output-ftdi/host/bin/python3.8 (found version "3.8.1")
CMake Deprecation Warning at /usr/share/cmake-3.13/Modules/UseSWIG.cmake:524 (message):
  SWIG_ADD_MODULE is deprecated.  Use SWIG_ADD_LIBRARY instead.
Call Stack (most recent call first):
  python/CMakeLists.txt:28 (swig_add_module)


CMake Warning (dev) at /usr/share/cmake-3.13/Modules/UseSWIG.cmake:564 (message):
  Policy CMP0078 is not set.  Run "cmake --help-policy CMP0078" for policy
  details.  Use the cmake_policy command to set the policy and suppress this
  warning.
Call Stack (most recent call first):
  /usr/share/cmake-3.13/Modules/UseSWIG.cmake:525 (swig_add_library)
  python/CMakeLists.txt:28 (swig_add_module)
This warning is for project developers.  Use -Wno-dev to suppress it.

-- Building python bindings via swig. Will be installed under /usr/lib/python3.8/site-packages


So it correctly finds our host-python3 and does not get confused about
the python 2.7 / 3.7 on my build machine.

In what setup is it failing for you without this patch?

-- 
Bye, Peter Korsgaard
