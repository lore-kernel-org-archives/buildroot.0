From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 22:36:09 +0200
Subject: [Buildroot] [PATCH 3/6] php: enable opcache extension in
 php.ini if selected
In-Reply-To: <1431978724-25081-3-git-send-email-bos@je-eigen-domein.nl>
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
 <1431978724-25081-3-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150518223609.6e103d96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Mon, 18 May 2015 21:52:01 +0200, Floris Bos wrote:
> Add a line to load the opcache extension in php.ini, at the
> bottom of the "dynamic extensions" section.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/php/php.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index c36a80c..65d5015 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -296,6 +296,9 @@ define PHP_INSTALL_FIXUP
>  		$(TARGET_DIR)/etc/php.ini
>  	$(SED) 's%;date.timezone =.*%date.timezone = $(PHP_LOCALTIME)%' \
>  		$(TARGET_DIR)/etc/php.ini
> +	$(if $(BR2_PACKAGE_PHP_EXT_OPCACHE),
> +		$(SED) '/;extension=php_xsl.dll/azend_extension=opcache.so' \

Why are you replacing the extension=php_xsl.dll line specifically?

If you're only looking at adding an extension, what about:

	$(if $(BR2_PACKAGE_PHP_EXT_OPCACHE),
		grep -q ^azend_extension=opcache.so $(TARGET_DIR)/etc/php.ini || \
			echo azend_extension=opcache.so >> $(TARGET_DIR)/etc/php.ini)

I don't know it's a few more lines, but it seems more "correct" than
hijacking some random line from php.ini, no?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
