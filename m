From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 15:39:42 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/php: Add Apache support
In-Reply-To: <1423305664-29877-2-git-send-email-bernd.kuhls@t-online.de>
References: <1423305664-29877-1-git-send-email-bernd.kuhls@t-online.de>
 <1423305664-29877-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150222153942.586eb56e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  7 Feb 2015 11:41:04 +0100, Bernd Kuhls wrote:

> +-  ac_output=`$APXS_HTTPD -v 2>&1 | grep version | $SED -e 's/Oracle-HTTP-//'`
> ++  ac_output='Server version: Apache/2.4.10 (Unix)'
> +   ac_IFS=$IFS
> + IFS="- /.
> + "
> +@@ -7626,7 +7626,7 @@
> + 
> +   # Test that we're trying to configure with apache 2.x
> + 
> +-  ac_output=`$APXS_HTTPD -v 2>&1 | grep version | $SED -e 's/Oracle-HTTP-//'`
> ++  ac_output='Server version: Apache/2.4.10 (Unix)'

What is this used for? What is the impact if the real version of Apache
doesn't match?

> +-    APACHE_THREADED_MPM=`$APXS_HTTPD -V | grep 'threaded:.*yes'`
> ++    APACHE_THREADED_MPM="threaded:     yes (fixed thread count)"

I am not really happy with this because it makes the PHP package assume
that the selected MPM model in apache is "worker". Even though that is
true today, it could be changed later on to also support the prefork
MPM, which I believe doesn't require thread support.

Maybe we could have one BR2_PACKAGE_APACHE_MPM_WORKER option, which the
PHP Apache support could depend on. For now, this option could be
blind and always on, and later on changed to something allowing to also
build support for the prefork MPM.

> +ifeq ($(BR2_PACKAGE_PHP_APACHE),y)
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +define PHP_FIX_THREADS_DETECTION
> +	$(SED) 's/pthreads_working\=no/pthreads_working\=yes/' $(@D)/configure
> +endef
> +# PHP assumes pthreads are not working when cross-compiling,
> +# needed for Apache-MPM worker

Even with --enable-pthreads ?

> +PHP_POST_PATCH_HOOKS += PHP_FIX_THREADS_DETECTION
> +endif
> +PHP_CONF_OPTS += \
> +	--with-apxs2=$(STAGING_DIR)/usr/bin/apxs \
> +	--with-config-file-path=/etc/apache2 \
> +	--with-config-file-scan-dir=/etc/apache2/php \
> +	--oldincludedir=$(STAGING_DIR)/usr/include \

Why is passing --oldincludedir necessary? An additional comment in
the code could be useful here.

Could you look into those issues and resend an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
