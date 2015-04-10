From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Apr 2015 01:43:26 +0200
Subject: [Buildroot] [PATCHv3] *config: improve handling of BR2_LEGACY
In-Reply-To: <1428525388-24739-1-git-send-email-yann.morin.1998@free.fr>
References: <1428525388-24739-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5528601E.2080302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/15 22:36, Yann E. MORIN wrote:
> From: Arnout Vandecappelle <arnout@mind.be>
> 
> In 8a46d4bf1f the randpackageconfig and allpackageyesconfig were
> extended with disabling all the legacy options, otherwise the resulting
> config couldn't be built. However, that didn't work for randconfig and
> allyesconfig.
> 
> This commit reverts 8a46d4bf1f and replaces it with a different
> approach: skipping of the legacy config options is passed explicitly
> through the environment variable SKIP_LEGACY, which forces
> BR2_SKIP_LEGACY to y.
> 
> We add a (silent) call to olddefconfig to set out the old legacy
> options aside.

 Yes, that's another way to avoid the 'make oldconfig' problem.

 I actually found it useful to have the option user-visible, because then it's
possible to get rid of all of them in one shot. But on the other hand, it's not
so nice that it gets saved in the defconfig...


> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> [yann.morin.1998 at free.fr: do not rely on a user-visible option, works
>  perfectly well with only blind options set from the environment]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v2 -> v3:
>   - add the missing pieces (calling olddefconfig)
> 
> Changes v1 -> v2:
>   - don't use a user-visible option  (Yann)
> ---
>  Config.in.legacy | 12 ++++++++++++
>  Makefile         | 27 ++++++++++++++-------------
>  2 files changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 445cab7..38fca09 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -52,6 +52,16 @@
>  #
>  # [End of example]
>  
> +config BR2_SKIP_LEGACY_ENV
> +	bool
> +	option env="SKIP_LEGACY"

 This additional option is no longer needed if it's not user visible.


 v4 coming up.


 Regards,
 Arnout

> +
> +config BR2_SKIP_LEGACY
> +	bool
> +	default y if BR2_SKIP_LEGACY_ENV
> +
> +if !BR2_SKIP_LEGACY
> +
>  config BR2_LEGACY
>  	bool
>  	help
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
