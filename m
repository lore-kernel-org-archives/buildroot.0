From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 12:05:53 +0200
Subject: [Buildroot] [PATCH 21/38] ptpd: systemd support
In-Reply-To: <e1e71965d966c70bec5fb685569364e52d90b1c8.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <e1e71965d966c70bec5fb685569364e52d90b1c8.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150714120553.0efea297@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:06:21 +0300, Alex Suykov wrote:

> +define PTPD_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 package/ptpd/ptpd.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/ptpd.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -sf /usr/lib/systemd/system/ptpd.service \

A relative path should be used here.

> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ptpd.service
> +endef
> +
>  $(eval $(generic-package))
> diff --git a/package/ptpd/ptpd.service b/package/ptpd/ptpd.service
> new file mode 100644
> index 0000000..580ca51
> --- /dev/null
> +++ b/package/ptpd/ptpd.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=Precision Time Protocol daemon
> +After=syslog.target network.target
> +
> +[Service]
> +ExecStart=/usr/sbin/ptpd -c -S

And according to Maxime Hadjinlian, this -S is not needed, since
redirecting stdout is already taken care of by systemd.

Applied with those two fixes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
