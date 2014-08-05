From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 5 Aug 2014 21:10:00 +0200
Subject: [Buildroot] [PATCH RFC] kconfig: allow pre-seending
	randpackageconfig
In-Reply-To: <1405812304-7603-1-git-send-email-yann.morin.1998@free.fr>
References: <1405812304-7603-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAAXf6LVT6xKNwVf5PSzBin7PDp=OW25dMqO+xaA9T7L_w-x9RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jul 20, 2014 at 1:25 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> NOTE: this is only a proof of concept, for initial feedback.
>

Commit title: s/pre-seending/pre-seeding/

> kconfig is not able to properly randomise choices when a base .config
> file is provided.
>
> Sicne we do have quite a few choices that selects one package or
> another, and we do want to sometime build them, we need to be able to

Since
sometimes

> preseed those packages.

Note that I don't find the above sentence extremely clear,
content-wise, so rewriting this may be good for a subsequent revision.

>
> Add a new environment variable that contains the path to a file
> containing options to be preseeded to randpackageconfig.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I'm fine with this idea.
We should add at least a comment in the Makefile to document this
though, just reading the target recipe is not trivial.

>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 1af51de..eeaf7d3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -751,6 +751,9 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>         @grep '^config BR2_PACKAGE_' Config.in.legacy | \
>                 while read config pkg; do \
>                 echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
> +ifneq ($(BR2_RAND_PRESEED_CONFIG),)
> +       @cat $(BR2_RAND_PRESEED_CONFIG) >> $(CONFIG_DIR)/.config.nopkg
> +endif
>         @$(COMMON_CONFIG_ENV) \
>                 KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
>                 $< --randconfig $(CONFIG_CONFIG_IN)
> --
> 1.9.1


Best regards,
Thomas
