From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 18:15:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: Allow to build
 with uclibc but w/o mausezahn
In-Reply-To: <899f39cb-501b-ef06-7884-5d4f4ef7909a@mind.be>
References: <20190304085741.13782-1-vadim4j@gmail.com>
 <899f39cb-501b-ef06-7884-5d4f4ef7909a@mind.be>
Message-ID: <20190328181511.22031245@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 4 Mar 2019 20:06:00 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> >  define NETSNIFF_NG_INSTALL_TARGET_CMDS
> >  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > -		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc install -C $(@D)
> > +		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc install \
> > +			-C $(@D) $(NETSNIFF_NG_TOOLS)  
> 
>  I don't like very much that we have to enumerate the tools in the .mk file, but
> I don't see any other possibility.

The Makefile has the following targets:

	allbutmausezahn: $(filter-out mausezahn,$(TOOLS))

	install_allbutmausezahn: $(foreach tool,$(filter-out mausezahn,$(TOOLS)),$(tool)_install)

So I think we can build/install everything except mausezahen fairly
easily without duplicating the list of tools in netsniff-ng.mk.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
