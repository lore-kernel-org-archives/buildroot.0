From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Mar 2012 21:48:57 +0200
Subject: [Buildroot] [PATCH v5] vlc: New package
In-Reply-To: <1332381260-15711-1-git-send-email-ismael.luceno@gmail.com>
References: <1332381260-15711-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <201203252148.58501.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 22 March 2012 02:54:20 Ismael Luceno wrote:
> Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>

 Not done yet, unfortunately...  But for a big patch like this that's
to be expected.

 If you're in a hurry to get this integrated, it may be worthwhile to
split the patch into a basic one that includes a minimal feature set,
and an extension that adds all the config options for the different
components.

 You should also test it with a minimal internal toolchain, i.e.
without any largefile, wchar and gettext stuff.  That will expose
a great number of errors right away.  For instance, the v4l2 stuff
fails because of LARGEFILE.

[snip]
> +config BR2_PACKAGE_VLC_PULSE
> +       bool "PulseAudio support"
> +       select BR2_PACKAGE_PULSEAUDIO

 pulseaudio depends on BR2_USE_WCHAR, so this dependency should be
repeated here.  And there should be a comment explaining that
WCHAR is needed.  Like this:

config BR2_PACKAGE_VLC_PULSE
	bool "PulseAudio support"
	select BR2_PACKAGE_PULSEAUDIO
	depends on BR2_USE_WCHAR # pulseaudio

comment "PulseAudio support requires a toolchain with WCHAR support"
	depends on !BR2_USE_WCHAR

 You should check for such a situation for each package for which you
add a select statement.  There are quite a few more like that, I've
checked it for just this one.  I mention a few more below, but there
are probably even more.


 Also, it would be nice to have a short help text for each option.
Doesn't have to be much, something like "pulseaudio is a proxy
between the audio hardware and audio applications.  See
http://pulseaudio.org" is sufficient.  But I realize it's a lot of
effort to write help texts for all these options.


[snip]
> +config BR2_PACKAGE_VLC_AVCODEC
> +       bool "FFmpeg (Many CODECs)"
> +       select BR2_PACKAGE_FFMPEG
> +       help
> +	 There is an awful lot of CODECs in libavcodec. You might want to avoid
> +	 duplication.

 This help text isn't very clear.  How about:

There is a large number of codecs in FFmpeg/libavcodec.  It is 
advisable to avoid duplication: select either the FFmpeg or the
vlc implementation for each codec, not both.

[snip]
> +config BR2_PACKAGE_VLC_GVFS
> +       bool "Gnome VFS support"
> +       select BR2_PACKAGE_GFVS
 Typo here: _GVFS.  And missing depends on BR2_LARGEFILE and 
BR2_USE_WCHAR.


> +config BR2_PACKAGE_VLC_V4L2
> +       bool "Video4Linux 2 support"
> +       select BR2_PACKAGE_LIBV4L
 depends on BR2_LARGEFILE

[snip]
> +config BR2_PACKAGE_VLC_UDEV
> +       bool "Udev support"
> +       select BR2_PACKAGE_UDEV

 udev is a special case, because it depends on the /dev management
option BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV.  You can't use a
select for that one (it would be too confusing).  So just set a
depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV.  The comment
is not needed in this case, because it's quite obvious that udev
support only makes sense if you have udev.

[snip]
> diff --git a/package/multimedia/vlc/vlc-uclibc-fixes.patch b/package/multimedia/vlc/vlc-uclibc-fixes.patch
> new file mode 100644
> index 0000000..5471b08
> --- /dev/null
> +++ b/package/multimedia/vlc/vlc-uclibc-fixes.patch
> @@ -0,0 +1,25 @@
> +Fixes compilation with uClibc, which doesn't provide gnu/libc-version.h nor
> +gnu_get_libc_version.
> +
> +Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>

 Did you send this patch upstream to vlc?  If not, could you do so?

[snip]
> +VLC_CONF_OPT += $(foreach i,avcodec avformat postproc swscale,--disable-$i)

 Nice!

[snip]
> +# The configure script fails to detect vasprintf on uClibc.
> +VLC_POST_CONFIGURE_HOOKS += VLC_FIX_CONF
> +define VLC_FIX_CONF
> +	$(SED) '1i#define HAVE_VASPRINTF 1' $(@D)/config.h
> +endef

 Nice!  Maybe remove the existing HAVE_VASPRINTF line too:

$(SED) '/HAVE_VASPRINTF/d; 1i#define HAVE_VASPRINTF 1' $(@D)/config.h

 Also, it's a bit more natural to put the 
VLC_POST_CONFIGURE_HOOKS += VLC_FIX_CONF
after the definition of VLC_FIX_CONF.  But it doesn't make a
difference, of course.


> +# The following rmoves the relink_command. If not removed, libtool tries to
                   ^^^removes
> +# relink against the host libraries, instead of the sysroot.
> +VLC_POST_BUILD_HOOKS += VLC_FIX_LA_FILES
> +define VLC_FIX_LA_FILES
> +	find $(@D) -name '*.la' -exec $(SED) '/^relink_command=/d' '{}' +

 For which .la's is this needed?  I've compiled various configurations with
several toolchains and I don't see a relink_command in any of the .la
files...

> +	touch $(@D)/modules/access/zip/libzip_plugin.la \
> +		$(@D)/modules/misc/liblogger_plugin.la

 And why is this needed?

> +endef
> +
> +$(eval $(call AUTOTARGETS))


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
