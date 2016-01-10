From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2016 14:26:04 +0100
Subject: [Buildroot] [PATCH v4] package/python-web2py: cleaning for
 space saving
In-Reply-To: <1438070683-2109-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1438070683-2109-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160110132604.GC3460@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2015-07-28 10:04 +0200, Angelo Compagnucci spake thusly:
> This patch removes from web2py folder welcome, examples application
> and a bunch of other files uneeded in production,
> furthermore, it removes the admin interface if unneeded.

Well, I think this should have been two commits:
  - one to get rid of the admin interface
  - one to get rid of unnecessary files

See mor ecomments below...

> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[--SNIP--]
> diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
> index 313114a..be95517 100644
> --- a/package/python-web2py/python-web2py.mk
> +++ b/package/python-web2py/python-web2py.mk
> @@ -11,13 +11,41 @@ PYTHON_WEB2PY_LICENSE_FILES = LICENSE
>  PYTHON_WEB2PY_DEPENDENCIES = python python-pydal host-python-pydal
>  
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
> +	rm -rf $(TARGET_DIR)/var/www/web2py/deposit
> +	rm -rf $(TARGET_DIR)/var/www/web2py/docs
> +	rm -rf $(TARGET_DIR)/var/www/web2py/examples
> +	rm -rf $(TARGET_DIR)/var/www/web2py/extras
> +	rm -rf $(TARGET_DIR)/var/www/web2py/handlers
> +	rm -rf $(TARGET_DIR)/var/www/web2py/scripts
> +	rm -rf $(TARGET_DIR)/var/www/web2py/ABOUT
> +	rm -rf $(TARGET_DIR)/var/www/web2py/anyserver.py
> +	rm -rf $(TARGET_DIR)/var/www/web2py/CHANGELOG
> +	rm -rf $(TARGET_DIR)/var/www/web2py/Makefile
> +	rm -rf $(TARGET_DIR)/var/www/web2py/MANIFEST.in
> +	rm -rf $(TARGET_DIR)/var/www/web2py/README.markdown
> +	rm -rf $(TARGET_DIR)/var/www/web2py/setup.py
> +	rm -rf $(TARGET_DIR)/var/www/web2py/tox.ini
> +endef
> +
> +ifeq ($(BR2_PACKAGE_PYTHON_WEB2PY_INSTALL_ADMIN),y)
> +define PYTHON_WEB2PY_GENERATE_PASSWORD
> +	$(HOST_DIR)/usr/bin/python2 -c 'import os; \
> +	os.chdir("$(@D)"); \
> +	from gluon.main import save_password; \
> +	save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)';
> +endef
> +PYTHON_WEB2PY_POST_BUILD_HOOKS += PYTHON_WEB2PY_GENERATE_PASSWORD

Previously, the password was generated at install time; now, it is
generated at build time. Why?

If I read the thing corretly, that's because the password was previously
generated before the files were being copied. So I think you could have
used a pre-install hook to generate the password, keeping the same
sequence as we have today:

    PYTHON_WEB2PY_PRE_INSTALL_TARGET_HOOKS += PYTHON_WEB2PY_GENERATE_PASSWORD

However, I think that is is correct and better to generate it at the end
of the build. It would have warranted a bit of explanations in the commit
log, though.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +else
> +define PYTHON_WEB2PY_REMOVE_ADMIN
> +	rm -rf $(TARGET_DIR)/var/www/web2py/applications/admin
>  endef
> +PYTHON_WEB2PY_POST_INSTALL_TARGET_HOOKS += PYTHON_WEB2PY_REMOVE_ADMIN
> +endif
>  
>  define PYTHON_WEB2PY_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 0755 -D package/python-web2py/S51web2py \
> -- 
> 1.9.1
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
