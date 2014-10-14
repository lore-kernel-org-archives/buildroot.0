From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Oct 2014 09:32:29 +0200
Subject: [Buildroot] [PATCH v2 2/2] randconfig: seed with
 BR2_RAND_PRESEED_CONFIG_FILES
In-Reply-To: <1413138065-6138-2-git-send-email-arnout@mind.be>
References: <1413134795-32050-1-git-send-email-arnout@mind.be>
 <1413138065-6138-1-git-send-email-arnout@mind.be>
 <1413138065-6138-2-git-send-email-arnout@mind.be>
Message-ID: <20141014073228.GB3730@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-10-12 20:21 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Currently, randconfig is completely unusable. Instead, we use
> randpackageconfig, with two use cases: in the autobuilders, and when
> doing manual testing of the validity of depends/select chains. In both
> cases, we actually want the possibility to explicitly select some
> packages or to set a string value or to randomise between a choice or
> to test bootloaders and kernels - all of this is currently impossible.
> 
> This patch adds a BR2_RAND_PRESEED_CONFIG_FILES environment variable
> that can be set to a (set of) files with config options that should be
> set or unset. randconfig and randpackageconfig will force these
> values.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> v2:
>  - split off the fix for legacy
>  - apply to both randconfig and randpackageconfig
>  - rename to BR2_RAND_PRESEED_CONFIG_FILES because it supports
>    multiple files
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Makefile | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5bcaa77..fb99de1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -732,6 +732,9 @@ oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
>  	@rm -f $(CONFIG_DIR)/.config.nopkg
> +ifneq ($(BR2_RAND_PRESEED_CONFIG_FILES),)
> +	@cp $(BR2_RAND_PRESEED_CONFIG_FILES) $(CONFIG_DIR)/.config.nopkg
> +endif

I guess you meant something like:
    @cat $(BR2_RAND_PRESEED_CONFIG_FILES) $>(CONFIG_DIR)/.config.nopkg

Here's what I get with cp:
    $ cp foo bar buz
    cp: target ?buz? is not a directory

>  	@grep '^config ' Config.in.legacy | \
>  		while read config pkg; do \
>  		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
> @@ -758,6 +761,9 @@ allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
>  	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
> +ifneq ($(BR2_RAND_PRESEED_CONFIG_FILES),)
> +	@grep BR2_PACKAGE_ $(BR2_RAND_PRESEED_CONFIG_FILES) >> $(CONFIG_DIR)/.config.nopkg
> +endif

Why do you explicitly grep for packages here?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
