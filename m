From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Mar 2016 17:06:17 +0200
Subject: [Buildroot] [PATCHv2] package/tvheadend: use wizard mode on
	first run
In-Reply-To: <1459177408-30399-1-git-send-email-yann.morin.1998@free.fr>
References: <1459177408-30399-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160328150617.GB3608@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2016-03-28 17:03 +0200, Yann E. MORIN spake thusly:
> The format of the ACL database in tvheadend has changed, and generating
> a default user is a little bit more involved than just dumping a file in
> the correct locations: filenames are now md5sum (of something?) and the
> usernames and passwords now have their own DB.
> 
> However, tvheadend has a wizard mode, where it is possible to configure
> the basic features, of which creating an admin user.
> 
> We remove our canned ACL database, and change the startup script to
> start in wizard mode on first run.
> 
> We still need to create the home directory, becauseour mkusers infra
> does not allow setting the access rights, and we want the tvheadend home
> to be go-rwx, as there will be credentials in there.

Well, right after sending this patch, I remembered we do have a way to
set permissions.

Marked as Changes Requested in patchwork; I'll respin a bit later...

Regards,
Yann E. MORIN.

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v1 -> v2:
>   - drop the old accesscontrol file  (Thomas)
>   - create the home directory with appropriate rights
> ---
>  package/tvheadend/Config.in       |  4 ++--
>  package/tvheadend/S99tvheadend    |  5 +++++
>  package/tvheadend/accesscontrol.1 | 13 -------------
>  package/tvheadend/tvheadend.mk    | 15 ++++++++-------
>  4 files changed, 15 insertions(+), 22 deletions(-)
>  delete mode 100644 package/tvheadend/accesscontrol.1
> 
> diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
> index 095ec65..67a4b14 100644
> --- a/package/tvheadend/Config.in
> +++ b/package/tvheadend/Config.in
> @@ -22,7 +22,7 @@ config BR2_PACKAGE_TVHEADEND
>  	  https://www.lonelycoder.com/redmine/projects/tvheadend/
>  
>  	  Note:
> -	    - a default user has been created to log in the web configuration
> -	      GUI: admin/admin; you can change it at your discretion at runtime.
> +	    - on first run, tvheadend will start in wizard mode; the webUI
> +	      is available on port 9981.
>  	    - if you want Avahi support, you'll need to enable:
>  	          Avahi, D-Bus, libdaemon
> diff --git a/package/tvheadend/S99tvheadend b/package/tvheadend/S99tvheadend
> index 75b66f3..65669ce 100644
> --- a/package/tvheadend/S99tvheadend
> +++ b/package/tvheadend/S99tvheadend
> @@ -21,6 +21,11 @@ ARGS="-f"
>  [ -z "${TVH_HTSP_PORT}" ] || ARGS="${ARGS} -e ${TVH_HTSP_PORT}"
>  [ "${TVH_DEBUG}" = "1"  ] && ARGS="${ARGS} -s"
>  
> +# If first run, start in wizard mode
> +if [ -z "$(ls -1 /home/tvheadend/.hts/tvheadend/accesscontrol/ 2>/dev/null)" ]; then
> +    ARGS="${ARGS} -C"
> +fi
> +
>  case "$1" in
>      start)
>          printf "Starting TVHeadend daemon: "
> diff --git a/package/tvheadend/accesscontrol.1 b/package/tvheadend/accesscontrol.1
> deleted file mode 100644
> index b920943..0000000
> --- a/package/tvheadend/accesscontrol.1
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -{
> -        "enabled": 1,
> -        "username": "admin",
> -        "password": "admin",
> -        "comment": "TVHeadend admin user",
> -        "prefix": "0.0.0.0/0",
> -        "streaming": 1,
> -        "dvr": 1,
> -        "dvrallcfg": 1,
> -        "webui": 1,
> -        "admin": 1,
> -        "id": "1"
> -}
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 3398faf..1551dad 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -107,14 +107,15 @@ TVHEADEND_POST_INSTALL_TARGET_HOOKS += TVHEADEND_CLEAN_SHARE
>  #----------------------------------------------------------------------------
>  # To run tvheadend, we need:
>  #  - a startup script, and its config file
> -#  - a default DB with a tvheadend admin
> -#  - a non-root user to run as
> -define TVHEADEND_INSTALL_DB
> -	$(INSTALL) -D -m 0600 package/tvheadend/accesscontrol.1     \
> -		$(TARGET_DIR)/home/tvheadend/.hts/tvheadend/accesscontrol/1
> -	chmod -R go-rwx $(TARGET_DIR)/home/tvheadend
> +#  - a non-root user to run as, and a home for it that is not accesible to
> +#    the other users (because there will be crendentials in there)
> +# Note that the home directory would be created by our mkusers script, but
> +# it only runs in target finalise and does not set the group and others
> +# permissions. So we create it here.
> +define TVHEADEND_CHOWN_HOME
> +	$(INSTALL) -d -m 0700 $(TARGET_DIR)/home/tvheadend
>  endef
> -TVHEADEND_POST_INSTALL_TARGET_HOOKS += TVHEADEND_INSTALL_DB
> +TVHEADEND_POST_INSTALL_TARGET_HOOKS += TVHEADEND_CHOWN_HOME
>  
>  define TVHEADEND_INSTALL_INIT_SYSV
>  	$(INSTALL) -D package/tvheadend/etc.default.tvheadend $(TARGET_DIR)/etc/default/tvheadend
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
