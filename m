From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Jul 2008 16:45:01 +0200
Subject: [Buildroot] [PATCH 1/5] lxdoom-wad: make installation of
	Doom	shareware wad file be more generic
In-Reply-To: <20080724143341.GA4991@mx.loc> (Bernhard Fischer's message of
	"Thu\, 24 Jul 2008 16\:33\:41 +0200")
References: <1216905717-9197-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<20080724143341.GA4991@mx.loc>
Message-ID: <87hcaffij6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> cp -f $(DL_DIR)/$(LXDOOM_WAD_SOURCE) $(LXDOOM_WAD_DIR)
 >> -	gunzip -d $(LXDOOM_WAD_DIR)/$(LXDOOM_WAD_SOURCE) 
 >> +	gunzip -d $(LXDOOM_WAD_DIR)/$(LXDOOM_WAD_SOURCE)

 Bernhard> no. There is no gunzip. So who added this stuff? I'm 100%
 Bernhard> sure that when i left there were no hardcoded decompressors
 Bernhard> in there. You should listen to what user say
 Bernhard> (resp. configure).

Yes, $(ZCAT) is what you want.

 >> +$(TARGET_DIR)/usr/share/games/doom/doom1.wad: $(LXDOOM_WAD_DIR)/.unpacked
 >> +	mkdir -p $(TARGET_DIR)/usr/share/games/doom
 >> +	cp -f $(LXDOOM_WAD_DIR)/doom-$(LXDOOM_WAD_VERSION).wad $@

 Bernhard> $(INSTALL) -D $(LXDOOM_WAD_DIR)/doom-$(LXDOOM_WAD_VERSION).wad $@

Yes, as long as you don't try to do it with symlinks (E.G. like what
you have with .so files) as install then resolves the symlinks and you
end up with multiple copies in your rootfs.

.. Like I recently learned the hard way (22862) ;)

-- 
Bye, Peter Korsgaard
