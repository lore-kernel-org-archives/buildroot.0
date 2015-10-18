From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 15:45:30 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/ffmpeg: Add support for
 GnuTLS
In-Reply-To: <1445110736-1663-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445110736-1663-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151018154530.06efcfb9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Yann,

On Sat, 17 Oct 2015 21:38:56 +0200, Bernd Kuhls wrote:
> Besides OpenSSL ffmpeg also supports GnuTLS.
> 
> If both GnuTLS and OpenSSL are enabled, the former takes precedence over
> the latter:
> http://git.videolan.org/?p=ffmpeg.git;a=blob;f=configure;h=7f9fed31a491ed0991aee2d354dba82e54e3291e;hb=refs/heads/release/2.8#l2719
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v4: Removed Kconfig options (Thomas)
> v3: rebased
> v2: OpenSSL and gpl'ed code from ffmpeg play together when nonfree

I've applied. However, I find the code to not be very pretty. What
about something like this instead:

ifeq ($(BR2_PACKAGE_GNUTLS),y)
FFMPEG_CONF_OPTS += --enable-gnutls --disable-openssl
FFMPEG_DEPENDENCIES += gnutls
# OpenSSL license is not compatible with the LGPL license of ffmpeg.
else ifeq ($(BR2_PACKAGE_OPENSSL):$(BR2_PACKAGE_FFMPEG_GPL):$(BR2_PACKAGE_FFMPEG_NONFREE),y::y)
FFMPEG_CONF_OPTS += --enable-openssl
FFMPEG_DEPENDENCIES += openssl
else
FFMPEG_CONF_OPTS += --disable-gnutls --disable-openssl
endif

I think it is functionally equivalent, but much nicer to read. If you
agree (and the above works), can you send a patch doing this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
