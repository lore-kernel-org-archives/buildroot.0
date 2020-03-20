From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Mar 2020 22:48:29 +0100
Subject: [Buildroot] [pkg-luarocks 4/6] pkg-luarocks: add support of
 host-luarocks-package
In-Reply-To: <20190918061915.31250-4-francois.perrad@gadz.org>
References: <20190918061915.31250-1-francois.perrad@gadz.org>
 <20190918061915.31250-4-francois.perrad@gadz.org>
Message-ID: <20200320224829.4d267580@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Wed, 18 Sep 2019 08:19:13 +0200
Francois Perrad <fperrad@gmail.com> wrote:

>  $(2)_BUILD_OPTS		?=
> -$(2)_NAME_UPSTREAM	?= $(1)
> -$(2)_SUBDIR		?= $$($(2)_NAME_UPSTREAM)-$$(shell echo "$$($(2)_VERSION)" | sed -e "s/-[0-9]$$$$//")
> -$(2)_ROCKSPEC		?= $$(call LOWERCASE,$$($(2)_NAME_UPSTREAM))-$$($(2)_VERSION).rockspec
> -$(2)_SOURCE		?= $$(call LOWERCASE,$$($(2)_NAME_UPSTREAM))-$$($(2)_VERSION).src.rock
> -$(2)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
> +$(3)_NAME_UPSTREAM	?= $(1)
> +$(3)_SUBDIR		?= $$($(3)_NAME_UPSTREAM)-$$(shell echo "$$($(3)_VERSION)" | sed -e "s/-[0-9]$$$$//")
> +$(3)_ROCKSPEC		?= $$(call LOWERCASE,$$($(3)_NAME_UPSTREAM))-$$($(3)_VERSION).rockspec
> +$(3)_SOURCE		?= $$(call LOWERCASE,$$($(3)_NAME_UPSTREAM))-$$($(3)_VERSION).src.rock
> +$(3)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))

I think this is not good, because it means that if a package "lua-foo"
has both a host and a target variant, then LUA_FOO_NAME_UPSTREAM will
be defined twice by the package infrastructure.

Instead, we want to do something like this:

ifndef $(2)_NAME_UPSTREAM
  ifdef $(3)_NAME_UPSTREAM
    $(2)_NAME_UPSTREAM = $($(3)_NAME_UPSTREAM)
  else
    $(2)_NAME_UPSTREAM ?= $(1)
  endif
endif

And so on for the different variables.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
