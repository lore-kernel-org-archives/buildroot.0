From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 18 May 2015 09:20:40 -0400
Subject: [Buildroot] [PATCH] libsodium: new package
In-Reply-To: <555900BF.6080704@openwide.fr>
References: <1431819535-9598-1-git-send-email-fhunleth@troodon-software.com>
 <55587EF9.1010003@openwide.fr>
 <CA+-urNTixTObmKHSWe5siw4wB3yqm_OTCCQdRHC5xoy9ZXRFNQ@mail.gmail.com>
 <555900BF.6080704@openwide.fr>
Message-ID: <CA+-urNT83-HMHiQ+KZB5N_jiKqoaEJMydWYNZUZzzx9u-WFmxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sun, May 17, 2015 at 4:57 PM, Romain Naour <romain.naour@openwide.fr> wrote:
> Hi Frank,
>
> Le 17/05/2015 20:25, Frank Hunleth a ?crit :
>> Hi Romain,
>>
>> On Sun, May 17, 2015 at 7:43 AM, Romain Naour <romain.naour@openwide.fr> wrote:
>>> Hi Frank,
>>>
>>> Le 17/05/2015 01:38, Frank Hunleth a ?crit :
>>>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>>>> ---
>>>>  package/Config.in                |  1 +
>>>>  package/libsodium/Config.in      |  6 ++++++
>>>>  package/libsodium/libsodium.hash |  2 ++
>>>>  package/libsodium/libsodium.mk   | 14 ++++++++++++++
>>>>  4 files changed, 23 insertions(+)
>>>>  create mode 100644 package/libsodium/Config.in
>>>>  create mode 100644 package/libsodium/libsodium.hash
>>>>  create mode 100644 package/libsodium/libsodium.mk
>>>>
>>>
>>> Since you are adding a new library, some packages will try to link with it.
>>> As far I know, zeromq can link with libsodium, so a new dependency should be
>>> added in a follow up patch.
>>
>> Thanks. I didn't know about the zeromq dependency. Before I submit a
>> new patch, do you know of an easy way to figure out what other
>> packages have a hidden dependency like this?
>
> There is no easy way, maybe by using the package manager from your GNU/Linux
> distribution to find some hit.
>
> Something like (debian8): sudo apt-cache rdepends libsodium13
> libsodium13
> Reverse Depends:
>   libzmq3
>   libzmq3
>   libsodium-dev
>   libsodium-dbg

I see basically the same list on my system. I did some searching
around and didn't see anything else.

>>> There is even an upstream path to disable libsodium in zeromq:
>>> https://github.com/zeromq/zeromq4-x/commit/faaf4550263395b84e6a80d3f9d7ba8816cdd714
>>
>> I looked at it. I'm not a zeromq user, so I don't really understand
>> why someone would want to have libsodium support disabled if they have
>> it. It seems simpler for now to make sure the dependency is there in
>> BR if libsodium is enabled. Maybe this is more of a desktop need?
>
> It's sometime required to do this construct in .mk files in order to handle
> properly the package dependency. (from nmap.mk)
>
> ifeq ($(BR2_PACKAGE_OPENSSL),y)
> NMAP_CONF_OPTS += --with-openssl="$(STAGING_DIR)/usr"
> NMAP_DEPENDENCIES += openssl
> else
> NMAP_CONF_OPTS += --without-openssl
> endif
>
> It's also depends if the option is on/off by default.
>
> But you're right, you need only something like this since libsodium is not
> enabled by default.
>
> ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
> ZEROMQ_DEPENDENCIES += libsodium
> ZEROMQ_CONF_OPTS += --with-libsodium="$(STAGING_DIR)/usr"
> endif

I'm sending a followup patch series with this shortly.

Thanks,
Frank
