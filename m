From: Heiko Thiery <Heiko.Thiery@kontron.com>
Date: Wed, 4 Dec 2019 12:29:41 +0000
Subject: [Buildroot] [PATCH 5/7] sysrepo: Use a common repository
 location
In-Reply-To: <b19aded0e3b221e21a629a3eba7deb8d7f54dfae.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
 <b19aded0e3b221e21a629a3eba7deb8d7f54dfae.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <f13741d320d244eba9134fcae275d329@kontron.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

> -----Urspr?ngliche Nachricht-----
> Von: Jan Kundr?t [mailto:jan.kundrat at cesnet.cz]
> Gesendet: Mittwoch, 4. Dezember 2019 10:38
> An: buildroot at buildroot.org
> Cc: Heiko Thiery; Fabrice Fontaine
> Betreff: [PATCH 5/7] sysrepo: Use a common repository location
> 
> Because the executables contain a hardcoded location to the on-disk repository
> path, we take care to use a stable, shared location between the host-sysrepo
> and sysrepo builds so that the host-side tools can install YANG modules and
> have them available once the system boots on the target.
> 
> This means that other packages, such as the upcoming netopeer2-keystored or
> the netopeer2-server, or really anything else which installs YANG modules into
> sysrepo, can just call `sysrepoctl` from `host-sysrepo`, and the resulting
> *target* image will have that module also available.
> 
> Also make sure that we prune the notification directory. "Notifications"
> in this context refer to a persistent state of NETCONF-level notifications which
> are created either by `sysrepoctl` for events such as module (de)installations,
> and by third-party code. There is no value in leaking these events from the
> build env into the target, and killing these causes in one fewer things to care
> about.
> 
> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>

> ---
>  package/sysrepo/sysrepo.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk index
> 113ed7a929..2ef64d13e2 100644
> --- a/package/sysrepo/sysrepo.mk
> +++ b/package/sysrepo/sysrepo.mk
> @@ -58,7 +58,7 @@ HOST_SYSREPO_CONF_OPTS = \
>  	-DCALL_TARGET_BINS_DIRECTLY=OFF \
>  	-DBUILD_EXAMPLES=OFF \
>  	-DBUILD_CPP_EXAMPLES=OFF \
> -	-DREPOSITORY_LOC=$(HOST_DIR)/etc/sysrepo \
> +	-DREPOSITORY_LOC=$(BASE_TARGET_DIR)/etc/sysrepo \
>  	-DSUBSCRIPTIONS_SOCKET_DIR=$(HOST_DIR)/var/run/sysrepo-
> subscriptions
> 
>  ifdef BR2_PACKAGE_SYSREPO_CPP
> @@ -68,5 +68,12 @@ ifdef BR2_PACKAGE_SYSREPO_CPP
>  	HOST_SYSREPO_CONF_OPTS += -DGEN_LANGUAGE_BINDINGS=ON -
> DGEN_CPP_BINDINGS=ON -DGEN_PYTHON_BINDINGS=OFF -
> DGEN_JAVA_BINDINGS=OFF  endif
> 
> +# There's no point in keeping the logs around define
> +SYSREPO_REMOVE_NOTIFICATION_LOG
> +	rm -rf $(BASE_TARGET_DIR)/etc/sysrepo/data/notifications/
> +endef
> +
> +SYSREPO_TARGET_FINALIZE_HOOKS +=
> SYSREPO_REMOVE_NOTIFICATION_LOG
> +
>  $(eval $(cmake-package))
>  $(eval $(host-cmake-package))
> --
> 2.21.0
> 
