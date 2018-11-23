From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Nov 2018 22:50:40 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
Message-ID: <20181123215040.GA5528@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-23 15:58 +0100, Thomas Petazzoni spake thusly:
> This commit implements the core of the move to per-package SDK and
> target directories. The main idea is that instead of having a global
> output/host and output/target in which all packages install files, we
> switch to per-package host and target directories, that only contain
> their explicit dependencies.
[--SNIP--]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
[--SNIP--]
> diff --git a/Makefile b/Makefile
> index 23032988a5..35fe1b3644 100644
> --- a/Makefile
> +++ b/Makefile
[--SNIP--]
> @@ -701,14 +712,28 @@ $(TARGETS_ROOTFS): target-finalize
>  # Avoid the rootfs name leaking down the dependency chain
>  target-finalize: ROOTFS=
>  
> -host-finalize: $(HOST_DIR_SYMLINK)
> +host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +	@$(call MESSAGE,"Creating global host directory")
> +	$(foreach pkg,$(sort $(PACKAGES)),\
> +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> +		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> +		$(HOST_DIR)$(sep))
> +endif

Up until now, host-finalize had no command, so it was de facto a phony
target. But with this patch, it gains commands in its recipe.o

So it now has to be explicitly marke .PHONY, if at least for consistency
with target-finalize and staging-finalize.

Also, as you noticed on IRC, and so you don't forget: foo-dirclean
should also remove the PPD for that package, while foo-reconfigure
should not remove it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
