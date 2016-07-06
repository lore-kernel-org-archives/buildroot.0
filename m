From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed, 6 Jul 2016 13:35:04 +1000
Subject: [Buildroot] [PATCH v3 2/6] Add documentation for merged
 defconfigs
In-Reply-To: <20160705081644.6fd47292@free-electrons.com>
References: <cover.1467176798.git.sam.bobroff@au1.ibm.com>
 <fb148ddadbc12c9a9437192761ba342237a27325.1467176798.git.sam.bobroff@au1.ibm.com>
 <489e6359-291e-5920-87d6-da23fe8c5d0a@smile.fr>
 <20160705060625.GB27663@tungsten.ozlabs.ibm.com>
 <20160705081644.6fd47292@free-electrons.com>
Message-ID: <20160706033503.GA4610@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 05, 2016 at 08:16:44AM +0200, Thomas Petazzoni wrote:
> Hello Sam,
> 
> On Tue, 5 Jul 2016 16:06:25 +1000, Sam Bobroff wrote:
> 
> > > Instead we recommend to use merge_config.sh from outside of Buildroot to
> > > generate the merged defconfig before calling make. Maybe we should add some
> > > documentation in the manual to explain how to use it.  
> > 
> > That seems fine, it might even be possible to add something to
> > $(BR2_EXTERNAL)/external.mk to hook it directly into the Makefiles.
> > 
> > Could you elaborate a bit on what you mean by using merge_config.sh outside of
> > buildroot? Would the fragment files still be checked into buildroot somewhere
> > (but just not hooked into the build system) or would they be maintained outside
> > it?
> 
> The idea is that Buildroot just takes as input a configuration file.
> How this configuration file is provided/generated is not Buildroot's
> responsibility.
> 
> For example, you could have in your BR2_EXTERNAL tree a bunch of
> defconfig fragments, and then a "genconfig" shell script to generate the
> final configuration you want to build using the defconfig fragments.
> This "genconfig" script relies on merge_config.sh to actually merge the
> relevant fragments together.
> 

Ah right, yes I'm sure something like that will work for work that stays
external to buildroot, but the case I'm concerned about is where BR2_EXTERNAL
isn't being used. We want to get our defconfigs out there for everyone to use
and contribute to :-) It looks like existing defconfigs could make use of this
too: from a bit of diff'ing in the configs directory there are already configs
that share a lot of values and would be easier to maintain using merging.

So how would you suggest handling merged configs that should be contributed
back to the community? Would you expect that we maintain our own merge-config
system and fragments and then contribute the full configs back to buildroot?

That seems like the simplest way to do it but I can't see a good way to handle
patches to them: users who have downloaded buildroot would have the defconfigs
but not the input fragments that were used to create them, so it would be
difficult to handle changes they need to make.

Would an alternative approach be to include the fragments and genconfig system
in buildroot but make it a separate component, so it wouldn't add complexity to
the build system? (e.g. you "make configs" to update your defconfigs.)

Cheers,
Sam.
