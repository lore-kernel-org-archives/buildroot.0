From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Sep 2015 23:28:37 +0100
Subject: [Buildroot] [PATCH 1/1] openvpn: add option for
 --enable-password-save
In-Reply-To: <1443001188-8997-1-git-send-email-andreas.wetzel@nanotronic.ch>
References: <1443001188-8997-1-git-send-email-andreas.wetzel@nanotronic.ch>
Message-ID: <56032795.30601@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Wetzel,

just a minor problems that (I think) will not prevent your patch to be 
applied by a maintaner:

The subject prefix of your patch should be "PATCH v2", as is the second 
version of your patch. This is explained in the Buildroot manual:

http://buildroot.org/downloads/manual/manual.html#submitting-patches

Subsection "21.5.2. Patch revision changelog".

On 23/09/15 10:39, Andreas Wetzel wrote:
> Added configuration option BR2_PACKAGE_OPENVPN_PWSAVE that
> adds --enable-password-save to OPENVPN_CONF_OPTS if selected.
>
> Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
> ---

You should have added a changelog here explaining the changes between v1 
and v2, as explained in the Buildroot manual, in the same subsection I 
mentioned above.

>   package/openvpn/Config.in  | 5 +++++
>   package/openvpn/openvpn.mk | 6 ++++++
>   2 files changed, 11 insertions(+)
>
> diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
> index 5edb479..ae29a1b 100644
> --- a/package/openvpn/Config.in
> +++ b/package/openvpn/Config.in
> @@ -27,6 +27,11 @@ config BR2_PACKAGE_OPENVPN_SMALL
>   	  You loose eurephia, debugging info, help messages and more.
>   	  It saves around 100 KiB in binary file size.
>
> +config BR2_PACKAGE_OPENVPN_PWSAVE
> +	bool "Allow passwords in files"
> +	help
> +	  Allow --askpass and --auth-user-pass passwords to be read from a file.

As explained in the Buildroot manual, the help text should be wrapped at 
72 characters, so the "file." should have been in the next line. I think 
a maintainer will not mind to fix it for you.

http://buildroot.org/downloads/manual/manual.html#writing-rules-config-in

Despite of those comments, I think your patch looks OK to be applied, so 
here you have my...

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Regards,

Vincent.

> +
>   choice
>   	prompt "Crypto backend"
>   	default BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index 1caa9a0..2973928 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -41,6 +41,12 @@ else
>   OPENVPN_CONF_OPTS += --disable-lzo
>   endif
>
> +ifeq ($(BR2_PACKAGE_OPENVPN_PWSAVE),y)
> +OPENVPN_CONF_OPTS += --enable-password-save
> +else
> +OPENVPN_CONF_OPTS += --disable-password-save
> +endif
> +
>   ifeq ($(BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL),y)
>   OPENVPN_CONF_OPTS += --with-crypto-library=openssl
>   OPENVPN_DEPENDENCIES += openssl
>
