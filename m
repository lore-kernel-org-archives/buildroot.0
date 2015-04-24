From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 24 Apr 2015 22:16:18 +0200
Subject: [Buildroot] [PATCH 06/10 v7] package/nvidia-driver: Add gl.pc
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <09718509727afa315acf9e7b999f71243f2a67c3.1423597914.git.yann.morin.1998@free.fr>
Message-ID: <XnsA486E28EE4A92berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:09718509727afa315acf9e7b999f71243f2a67c3.1423597914.git.yann.morin.1998
@free.fr:

> +     $(INSTALL) -D -m 0644 package/nvidia-driver/gl.pc 
$(STAGING_DIR)/usr/lib/pkgconfig/gl.pc

Hi,

the nvidia package should not install gl.pc when
BR2_PACKAGE_NVIDIA_DRIVER_XORG is not set because in this case nvidia-driver 
is not a provider for libgl.

The reason for this autobuild error 
http://autobuild.buildroot.net/results/724/724fce8ce51c2c0578192b1369a1cfcea3
d72638/
in the vlc package is that vlc detects gl.pc from the nvidia package and 
tries to enable opengl support. Compiling this defconfig with "make vlc" 
alone works, if you compile nvidia-driver before vlc than the build breaks.

.config looks like this.

$ grep -i nvidia .config
BR2_PACKAGE_NVIDIA_DRIVER=y
# nvidia-driver X.org drivers needs a modular Xorg server
# BR2_PACKAGE_NVIDIA_DRIVER_CUDA is not set
# nvidia kernel module needs a kernel to be built

Regards, Bernd
