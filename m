From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 15:47:36 +0100
Subject: [Buildroot] [PATCH v3] package/python-web2py: new package
In-Reply-To: <1423918174-8149-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1423918174-8149-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150214154736.0e97892e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Sat, 14 Feb 2015 13:49:34 +0100, Angelo Compagnucci wrote:

> +config BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD
> +	string "Administrative password"

I'm not sure "administrative password" is a good naming. It should
probably just be "admin panel password", or something like that.

> diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
> new file mode 100644
> index 0000000..6fcf0c1
> --- /dev/null
> +++ b/package/python-web2py/python-web2py.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# web2py
> +#
> +################################################################################
> +
> +PYTHON_WEB2PY_VERSION = 2.9.12
> +PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py/archive/
> +PYTHON_WEB2PY_SOURCE = R-$(PYTHON_WEB2PY_VERSION).tar.gz
> +PYTHON_WEB2PY_LICENSE = LGPLv3
> +PYTHON_WEB2PY_LICENSE_FILES = LICENSE

You should have a dependency on Python here.

> +
> +define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
> +	python -c 'import os; \

Use $(HOST_DIR)/usr/bin/python2 here.

> +		os.chdir("$(@D)"); \
> +		from gluon.main import save_password; \
> +		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),80)'
> +	rsync -a $(@D)/* $(TARGET_DIR)/usr/share/web2py

'cp -dpfr' please

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
