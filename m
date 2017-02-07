From: LogiSch17 <logi.tss@hotmail.de>
Date: Tue, 7 Feb 2017 00:34:45 -0800 (PST)
Subject: [Buildroot] BR2_EXTERNAL tree - Config.in can`t open
 /package/Config.in after Update to 2016.11
Message-ID: <1486456485390-156297.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,
i have the following problem, i just update to 2016.11 from 2016.05 .
Then i converted my br2_external trees as descripted.
After that when i am tyring to make, or make menuconfig i get:

[lorenz at lorenzPc mattros]$ make
make -C /home/lorenz/mattros/buildroot O=/home/lorenz/mattros/ziesel/output
BR2_EXTERNAL_ZIESEL_PATH=/home/lorenz/mattros PROJECT_NAME=ziesel
BR2_DEFCONFIG=/home/lorenz/mattros/ziesel/defconfig defconfig
  GEN     /home/lorenz/mattros/ziesel/output/Makefile
/home/lorenz/mattros/Config.in:1: can't open file "/pigpio/Config.in"
make[1]: *** [Makefile:875: defconfig] Fehler 1
make: *** [common.mk:41: default] Fehler 2


I am using the following directory structure:
-board 
     +ziesel
          +cmdline.txt
          +...
-buildroot
    +..
-overlays
    +..
-patches
    +..
-pigpio
     +Config.in
     +libpigpio.mk
-rtimu
     +Config.in
     +rtimu.mk
-ziesel-gui
     +Config.in
     +ziesel-gui.mk
     +src
         +myProgramm..
-ziesel
      + defconfig
      + output
-common.mk
-Config.in
-external.desc
-external.mk
-Makefile

This is my external.desc:
name: ZIESEL

my Config.in:
source "$BR2_EXTERNAL_ZIESEL_PATH/pigpio/Config.in"
source "$BR2_EXTERNAL_ZIESEL_PATH/ziesel-gui/Config.in"
source "$BR2_EXTERNAL_ZIESEL_PATH/rtimu/Config.in"

my external.mk:
include $(BR2_EXTERNAL_ZIESEL_PATH)/pigpio/libpigpio.mk
include $(BR2_EXTERNAL_ZIESEL_PATH)/ziesel-gui/ziesel-gui.mk
include $(BR2_EXTERNAL_ZIESEL_PATH)/rtimu/rtimu.mk

my Makefile:
PROJECT_NAME := ziesel

include common.mk

and here is my /pigpio/Config.in:
config BR2_PACKAGE_PIGPIO
	bool "libpigpio"
	help
	  libpigpio is a C library for the Raspberry Pi which allows control of the
general purpose input outputs (gpios).

before i updated everything worked perfekt.
I am not sure what i am doing wrong here.
When i remove pigpio from Config.in and external.mk , i get the same error
for ziesel-gui





--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/BR2-EXTERNAL-tree-Config-in-can-t-open-package-Config-in-after-Update-to-2016-11-tp156297.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
