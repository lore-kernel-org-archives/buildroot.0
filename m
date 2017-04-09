From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 16:05:29 +0200
Subject: [Buildroot] [PATCH 2/3] package/pngquant: new package
In-Reply-To: <20170408151804.11102-2-bernd.kuhls@t-online.de>
References: <20170408151804.11102-1-bernd.kuhls@t-online.de>
 <20170408151804.11102-2-bernd.kuhls@t-online.de>
Message-ID: <20170409160529.64e61007@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Apr 2017 17:18:03 +0200, Bernd Kuhls wrote:

> +define HOST_PNGQUANT_CONFIGURE_CMDS
> +	(cd $(@D) && \
> +		$(HOST_CONFIGURE_OPTS) \
> +		./configure --prefix=/usr \

--prefix=/usr is not correct for host packages, it should be
--prefix=$(HOST_DIR)/usr.

> +define HOST_PNGQUANT_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) PREFIX="$(HOST_DIR)/usr" -C $(@D) install

Then passing PREFIX= here becomes useless.

> +define PNGQUANT_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install

And here passing DESTDIR=$(TARGET_DIR) makes more sense, since
--prefix=/usr is passed at configuration time.

I've fixed this, and grouped together the host configure/build/install
commands, and then applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
