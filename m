From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Feb 2020 10:41:59 +0200
Subject: [Buildroot] [PATCH] package/fail2ban: The (host-python3) 2to3
 utility needs to be present
In-Reply-To: <20200226082818.5066-1-p.debruijn@unilogic.nl>
References: <20200226082818.5066-1-p.debruijn@unilogic.nl>
Message-ID: <87h7zdoi3s.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pascal,

On Wed, Feb 26 2020, Pascal de Bruijn wrote:
> During _POST_PATCH_HOOKS _DEPENDANCIES aren't guaranteed to be built,
> however during _PRE_CONFIGURE_HOOKS they should be built.
>
> Should fix:
> http://autobuild.buildroot.net/results/dd8e225e2a49cfa6735bed11459007003a37c137/
> http://autobuild.buildroot.net/results/e688c3652bd474ac682984e2e5947701942f0f57/

Thanks for following up on this.

> Cc: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/fail2ban/fail2ban.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
> index 6f023b48a1..6cb77c2514 100644
> --- a/package/fail2ban/fail2ban.mk
> +++ b/package/fail2ban/fail2ban.mk
> @@ -15,7 +15,7 @@ define FAIL2BAN_PYTHON_2TO3
>  	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
>  endef
>  FAIL2BAN_DEPENDENCIES += host-python3
> -FAIL2BAN_POST_PATCH_HOOKS += FAIL2BAN_PYTHON_2TO3
> +FAIL2BAN_PRE_CONFIGURE_HOOKS += FAIL2BAN_PYTHON_2TO3

As Thomas suggested please add a comment here. Something like:

# We can't use _POST_PATCH_HOOKS because dependencies are not guaranteed
# to build and install before _POST_PATCH_HOOKS run.

baruch

>  endif
>
>  define FAIL2BAN_FIX_DEFAULT_CONFIG

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
