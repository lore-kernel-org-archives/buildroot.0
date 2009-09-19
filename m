From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 Sep 2009 17:26:29 +0200
Subject: [Buildroot] [PATCH 1/6] Remove the "project" feature
In-Reply-To: <20090917161713.GA4647@mx.loc> (Bernhard Reutner-Fischer's
	message of "Thu\, 17 Sep 2009 18\:17\:13 +0200")
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1253135266-26880-2-git-send-email-thomas.petazzoni@free-electrons.com>
	<20090917161713.GA4647@mx.loc>
Message-ID: <87fxajx8ey.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 Bernhard> On Wed, Sep 16, 2009 at 11:07:41PM +0200, Thomas Petazzoni wrote:
 >> flush:
 >> -	rm -f $(PROJECT_BUILD_DIR)/tgt-config.cache
 >> +	rm -f $(BUILD_DIR)/tgt-config.cache
 >> 
 >> %_defconfig: $(CONFIG)/conf
 >> cp $(shell find ./target/ -name $@) .config
 >> -@$(MAKE) oldconfig

 Bernhard> That find is gross. $(wildcard $(TOPDIR)/target/*/$(@)_defconfig)
 Bernhard> and we have $(Q) that is either set to '@' or is empty.
 Bernhard> Apart from that a failing oldconfig is and should be fatal.

Yes - Notice that it's not something new Thomas is introducing, it has
been in the tree for a long time (Ulf afaik added it).

I think I would actually prefer having all defconfigs together in
something like configs/ just like the Linux kernel has it instead of
spread over the tree. That has a number of advantages:

 - %_defconfig rule gets a lot simpler - E.G. something like:
%_defconfig: $(TOPDIR)/config/%_defconfig:
             cp $^ $(TOPDIR)/.config

 - We could display the available defconfigs in make help:
         @$(foreach b, $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig)), \
          printf "  %-22s - Build for %s\\n" $(b) $(subst _defconfig,,$(b));)

 - It's easy to build all defconfigs before a release with simple shell
   scripting, and it's easy for newcomers to see what configs are
   available

The disadvantage is that the defconfig isn't together with the other
target/device/* files.

I implemented something like that for the company I work for, but Ulf
added the current implementation before I got mine committed.

Comments, anyone?

-- 
Bye, Peter Korsgaard
