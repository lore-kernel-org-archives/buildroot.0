From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 21:12:20 +0200
Subject: [Buildroot] [PATCH v2] pulseview: new package
In-Reply-To: <CAMpxmJUeJms2BVLVrhsgm7d1MegO-hV1XUEPwUgiCc7Z81Mfgg@mail.gmail.com>
References: <1426759708-4920-1-git-send-email-bgolaszewski@baylibre.com>
 <20150406234303.010225ea@free-electrons.com>
 <CAMpxmJXWnzUwgM7EQ3De4OCAprJ1oFVecYMD8j+xa7dU8co1qA@mail.gmail.com>
 <20150408162905.4cfbc0a3@free-electrons.com>
 <CAMpxmJUeJms2BVLVrhsgm7d1MegO-hV1XUEPwUgiCc7Z81Mfgg@mail.gmail.com>
Message-ID: <20150408211220.3e34e66a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Wed, 8 Apr 2015 18:05:38 +0200, Bartosz Golaszewski wrote:

> still no success. The reason for pulseview failures is libsigrokcxx.so
> not being present on the target. Please consider applying the attached
> patch, which should let us know what the reason is for libsigrokcxx
> silent failures.

I've reproduced the problem in the autobuilder directly, and the
problem is fairly clear:

ESC[3m>>> libsigrok 380ee96fdfe0895ca0aa0b158d5c332ef08f8b3c ConfiguringESC[23m
mkdir -p /home/test/outputs/1f018c927c31e5302bfac85fd8e4ecb2fd5d38f3/output/build/libsigrok-380ee96fdfe0895ca0aa0b158d5c332ef08f8b3c/autostuff
ESC[3m>>> libsigrok 380ee96fdfe0895ca0aa0b158d5c332ef08f8b3c AutoreconfiguringESC[23m
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'autostuff'.
libtoolize: copying file 'autostuff/ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'autostuff'.
libtoolize: copying file 'autostuff/libtool.m4'
libtoolize: copying file 'autostuff/ltoptions.m4'
libtoolize: copying file 'autostuff/ltsugar.m4'
libtoolize: copying file 'autostuff/ltversion.m4'
libtoolize: copying file 'autostuff/lt~obsolete.m4'
configure.ac:42: installing 'autostuff/ar-lib'
configure.ac:42: installing 'autostuff/compile'
configure.ac:37: installing 'autostuff/config.guess'
configure.ac:37: installing 'autostuff/config.sub'
configure.ac:40: installing 'autostuff/install-sh'
configure.ac:40: installing 'autostuff/missing'
Makefile.am: installing './INSTALL'
Makefile.am: installing 'autostuff/depcomp'
parallel-tests: installing 'autostuff/test-driver'
ESC[3m>>> libsigrok 380ee96fdfe0895ca0aa0b158d5c332ef08f8b3c Patching libtoolESC[23m
[...]
Enabled language bindings:
 - C++............................. no (Doxygen required)

So, generating the C++ bindings requires Doxygen. And Doxygen is not
part of the mandatory Buildroot dependencies, and not packaged in
Buildroot as a host package.

The reason why it works for you is because you have Doxygen installed
on your machine. Several of the autobuilders run in a minimal chroot
that has only the strict requirements of Buildroot installed, nothing
else, specifically to detect such issues.

So, in the mean time, I've marked libsigrokcxx as broken, as well as
pulseview. I believe the best solution is probably to create a
host-doxygen package (or convince the libsigrok developers to not use
something such as doxygen to generate C++ bindings). Can you look into
this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
