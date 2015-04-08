From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Apr 2015 23:46:17 +0200
Subject: [Buildroot] [PATCH 00/18] package/mplayer: add optional
 dependencies
In-Reply-To: <20150408233523.087d9e0c@free-electrons.com>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <20150408233523.087d9e0c@free-electrons.com>
Message-ID: <20150408214617.GJ4197@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-08 23:35 +0200, Thomas Petazzoni spake thusly:
> On Sun, 29 Mar 2015 19:11:16 +0200, Bernd Kuhls wrote:
> 
> >   package/mplayer: add optional lzo support
> >   package/mplayer: add optional faad2 support
> >   package/mplayer: add optional rtmpdump support
> >   package/mplayer: add optional speex support
> >   package/mplayer: add optional libiconv support
> >   package/mplayer: disable optional libcdio support
> >   package/mplayer: add optional bzip2 support
> >   package/mplayer: add optional lame support
> >   package/mplayer: add optional libmpeg2 support
> 
> I've applied those patches, after fixing up things to rely on
> autodection in order to avoid the "extra libs" thing.
> 
> However, I'm not entirely happy with how the mplayer package looks
> like. Some dependencies have explicit disable:
> 
> ifeq ($(BR2_PACKAGE_LAME),y)
> MPLAYER_DEPENDENCIES += lame
> MPLAYER_CONF_OPTS += --enable-mp3lame
> else
> MPLAYER_CONF_OPTS += --disable-mp3lame
> endif
> 
> but some do not:
> 
> ifeq ($(BR2_PACKAGE_TREMOR),y)
> MPLAYER_DEPENDENCIES += tremor
> MPLAYER_CONF_OPTS += --disable-tremor-internal --enable-tremor
> endif
> 
> and for example, when --disable-tremor is not passed, an internal
> tremor implementation is used, as far as I can see.
> 
> There are also cases like:
> 
> MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_BZIP2),bzip2)
> 
> All of this should probably be harmonized to properly get an explicit
> disabling for all dependencies, unless there is a good reason not to do
> so.

Well, the reason is pretty obvious:

  - it's not an autotools package, the configure is hand-written
  - some options have explicit --enable/disable-foo
  - some options only have --enable-foo
  - and some only rely on detecting the optional lib(s)

For example, there's no option for bzip2: if the lib is present, it is
enabled, otherwise it is disabled.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
