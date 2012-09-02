From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 02 Sep 2012 21:52:59 +0200
Subject: [Buildroot] make clean; make doesn't work
Message-ID: <5043B91B.8020703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  To test Yann's latest patch series, I did a 'make clean; make' in one of my
output directories.  Surprisingly, this failed...  Because the .config in
that directory was pretty old, the silentoldconfig was run.  This run asked
me a few questions about newly added options.  One of them was the external
toolchain - the original one didn't exist anymore.  So I select a different
one, and buildroot continues building.  However, it's still using the old
toolchain!  Clearly, this will create problems somewhere down the line...

  What happens is that the .config is included by the Makefile; however,
when the .config is modified, it is not re-read.  Normally, GNU make
automatically re-reads an included file when it is updates.  However,
this doesn't happen here because the .config file does not appear as
a target.  Instead, it is created by the rule

$(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
	$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig

i.e. as a side-effect of building auto.conf.

  So I'd like to make the .config a real target of a dependency that rebuilds
it.  Unfortunately, I don't understand enough of this auto.conf file
to know how to do it...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
