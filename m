From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 6 Dec 2019 09:46:04 -0800
Subject: [Buildroot] [PATCH v3 1/1] package/grpc: bump to version 1.25.0
In-Reply-To: <20191205221807.3022cc5b@windsurf>
References: <20191205210155.2705242-1-aduskett@gmail.com>
 <20191205221807.3022cc5b@windsurf>
Message-ID: <CAFSsvmqfkP9jYEabkXcrR9SRnV0wZT+=YKoYF+TrTu7drkwyvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not sure, but the same could be said to the above as well.

On Thu, Dec 5, 2019 at 1:18 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu,  5 Dec 2019 13:01:55 -0800
> aduskett at gmail.com wrote:
>
> > -GRPC_VERSION = 1.23.0
> > +GRPC_VERSION = 1.25.0
> >  GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
> >  GRPC_LICENSE = Apache-2.0
> >  GRPC_LICENSE_FILES = LICENSE
> > @@ -48,6 +48,14 @@ GRPC_CFLAGS += -O0
> >  GRPC_CXXFLAGS += -O0
> >  endif
> >
> > +# Toolchains older than gcc5 will fail to compile with -0s due to:
> > +# error: failure memory model cannot be stronger than success memory model for
> > +# '__atomic_compare_exchange'
> > +ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)
>
> Could also be:
>
> ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
>
> > +GRPC_CFLAGS += -O0
> > +GRPC_CXXFLAGS += -O0
>
> What happens when O2 or O3 are the default optimization flags? Does it
> build? If it does, what you're doing is a bit brutal, as you're forcing
> O0 even if O2 or O3 would work.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
