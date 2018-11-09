From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Nov 2018 21:40:07 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/proftpd: add tunable buffer
 size
In-Reply-To: <20181109193503.7984-1-jared.bents@rockwellcollins.com>
References: <20181109193503.7984-1-jared.bents@rockwellcollins.com>
Message-ID: <5cc7a533-2760-cdd0-7586-9405553179ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jared,

On 09/11/2018 20:35, Jared Bents wrote:
> Enables tunable buffer size as a compile time option
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  package/proftpd/Config.in  | 8 ++++++++
>  package/proftpd/proftpd.mk | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
> index b615a5ff4c..51c795501e 100644
> --- a/package/proftpd/Config.in
> +++ b/package/proftpd/Config.in
> @@ -65,4 +65,12 @@ config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_SQL
>  	  Compile mod_quotatab with mod_quotatab_sql table.
>  
>  endif
> +
> +config BR2_PACKAGE_PROFTPD_BUFFER_SIZE
> +	int "buffer size (0 for default)"

 You should specify the unit here, so "buffer size in bytes".

> +	default "0"
> +	help
> +	  Compile ProFTPD with tunable buffer size. Size in
> +	  bytes. 0 uses default size.

 It's not very clear what this means. I like the text from [1], so the help text
could be something like:

	  By increasing the buffer size above the default of 1K,
	  proftpd reads and writes data in larger chunks, and makes
	  fewer expensive system calls. Use of this option to set buffer
	  sizes of 8K or more has been reported to drastically increase
	  transfer speeds (depending on network configurations).

	  0 uses the default size of 1024.

> +
>  endif
> diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
> index 8f3ff5088e..5ff0bc17e5 100644
> --- a/package/proftpd/proftpd.mk
> +++ b/package/proftpd/proftpd.mk
> @@ -121,4 +121,8 @@ define PROFTPD_INSTALL_INIT_SYSTEMD
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/proftpd.service
>  endef
>  
> +ifneq ($(BR2_PACKAGE_PROFTPD_BUFFER_SIZE),0)
> +PROFTPD_CONF_OPTS += --enable-tunable-buffer-size=$(BR2_PACKAGE_PROFTPD_BUFFER_SIZE)

 Have you tested this? As far as I can see, the option is actually called
--enable-buffer-size. [1] indeed mentions --enable-tunable-buffer-size; I guess
that's either a mistake or from an earlier version, though.


 I've marked this patch as Changes Requested in patchwork. Could you send an
updated version?

 Regards,
 Arnout


> +endif
> +
>  $(eval $(autotools-package))
> 

[1] http://www.proftpd.org/docs/howto/BCP.html
