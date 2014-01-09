From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 09 Jan 2014 18:13:23 +0100
Subject: [Buildroot] [PATCH 3/5] package/tzdata: install a default
	localtime
In-Reply-To: <d33faa4dcebfdac0f304495fcdac3db1f31c791d.1389134731.git.yann.morin.1998@free.fr>
References: <cover.1389134731.git.yann.morin.1998@free.fr>
 <d33faa4dcebfdac0f304495fcdac3db1f31c791d.1389134731.git.yann.morin.1998@free.fr>
Message-ID: <52CED8B3.5090800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/14 23:46, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Add an option to install a default localtime.
>
> since tzdata only makes sense for (e)glibc, we don't care
> that we install timezone files that uClibc can't understand.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>   package/tzdata/Config.in | 10 ++++++++++
>   package/tzdata/tzdata.mk |  8 +++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/package/tzdata/Config.in b/package/tzdata/Config.in
> index 1be6814..c0ede1f 100644
> --- a/package/tzdata/Config.in
> +++ b/package/tzdata/Config.in
> @@ -23,4 +23,14 @@ config BR2_PACKAGE_TZDATA_ZONELIST
>   	  The full list is the list of files in the time zone database source,
>   	  not including the build and .tab files.
>
> +config BR2_PACKAGE_TZDATA_LOCALTIME
> +	string "default local time"
> +	help
> +	  The time zone to install as the default local time, expressed as a
> +	  tzdata location, such as:
> +	    GMT, Europe/Paris, America/New_York, Pacific/Wallis...

  I hope this will not confuse users to think that they can specify 
multiple values separated by a comma...

> +
> +	  If empty, no local time will be set, and the dates will be
> +	  expressed in UTC.
> +
>   endif
> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> index 1cb5b3f..74263e1 100644
> --- a/package/tzdata/tzdata.mk
> +++ b/package/tzdata/tzdata.mk
> @@ -39,8 +39,14 @@ define TZDATA_INSTALL_TARGET_CMDS
>   	cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
>   	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
>   	for zone in posix/*; do                 \
> -	    ln -sfn "$${zone}" "$${zone##*/}";    \
> +	    ln -sfn "$${zone}" "$${zone##*/}";  \
>   	done
> +	if [ -n "$(BR2_PACKAGE_TZDATA_LOCALTIME)" ]; then                   \

  Ick, this looks ugly... If it is unset, make will evaluate it to

	if [ -n """" ]; then ...

which is indeed an empty string, but not so nice... IOW, it's missing a 
qstrip.

  Also, instead of a shell condition I'd prefer a make condition, but 
that's probably a matter of taste.

> +	    cd $(TARGET_DIR)/etc;                                           \
> +	    ln -sf ../usr/share/zoneinfo/$(BR2_PACKAGE_TZDATA_LOCALTIME)    \

  Same here. But also quotes should be added in case the user put 
something stupid there.

> +	           localtime;                                               \
> +	    echo "$(BR2_PACKAGE_TZDATA_LOCALTIME)" >timezone;               \

  Same here. The quotes are not actually quoting anything now...


  Regards,
  Arnout

> +	fi
>   endef
>
>   $(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
