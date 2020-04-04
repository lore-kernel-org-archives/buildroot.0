From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 4 Apr 2020 19:43:19 +0200
Subject: [Buildroot] systemd 245 build issues with the old codesourcery ARM
 2014.05 toolchain
Message-ID: <dc50e1db-aead-b8f5-cfd8-6645e433429f@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

Since the last systemd bump to version 245, all our systemd based tests are
failing to build:

https://gitlab.com/buildroot.org/buildroot/-/jobs/498144403
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144405
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144406
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144408
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144410
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144412

This is due to the following build issue:

../src/shared/gpt.c:7:9: error: initializer element is not constant
         { GPT_ROOT_X86,              "root-x86"              },

Note that gpt.c is a new file introduced in the last release of systemd:

https://github.com/systemd/systemd/blob/v245/src/shared/gpt.c

Such issue would have trigged a lot of build issues on the autobuilders, but
that's not the case:

http://autobuild.buildroot.org/?reason=systemd-245

The build is failing only when the toolchain codesourcery ARM 2014.05 is used.

So, it's seems a toolchain issue.

I did a test with a toolchain using gcc 5.5.0 and the build is ok.

http://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi--glibc--stable-2017.05-toolchains-1-1.tar.bz2

While searching for "error: initializer element is not constant" message, I
noticed a note about gcc 5 change about "Initializing statics with compound
literals":

https://gcc.gnu.org/gcc-5/porting_to.html

I'm not sure it's worth the effort to patch and try to upstream a patch to
systemd for the sake of building systemd with such old compiler (gcc < 5.0).

We can instead update the testsuite to use the Bootlin toolchain 2017.05, but it
mean testing with an old toolchain that can't even be build with the current
version of Buildroot. Maybe the Bootlin 2018.11-1 toolchain would be more
suitable (gcc 7.x) or even better the upcoming 2020.02-2 toolchain ?

Thoughts ?

Best regards,
Romain
