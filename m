From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Dec 2008 09:17:21 +0100
Subject: [Buildroot] Builroot Make Error (
In-Reply-To: <BAY124-W558A56205B09EF85A2940ED2030@phx.gbl>
References: <BAY124-W558A56205B09EF85A2940ED2030@phx.gbl>
Message-ID: <20081203091721.70003613@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 2 Dec 2008 16:45:13 -0800,
Quick X <quickx@hotmail.com> a ?crit :

> make menuconfig > Target Options > Atmel Device Support > Secondary
> locations (*** Package support ***) > also copy the image to... 
> If this value is set to nothing "()" then you get a "mkdir -p"
> "mkdir: missing operand" "Error 1" problem, most the other "Copy To"
> Locations allow you to not copy if you wish it. [...]

There's a missing test in
target/device/Atmel/at91bootstrap/at91bootstrap.mk, fixed by the
attached patch. But I think your problem is occuring in
target/device/Atmel/u-boot/u-boot.mk, which uses TARGET_ATMEL_COPYTO
without testing if it's set or not. A more slightly more complicated
fix is needed here.

Sincerly,

Thomas

---
 target/device/Atmel/at91bootstrap/at91bootstrap.mk |    2 ++
 1 file changed, 2 insertions(+)

Index: buildroot2/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- buildroot2.orig/target/device/Atmel/at91bootstrap/at91bootstrap.mk
+++ buildroot2/target/device/Atmel/at91bootstrap/at91bootstrap.mk
@@ -63,7 +63,9 @@
 $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY): $(AT91BOOTSTRAP_TARGET)
 	mkdir -p $(BINARIES_DIR)
 	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
+ifneq	($(TARGET_ATMEL_COPYTO),)
 	cp $(AT91BOOTSTRAP_TARGET) $(BR2_TARGET_ATMEL_COPYTO)/$(AT91BOOTSTRAP_BINARY)
+endif
 
 .PHONY: at91bootstrap at91bootstrap-source
 


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
