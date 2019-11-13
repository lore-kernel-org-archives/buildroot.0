From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Nov 2019 14:02:05 +0100
Subject: [Buildroot] [PATCH v4] package/sdbusplus: new package
In-Reply-To: <20190807191146.32047-1-jfaith@impinj.com>
References: <710b4b46-81d6-e5e6-4820-f8e1fb435750@mind.be>
 <20190807191146.32047-1-jfaith@impinj.com>
Message-ID: <20191113140205.03121bcb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello John,

On Wed, 7 Aug 2019 19:12:00 +0000
John Faith <jfaith@impinj.com> wrote:

> A C++ library for interacting with sd-bus and a C++ bindings generator.
> 
> The host build produces a code generation tool, sdbus++ while the
> target build gives libsdbusplus.
> 
> The code generator requires host-python-pyyaml, host-python-inflection,
> and host-python-mako. Since it isn't built for the target, the target
> build does not require them.
> 
> The host package includes a code and documentation generation program,
> which is useful for including in a buildroot SDK, even if no target
> package needs it, so make it a user-selectable host package.
> 
> host-autoconf-archive is added as a dependency since configure.ac
> uses the AX_PKG_CHECK_MODULES macro.
> 
> Signed-off-by: John Faith <jfaith@impinj.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

I have finally applied to next, with one change. See below.

> +SDBUSPLUS_VERSION = 4212292bcf136d04b38ba5116aa568b0fa312798
> +SDBUSPLUS_SITE = $(call github,openbmc,sdbusplus,$(SDBUSPLUS_VERSION))
> +SDBUSPLUS_DEPENDENCIES = host-autoconf-archive host-pkgconf systemd
> +HOST_SDBUSPLUS_DEPENDENCIES = \
> +	host-autoconf-archive \
> +	host-pkgconf \
> +	host-python \

I replaced this with:

	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)

which is something we do in many other packages, to use host-python3
when host-python3 is anyway going to be built as a dependency of the
target python3.

I tested it, and it does seem to work, i.e I was able to use the
binding generator tool with a Python 3 installation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
