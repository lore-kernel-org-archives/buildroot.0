From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 19 Mar 2014 12:58:40 +0100
Subject: [Buildroot] [PATCH v3 1/2] libubox: new package
In-Reply-To: <CAHXCMMKqbip=H_DnrDhv5fkU=pmwA69a6=7oh-0nznm85Zw7hg@mail.gmail.com>
References: <1395172899-3799-1-git-send-email-yegorslists@googlemail.com>
 <20140318233003.779610f2@skate>
 <CAGm1_kuWvJG9JuikJsBZ+uBwoBFoJVhyNnugaUvQS9HpPiFa-g@mail.gmail.com>
 <CAHXCMMKqbip=H_DnrDhv5fkU=pmwA69a6=7oh-0nznm85Zw7hg@mail.gmail.com>
Message-ID: <CAGm1_ks2FeSgnk7xdwxVysYcgrHVKARfUSU38vDLcYOcAhwFwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 19, 2014 at 12:29 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Yegor, all,
>
> On Wed, Mar 19, 2014 at 12:00 PM, Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
>> On Tue, Mar 18, 2014 at 11:30 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Dear Yegor Yefremov,
>>>
>>> On Tue, 18 Mar 2014 21:01:38 +0100, Yegor Yefremov wrote:
>>>
>>>> +LIBUBOX_VERSION = bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b
>>>> +LIBUBOX_SITE = git://nbd.name/luci2/libubox.git
>>>> +LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
>>>> +LIBUBOX_INSTALL_STAGING = YES
>>>> +
>>>> +ifeq ($(BR2_PACKAGE_LUA),y)
>>>> +     LIBUBOX_DEPENDENCIES = lua
>>>> +     LIBUBOX_MAKE_ENV = \
>>>> +             PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
>>>> +             PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
>
> This should be added in the cmake infrastructure.
> In package/pkg-cmake.mk, PKG_CONFIG_SYSROOT_DIR is already correctly set:
> http://git.buildroot.net/buildroot/tree/package/pkg-cmake.mk#n173
>
> I'm a bit dubious about the need for PKG_CONFIG_PATH, this is already
> a standard location in which pkg-config looks for (according to man).
> I would expect this variable to be set in the
> $(HOST_DIR)/usr/bin/pkg-config wrapper, but AFAICS it's not :-/
>
> BTW, what error are you facing without these variables set in
> configure env.? Could you pastebin the error logs?

Strange. I've removed the statements and I have no problems. As I
started with my development, CMake complained about not finding Lua
via pkg-config and it worked only after I've added these PATHs. I'll
this at home, where I've encountered this issue and then resend the
patches.

>>> No. These variables should I believe not be necessary. The
>>> cmake-package infrastructure should simply use PATH=$(TARGET_PATH) so
>>> that when a CMake package is built, $(HOST_DIR)/usr/bin/pkg-config is
>>> used, and this pkg-config variant already knows the right path and
>>> sysroot for the .pc files.
>>>
>>> I believe Samuel Martin has already sent a patch doing this for the
>>> CMake package infrastructure.
>>
>> Samuel could you point me to the right package with the proper example?
