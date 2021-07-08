From: Herve Codina <herve.codina@bootlin.com>
Date: Thu, 8 Jul 2021 17:38:34 +0200
Subject: [Buildroot] [PATCH v2 08/18] package/pkg-generic.mk: move
 python fixup to generic package infrastructure
In-Reply-To: <20210707201257.GB410642@scaer>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-9-herve.codina@bootlin.com>
 <20210706195048.GO2521@scaer> <20210707134828.7feafbd2@bootlin.com>
 <f809847a-151a-18d2-ff5d-302b60677e45@mind.be>
 <20210707144915.2db26f79@bootlin.com>
 <20210707201257.GB410642@scaer>
Message-ID: <20210708173834.04a84dbc@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 7 Jul 2021 22:12:57 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Herv?, Arnout, All,
> 
> On 2021-07-07 14:49 +0200, Herve Codina spake thusly:
> > On Wed, 7 Jul 2021 14:21:16 +0200
> > Arnout Vandecappelle <arnout@mind.be> wrote:  
> > > > These finds are now called for all packages and .../lib/python* can be not
> > > > present. In this case, find fails.    
> 
> OK, I see.
> 
> However, the commit log was lacking these explanations, because the
> change is not simply "the python fixup is moved to the generic package
> infrastructure", because the fixups had to be adapted.
> 
> > >  A simpler way of doing that would be:
> > > 	$(if $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*),
> > > 		$(Q)find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*  
> > I think this does not solve the problem.
> > find fails if at least one of the 2 paths are not present.
> > 
> > Something like this (not tested) is needed.
> > 
> > 	$(if $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*),
> >  		$(Q)find $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*)  
> 
> Yes, this would keep the pre-existing behaviour.
> 
> However, I think the traditional way we usually do that would be with a
> foreach:
> 
>     $(foreach dir, $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*), \
>         $(Q)find $(dir) -name "_sysconfigdata*.py" -print0 \
>         |xargs -0 --no-run-if-empty \
>             $(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g"
>         $(Q)find $(dir) -name "_sysconfigdata*.pyc" -delete
>     )
> 
> And thus you're back to a basic, non-parameterised macro that can be
> used as a POST_PREPARE_HOOK. Wee! :-)
> 
> Note: optimisation: we should be able to use a single find call to do
> both, though:
> 
>     $(foreach dir, $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*), \
>         $(Q)find $(dir) \( -name "_sysconfigdata*.pyc" -delete \) \
>             -o \( -name "_sysconfigdata*.py" -print0 \) \
>         |xargs -0 --no-run-if-empty \
>             $(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
>     )
> 
> Maybe the groupings '\( ... \)' are superfluous. Adapt appropriately...
> 

I tried this kind of things and I ran into trouble with $(wildcard ...)
Indeed, $(wildcard ...) does not see my directories.
A simple 'ls $(HOST_DIR)/lib/python*' just before $(foreach dir, $(wildcard ...), ...)
lists the directory.

Suppose this stupid package:
---- 8< -----
define TLP_PKGA_INSTALL_TARGET_CMDS
	echo "$$(date)" > $(TARGET_DIR)/pkga1
	echo "$$(date)" > $(TARGET_DIR)/pkga2
	mkdir -p $(TARGET_DIR)/foo/bla
	touch $(TARGET_DIR)/foo/bla/file1
	touch $(TARGET_DIR)/foo/bla/file2
endef

define TLP_PKGA_LIST_CMD
	echo "ls:" && ls $(TARGET_DIR)/foo/* || true
	echo "wildcard: $(wildcard $(TARGET_DIR)/foo/*)"
endef

TLP_PKGA_PRE_INSTALL_TARGET_HOOKS += TLP_PKGA_LIST_CMD
TLP_PKGA_POST_INSTALL_TARGET_HOOKS += TLP_PKGA_LIST_CMD


$(eval $(generic-package))
---- 8< -----

'make pkg' leads to:
	>>> pkg  Installing to target
	echo "ls:" && ls /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/foo/* || true
	ls:
	ls: cannot access '/home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/foo/*': No such file or directory
	echo "wildcard: "
	wildcard: 
	echo "$(date)" > /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/pkga1
	echo "$(date)" > /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/pkga2
	mkdir -p /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/foo/bla
	touch /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/foo/bla/file1
	touch /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/foo/bla/file2
	echo "ls:" && ls /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/foo/* || true
	ls:
	file1  file2
	echo "wildcard: "
	wildcard: 

$(wildcard ...) uses internal make caching.
Depending on when it is called related to make internal caching updates, it can
lead to unexpected results.

In the example provided, make cannot known that $(TARGET_DIR)/foo/bla was updated by
TLP_PKGA_INSTALL_TARGET_CMDS and so it didn't update its internal caching.
$(wildcard ...) does not see the new files.

Herve

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
