From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jul 2015 21:02:19 +0200
Subject: [Buildroot] [PATCH 1/3] package/python-web2py: cleaning for
 space savings
In-Reply-To: <1437768317-9283-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1437768317-9283-1-git-send-email-angelo.compagnucci@gmail.com>
 <1437768317-9283-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150725210219.2acba408@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,

On Fri, 24 Jul 2015 22:05:15 +0200, Angelo Compagnucci wrote:

>  if BR2_PACKAGE_PYTHON_WEB2PY
>  
> +if ! BR2_PACKAGE_PYTHON_WEB2PY_CLEAN_ADMIN
> +
>  config BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD
>  	string "admin panel password"
>  	default web2py
> @@ -21,3 +23,11 @@ config BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD
>  	  Set the admin panel password.
>  
>  endif

Then it's more logical for this option to be defined *after* the clean
admin option.

> +
> +config BR2_PACKAGE_PYTHON_WEB2PY_CLEAN_ADMIN
> +	bool "clean admin panel application"

Instead of clean, I think you should use "remove".

>  define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
> -	$(HOST_DIR)/usr/bin/python2 -c 'import os; \
> -		os.chdir("$(@D)"); \
> -		from gluon.main import save_password; \
> -		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
>  	mkdir -p $(TARGET_DIR)/var/www/web2py
>  	cp -dpfr $(@D)/* $(TARGET_DIR)/var/www/web2py
> +	rm -rf $(TARGET_DIR)/var/www/web2py/welcome.w2p
> +	rm -rf $(TARGET_DIR)/var/www/web2py/applications/examples
> +	rm -rf $(TARGET_DIR)/var/www/web2py/applications/welcome
> +	if test -n "$(BR2_PACKAGE_PYTHON_WEB2PY_CLEAN_ADMIN)" ; then\
> +		rm -rf $(TARGET_DIR)/var/www/web2py/applications/admin;\
> +	else\
> +		$(HOST_DIR)/usr/bin/python2 -c 'import os; \
> +		os.chdir("$(@D)"); \
> +		from gluon.main import save_password; \
> +		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)';\
> +	fi

Please use a make based conditional rather than a shell one.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
