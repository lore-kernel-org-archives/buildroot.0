From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 8 Dec 2009 09:54:38 -0500
Subject: [Buildroot] linux-fusion build failure
In-Reply-To: <1260243219.5232.1.camel@RoadRunner>
References: <1260243219.5232.1.camel@RoadRunner>
Message-ID: <a038bef50912080654p11c7bec2gf189a5ffa82bfc4e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Dec 7, 2009 at 10:33 PM, Nicolae T <microvis@cox.net> wrote:
> Hi all,
>
> Can anyone explain what's going on here with linux-fusion build failing
> here?
> Thanks

I can provide my interpretation of the error messages although I will
caveat that I haven't actually tried building linux-fusion.

> cat: /home/nicolae/buildroot7Dec/output/build/.linux-version: No such file
> or directory

In package/linux-fusion/linux-fusion.mk it tries to determine the
linux version from a magic file '.linux_version' which in your
environment doesn't appear to exist.

This is created by 'make linux26-version' and/or 'make linux26'. In my
environment the magic file is there. Linux-fusion does appear to have
a dependency on linux26 so that _should_ have done the trick.  Maybe
something got cleaned? Anyway 'make linux26-version' should put the
file back.

> make[1]: Entering directory
> `/home/nicolae/buildroot7Dec/output/build/linux-fusion-8.0.2'
> rm -f linux/drivers/char/fusion/Makefile
> ln -s Makefile-2. linux/drivers/char/fusion/Makefile
> /usr/bin/make -C /home/nicolae/buildroot7Dec/output/build/linux- \

This is wrong. Probably because the kernel version could not be
determined this should be something like linux-2.6.30.2 (or whatever
your actual kernel is)

> ARCH=arm \
> CC=/home/nicolae/buildroot7Dec/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc
> \
> AS=/home/nicolae/buildroot7Dec/output/staging/usr/bin/arm-linux-uclibcgnueabi-as
> \
> CPPFLAGS=" \
> -I`pwd`/linux/include \
> -I/home/nicolae/buildroot7Dec/output/build/linux-/include \
> -I/home/nicolae/buildroot7Dec/output/build/linux-/include \
> -I/home/nicolae/buildroot7Dec/output/build/linux-/arch/arm/include \
> " \
> SUBDIRS=`pwd`/linux/drivers/char/fusion modules

> make: Entering an unknown directory
> make: *** /home/nicolae/buildroot7Dec/output/build/linux-: No such file or
> directory.? Stop.

This is the actual error message in the sub-make because it couldn't
find the directory to change to.

> make: Leaving an unknown directory
> make[1]: *** [all] Error 2
> make[1]: Leaving directory
> `/home/nicolae/buildroot7Dec/output/build/linux-fusion-8.0.2'
> make: ***
> [/home/nicolae/buildroot7Dec/output/build/linux-fusion-8.0.2/.install] Error
> 2

And this is a flow-on error from the one above.

Taking a closer look at my environment I don't think linux-fusion
would build for me either because `cat output/build/.linux-version`
gives 2.6.30.2-00249-g25a3f99 but `ls output/build/ | grep linux`
gives linux-2.6.30.2

At a guess I'd suggest the following patch but its completely untested.

-------8<-------
From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 8 Dec 2009 09:44:13 -0500
Subject: [PATCH] linux-fusion: use buildroots kernel version

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/linux-fusion/linux-fusion.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk
b/package/linux-fusion/linux-fusion.mk
index 058e965..85b9c10 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -13,7 +13,7 @@ LINUX_FUSION_INSTALL_TARGET = YES
 # BR2_LINUX26_VERSION is not really dependable
 # LINUX26_VERSION is not yet set.
 # Retrieve REAL kernel version from file.
-LINUX_FOR_FUSION=`cat $(BUILD_DIR)/.linux-version`
+LINUX_FOR_FUSION=BR2_KERNEL_CURRENT_VERSION

 LINUX_FUSION_DIR:=$(BUILD_DIR)/linux-fusion-$(LINUX_FUSION_VERSION)
 LINUX_FUSION_ETC_DIR:=$(TARGET_DIR)/etc/udev/rules.d
--
1.6.4.2
-------8<-------
