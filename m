From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 16:07:16 +0200
Subject: [Buildroot] [PATCH v3 1/2] host-zynq-boot-bin: new package
In-Reply-To: <1435063751-27344-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
References: <1434971728-16094-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1435063751-27344-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1435063751-27344-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
Message-ID: <20150704160716.347e3e35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Viktorin,

On Tue, 23 Jun 2015 14:49:10 +0200, Jan Viktorin wrote:
> From: Jan Viktorin <viktorin@rehivetech.com>
> 
> The package creates file images/boot.bin to boot
> Xilinx Zynq based boards. It might not work with
> U-Boot older then 2015.07.
> 
> The script zynq-boot-bin.py is contained in the
> Xilinx repository of U-Boot (it is not in upstream).
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>

After reading the discussion with Arnout and Yann, here is what I'd
personally prefer to see for this:

 * A host-zynq-boot-bin package, which only downloads and installs the
   Python script to $(HOST_DIR)/usr/bin. If the script is Python 2 only
   then you must make it depend on host-python, because the system
   Python can be either Python 2 or 3. If however, the script is Python
   2 and Python 3 compatible, there is no need to add a host-python
   dependency, because we can use the system provided Python
   interpreter.

 * One of the two following solutions:

   - An extension of the U-Boot Config.in + uboot.mk to optionally
     generated a Zynq image. It would add host-zynq-boot-bin in the
     dependencies of U-Boot, and call the Python script at the right
     time. Something along the lines of:

ifeq ($(BR2_TARGET_UBOOT_ZYNQ_IMAGE),y)
define UBOOT_GENERATE_ZYNQ_IMAGE
	$(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/zynq-..py -o $(BINARIES_DIR)/...
endef
UBOOT_DEPENDENCIES += host-zynq-boot-bin
UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_GENERATE_ZYNQ_IMAGE
endif

   - Just not do anything special in U-Boot, and add an entry in
     menuconfig to enable the host-zynq-boot-bin package, and in your
     board configuration, write a post-build script that generates the
     final image.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
