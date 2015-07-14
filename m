From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 11:57:38 +0200
Subject: [Buildroot] [PATCH 20/38] proftpd: systemd support
In-Reply-To: <de424ff6bb3228307c64e35bcafab21db1b75526.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <de424ff6bb3228307c64e35bcafab21db1b75526.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150714115738.731636f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:06:15 +0300, Alex Suykov wrote:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/proftpd/proftpd.mk      |  8 ++++++++
>  package/proftpd/proftpd.service | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/proftpd/proftpd.service
> 
> diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
> index 023b4dd..81a8a69 100644
> --- a/package/proftpd/proftpd.mk
> +++ b/package/proftpd/proftpd.mk
> @@ -55,4 +55,12 @@ define PROFTPD_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d/S50proftpd
>  endef
>  
> +define PROFTPD_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 package/proftpd/proftpd.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/proftpd.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -sf /usr/lib/systemd/system/proftpd.service \

This should have been a relative path.

> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/proftpd.service
> +endef
> +
>  $(eval $(autotools-package))
> diff --git a/package/proftpd/proftpd.service b/package/proftpd/proftpd.service
> new file mode 100644
> index 0000000..f1777a5
> --- /dev/null
> +++ b/package/proftpd/proftpd.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=FTR server

And 'FTP server'.

Applied with those two changes, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
