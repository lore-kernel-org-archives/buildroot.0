From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 28 Jan 2020 12:17:36 +0100
Subject: [Buildroot] Fwd: Building helloworld package
In-Reply-To: <CAL=12L0cJNEKwgZ7qVTs-4xGh2HNxCTBU7PsYa+iqpc4yd2HHQ@mail.gmail.com>
References: <CAL=12L3JEZrrx_vW=XYBob4x1_vN1yP+TNvtKH=UPOAM0Eg-9Q@mail.gmail.com>
 <CAL=12L0cJNEKwgZ7qVTs-4xGh2HNxCTBU7PsYa+iqpc4yd2HHQ@mail.gmail.com>
Message-ID: <20200128121736.049bf4f3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

please try to send your e-mails as plain text instead of html (the default looks garbled like
this http://lists.busybox.net/pipermail/buildroot/2020-January/272348.html)...

> Hi!! I have a ZCU102 (Xilinx) board and I'm trying to build a linux with a simple package, helloworld.
> 
> I've been following this page --> https://techfortalk.co.uk/2017/06/16/how-to-create-a-new-package-under-buildroot/

You seem to have it a little mixed up with
	https://techfortalk.co.uk/2017/06/15/how-to-addcompile-a-kernel-module-as-a-new-buildroot-package/

And the page how-to-create-a-new-package-under-buildroot contains some typos/mistakes..., but
the following should work in your case:

> 
> - My package/Config.in is:
> config BR2_PACKAGE_PAQPRUEBAADRI
>        bool "paqpruebaadri"
>        help
>                This is sample package.
> 

package/paq_prueba_adri/Config.in:

config BR2_PACKAGE_PAQ_PRUEB_AADRI
	bool "paq-prueba-adri"
	help
	  This is sample package.

> - My package/paq_prueba_adri.mk is:
> paqpruebaadri_MODULE_VERSION = 1.0
> paqpruebaadri_SITE = /home/adrian/Documents/codigo_holamundo
> paqpruebaadri_SITE_METHOD = local
> paqpruebaadri_LICENSE = GPLv2
> paqpruebaadri_LICENSE_FILES = COPYING
> paqpruebaadri_MODULE_MAKE_OPTS = \
>         CONFIG_DUMMY1= \
>         CONFIG_DUMMY2=y
> 
> define ADRI_BUILD_CMDS
> $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> endef
> 
> define ADRI_INSTALL_TARGET_CMDS
> $(INSTALL) -D -m 0755 $(@D)/adritest $(TARGET_DIR)/bin
> $(INSTALL) -D -m 0755 $(@D)//run_adritest.sh $(TARGET_DIR)/bin
> $(TARGET_DIR)/root
> endef
>  
> $(eval $(generic-package))

package/paq_prueba_adri/paq_prueba_adri.mk

PAQ_PRUEBA_ADRI_VERSION = 1.0
PAQ_PRUEBA_ADRI_SITE = /home/adrian/Documents/codigo_holamundo
PAQ_PRUEBA_ADRI_SITE_METHOD = local
PAQ_PRUEBA_ADRI_LICENSE = GPLv2
PAQ_PRUEBA_ADRI_LICENSE_FILES = COPYING

define PAQ_PRUEBA_ADRI_BUILD_CMDS
$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define PAQ_PRUEBA_ADRI_INSTALL_TARGET_CMDS
$(INSTALL) -D -m 0755 $(@D)/holamundo $(TARGET_DIR)/bin
endef
 
$(eval $(generic-package))

> 
> - And, inside of the main Config.in, I've written:
> menu "Target packages"
> 
> source "package/busybox/Config.in"CC := gcc

all: holamundo

holamundo: holamundo.c
	$(CC) $(CFLAGS) -o holamundo holamundo.c

> source "package/skeleton/Config.in"
> source "package/skeleton-custom/Config.in"
> source "package/skeleton-init-common/Config.in"
> source "package/skeleton-init-none/Config.in"
> source "package/skeleton-init-systemd/Config.in"
> source "package/skeleton-init-sysv/Config.in"
> 
> --> menu "Paq prueba ADRI"                                            <--
> -->         source "package/paq_prueba_adri/Config.in"  <--
> --> endmenu                                                                        <--
> 
> menu "Audio and video applications"
> source "package/alsa-utils/Config.in"
> source "package/atest/Config.in"
> .
> .
> .

package/Config.in:

[...]
menu "Paq prueba ADRI"
        source "package/paq_prueba_adri/Config.in
endmenu
[...]

> CC := gcc

all: holamundo

holamundo: holamundo.c
	$(CC) $(CFLAGS) -o holamundo holamundo.c

> - The code and make files are:
> #include <stdio.h>
> 
> int main()
> {
>         printf("Hola mundo");
>         return 0;
> }
> 

Should be o.k. (if stored under /home/adrian/Documents/codigo_holamundo/holamundo.c)...

> 
> holamundo:
> /home/adrian/Documents/ZCU-102/buildroot-2019.02.3/output/host/usr/bin/aarch64-linux-gnu-gcc holamundo.c
> 

/home/adrian/Documents/codigo_holamundo/Makefile:

CC := gcc
CFLAGS := -Wall -g

all: holamundo

holamundo: holamundo.c
	$(CC) $(CFLAGS) -o holamundo holamundo.c


> But, when I boot the board, I don't find anything about my package.
> Am I following the correct steps?

Make sure BR2_PACKAGE_PAQ_PRUEB_AADRI is enabled in your buildroot .config file...

In case of failure don't hesitate to ask further questions and/or send the output
from:
	$ rm -rf build/paq_prueba_adri-1.0 && make paq_prueba_adri VERBOSE=1

Regards,
Peter

> 
> Thanks, Adri?n.
> 
