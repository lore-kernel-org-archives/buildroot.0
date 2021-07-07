From: Herve Codina <herve.codina@bootlin.com>
Date: Wed, 7 Jul 2021 14:49:15 +0200
Subject: [Buildroot] [PATCH v2 08/18] package/pkg-generic.mk: move
 python fixup to generic package infrastructure
In-Reply-To: <f809847a-151a-18d2-ff5d-302b60677e45@mind.be>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-9-herve.codina@bootlin.com>
 <20210706195048.GO2521@scaer> <20210707134828.7feafbd2@bootlin.com>
 <f809847a-151a-18d2-ff5d-302b60677e45@mind.be>
Message-ID: <20210707144915.2db26f79@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 7 Jul 2021 14:21:16 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > 
> > These finds are now called for all packages and .../lib/python* can be not
> > present. In this case, find fails.  
> 
>  A simpler way of doing that would be:
> 
> 	$(if $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*),
> 		$(Q)find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*
> 

I think this does not solve the problem.
find fails if at least one of the 2 paths are not present.

Something like this (not tested) is needed.

	$(if $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*),
 		$(Q)find $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*)



> 
> > Using '-path' avoid this failure if files/dirs are not present.
> > 
> > I wanted to mimic fixup-libtool-files.
> > And so performed 2 calls. One for HOST_DIR and the other for STAGING_DIR.
> > 
> > For HOST_DIR, the previous find searched in $(HOST_DIR)/lib,
> > for STAGING_DIR, it searched in $(STAGING_DIR)/usr/lib,
> > 
> > That's why I wrote the macro with 
> > -path '$(2)/lib/python*' -o -path '$(2)/usr/lib/python*'
> > 
> > We can simplify the call using:
> >   $(Q)find $(2) -path '$(2)/usr/lib/python*' -name ...
> > This assumes:
> > (1) python stuff will not install anything in $(STAGING_DIR)/lib/python*  
> 
>  This you can safely assume.

Ok.

> 
> > (2) $(HOST_DIR)/usr will always be a symlink to $(HOST_DIR)/.  
> 
>  Although for now you can assume this, ideally we would like to have the
> possibility to get rid of the usr->. symlink. So if you can avoid relying on it
> it would be better.

Right.
Assuming, the symlink not present, can we be sure that host python stuff will be
installed only in $(HOST_DIR)/lib/python* ?

Herv?

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
