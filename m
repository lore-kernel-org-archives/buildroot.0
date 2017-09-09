From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Sun, 10 Sep 2017 00:12:01 +0200
Subject: [Buildroot] [PATCH 01/49 v2] package/asterisk: new package
In-Reply-To: <ee34d49f318e171beb6b4ba642d04c960aa9560e.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <ee34d49f318e171beb6b4ba642d04c960aa9560e.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <99aa5c38-2b31-f313-19fa-c42e28e37c3c@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Yann,

I found a few typos :-).

On 09.09.2017 23:39, Yann E. MORIN wrote:
> Asterisk: the flagship of telephony on Linux. These are the lines of
> code whose continuous mission is to power small and large enterprises
> telephony systems, to boldly provide IP PBX where no one has done so
> before.
> 
> But it is a hell to get compiled... :-(
> 
> For starters, it needs a host tool, menuselect, to prepare its build
> configuration. Unfortunately, the way it handles menuselect does not
> paly very well for cross-compilation: the main ./configure calls out to

"paly" --> apply?

> menuselect's own ./configure, and of course that runs with the same
> environement, which is wrong for croos-compilation (because of variables

"croos-compilation"

> like CC, CFLAGS and the likes).
> 

[..]

> [0] http://downloads.asterisk.org/pub/telephony/asterisk/releases/
> 
> The official archive contains the sound archives plus a full set of
> documentation. This makes it very big. Unfotunately, the hosting site is

"Unfotunately" - missing an r. What does 'very big' actually mean?

> rather slow, topping at about ~204kbps. So we get the archive from the
> official mirror on Github. But that archive is missing the sound
> archives, so we download them separately.
> 
> Some tests, like the crypt() one, are broken and could not have ever
> possibly worked at all. Worse, the FFmpeg test is looking for headers
> that FFmpeg removed more than 10 years ago and are virtually no longer
> available in any distro. So, FFmpeg support is definitely not tested
> by upstream and can't possibly work at all. Finally, trying to run
> test-code does not work in cross-compilation.
> 
> As a final stroke of genius, asterisk checks for the re-entrant variant
> of res_ninit(), and concludes that all such functions are available, 
> of which res_nsearch(). 

I think a word is probably missing here?

[...]

> diff --git a/package/asterisk/0001-configure-do-not-configure-in-menuselect.patch b/package/asterisk/0001-configure-do-not-configure-in-menuselect.patch
> new file mode 100644
> index 0000000000..33c917d7fa
> --- /dev/null
> +++ b/package/asterisk/0001-configure-do-not-configure-in-menuselect.patch
> @@ -0,0 +1,58 @@
> +From cc5daff874779475742bdb89a9328bb4fc4c4e09 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Tue, 27 Dec 2016 11:20:19 +0100
> +Subject: [PATCH] configure: do not configure in menuselect
> +
> +When cross-compiling, the arguments and environment for ./configure are
> +different for the host and the target, and we want menuselect to be
> +compiled for the build machine, not the target.
> +
> +Although we do not pass any option to ./configure for menuselect, the
> +environment may still reference variables for the tagert, like CC or
> +CFLAGS and so on... We can not build menuselect with those variables.
> +
> +Intead, just assume that menuselect will be pre-compiled.

Intead -> Instead

[...]

> diff --git a/package/asterisk/0003-configure-fix-detection-of-libcrypt.patch b/package/asterisk/0003-configure-fix-detection-of-libcrypt.patch
> new file mode 100644
> index 0000000000..b92fc9a13d
> --- /dev/null
> +++ b/package/asterisk/0003-configure-fix-detection-of-libcrypt.patch
> @@ -0,0 +1,43 @@
> +From 8996503f6c55e55f326ab11c18278954ad7abaf3 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Tue, 27 Dec 2016 11:21:57 +0100
> +Subject: [PATCH] configure: fix detection of libcrypt
> +
> +The crypt() function is searched in two locations: -lcrypt and the
> +standard C library.
> +
> +The result of the forner is stored in the LIBCRYPT 'scheme' while that

forner -> former

[...]

> diff --git a/package/asterisk/0004-configure-in-cross-complation-assimne-eventfd-are-av.patch b/package/asterisk/0004-configure-in-cross-complation-assimne-eventfd-are-av.patch
> new file mode 100644
> index 0000000000..38214c38c0
> --- /dev/null
> +++ b/package/asterisk/0004-configure-in-cross-complation-assimne-eventfd-are-av.patch
> @@ -0,0 +1,37 @@
> +From e7de812c979d219765fbf1292f0e150bfa087716 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Sun, 18 Jun 2017 21:54:16 +0200
> +Subject: [PATCH] configure: in cross-complation, assume eventfd are available
> +
> +eventfd have been in the kernel since 2.6.22, and in glibc since 2.8,
> +repectively released in July 2007 and April 2008, almost a decade ago
> +now.
> +
> +Assume that noone building from now on for cross-compilation will be

'noone' -> no one

> +unlucky enough to get versions older than that...
> +
> +As such, in cross-compilation, assumne eventfd are available.

'assumne '-> assume

[...]

> +++ b/package/asterisk/asterisk.mk
> @@ -0,0 +1,173 @@
> +################################################################################
> +#
> +# asterisk
> +#
> +################################################################################
> +
> +ASTERISK_VERSION = 14.5.0
> +# Use the github mirror: it's an official mirror maintained by Digium, and
> +# provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
> +ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
> +
> +ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
> +ASTERISK_EXTRA_DOWNLOADS = \
> +	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.5.tar.gz \
> +	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz
> +
> +# For patches 0001, 0003 and 0004
> +ASTERISK_AUTORECONF = YES
> +ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject
> +
> +ASTERISK_DEPENDENCIES = \
> +	host-asterisk \
> +	jansson \
> +	libcurl \
> +	libxml2 \
> +	ncurses \
> +	sqlite \
> +	util-linux
> +
> +# Asterisk wants to run its menuselect tool (a highly tweaked derivative of
> +# kconfig), but builds it using the target tools. So we build it in the host
> +# variant (see below), and copy the full build tree of menuselect.
> +define ASTERISK_COPY_MENUSELECT
> +	rm -rf $(@D)/menuselect
> +	cp -a $(HOST_ASTERISK_DIR)/menuselect $(@D)/menuselect
> +endef
> +ASTERISK_PRE_CONFIGURE_HOOKS += ASTERISK_COPY_MENUSELECT
> +
> +ASTERISK_CONF_OPTS = \
> +	--disable-xmldoc \
> +	--disable-internal-poll \
> +	--disable-asteriskssl \
> +	--disable-rpath \
> +	--without-asound \
> +	--without-bfd \
> +	--without-execinfo \
> +	--without-bluetooth \
> +	--without-cap \
> +	--without-cpg \
> +	--without-curses \
> +	--without-dahdi \
> +	--without-gsm \
> +	--without-ilbc \
> +	--without-gtk2 \
> +	--without-gmime \
> +	--without-h323 \
> +	--without-hoard \
> +	--without-ical \
> +	--without-iconv \
> +	--without-iksemel \
> +	--without-imap \
> +	--without-inotify \
> +	--without-iodbc \
> +	--without-isdnnet \
> +	--without-jack \
> +	--without-uriparser \
> +	--without-kqueue \
> +	--without-ldap \
> +	--without-libedit \
> +	--without-libxslt \
> +	--without-ltdl \
> +	--without-lua \
> +	--without-misdn \
> +	--without-mysqlclient \
> +	--without-nbs \
> +	--without-neon \
> +	--without-neon29 \
> +	--without-netsnmp \
> +	--without-newt \
> +	--without-ogg \
> +	--without-openr2 \
> +	--without-opus \
> +	--without-osptk \
> +	--without-oss \
> +	--without-postgres \
> +	--without-pjproject \
> +	--without-popt \
> +	--without-portaudio \
> +	--without-pri \
> +	--without-pwlib \
> +	--without-radius \
> +	--without-resample \
> +	--without-sdl \
> +	--without-SDL_image \
> +	--without-spandsp \
> +	--without-ss7 \
> +	--without-speex \
> +	--without-speexdsp \
> +	--without-sqlite \
> +	--without-srtp \
> +	--without-ssl \
> +	--without-suppserv \
> +	--without-tds \
> +	--without-termcap \
> +	--without-timerfd \
> +	--without-tinfo \
> +	--without-tonezone \
> +	--without-unbound \
> +	--without-unixodbc \
> +	--without-vorbis \
> +	--without-vpb \
> +	--without-x11 \
> +	--without-z \
> +	--with-crypt \
> +	--with-jansson \
> +	--with-libcurl \
> +	--with-libxml2 \
> +	--with-ncurses="$(STAGING_DIR)/usr" \
> +	--with-sqlite3="$(STAGING_DIR)/usr" \
> +	--with-sounds-cache=$(BR2_DL_DIR)
> +
> +# avcodec are from ffmpeg. There is virtually zero chance this could
> +# even work; 

"could have ever worked"?

[...]

Best wishes,
Marcus
