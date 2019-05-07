From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 7 May 2019 22:40:38 +0200
Subject: [Buildroot] [RFC PATCH 1/1] iputils: Bump to version s20190324
In-Reply-To: <20190505232923.22744-1-petr.vorel@gmail.com>
References: <20190505232923.22744-1-petr.vorel@gmail.com>
Message-ID: <20190507224038.0e11b51b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

On Mon,  6 May 2019 01:29:23 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> I'm trying to update iputils for Buildroot to newest version s20190324,
> which changed build system to Meson. I cannot figure out which compiler
> option is missing / wrong, or which dependency is missing or which
> buildroot config is missing wrong. Any tip / idea?

ping6_common.c lacks:

#include <stddef.h>

once added, it builds fine. The installation then fails because:

define IPUTILS_INSTALL_TARGET_CMDS
        $(INSTALL) -D -m 755 $(@D)/arping      $(TARGET_DIR)/sbin/arping
        $(INSTALL) -D -m 755 $(@D)/clockdiff   $(TARGET_DIR)/bin/clockdiff
        $(INSTALL) -D -m 755 $(@D)/ping        $(TARGET_DIR)/bin/ping
        $(INSTALL) -D -m 755 $(@D)/rarpd       $(TARGET_DIR)/sbin/rarpd
        $(INSTALL) -D -m 755 $(@D)/rdisc       $(TARGET_DIR)/sbin/rdisc
        $(INSTALL) -D -m 755 $(@D)/tftpd       $(TARGET_DIR)/usr/sbin/in.tftpd
        $(INSTALL) -D -m 755 $(@D)/tracepath   $(TARGET_DIR)/bin/tracepath
        $(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
endef

is no longer correct, as binaries are now produced in $(@D)/build/. But
probably we could use the standard installation procedure of the meson
build system instead of having custom install commands ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
