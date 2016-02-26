From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 01:03:00 +0100
Subject: [Buildroot] [PATCH 04/32] package/systemd: add
 --enable/disable-lz4
In-Reply-To: <1456437341-19025-5-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-5-git-send-email-gabe@hashrabbit.co>
Message-ID: <56CF9634.9080009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/16 22:55, Gabe Evans wrote:
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Without the Config.in change I think it should go into master.

 Regards,
 Arnout

> ---
>  package/systemd/Config.in  | 3 ++-
>  package/systemd/systemd.mk | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 1972b1d..9de6e11 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -56,7 +56,8 @@ config BR2_PACKAGE_SYSTEMD
>  	  The selection of other packages will enable some features:
>  
>  	  - acl package will add support for multi-seat.
> -	  - xz package will add compression support in journal and coredump.
> +	  - xz and/or lz4 packages will add compression support in journal
> +	    and coredump.
>  	  - libgcrypt package will add support for journal sealing and resolved
>  	    DNSSEC verification.
>  
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index ac211c8..9f15f24 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -83,6 +83,13 @@ else
>  SYSTEMD_CONF_OPTS += --disable-bzip2
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LZ4),y)
> +SYSTEMD_DEPENDENCIES += lz4
> +SYSTEMD_CONF_OPTS += --enable-lz4
> +else
> +SYSTEMD_CONF_OPTS += --disable-lz4
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XZ),y)
>  SYSTEMD_DEPENDENCIES += xz
>  SYSTEMD_CONF_OPTS += --enable-xz
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
