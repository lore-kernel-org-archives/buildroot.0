From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 21:44:52 +0100
Subject: [Buildroot] [PATCH v3 1/1] jsen: new package
In-Reply-To: <1456233895-31812-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
References: <1456233895-31812-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
Message-ID: <56CCC4C4.5020402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/23/16 14:24, Atul Singh wrote:
> 
> ---
> Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
>  package/Config.in      |  1 +
>  package/jsen/Config.in |  6 ++++++
>  package/jsen/jsen.hash |  2 ++
>  package/jsen/jsen.mk   | 18 ++++++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/jsen/Config.in
>  create mode 100644 package/jsen/jsen.hash
>  create mode 100644 package/jsen/jsen.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index a5b31aa..6f8b8bd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -984,6 +984,7 @@ menu "External jQuery plugins"
>  	source "package/jquery-validation/Config.in"
>  endmenu
>  endif
> +	source "package/jsen/Config.in"

 I wonder if this is really the correct place for it. This menu is for
Javascript libraries that are installed in /var/www, i.e. that are meant to be
used by web clients. AFAICS, however, jsen is meant to be used with nodejs
(which is why it's installed in /usr/share, I guess). So I think we should
create a new menu under the nodejs package:

	source "package/nodejs/Config.in"
if BR2_PACKAGE_NODEJS
menu "NodeJS libraries/modules"
	source "package/jsen/Config.in"
endmenu
endif

 I vaguely remember that this was discussed before - if so, the conclusion of
that discussion should have been in your commit message.


 Regards,
 Arnout

>  	source "package/jsmin/Config.in"
>  	source "package/json-javascript/Config.in"
>  endmenu
> diff --git a/package/jsen/Config.in b/package/jsen/Config.in
> new file mode 100644
> index 0000000..8c41a19
> --- /dev/null
> +++ b/package/jsen/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_JSEN
> +	bool "jsen"
> +	help
> +	  JSEN (JSON Sentinel) validates your JSON objects using JSON-Schema.
> +
> +	  https://github.com/bugventure/jsen
> diff --git a/package/jsen/jsen.hash b/package/jsen/jsen.hash
> new file mode 100644
> index 0000000..fdfcd93
> --- /dev/null
> +++ b/package/jsen/jsen.hash
> @@ -0,0 +1,2 @@
> +# Locally Computed
> +sha256  651b3ae5c92865705c144175a8297305788a0e9a1f46ee9b8caa127c6bce6709  jsen-v0.6.0.tar.gz
> diff --git a/package/jsen/jsen.mk b/package/jsen/jsen.mk
> new file mode 100644
> index 0000000..535389d
> --- /dev/null
> +++ b/package/jsen/jsen.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# jsen
> +#
> +################################################################################
> +
> +JSEN_VERSION = v0.6.0
> +JSEN_SITE = $(call github,bugventure,jsen,$(JSEN_VERSION))
> +JSEN_LICENSE = MIT
> +JSEN_LICENSE_FILES = LICENSE
> +
> +define JSEN_INSTALL_TARGET_CMDS
> +        mkdir -p $(TARGET_DIR)/usr/share/jsen
> +        $(foreach d,dist lib index.js,\
> +                cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/jsen/$(sep))
> +endef
> +
> +$(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
