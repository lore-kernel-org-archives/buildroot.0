From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Apr 2013 15:31:28 +0200
Subject: [Buildroot] buildroot still compiles C++ code when C++ compiler
 is unavailable
In-Reply-To: <klacea$3sl$1@ger.gmane.org>
References: <klacea$3sl$1@ger.gmane.org>
Message-ID: <20130425153128.71c7c44f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adam Nielsen,

On Thu, 25 Apr 2013 14:46:05 +1000, Adam Nielsen wrote:

> After a successful build and changing some settings, I'm struggling
> to get a second successful build.  I had to select a newer version of
> GCC to avoid some segfaults, but now when compiling I get these
> errors:
> 
> checking whether to build shared libraries... yes
> checking whether to build static libraries... yes
> checking how to run the C++ preprocessor... /lib/cpp
> configure: error: in 
> `buildroot/build/gettext-0.18.2.1/gettext-runtime/libasprintf':
> configure: error: C++ preprocessor "/lib/cpp" fails sanity check
> See `config.log' for more details
> configure: error: ./configure failed for libasprintf
> configure: error: ./configure failed for gettext-runtime
> 
> According to Google it's because I don't have a C++ compiler
> installed, which is correct, I had originally compiled it, but then I
> deselected it in the buildroot config as the library was too big to
> fit in my device's flash memory.
> 
> I was assuming buildroot would now omit those packages that require
> C++, but it looks like I am wrong.  Is there an easy way to find out
> which packages depend on C++ and tell buildroot not to build them,
> now I have deselected C++ support?

All packages that depend on C++ have the 'depends on
BR2_INSTALL_LIBSTDCPP' dependency, so they are not selectable when C++
is not available.

However, did you do a complete 'make clean; make' cycle after disabling
C++ support? Buildroot doesn't track the configuration changes you're
making, so when you make a change as big in consequences as disabling
C++, you should do a complete rebuild.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
