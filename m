From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Nov 2018 21:44:25 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/proftpd: add sendfile
In-Reply-To: <20181109193503.7984-2-jared.bents@rockwellcollins.com>
References: <20181109193503.7984-1-jared.bents@rockwellcollins.com>
 <20181109193503.7984-2-jared.bents@rockwellcollins.com>
Message-ID: <da5a6b9b-cac6-c39c-2123-9fa7700371c6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/11/2018 20:35, Jared Bents wrote:
> Enables sendfile as a compile time option
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  package/proftpd/Config.in  | 6 ++++++
>  package/proftpd/proftpd.mk | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
> index 51c795501e..ab3f0d3bf3 100644
> --- a/package/proftpd/Config.in
> +++ b/package/proftpd/Config.in
> @@ -73,4 +73,10 @@ config BR2_PACKAGE_PROFTPD_BUFFER_SIZE
>  	  Compile ProFTPD with tunable buffer size. Size in
>  	  bytes. 0 uses default size.
>  
> +config BR2_PACKAGE_PROFTPD_SENDFILE
> +	bool "sendfile support"
> +	help
> +	  Compile ProFTPD with sendfile. Sendfile implements
> +	  zero-copy transfers.

 Is there any reason to make this optional? sendfile has been supported in Linux
for ages. And anyway, the configure script checks that.

> +
>  endif
> diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
> index 5ff0bc17e5..45bc13eafa 100644
> --- a/package/proftpd/proftpd.mk
> +++ b/package/proftpd/proftpd.mk
> @@ -125,4 +125,8 @@ ifneq ($(BR2_PACKAGE_PROFTPD_BUFFER_SIZE),0)
>  PROFTPD_CONF_OPTS += --enable-tunable-buffer-size=$(BR2_PACKAGE_PROFTPD_BUFFER_SIZE)
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PROFTPD_SENDFILE),y)
> +PROFTPD_CONF_OPTS += --enable-sendfile

 If we indeed keep it optional, you should also add an explicit disable:

else
PROFTPD_CONF_OPTS += --disable-sendfile


 I have marked your patch as Changes Requested in patchwork, so unless you
resend it (with the fixes mentioned above), we will forget about it.

 Thank you!

 Regards,
 Arnout


 Regards,
 Arnout

> +endif
> +
>  $(eval $(autotools-package))
> 
