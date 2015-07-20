From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Jul 2015 23:49:34 +0200
Subject: [Buildroot] [PATCH v1 1/1] rtl8821au: new package
In-Reply-To: <CA+h8R2rrU9vxJ7KiXpTuZW5S9+w9RZJwfLx_t+04OnYRJYEmiA@mail.gmail.com>
References: <1436914861-10912-1-git-send-email-christian@paral.in>
 <20150718232609.5828891c@free-electrons.com>
 <CA+h8R2pR_BU7FRm0R8EHKuA7rqgeeRrzBzy1AkvVEuqo04uAwQ@mail.gmail.com>
 <20150720233051.6ae1947e@free-electrons.com>
 <CA+h8R2rrU9vxJ7KiXpTuZW5S9+w9RZJwfLx_t+04OnYRJYEmiA@mail.gmail.com>
Message-ID: <20150720214934.GA3730@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2015-07-20 21:35 +0000, Christian Stewart spake thusly:
> I don't think I will forget about maintaining this because we're using the
> driver here in the lab extensively. Only thing I can forsee happening is
> the vendor releasing another version at some point, but you can always
> email me to update the repo and test with the newer version and I'll get on
> it pretty quickly.

Yeah, as Thomas said, we have no choice in this case, and yuour repo is
as good as any other in this respect. Thanks for doing that work! :-)

> As per the rtl8821au business...
> 
> Is this the best way to specify the defines I need in the makefile:
> 
> RTL8821AU_MODULE_MAKE_OPTS = KVER="$(LINUX_VERSION_PROBED)"
> ARCH="$(KERNEL_ARCH)"

Well, you can ditch ARCH, it's already passed by the kernel-module infra.
Also, do not quote the version string, so just:

    RTL8821AU_MODULE_MAKE_OPTS = KVER=$(LINUX_VERSION_PROBED)

> Also, what's the best way to determine big or little endian? All of the
> arch options have different formats for specifying it.

We do have BR2_ENDIAN that is a string for the endianness, either BIG or
LITTLE.

So I'd say:

    ifeq ($(call qstrip,$(BR2_ENDAIN)),BIG)
    RTL8821AU_CFLAGS_ENDIAN = -DCONFIG_BIG_ENDIAN
    else
    RTL8821AU_CFLAGS_ENDIAN = -DCONFIG_LITTLE_ENDIAN
    endif

Then use that as:

    RTL8821AU_MODULE_MAKE_OPTS = \
        KVER=$(LINUX_VERSION_PROBED) \
        USER_EXTRA_CFLAGS=$(RTL8821AU_CFLAGS_ENDIAN)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
