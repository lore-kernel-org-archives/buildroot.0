From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 May 2013 15:50:25 +0200
Subject: [Buildroot] [PATCH 1/1] ser2net: add default init script
In-Reply-To: <1367757785-5850-1-git-send-email-plagnioj@jcrosoft.com>
References: <1367757785-5850-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <20130505135025.GA3246@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christophe, All,

See my comments inlined below.

On Sun, May 05, 2013 at 02:43:05PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> add option to specify the configuration file
> 
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> ---
>  package/ser2net/Config.in  |    9 +++++++++
>  package/ser2net/S50ser2net |   48 ++++++++++++++++++++++++++++++++++++++++++++
>  package/ser2net/ser2net.mk |   27 +++++++++++++++++++++++++
>  3 files changed, 84 insertions(+)
>  create mode 100644 package/ser2net/S50ser2net
> 
> diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
> index e3b8870..3480d85 100644
> --- a/package/ser2net/Config.in
> +++ b/package/ser2net/Config.in
> @@ -8,5 +8,14 @@ config BR2_PACKAGE_SER2NET
>  
>  	  http://ser2net.sourceforge.net
>  
> +if BR2_PACKAGE_SER2NET
> +
> +config BR2_PACKAGE_SER2NET_CONF
> +	string "Configuration file"
> +	help
> +	  Configuration file.

I think we should provide a default, basic configuration file that we
install unconditionnally to the rootfs. The user will then be free to
provide a post-build script to tweak that file.


> diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
> index 378dc06..5a2539e 100644
> --- a/package/ser2net/ser2net.mk
> +++ b/package/ser2net/ser2net.mk
> @@ -9,4 +9,31 @@ SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
>  SER2NET_LICENSE = GPLv2+
>  SER2NET_LICENSE_FILES = COPYING
>  
> +define SER2NET_INIT_SCRIPT_INSTALL
> +	$(INSTALL) -m 0755 package/ser2net/S50ser2net $(TARGET_DIR)/etc/init.d
> +endef
> +
> +SER2NET_POST_INSTALL_TARGET_HOOKS += SER2NET_INIT_SCRIPT_INSTALL

Please use SER2NET_INSTALL_INIT_SYSV to install that script, eg.:
    SER2NET_INSTALL_INIT_SYSV += SER2NET_INIT_SCRIPT_INSTALL

this way, the init script will only be installed if a sysv init sequence
is used (and not systemd).

Also, would it be possible to provide a systemd unit?
Ditto, use: SER2NET_INSTALL_INIT_SYSTEMD

> +
> +define SER2NET_INIT_SCRIPT_UNINSTALL
> +	rm -f $(TARGET_DIR)/etc/init.d/S50ser2net
> +endef
> +
> +SER2NET_POST_UNINSTALL_TARGET_HOOKS += SER2NET_INIT_SCRIPT_UNINSTALL

I think we decided that uninstall targets are not needed, because
uninstall is not working completely in Buildroot. Drop it.

> +
> +define SER2NET_CONF_INSTALL
> +	if [ "$(BR2_PACKAGE_SER2NET_CONF)" != "" ] ; then \
> +		$(INSTALL) -m 0644 $(BR2_PACKAGE_SER2NET_CONF) \
> +			$(TARGET_DIR)/etc/ser2net.conf ; \
> +	fi
> +endef
> +
> +SER2NET_POST_INSTALL_TARGET_HOOKS += SER2NET_CONF_INSTALL

Always install a default configuration file, as said above.

> +define SER2NET_CONFIG_UNINSTALL
> +	rm -f $(TARGET_DIR)/etc/ser2net.conf
> +endef
> +
> +SER2NET_POST_UNINSTALL_TARGET_HOOKS += SER2NET_CONFIG_UNINSTALL

Ditto for uninstall: drop it.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
