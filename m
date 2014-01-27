From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jan 2014 18:26:01 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: use absolute paths to
	BR2_EXTERNAL
In-Reply-To: <44e6c31931f55e79eec713be1a202f2c170667b7.1390424303.git.yann.morin.1998@free.fr>
References: <cover.1390424302.git.yann.morin.1998@free.fr>
 <44e6c31931f55e79eec713be1a202f2c170667b7.1390424303.git.yann.morin.1998@free.fr>
Message-ID: <52E696A9.5070700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/01/14 21:59, Yann E. MORIN wrote:
> +  _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
> +  ifeq ($(_BR2_EXTERNAL),)
> +    ifeq ($(patsubst /%,/,$(BR2_EXTERNAL)),/)
> +      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist)
> +    else
> +      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relatively to $(TOPDIR))

  I don't think the limited explanation "relatively to $(TOPDIR)" 
warrants the additional complexity of patsubsting stuff.

> +    endif
> +  endif
> +  BR2_EXTERNAL := $(_BR2_EXTERNAL)

  AFAICS there is no need to have a separate _BR2_EXTERNAL, since we'll 
anyway error out if it is empty.

  So, I'd propose:

override BR2_EXTERNAL := $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
ifeq ($(BR2_EXTERNAL),)
	$(error BR2_EXTERNAL directory '$(BR2_EXTERNAL)' does not exist)
endif


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
