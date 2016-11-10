From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Thu, 10 Nov 2016 11:05:30 +0100
Subject: [Buildroot] ninja/python-meson packages
In-Reply-To: <20161110091808.06ceb521@free-electrons.com>
References: <98b7a6164112ee321e9220d5b8c47a33@openmailbox.org>
 <20161109212812.39399895@free-electrons.com>
 <37cfb466-91a2-2434-24a4-dbd13ddfbc0f@openmailbox.org>
 <20161110044245.mpwgroempys43o27@tarshish>
 <20161110091808.06ceb521@free-electrons.com>
Message-ID: <da5fab995f80d9aefa53ab856d999f4c@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 2016-11-10 09:18, Thomas Petazzoni a ?crit?:
> On Thu, 10 Nov 2016 06:42:45 +0200, Baruch Siach wrote:
>> Does that mean that we won't be able to use the host distro installed 
>> cmake?
>> Not so good in terms of build time. I guess it offsets most of the 
>> build time
>> gain in moving to ninja, if not more.
> 
> This is one of the reasons why I want to have this as an option, at
> least initially. We clearly want to keep the nice benefit of using the
> system-provided CMake.

I was not aware of the new possibility to use cmake from the host 
(support/dependencies/check-host-cmake.mk). But it is not a problem.

There is a misunderstanding, I need to clarify:
I'm not changing anything in cmake package, I'm only modifying 
pkg-cmake.mk.
CMake (either from your host, or host-cmake from buildroot) has support 
for both make and ninja backend, it is not an option at compilation 
time.
It is a "configure option" to set in pkg-cmake.mk ($(2)_CONF_OPTS += -G 
Ninja), in the configure step of each package based on cmake infra.

Yet you're right as far as "make" is concerned.
Buildroot and CMake use "make" from your host distro. If we switch to 
ninja, it implies that an extra package needs to be built: host-ninja.
So the benefit of ninja is only:
- if you have several packages using CMake (I can't say how many are 
necessary to cancel out host-ninja build time...)
- if you rebuild CMake packages regularly - in development mode, which 
is not what buildroot is designed for, in the first place.
- if another package uses meson: host-ninja is required anyway... (but 
this is the future ;))

-- 
C?dric
