From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Nov 2012 17:40:00 +0100
Subject: [Buildroot] [PATCH] busybox: needs linux-pam dependency added
 if using custom busybox .config & busybox login applet
In-Reply-To: <1353197713-20796-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1353197713-20796-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20121118174000.0fe79ef6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Sun, 18 Nov 2012 02:15:13 +0200, Stefan Fr?berg wrote:

> +# linux-pam must be built first if user has custom
> +# BusyBox .config file and that file has also login
> +# applet (CONFIG_LOGIN) enabled.
> +ifeq ($(shell sed -n "s/CONFIG_LOGIN=\(y\)/\1/p" $(BR2_PACKAGE_BUSYBOX_CONFIG)),y)
> +BUSYBOX_DEPENDENCIES += linux-pam
> +endif

I don't think this will work nicely. BR2_PACKAGE_BUSYBOX_CONFIG is the
source for the Busybox configuration, but the user can do "make
busybox-menuconfig" do adjust it. In this case, the contents of the
BR2_PACKAGE_BUSYBOX_CONFIG file and the contents of the real
configuration file used by Busybox are different. If the latter has
CONFIG_LOGIN, but not the former, then you will not link against
linux-pam while you should.

It is really difficult to have dependencies that are needed only when
some specific Busybox features are enabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
