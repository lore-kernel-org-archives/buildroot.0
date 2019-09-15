From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 21:06:49 +0200
Subject: [Buildroot] [PATCH 16/27] package/waf: bump to version 2.0.18
In-Reply-To: <20190908161204.26761-1-chrismcc@gmail.com>
References: <20190908161204.26761-1-chrismcc@gmail.com>
Message-ID: <20190915210649.43b7c14d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christopher,

On Sun,  8 Sep 2019 09:12:04 -0700
Christopher McCrory <chrismcc@gmail.com> wrote:

> update _SOURCE
> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

Did you really test this patch? I don't see how it can work. See below.

> diff --git a/package/waf/waf.mk b/package/waf/waf.mk
> index 97bc2a8963..715cbe136d 100644
> --- a/package/waf/waf.mk
> +++ b/package/waf/waf.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -WAF_VERSION = 1.9.5
> -WAF_SOURCE = waf-$(WAF_VERSION)
> +WAF_VERSION = 2.0.18
> +WAF_SOURCE = waf-$(WAF_VERSION).tar.bz2

So now, you're downloading waf as a tarball. So could you explain how
the HOST_WAF_EXTRACT_CMDS can work?

It's defined as-is:

define HOST_WAF_EXTRACT_CMDS
        $(INSTALL) -D -m 0755 $(HOST_WAF_DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
endef

So obviously, it fails badly, with:

>>> host-waf 2.0.18 Extracting
/usr/bin/install -D -m 0755 /home/thomas/dl/waf/waf-2.0.18 /home/thomas/projets/buildroot/output/build/host-waf-2.0.18/waf
/usr/bin/install: cannot stat '/home/thomas/dl/waf/waf-2.0.18': No such file or directory

So either you continue to use the standalone file at
https://waf.io/waf-2.0.18 (and you can keep the current extract
commands), or you switch to the tarball as you did, but definitely the
extract/install steps need to be updated.

It's probably worth reminding that we expect contributors to test their
patches before they are submitted, at least in a minimal. I would have
preferred less than 27 version bumps on your series, but version bumps
that are actually tested :-/

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
