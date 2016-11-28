From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 21:56:56 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: change configuration
 directory
In-Reply-To: <20161128094512.27804-1-damjan.marion@gmail.com>
References: <20161128094512.27804-1-damjan.marion@gmail.com>
Message-ID: <20161128215656.2b1d28c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm adding Yann E. Morin and Bernd Kuhls in Cc, since they are listed
in our DEVELOPERS file for this package. Yann, Bernd, could you have a
look at the below patch?

Damjan: next time, could you use our get-developers script to get the
proper list of recipients for your patches, so that the appropriate
developers get automatically Cc'ed?

Thanks!

Thomas

On Mon, 28 Nov 2016 10:45:12 +0100, Damjan Marion wrote:
> Currently tvheadend configuration is stored in
> /home/tvheadend/.hts/tvheadend. This patch changes this location
> to /etc/tvheadend which seems to be more appropriate place.
> 
> Signed-off-by: Damjan Marion <damjan.marion@gmail.com>
> ---
>  package/tvheadend/S99tvheadend | 4 ++--
>  package/tvheadend/tvheadend.mk | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/tvheadend/S99tvheadend b/package/tvheadend/S99tvheadend
> index 65669ce..98167bf 100644
> --- a/package/tvheadend/S99tvheadend
> +++ b/package/tvheadend/S99tvheadend
> @@ -13,7 +13,7 @@ PIDFILE=/var/run/$NAME.pid
>  # Read configuration variable file if it is present
>  [ -r "/etc/default/${NAME}" ] && . "/etc/default/${NAME}"
>  
> -ARGS="-f"
> +ARGS="-f -c /etc/tvheadend"
>  [ -z "${TVH_USER}"      ] || ARGS="${ARGS} -u ${TVH_USER}"
>  [ -z "${TVH_GROUP}"     ] || ARGS="${ARGS} -g ${TVH_GROUP}"
>  [ -z "${TVH_ADAPTERS}"  ] || ARGS="${ARGS} -a ${TVH_ADAPTERS}"
> @@ -22,7 +22,7 @@ ARGS="-f"
>  [ "${TVH_DEBUG}" = "1"  ] && ARGS="${ARGS} -s"
>  
>  # If first run, start in wizard mode
> -if [ -z "$(ls -1 /home/tvheadend/.hts/tvheadend/accesscontrol/ 2>/dev/null)" ]; then
> +if [ -z "$(ls -1 /etc/tvheadend/accesscontrol/ 2>/dev/null)" ]; then
>      ARGS="${ARGS} -C"
>  fi
>  
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index a3afec8..11e56b6 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -93,6 +93,7 @@ endef
>  
>  define TVHEADEND_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
> +	mkdir -p $(TARGET_DIR)/etc/tvheadend
>  endef
>  
>  # Remove documentation and source files that are not needed because we
> @@ -116,10 +117,10 @@ define TVHEADEND_INSTALL_INIT_SYSV
>  endef
>  
>  define TVHEADEND_USERS
> -	tvheadend -1 tvheadend -1 * /home/tvheadend - video TVHeadend daemon
> +	tvheadend -1 tvheadend -1 * - - video TVHeadend daemon
>  endef
>  define TVHEADEND_PERMISSIONS
> -	/home/tvheadend r 0700 tvheadend tvheadend - - - - -
> +	/etc/tvheadend r 0700 tvheadend tvheadend - - - - -
>  endef
>  
>  $(eval $(generic-package))



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
