From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 29 Oct 2012 16:23:39 -0400
Subject: [Buildroot] Topics for the Buildroot Developers meeting
In-Reply-To: <20121029194314.7545a446@skate>
References: <20121029194314.7545a446@skate>
Message-ID: <CANxTyt6PV3WYycEmUFzXECsE3W2UErmqkPF-jMovy_YAn291Cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 29, 2012 at 2:43 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Please let us know if you have other topics that you would like us to
> discuss: issues with Buildroot, missing features, anything.

Maybe a couple of small items, if the attendants are interested:

- If the autobuilder emails are generated from some kind of script,
then it would be nice if the report could be modified to include
per-package failure counts.  This gives anyone who is interested in
reducing failure count an idea of what issue might reduce the failure
count the most.  For example, the following line comes close:

  $ grep "Failure reason" 2012-09-26.htm | sort | uniq -c | sort -nr
      5 Failure reason : linux-pam-1.1.4
      4 Failure reason : genext2fs-1.4.1
      3 Failure reason : lua-5.1.5
      3 Failure reason : libffi-3.0.11
      3 Failure reason : gnutls-2.12.20
      2 Failure reason : x11vnc-0.9.13
      2 Failure reason : pulseaudio-2.0
      2 Failure reason : mplayer-1.1
      2 Failure reason : icu-4.8.1.1
      2 Failure reason : directfb-1.4.16
      1 Failure reason : xenomai-2.6.0
      1 Failure reason : qt-4.8.3
      1 Failure reason : python-2.7.2

- Back in May or so, ccache.mk was changed to set the cache directory
default to an environment variable setting rather than hard-coding to
the defconfig's setting, and the Makefile modified to export that same
variable.  But when ccache is invoked by hand rather than by Makefile,
ccache uses ~/.ccache for the directory unless you set up a
BUILDROOT_CACHE_DIR environment variable that hopefully matches the
defconfig's setting.  It's nice that we can change the cache dir
without recompiling ccache (I guess), but a side effect is that it is
now more difficult to configure ccache for a larger cache (the -M
operation).  I have a project that exceeds the default 1GB default, so
I hit this issue often.  (I also like to use the -s to see status
without incurring the 3 or 4 seconds required to read all the
Makefile/*.mk files when I call "make ccache-stats" on my little Acer
Aspire netbook.)  So I was considering adding something like this, to
change ccache's last-ditch .ccache default to at least give the
possibility of matching a likely "$(HOME)/*" defconfig setting:

# Change hard-coded default to match path in the defconfig
ifneq (,$(filter "$(HOME)/%,$(BR2_CCACHE_DIR)))
  define HOST_CCACHE_CHANGE_DEFAULT_DIR
	sed -i 's,"%s/.ccache",$(BR2_CCACHE_DIR:"$(HOME)/%="\%s/%),' $(@D)/ccache.c
  endef
  HOST_CCACHE_POST_CONFIGURE_HOOKS += HOST_CCACHE_CHANGE_DEFAULT_DIR
endif

So if attendants also use ccache and have similar concerns, maybe a
minute or two can be spared to see if this is a general problem worth
looking into?

Thanks,
Danomi -
