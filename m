From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 22:37:52 +0200
Subject: [Buildroot] [PATCH 1/1] New package: gRPC,
 Google's remote procedue calss protocol.
In-Reply-To: <CANRZ_fnbcgmYd1iGv1EUNe_hbUhPtWF3ghJhHgwmNhsDHtO2RA@mail.gmail.com>
References: <20180917193455.14329-1-mark.fine@gmail.com>
 <20180918220046.32289eab@windsurf>
 <CANRZ_fnbcgmYd1iGv1EUNe_hbUhPtWF3ghJhHgwmNhsDHtO2RA@mail.gmail.com>
Message-ID: <20180918223752.6b4ccaee@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark,

On Tue, 18 Sep 2018 13:26:06 -0700, Mark Fine wrote:

> > See
> > https://buildroot.org/downloads/manual/manual.html#github-download-url
> > for more details about this.
> 
> Initially, I tried to use tarballs off of git and a locally calculated hash
> file, but had issues with BR finding and downloading the tarballs. Will try
> again.

OK, let me know if you run into specific issues.

> > > +GRPC_LICENSE = BSD-3-Clause
> > > +GRPC_LICENSE_FILES = LICENSE
> > > +
> > > +GRPC_DEPENDENCIES = host-grpc gflags gtest c-ares openssl protobuf zlib
> > > +HOST_GRPC_DEPENDENCIES = host-c-ares host-protobuf host-openssl
> > > +
> > > +GRPC_INSTALL_STAGING = YES
> > > +
> > > +GRPC_MAKE_ENV = \
> > > +     CC="$(TARGET_CC)" \
> > > +     CXX="$(TARGET_CXX)" \
> > > +     LD="$(TARGET_CC)" \
> > > +     LDXX="$(TARGET_CXX)" \
> > > +     STRIP="$(TARGET_STRIP)" \
> > > +     PROTOC="$(HOST_DIR)/bin/protoc" \
> > > +     PATH="$(HOST_DIR)/bin:$(PATH)" \  
> >
> > Use BR_PATH instead.
> >  
> > > +     GRPC_CROSS_COMPILE=true \
> > > +     GRPC_CROSS_LDOPTS="$(TARGET_LDFLAGS)" \
> > > +     GRPC_CROSS_AROPTS="$(LTO_PLUGIN)" \
> > > +     HAS_PKG_CONFIG=false \  
> >
> > Why ?
> >  
> 
> I believe this was added per the Makefile:
> 
> # The steps for cross-compiling are as follows:
> # First, clone and make install of grpc using the native compilers for the host.
> # Also, install protoc (e.g., from a package like apt-get)
> # Then clone a fresh grpc for the actual cross-compiled build
> # Set the environment variable GRPC_CROSS_COMPILE to true
> # Set CC, CXX, LD, LDXX, AR, and STRIP to the cross-compiling binaries
> # Also set PROTOBUF_CONFIG_OPTS to indicate cross-compilation to protobuf (e.g.,
> #  PROTOBUF_CONFIG_OPTS="--host=arm-linux --with-protoc=/usr/local/bin/protoc" )
> # Set HAS_PKG_CONFIG=false

Looks weird. Perhaps it's simply to make sure the system-provided
pkg-config doesn't get used. But in Buildroot, we provide in
$(HOST_DIR)/bin, a special pkg-config that returns results that are
valid when cross-compiling.

> > > +     PROTOBUF_CONFIG_OPTS="--host=$(GNU_TARGET_NAME)  
> > --with-protoc=$(HOST_DIR)/bin/protoc" \
> >
> > Seems weird, is grpc going to build its own protobuf ?  
> 
> I believe this uses the host built protobuf compiler picked up from
> host-protobuf.

But why --host=$(GNU_TARGET_NAME) is needed ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
