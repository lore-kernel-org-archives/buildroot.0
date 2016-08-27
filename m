From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 22:16:13 +0200
Subject: [Buildroot] [PATCH 12/16 v3] core: handle .br-external in a
 make rule
In-Reply-To: <0994022779466155b22c6e815e737d21c447a528.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <0994022779466155b22c6e815e737d21c447a528.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <20160827221613.2c753c17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 12:34:32 +0200, Yann E. MORIN wrote:

>  BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
>  -include $(BR2_EXTERNAL_FILE)
> -ifeq ($(BR2_EXTERNAL),)
> -  $(shell rm -f $(BR2_EXTERNAL_FILE))
> -else
> +ifneq ($(BR2_EXTERNAL),)
>    _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
>    ifeq ($(_BR2_EXTERNAL),)
>      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relative to $(TOPDIR))
>    endif
>    override BR2_EXTERNAL := $(_BR2_EXTERNAL)
> -  $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
>    ifneq ($(wildcard $(BR2_EXTERNAL)/external.id),)
>      BR2_EXTERNAL_ID := $(shell cat $(BR2_EXTERNAL)/external.id 2>/dev/null)
>      ifeq ($(BR2_EXTERNAL_ID),)
> @@ -173,6 +167,11 @@ else
>    BR2_EXTERNAL_MK = $(BR2_EXTERNAL)/external.mk
>  endif
>  
> +# This needs to be *after* we compute BR_EXTERNAL, above.
> +.PHONY: $(BR2_EXTERNAL_FILE)
> +$(BR2_EXTERNAL_FILE):
> +	@echo BR2_EXTERNAL ?= $(BR_EXTERNAL) >$@
> +

I'm probably missing something, but where is this make target being
"triggered" ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
