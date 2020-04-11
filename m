From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:38:42 +0200
Subject: [Buildroot] [PATCH 6/8] core/show-info: report package stamp
 files
In-Reply-To: <39b4e30872bf54a34bf482576022c0d025b89b25.1586592741.git.yann.morin.1998@free.fr>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <39b4e30872bf54a34bf482576022c0d025b89b25.1586592741.git.yann.morin.1998@free.fr>
Message-ID: <20200411103842.3d095fbf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 10:12:31 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> +	"stamp_files": {
> +		$(if $($(1)_OVERRIDE_SRCDIR), \
> +			"rsync": "$(notdir $($(1)_TARGET_RSYNC))"$(comma) \
> +			, \
> +			"download": "$(notdir $($(1)_TARGET_SOURCE))"$(comma) \
> +			"extract": "$(notdir $($(1)_TARGET_EXTRACT))"$(comma) \
> +			"patch": "$(notdir $($(1)_TARGET_PATCH))"$(comma) \
> +		)
> +		"configure": "$(notdir $($(1)_TARGET_CONFIGURE))",
> +		"build": "$(notdir $($(1)_TARGET_BUILD))",
> +		$(if $(filter YES,$($(1)_INSTALL_STAGING)),\
> +			"install_staging": "$(notdir $($(1)_TARGET_INSTALL_STAGING))"$(comma) \
> +		)
> +		$(if $(filter YES,$($(1)_INSTALL_TARGET)),\
> +			"install_target": "$(notdir $($(1)_TARGET_INSTALL_TARGET))"$(comma) \
> +		)
> +		$(if $(filter YES,$($(1)_INSTALL_IMAGES)),\
> +			"install_images": "$(notdir $($(1)_TARGET_INSTALL_IMAGES))"$(comma) \
> +		)
> +		$(if $(filter host,$($(1)_TYPE)), \
> +			"install":  "$(notdir $($(1)_TARGET_INSTALL_HOST))"$(comma) \
> +		)

Isn't this going to add for each package exactly the same information,
over and over again ? I.e, just the names of stamp files, again, again,
and again. This seems like a big waste of space, making the JSON output
very noisy. I think the tool showing the progress should simply know
what the stamp files are.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
