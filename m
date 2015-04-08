From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 23:35:23 +0200
Subject: [Buildroot] [PATCH 00/18] package/mplayer: add optional
 dependencies
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150408233523.087d9e0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 29 Mar 2015 19:11:16 +0200, Bernd Kuhls wrote:

>   package/mplayer: add optional lzo support
>   package/mplayer: add optional faad2 support
>   package/mplayer: add optional rtmpdump support
>   package/mplayer: add optional speex support
>   package/mplayer: add optional libiconv support
>   package/mplayer: disable optional libcdio support
>   package/mplayer: add optional bzip2 support
>   package/mplayer: add optional lame support
>   package/mplayer: add optional libmpeg2 support

I've applied those patches, after fixing up things to rely on
autodection in order to avoid the "extra libs" thing.

However, I'm not entirely happy with how the mplayer package looks
like. Some dependencies have explicit disable:

ifeq ($(BR2_PACKAGE_LAME),y)
MPLAYER_DEPENDENCIES += lame
MPLAYER_CONF_OPTS += --enable-mp3lame
else
MPLAYER_CONF_OPTS += --disable-mp3lame
endif

but some do not:

ifeq ($(BR2_PACKAGE_TREMOR),y)
MPLAYER_DEPENDENCIES += tremor
MPLAYER_CONF_OPTS += --disable-tremor-internal --enable-tremor
endif

and for example, when --disable-tremor is not passed, an internal
tremor implementation is used, as far as I can see.

There are also cases like:

MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_BZIP2),bzip2)

All of this should probably be harmonized to properly get an explicit
disabling for all dependencies, unless there is a good reason not to do
so.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
