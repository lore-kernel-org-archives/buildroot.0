From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 23:33:34 +0200
Subject: [Buildroot] [PATCH] mmc-utils: use upstream provided install
 target
In-Reply-To: <458a66622f1ede03edf340d7f05d52f971eabc79.1504510840.git.baruch@tkos.co.il>
References: <458a66622f1ede03edf340d7f05d52f971eabc79.1504510840.git.baruch@tkos.co.il>
Message-ID: <20170906233334.328e7d87@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Sep 2017 10:40:40 +0300, Baruch Siach wrote:
>  define MMC_UTILS_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/mmc $(TARGET_DIR)/usr/bin/mmc
> +	prefix=$(TARGET_DIR) $(MAKE) -C $(@D) install
>  endef

This is not entirely correct, for a few reasons: first, your patch
introduces a difference as the "mmc" program is now installed
in /bin/mmc and not /usr/bin/mmc, which isn't nice.

Also, it mis-uses prefix, as DESTDIR should be used. The correct
use is prefix=/usr (to override the default of /usr/local) and
DESTDIR=$(TARGET_DIR).

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
