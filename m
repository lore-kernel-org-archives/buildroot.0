From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 14:51:32 +0100
Subject: [Buildroot] [PATCH 2/2] libvncserver: add config option for
 tightpng encoding support
In-Reply-To: <b66fd2b4894b872b928f81fdf13998ec@to-the-max.net>
References: <1419554775-11560-1-git-send-email-bos@je-eigen-domein.nl>
 <1419554775-11560-2-git-send-email-bos@je-eigen-domein.nl>
 <20141226180839.53e2df6f@free-electrons.com>
 <b66fd2b4894b872b928f81fdf13998ec@to-the-max.net>
Message-ID: <20141227145132.1c48523a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Fri, 26 Dec 2014 18:37:15 +0100, Floris Bos wrote:

> JPEG and PNG are both necesarry.
> 
> Libvncserver will only compile tight.c if HAVE_LIBJPEG
> 
> https://github.com/LibVNC/libvncserver/blob/master/libvncserver/Makefile.am#L49
> 
> And inside tight.c png is optional, jpeg is not.

Ok, so I believe we should rather do:

+config BR2_PACKAGE_LIBVNCSERVER_TIGHTPNG
+	bool "TightPNG encoding support"
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	help
+	  TightPNG encoding speeds up HTML5 based VNC clients like noVNC.
+
+	  http://wiki.qemu.org/VNC_Tight_PNG

in Config.in (i.e as you did)

And then in libvncserver.mk, do:

ifeq ($(BR2_PACKAGE_LIBPNG),y)
LIBVNCSERVER_DEPENDENCIES += libpng
else
LIBVNCSERVER_CONF_OPTS += --without-png
endif

This way, people not using tightpng support but having libpng enabled
will have PNG support in libvncserver.

Can you rework your patch in this direction?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
