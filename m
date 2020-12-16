From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Dec 2020 15:23:25 +0100
Subject: [Buildroot] [PATCH next 07/12] package/pkg-cargo.mk: introduce
 the cargo package infrastructure
In-Reply-To: <dad088c8-c08e-740f-3c43-c1d2ac32f6ea@essensium.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-8-thomas.petazzoni@bootlin.com>
 <dad088c8-c08e-740f-3c43-c1d2ac32f6ea@essensium.com>
Message-ID: <20201216152325.6277cdbd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Dec 2020 14:58:39 +0100
Patrick Havelange <patrick.havelange@essensium.com> wrote:

> > +#
> > +# Target installation step. Only define it if not already defined by
> > +# the package .mk file.
> > +#
> > +ifndef $(2)_INSTALL_TARGET_CMDS
> > +define $(2)_INSTALL_TARGET_CMDS
> > +	$$(TARGET_MAKE_ENV) $$($(2)_CARGO_ENV) \
> > +		cargo install \
> > +			--target $$(RUSTC_TARGET_NAME) \
> > +			--offline \
> > +			--root $$(TARGET_DIR)/usr/ \
> > +			--bins \
> > +			--path $$(@D) \
> > +			--force \
> > +			--locked \
> > +			$$($(2)_CARGO_INSTALL_OPTS)
> > +endef
> > +endif
> > +
> > +ifndef $(2)_INSTALL_CMDS
> > +define $(2)_INSTALL_CMDS
> > +	$$(HOST_MAKE_ENV) \
> > +		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
> > +		$$($(2)_CARGO_ENV) \
> > +		cargo install \
> > +			--offline \
> > +			--root $$(HOST_DIR) \
> > +			--bins \
> > +			--path $$(@D) \
> > +			--force \
> > +			--locked \
> > +			$$($(2)_CARGO_INSTALL_OPTS)
> > +endef
> > +endif  
> 
> Nitpick: This is the only minor thing that bothers me a bit: the 
> duplication for the host/target cases of the cargo command flags. Would 
> it not be better if they were merged ?

I agree. In fact while re-using your code and extending it, I did quite
a bit of back and forth in using variables to share options, not using
variables. I was not sure myself. But OK, if you also feel like we
should share those common options, I guess it's a sign that we should
go with that!

> BR,

Is this "Best Regards", "BuildRoot" or both ? :-)

Cheers!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
