From: Vadym Kochan <vadim4j@gmail.com>
Date: Thu, 28 Mar 2019 19:41:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: Allow to build
 with uclibc but w/o mausezahn
In-Reply-To: <20190328181511.22031245@windsurf>
References: <20190304085741.13782-1-vadim4j@gmail.com>
 <899f39cb-501b-ef06-7884-5d4f4ef7909a@mind.be>
 <20190328181511.22031245@windsurf>
Message-ID: <20190328174125.GA15667@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 28, 2019 at 06:15:11PM +0100, Thomas Petazzoni wrote:
> On Mon, 4 Mar 2019 20:06:00 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
> > >  define NETSNIFF_NG_INSTALL_TARGET_CMDS
> > >  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > > -		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc install -C $(@D)
> > > +		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc install \
> > > +			-C $(@D) $(NETSNIFF_NG_TOOLS)  
> > 
> >  I don't like very much that we have to enumerate the tools in the .mk file, but
> > I don't see any other possibility.
> 
> The Makefile has the following targets:
> 
> 	allbutmausezahn: $(filter-out mausezahn,$(TOOLS))
> 
> 	install_allbutmausezahn: $(foreach tool,$(filter-out mausezahn,$(TOOLS)),$(tool)_install)
> 
> So I think we can build/install everything except mausezahen fairly
> easily without duplicating the list of tools in netsniff-ng.mk.
> 

Good catch, I really missed this event that I contributed some quite a
lot of patches to netsniff-ng :))

But still separate config option for mz is OK ? If not, then I will
prepare patch for netsniff-ng configure to check for existence of missed
function for mz, but in that case libnet and libcli will be selected by
buildroot even if mz is not built.

Regards,
Vadim Kochan
