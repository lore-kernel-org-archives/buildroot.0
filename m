From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 19 Oct 2015 21:23:48 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/ffmpeg: Add support for
	GnuTLS
References: <1445110736-1663-1-git-send-email-bernd.kuhls@t-online.de>
 <20151018154530.06efcfb9@free-electrons.com>
Message-ID: <4jsffcxklv.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sun, 18 Oct 2015 15:45:30 +0200 schrieb Thomas Petazzoni:

> # OpenSSL license is not compatible with the LGPL license of ffmpeg.
> else ifeq ($(BR2_PACKAGE_OPENSSL):$(BR2_PACKAGE_FFMPEG_GPL)
$(BR2_PACKAGE_FFMPEG_NONFREE),y::y)
> FFMPEG_CONF_OPTS += --enable-openssl
> FFMPEG_DEPENDENCIES += openssl
> else
> FFMPEG_CONF_OPTS += --disable-gnutls --disable-openssl
> endif
> 
> I think it is functionally equivalent, but much nicer to read. If you
> agree (and the above works), can you send a patch doing this?

your code does not duplicate the logic of ffmpeg configure. In your 
proposal the following settings are required for OpenSSL support:

	BR2_PACKAGE_FFMPEG_GPL		disabled
	BR2_PACKAGE_FFMPEG_NONFREE	enabled

This is one of three valid combinations, ffmpeg configure also
accepts these combinations for OpenSSL support:

	BR2_PACKAGE_FFMPEG_GPL		disabled
	BR2_PACKAGE_FFMPEG_NONFREE	disabled
and
	BR2_PACKAGE_FFMPEG_GPL		enabled
	BR2_PACKAGE_FFMPEG_NONFREE	enabled

because in

http://git.videolan.org/?
p=ffmpeg.git;a=blob;f=configure;h=7f9fed31a491ed0991aee2d354dba82e54e3291e;hb=refs/
heads/release/2.8#l4664

the following code line

enabled gpl && die_license_disabled_gpl nonfree openssl

checks whether --enable-gpl was issued and breaks only if --enable-
nonfree is not used at the same time like in the third example.

If --enable-gpl is not used, like in the first and second example, there 
will be no OpenSSL-related license checks during ffmpeg configure.

In other words: You can enable gpl-only code in ffmpeg along with OpenSSL 
support if you do not re-distribute the resulting binaries. If you do not 
enable gpl-only code you can do what you want regarding OpenSSL ;)

I am a bit lost atm trying to mirror this logic in an optimized form in 
package/ffmpeg/ffmpeg.mk as requested, sorry.

Regards, Bernd
