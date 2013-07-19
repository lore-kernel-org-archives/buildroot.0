From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 19 Jul 2013 07:29:12 +0200
Subject: [Buildroot] Problem compiling local code
In-Reply-To: <4FDB62BA-61E8-4C1C-8835-61BC2DCF0FA4@deadfrog.net>
References: <4FDB62BA-61E8-4C1C-8835-61BC2DCF0FA4@deadfrog.net>
Message-ID: <CAAXf6LXmwk0NwheagUtnSX5u9iZei2ieJLs6+XyFqRXm4zKSyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Fri, Jul 19, 2013 at 6:11 AM, Ryan Wilkins <ryan@deadfrog.net> wrote:
> Hello,
>
> I'm having an issue that I can't quite seem to figure out.  The problem I'm having is that I'm trying to add a custom package for buildroot to compile and add to a finished image.  It was simple to get the selection box show up for my sample project in menuconfig, but buildroot never seems to compile my code and install it.  I created a simple program, a hello world kind of thing, including a Makefile.  The program compiles and runs properly if I run "make" manually from the directory and run the executable.  I've created the Config.in and .mk files according to the buildroot documentation online or so I think.
>
> My environment is a x86_64 host cross compiling for x86.  Buildroot is 2013.05.  Toolchain is Sourcery CodeBench 2012.09.  Everything else in buildroot appears to build properly as I've had the produced image loaded and running on the target device and it works fine.  It just lacks my simple program
>
> I'm guessing the issue is with my hello.mk so below is that file.  Can anyone point me in a direction of what I might be doing wrong?
>
> Thanks much!
>
> Ryan Wilkins
>
>
>
> #####
> #
> # hello test program
> #
> #####
>
> HELLO_VERSION = 0.1
> HELLO_SOURCE = hello-$(HELLO_VERSION).tar.gz
> HELLO_SITE = /vm/omnia/src/hello/
> HELLO_SITE_METHOD = file
> #HELLO_LICENSE = Proprietary
> #HELLO_LICENSE_FILES =
> #HELLO_INSTALL_STAGING =
> #HELLO_CONFIG_SCRIPTS =
> #HELLO_DEPENDENCIES =
>
> define HELLO_BUILD_CMDS
>         $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) hello
> endef
>
> define HELLO_INSTALL_TARGET_CMDS
>         $(INSTALL) -m 0755 $(@D)/hello $(TARGET_DIR)/usr/bin
> endef
>
> $(eval $(generic-package))

Is there any output regarding the hello package, like 'downloading',
'extracting', 'building', etc. or nothing at all?
What is the name of the config option that you added, and are you sure
it's enabled in .config?

What happens if you explicitly run 'make hello' ?

Depending on what you did before, you may also need to clear previous
attempts from the output, for example with:
make hello-dirclean

If the hello package is seen correctly by buildroot, but the
compilation doesn't work correctly, you may want to add
KBUILD_VERBOSE=1 to the make command, to see the actual make command
executed.

Best regards,
Thomas
