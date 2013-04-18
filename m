From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Apr 2013 14:29:54 +0200
Subject: [Buildroot] configure error while trying to add package git
In-Reply-To: <9BAF5BF9BE8F4D08B0E74E8595853989@JohanW7>
References: <9BAF5BF9BE8F4D08B0E74E8595853989@JohanW7>
Message-ID: <20130418142954.6cb3b00a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Thu, 18 Apr 2013 14:21:06 +0200, Sagaert Johan wrote:

> The configure script throws :
>  
> configure: error: cannot run test program while cross compiling

This happens when a configure.ac script has a AC_RUN_IFELSE() test. It
tries to run programs, which is not possible when cross-compiling. So
you need to tell the configure script what is the result of those
tests, so that it doesn't execute them. In the case of Git, it should
be:

GIT_CONF_ENV = \
	ac_cv_fread_reads_directories=<yes or no> \
	ac_cv_snprintf_returns_bogus=<yes or no>

Of course, you still have to figure out what's the right value to put.

> #resolves to tag 1.8.2.1 
> GIT_VERSION         = 5bda18c186e455f8e65f976d3bf333ab1f4b5b53

Then just use GIT_VERSION = 1.8.2.1

Just curious, why are you packaging Git? Remember that we are
deprecating the support for the toolchain on the target, so if what you
want to achieve is build C/C++ code on the target, you're probably not
on the right track.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
