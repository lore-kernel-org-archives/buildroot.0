From: Markus Mayer <mmayer@broadcom.com>
Date: Tue, 21 Jan 2020 15:09:55 -0800
Subject: [Buildroot] [PATCH 0/1] system/Config.in: introduce pre-build script
Message-ID: <20200121230956.23129-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am writing a separate "cover letter" for this change, even though it is
just a single patch, and a small one at that. But I think an explanation and
some background is helpful, which would be too long to include in the patch
itself.

Very recently, we discovered the need to run some prepatory steps before
launching a Buildroot build.

Specifically, we are building ARM64 images that also contain a 32-bit
run-time environment from an Aarch32 toolchain (just the shared libraries
and ld.so from sys-root, nothing fancier than that). -- No, we aren't doing
this for fun, but because there are some binaries, which we don't have the
sources for, that only come as 32-bit variants and they need to be able to
execute in an ARM64 environment, as well.

We used to use /lib64 and /lib to store the shared libraries in the target
file system. However, we have come to realize that using /lib and /lib32
makes a lot of things much easier (/lib64 merely becomes a symlink to /lib
in this setup) and began the transition.

However, introducing the change leads to a problem for developers they don't
expect: they simply update their GIT repo as they are used to doing, and
suddenly their already existing build is inconsistent with what is now
expected, whereas in the past it has always been possible to do an
incremental build even after a "git pull."

Enter a pre-build script that checks if /lib64 is a directory and not a
symlink. If so, it removes $TARGET_DIR and all .stamp_target_installed files
from the build/ directory. Problem solved: the $TARGET_DIR will be
re-populated with the proper directory layout, even if only an incremental
build is being performed. The developers (who aren't Buildroot experts and
don't really care what mechanims we use to build our file system as long as
it works) don't have to remember to run any additional steps manually nor do
they have to rebuild everything from scratch or end up running into
inexplicable build errors. Instead, the build system knows all on its own to
do this additional step only once and only when actually required.

While the reason we want a pre-build script at this point in time is very
specific to our setup, I am sure others have come across reasons of their
own why such a feature might be helpful. Also, the feature seems to be
pretty non-intrusive and adds hardly any overhead if not used.

Only after I came up with the attached patch did I do a quick Google search
and discovered that there was an attempt almost seven years ago of adding
the same feature. The patch here is almost identical to my proposal:

https://patchwork.ozlabs.org/patch/220466/

It looks like it was denied at the time. I am not exactly sure why. Maybe
because the author didn't answer the questions regarding the use case?

In the hopes of a different outcome, I wrote this detailed description
above. And, of course, I am more than willing to tweak and adapt this patch
based community input and proposals.

Regards,
-Markus


Markus Mayer (1):
  system/Config.in: introduce pre-build script

 Makefile         |  3 +++
 system/Config.in | 10 ++++++++++
 2 files changed, 13 insertions(+)

-- 
2.17.1
