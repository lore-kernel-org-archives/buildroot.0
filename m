From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Jul 2021 22:12:57 +0200
Subject: [Buildroot] [PATCH v2 08/18] package/pkg-generic.mk: move
 python fixup to generic package infrastructure
In-Reply-To: <20210707144915.2db26f79@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-9-herve.codina@bootlin.com>
 <20210706195048.GO2521@scaer> <20210707134828.7feafbd2@bootlin.com>
 <f809847a-151a-18d2-ff5d-302b60677e45@mind.be>
 <20210707144915.2db26f79@bootlin.com>
Message-ID: <20210707201257.GB410642@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, Arnout, All,

On 2021-07-07 14:49 +0200, Herve Codina spake thusly:
> On Wed, 7 Jul 2021 14:21:16 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> > > These finds are now called for all packages and .../lib/python* can be not
> > > present. In this case, find fails.  

OK, I see.

However, the commit log was lacking these explanations, because the
change is not simply "the python fixup is moved to the generic package
infrastructure", because the fixups had to be adapted.

> >  A simpler way of doing that would be:
> > 	$(if $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*),
> > 		$(Q)find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*
> I think this does not solve the problem.
> find fails if at least one of the 2 paths are not present.
> 
> Something like this (not tested) is needed.
> 
> 	$(if $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*),
>  		$(Q)find $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*)

Yes, this would keep the pre-existing behaviour.

However, I think the traditional way we usually do that would be with a
foreach:

    $(foreach dir, $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*), \
        $(Q)find $(dir) -name "_sysconfigdata*.py" -print0 \
        |xargs -0 --no-run-if-empty \
            $(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g"
        $(Q)find $(dir) -name "_sysconfigdata*.pyc" -delete
    )

And thus you're back to a basic, non-parameterised macro that can be
used as a POST_PREPARE_HOOK. Wee! :-)

Note: optimisation: we should be able to use a single find call to do
both, though:

    $(foreach dir, $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*), \
        $(Q)find $(dir) \( -name "_sysconfigdata*.pyc" -delete \) \
            -o \( -name "_sysconfigdata*.py" -print0 \) \
        |xargs -0 --no-run-if-empty \
            $(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
    )

Maybe the groupings '\( ... \)' are superfluous. Adapt appropriately...

> > > This assumes:
> > > (1) python stuff will not install anything in $(STAGING_DIR)/lib/python*  
> >  This you can safely assume.

Well, a package that would install its python bindings in /lib/python*
would anyway break at runtime, so this package would need to eb fixed to
install in /usr/lib/python*

So yes, nothing to look for in staging/lib/python*.

> > > (2) $(HOST_DIR)/usr will always be a symlink to $(HOST_DIR)/.  
> >  Although for now you can assume this, ideally we would like to have the
> > possibility to get rid of the usr->. symlink. So if you can avoid relying on it
> > it would be better.
> Right.
> Assuming, the symlink not present, can we be sure that host python stuff will be
> installed only in $(HOST_DIR)/lib/python* ?

I think, as Arnout said, that the usr symlink will always be present. So
we can also safely assume that there is nothing to look for in
host/usr/lib/python* either, because:

 1) that would have already been found in host/lib/python*

 2) that would also probably not work if usr was not a symlink, because
    our host python would not look there to find modules anyway

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
