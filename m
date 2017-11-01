From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 20:56:25 +0100
Subject: [Buildroot] [PATCH] package/nmap: fix libssh2 test
In-Reply-To: <20171101121955.15426-1-jcmvbkbc@gmail.com>
References: <20171101121955.15426-1-jcmvbkbc@gmail.com>
Message-ID: <20171101205625.5ea3b3ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Nov 2017 15:19:55 +0300, Max Filippov wrote:
> nmap configure script adds '-lm' to the list of included headers when it
> runs the test that checks the presence of libssh2.h. The test fails and
> nmap tries to build and use bundled libssh2.
> Fix the test.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/9e636919c98cd31b5067c8306d0e481a672434cf
>   http://autobuild.buildroot.net/results/912561f505ad10d1eaa96dbe247d5838e9968e14
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

I committed a different version of your patch, but based on the same
idea. The main changes are:

 - Instead of dropping -lm entirely, I keep it, but at the right place,
   i.e as the fifth argument of the AC_CHECK_LIB() call rather than as
   an argument of the AC_CHECK_HEADER() call.

 - Instead of patching the configure script, I'm doing an autoconf (but
   not a full autoreconf, as that doesn't work, as you and Baruch have
   noticed). It is worth mentioning that Debian has a nmap patch that
   fixes the AC_DEFINE() issues, but then I fell into another problem:
   there is no Makefile.am in the top-level source directory, and
   therefore automake complains. This is why I resorted to using just
   autoconf.

See
https://git.buildroot.org/buildroot/commit/?id=302ab5ed258c366dfc3853954ef9ec20b22661ce
for what I ended up committing.

Thanks for all the research. Could you submit the patch to upstream
nmap?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
