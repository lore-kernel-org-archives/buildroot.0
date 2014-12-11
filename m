From: Thierry Bultel <tbultel@free.fr>
Date: Thu, 11 Dec 2014 16:49:19 +0100
Subject: [Buildroot] [PATCH v2 1/1] Added mpd-mpc, mpc client to mpd
In-Reply-To: <1418310431.1312.25.camel@posteo.de>
References: <1418116054-31925-1-git-send-email-tbultel@free.fr>	
 <1418244950.1312.15.camel@posteo.de> <54898116.3090203@free.fr>
 <1418310431.1312.25.camel@posteo.de>
Message-ID: <5489BCFF.2080803@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 11/12/2014 16:07, J?rg Krause a ?crit :
> On Do, 2014-12-11 at 12:33 +0100, Thierry Bultel wrote:
>> Le 10/12/2014 21:55, J?rg Krause a ?crit :
>>> Hi Thierry,
>>>
>>> mpc was on my contribution list, too. You find my comments below.
>>>
>>> On Di, 2014-12-09 at 10:07 +0100, Thierry Bultel wrote:
>>>> ---
>>>> Changes v1 -> v2
>>>>     - No needed dependency to mpd (suggested by Thomas)
>>>>     - Added hash and license information
>>>>
>>>> Signed-off-by: Thierry Bultel <tbultel@free.fr>
>>>> ---
>>>>    package/Config.in            |  1 +
>>>>    package/mpd-mpc/Config.in    |  7 +++++++
>>>>    package/mpd-mpc/mpd-mpc.hash |  2 ++
>>>>    package/mpd-mpc/mpd-mpc.mk   | 14 ++++++++++++++
>>>>    4 files changed, 24 insertions(+)
>>>>    create mode 100644 package/mpd-mpc/Config.in
>>>>    create mode 100644 package/mpd-mpc/mpd-mpc.hash
>>>>    create mode 100644 package/mpd-mpc/mpd-mpc.mk
>>>>
>>>> diff --git a/package/Config.in b/package/Config.in
>>>> index 600a68d..e9cd5e8 100644
>>>> --- a/package/Config.in
>>>> +++ b/package/Config.in
>>>> @@ -19,6 +19,7 @@ menu "Audio and video applications"
>>>>    	source "package/madplay/Config.in"
>>>>    	source "package/modplugtools/Config.in"
>>>>    	source "package/mpd/Config.in"
>>>> +	source "package/mpd-mpc/Config.in"
>>>>    	source "package/mpg123/Config.in"
>>>>    	source "package/mplayer/Config.in"
>>>>    	source "package/musepack/Config.in"
>>>> diff --git a/package/mpd-mpc/Config.in b/package/mpd-mpc/Config.in
>>>> new file mode 100644
>>>> index 0000000..1debc83
>>>> --- /dev/null
>>>> +++ b/package/mpd-mpc/Config.in
>>>> @@ -0,0 +1,7 @@
>>>> +config BR2_PACKAGE_MPD_MPC
>>>> +	bool "mpd-mpc"
>>>> +	select BR2_PACKAGE_LIBMPDCLIENT
>>>> +	help
>>>> +	  A minimalist command line interface to MPD.
>>>> +
>>>> +	  http://www.musicpd.org/clients/mpc/
>>>> diff --git a/package/mpd-mpc/mpd-mpc.hash b/package/mpd-mpc/mpd-mpc.hash
>>>> new file mode 100644
>>>> index 0000000..d1fa7b1
>>>> --- /dev/null
>>>> +++ b/package/mpd-mpc/mpd-mpc.hash
>>>> @@ -0,0 +1,2 @@
>>>> +# No upstream hashes for the following:
>>>> +sha1 dd1577cfff1d8324bc27c97fb26d88b845118800  mpc-0.26.tar.xz
>>>> diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
>>>> new file mode 100644
>>>> index 0000000..a375807
>>>> --- /dev/null
>>>> +++ b/package/mpd-mpc/mpd-mpc.mk
>>>> @@ -0,0 +1,14 @@
>>>> +################################################################################
>>>> +#
>>>> +# mpc
>>>
>>> Package name is mpd-mpc:
>>>
>>>> +#
>>>> +################################################################################
>>>> +
>>>> +MPD_MPC_VERSION = 0.26
>>>> +MPD_MPC_SITE = http://www.musicpd.org/download/mpc/0
>>>> +MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
>>>
>>> I would follow the way mpd.mk and libmpdclient.mk are written:
>>>
>>>           MPD_MPC_VERSION_MAJOR = 0
>>>           MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).26
>>>           MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
>>>           MPD_MPC_SITE =
>>>           http://www.musicpd.org/download/mpc/$(MPD_MPC_VERSION_MAJOR)
>>>
>>>> +MPD_MPC_LICENSE = GPLv2
>>>
>>> Licence is GPLv2+
>>>           MPD_MPC_LICENSE = GPLv2+
>>>
>>>> +MPD_MPC_LICENSE_FILES = COPYING
>>>> +MPD_MPC_DEPENDENCIES = libmpdclient
>>>
>>> mpc also depends on host-pkgconf:
>>>           MPD_MPC_DEPENDENCIES = host-pkgconf libmpdclient
>>
>> Ok for host-pkgconf dependency
>>
>>>
>>> mpc needs a C99 compiler:
>>>           MPD_MPC_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
>>
>> I had not noticed it, probably because I had C++ support in my toolchain ?
>
> I think I used a one of the uclibc toolchains from autobuild for
> testing: http://autobuild.buildroot.org/toolchains/tarballs/
>
>>>
>>> mpc has an optional dependency to libiconv:
>>>           ifeq ($(BR2_PACKAGE_LIBICONV),y)
>>>           	MPD_MPC_DEPENDENCIES += libiconv
>>>           	MPD_MPC_CONF_OPTS += --enable-iconv
>>>           else
>>>           	MPD_MPC_CONF_OPTS += --disable-iconv
>>>           endif
>>>
>>
>> how did you noticed it ? simply by checking the configure options ?
>
> Yes.
>>
>>>> +
>>>> +$(eval $(autotools-package))
>>>
>>> I had the idea to group all MPD clients (currently mpc and ncmpcpp)
>>> under mpd and name them MPD_CLIENT_MPC, MPD_CLIENT_NCMPCPP. There exist
>>> several more clients which are only valuable with MPD. How about this?
>>
>> sure, ympd, and upmpdcli, too ? And what about libmpd ?
>
> upmpdcli is not a client, but a front-end. And libmpd is a library.
>
> I have thought about this again. It's not necessary to have MPD and the
> client on the same host, the it must be possible to build the client
> without selecting MPD.
>
> Maybe something like this make sense in the Kconfig:
>
> [ ] mpd
> [*] mpd-clients --->
> [ ] mpc
> [ ] ncmpcpp
> ...

That is also what I am thinking about.
But it could be nice to have a mpd main menu, that holds mpd, then the 
frontends, the libraries, and the clients, in different sections.

I will submit something like that.

>
> But this can be proposed later.
>
