From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Jun 2020 21:04:13 +0200
Subject: [Buildroot] Is there a way to alter BR2_CMAKE_VERSION_MIN?
In-Reply-To: <CALFsTFXiiOb7t0Biw30OXjVLXwfd1x-dmjtnEDQy+Ogmi4ZU-g@mail.gmail.com>
References: <CALFsTFXiiOb7t0Biw30OXjVLXwfd1x-dmjtnEDQy+Ogmi4ZU-g@mail.gmail.com>
Message-ID: <20200623190413.GX2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asaf, All,

On 2020-06-23 21:36 +0300, Asaf Kahlon spake thusly:
> Currently, BR2_CMAKE_VERSION_MIN is set to 3.10.
> On my machine I have cmake=3.12 and on my BR2_EXTERNAL tree I have
> some private packages requiring cmake>=3.13.
> In the current state, Buildroot won't build host-cmake since the
> installed one is greater than 3.10, but still the compilation fails
> because those packages need a higher version from what I have on my
> machine.
> 
> Is there a reason why BR2_CMAKE_VERSION_MIN isn't set with "?=" but
> with "="? Setting it with "?=" gives the user the option to change it
> in case there are private packages which need a higher version of
> CMake.
> 
> Any other ideas on how to overcome this issue?

We already had the discussion a while ago on the IRC channel, and IIRC,
the conclusion was that we wanted to move to a per-package minimum
version, for example:

    LIBFOO_CMAKE_REQUIRED_VERSION = 3.12

And the the cmake-package infra would automatically add host-cmake as a
dependency of libfoo if the host cmake is not suitable. Probably with
some code like:

    $(2)_CMAKE = $$(shell support/dependencies/check-host-cmake.sh $$($(2)_CMAKE_REQUIRED_VERSION) $$(BR2_CMAKE_CANDIDATES))
    ifeq ($$($(2)_CMAKE),)
    $(2)_DEPENDENCIES += host-cmake
    $(2)_CMAKE = $(HOST_DIR)/bin/cmake
    endif

And then, remove:

    $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)

And change calls to $$(BR2_CMAKE) with calls to $$($(2)_CMAKE)

Then move the definition of BR2_CMAKE_CANDIDATES to pkg-cmake.mk

Expand all the packages that use cmake-package to define the version
they need.

And finally, kill support/dependencies/check-host-cmake.mk, tp keep only
support/dependencies/check-host-cmake.sh

Obviously, that will be a multi-patch, long effort...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
