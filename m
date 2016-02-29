From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Feb 2016 22:49:03 +0100
Subject: [Buildroot] [PATCH v2] gst1-av: fix cpu detection in libav
	configure
In-Reply-To: <1456701407-18377-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 29 Feb 2016 00:16:47 +0100")
References: <1456701407-18377-1-git-send-email-arnout@mind.be>
Message-ID: <87vb57nq5s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The configure script tries to guess a lot based on the cpu for which it
 > is configured. Without --cpu, it will use a 'generic' cpu and disable
 > any other options we pass to it.

 > In addition, we have to pass the --sysroot option like we do in the
 > ffmpeg package. This makes sure that regardless of the architecture
 > options that ffmpeg passes along, an external multilib toolchain
 > doesn't try to use a subdirectory of the sysroot. The libav build
 > system will pass a --isysroot argument which overrides the multilib
 > subdir.

 > Finally, we have to properly enable/disable the architecture-specific
 > optimisations. Autodetection of these things is completely borked in
 > the configure script.

 > Fixes:
 > http://autobuild.buildroot.net/results/ce83513135e7765c171353815947d715eb897d3d

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 > v2: improve commit message

 > The --isysroot is something we should probably do in the toolchain
 > wrapper.
 > ---
 >  package/gstreamer1/gst1-libav/gst1-libav.mk | 23 ++++++++++++++++++++++-
 >  1 file changed, 22 insertions(+), 1 deletion(-)

 > diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
 > index 3a987a7..97ff40f 100644
 > --- a/package/gstreamer1/gst1-libav/gst1-libav.mk
 > +++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
 > @@ -10,7 +10,10 @@ GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 
 >  GST1_LIBAV_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
 
 > -GST1_LIBAV_CONF_EXTRA_OPTS = --cross-prefix=$(TARGET_CROSS) --target-os=linux
 > +GST1_LIBAV_CONF_EXTRA_OPTS = \
 > +	--cross-prefix=$(TARGET_CROSS) \
 > +	--target-os=linux \
 > +	--sysroot=$(STAGING_DIR)

What does this do exactly? As far as I can see this only sets the
sysinclude_default variable (which apparently isn't used anywhere?) and
passes --sysroot / --isysroot to the compiler, which should be a noop
for us as we already do that in the wrapper.

-- 
Bye, Peter Korsgaard
