From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 15 Nov 2017 14:41:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/feh: Fix build issue with some
 older cross-compilers
In-Reply-To: <20171115115155.4830-1-petr.vorel@gmail.com>
References: <20171115115155.4830-1-petr.vorel@gmail.com>
Message-ID: <20171115124111.e6rdg5i6hxg3uorh@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

How did you overcome the build issue you had?

On Wed, Nov 15, 2017 at 12:51:54PM +0100, Petr Vorel wrote:
> by adding -std=gnu11 to CFLAGS.
> 
> Also: build in parallel, use TARGET_CONFIGURE_OPTS and cleanup
> FEH_INSTALL_TARGET_CMDS.

This should be a separate patch, I think.

baruch

> Fixes:
> http://autobuild.buildroot.net/results/94527fcd70fa85298c366537013c939534beead0/
> http://autobuild.buildroot.net/results/bf31199cdaa18971a9b599c26fbefac73b2d6f30/
> http://autobuild.buildroot.net/results/5b65c305b50664e02d5f8022278055c80739342d/
> http://autobuild.buildroot.net/results/ed3b9fb8d09cd677af4b8825566877c552926ae5/
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/feh/feh.mk | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/feh/feh.mk b/package/feh/feh.mk
> index 3f4c410440..e0ca21b9ca 100644
> --- a/package/feh/feh.mk
> +++ b/package/feh/feh.mk
> @@ -12,13 +12,12 @@ FEH_LICENSE = MIT
>  FEH_LICENSE_FILES = COPYING
>  
>  define FEH_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
> -		-C $(@D) all
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=gnu11" \
> +		$(MAKE) -C $(@D) all
>  endef
>  
>  define FEH_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
> -		PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
> +	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
>  endef
>  
>  $(eval $(generic-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
