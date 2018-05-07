From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 09:16:35 +0200
Subject: [Buildroot] regarding creating my own customized package in
 buildroot and use it in my OS in Raspberry Pi
In-Reply-To: <CANMfZMiHNh87+NfnNfYiKpOZGx5uKXwytgF9g2CQhViP5CTfrg@mail.gmail.com>
References: <CANMfZMiHNh87+NfnNfYiKpOZGx5uKXwytgF9g2CQhViP5CTfrg@mail.gmail.com>
Message-ID: <20180507091635.028c4a6b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 7 May 2018 12:32:39 +0530, s.vineeth amalraj wrote:

> I am Vineeth. I would like to create a simple python package in my

You're saying "python package" here, but below, you try to build a C
program.

> 4. Next under *tamil.mk <http://tamil.mk/>* file the below code is pasted:
> 
> *TAMIL_MODULE_VERSION = 1.0*
> *TAMIL_SITE = /home/sands/Documents/vineeth/testtamil.c*

This should be a folder, not a file. I also recommend to use a relative
path, for example:

	TAMIL_SITE = $(TOPDIR)/../tamil/

> *TAMIL_SITE_METHOD = local*
> *TAMIL_LICENSE = GPLv2*
> *TAMIL_LICENSE_FILES = COPYING*
> *TAMIL_MODULE_MAKE_OPTS = \*
> *        CONFIG_DUMMY1= \*
> *        CONFIG_DUMMY2=y*
> 
> *define KERNEL_MODULE_BUILD_CMDS*
> *        $(MAKE) -C '$(@D)' LINUX_DIR='$(LINUX_DIR)' CC='$(TARGET_CC)'
> LD='$(TARGET_LD)' modules*
> *endef*
> 
> *$(eval $(kernel-module))*

Why are you trying to build it as a kernel module ? The program source
code you have below is just a user-space program.

> 6. I created a file named *testtamil.c* and saved in /home/sands/Documents/
> vineeth/testtamil.c.  and in the file testtamil.c i have pasted the below
> code:
> 
> *#include<stdio.h>*
> *int main()*
> *{*
> *printf("tamil is tested\n");*
> *printf("working fine");*
> 
> *return 1;*
> *}*

This is just a user-space program. Why do you think you need to use the
"kernel-module" infrastructure ?

> *Issue:* This is reflecting in *make menuconfig* but not building and
> getting make error and below is the error which i faced.
> 
> ERROR: /home/sands/Documents/vineeth/testtamil.c does not exist
> package/pkg-generic.mk:194: recipe for target '/home/sands/Documents/vineeth
> /buildroot-at91/output/build/tamil/.stamp_rsynced' failed
> make[1]: *** [/home/sands/Documents/vineeth/buildroot-at91/output/build/tamil/.stamp_rsynced]
> Error 1
> Makefile:79: recipe for target '_all' failed
> make: *** [_all] Error 2

Please make sure TAMIL_SITE points to a folder, not a file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
