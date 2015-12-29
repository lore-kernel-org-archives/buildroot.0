From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2015 21:34:20 +0100
Subject: [Buildroot] [PATCH] Drop ldconfig handling
In-Reply-To: <1451420850-22132-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1451420850-22132-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151229203420.GF3445@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-29 21:27 +0100, Thomas Petazzoni spake thusly:
> The ldconfig handling in the main Makefile is utterly broken, as it
> calls the build machine ldconfig to generate the ld.so.cache of the
> target. Unfortunately, the format of the ld.so.cache is architecture
> specific, and therefore the build machine ldconfig cannot be used
> as-is.
> 
> This patch therefore simply drops using ldconfig entirely, and removes
> /etc/ld.so.conf.d/ from the target skeleton. The idea is that all
> libraries that should be loaded by the dynamic linker must be
> installed in paths where the dynamic linker searches them by default
> (typically /lib or /usr/lib).
> 
> This might potentially break a few packages, but the only way to know
> is to actually stop handling ldconfig. In order to be notified of such
> cases, we add a check in target-finalize to verify that there is no
> /etc/ld.so.conf file in the target.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile                                | 14 ++------------
>  system/skeleton/etc/ld.so.conf.d/.empty |  0
>  2 files changed, 2 insertions(+), 12 deletions(-)
>  delete mode 100644 system/skeleton/etc/ld.so.conf.d/.empty
> 
> diff --git a/Makefile b/Makefile
> index 1d69192..a15013e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -598,18 +598,8 @@ endif
>  		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
>  
>  	mkdir -p $(TARGET_DIR)/etc
> -	# Mandatory configuration file and auxiliary cache directory
> -	# for recent versions of ldconfig
> -	touch $(TARGET_DIR)/etc/ld.so.conf
> -	mkdir -p $(TARGET_DIR)/var/cache/ldconfig
> -	if [ -x "$(TARGET_CROSS)ldconfig" ]; \
> -	then \
> -		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR) \
> -					-f $(TARGET_DIR)/etc/ld.so.conf; \
> -	else \
> -		/sbin/ldconfig -r $(TARGET_DIR) \
> -			       -f $(TARGET_DIR)/etc/ld.so.conf; \
> -	fi
> +	test -f $(TARGET_DIR)/etc/ld.so.conf && \
> +		{ echo "ERROR: we shouldn't have a /etc/ld.so.conf file"; exit 1; } || true

We could also add (in case a package installs something in there):

    test -d $(TARGET_DIR)/etc/ld.so.conf.d && \
        { echo "ERROR: we shouldn't have a /etc/ld.so.conf.d directory"; exit 1; } || true

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  	( \
>  		echo "NAME=Buildroot"; \
>  		echo "VERSION=$(BR2_VERSION_FULL)"; \
> diff --git a/system/skeleton/etc/ld.so.conf.d/.empty b/system/skeleton/etc/ld.so.conf.d/.empty
> deleted file mode 100644
> index e69de29..0000000
> -- 
> 2.6.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
