From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Nov 2017 22:33:47 +0100
Subject: [Buildroot] [RFCv1 3/4] toolchain: post-pone evaluation of
 TOOLCHAIN_EXTERNAL_BIN
In-Reply-To: <42689797-2392-a70c-16d4-eb96c6bcc8c0@mind.be>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-4-thomas.petazzoni@free-electrons.com>
 <42689797-2392-a70c-16d4-eb96c6bcc8c0@mind.be>
Message-ID: <20171107223347.143e3642@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Nov 2017 22:23:24 +0100, Arnout Vandecappelle wrote:

> > diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > index dc0588c536..b9ad1720a1 100644
> > --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> > +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > @@ -77,7 +77,7 @@ ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
> >  TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
> >  endif
> >  else
> > -TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
> > +TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin  
> 
>  It gives me the shivers to see the same variable sometimes defined recursive
> and sometimes defined immediate... But I can't find an elegant solution (other
> than introducing an artificial extra variable, which is also ugly), so
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I also saw the other TOOLCHAIN_EXTERNAL_BIN assignment using := above,
and didn't change it for now because that was not the case I was
interested in testing/fixing. But my plan was to get back to this :=
assignment at some point. However, it seems like you have concluded
that we have to keep := here. Could you explain why?

Note: I think keeping the := is OK, because TOOLCHAIN_EXTERNAL_PREFIX
doesn't reference anything like HOST_DIR/STAGING_DIR/TARGET_DIR, so
it's fine to have evaluation at the time of assignment for this case.

Perhaps a comment above would help clarify that it's intentional?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
