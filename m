From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Wed, 28 Jun 2017 13:34:53 -0700
Subject: [Buildroot] [PATCH] rauc: new package
In-Reply-To: <1227a3fa-c73c-8f13-58aa-1d0658a13b6f@mind.be>
References: <20170628060724.12026-1-yurovsky@gmail.com>
 <1227a3fa-c73c-8f13-58aa-1d0658a13b6f@mind.be>
Message-ID: <CAAkeqgVPzX2aBnDkr6mbA7_q-njtsknG3t07Qq_dzECAPDf4cA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Jun 28, 2017 at 12:59 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Andrey,
>
> On 28-06-17 08:07, Andrey Yurovsky wrote:
>> RAUC is the Robust Auto-Update Controller developed by the folks at
>> Penguintronix. It supports updating embedded systems from the network
>   ^^^^^^^^^^^^^Pengutronix
>
>> (ex: HawkBit) or from a disk and provides a d-bus interface.
>
>  So this is Pengutronix' competitor to swupdate?

I believe so. I have no personal involvement in either one but rauc's
approach is a little different and it may offer advantages for certain
systems (for example its d-bus interface vs. a UNIX socket) and the
firmware bundle/image format is different. They're roughly equivalent
in the problem they're solving though.

>>
>> Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
>> ---
>>  package/rauc/Config.in | 18 ++++++++++++++++++
>>  package/rauc/rauc.hash |  2 ++
>>  package/rauc/rauc.mk   | 19 +++++++++++++++++++
>
>  You don't add it to package/Config.in, so it is not possible to select this
> package.

That's right, I have no idea how I messed that up and it'll be addressed in v2.

>  Have you checked the package with support/scripts/check-package ?
>  Have you validated it with support/scripts/test-pkg ?

I did run check-package but not test-pkg, I'll make sure both are run
next time, again sorry about that.

>  You can include the full text that you have in the commit log. Also, we need an
> upstream URL. And with that added, the reference to the documentation is not
> really needed (it's one click away from the upstream URL). So:
>
>           RAUC is the Robust Auto-Update Controller developed by Pengutronix.
>           It controls the update process on embedded Linux systems. It supports
>           updating from the network or from a disk. It provides a D-Bus
>           interface.
>
>           http://rauc.io/

Understood. Will do.

>  Please verify the tarball against the upstream signature, and write:
>
> # Locally calculated, after verifying against
> # https://github.com/rauc/rauc/releases/download/v0.1.1/rauc-0.1.1.tar.xz.asc

Ok.

>  There is an upstream tarball, so you should use that:

Ok, I was following another package, I'll use the tarball directly
since indeed they have tarball releases.

> RAUC_VERSION = 0.1.1
> RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
> RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
>
>> +RAUC_LICENSE = GPL-2.1
>
>  GPL-2.1 doesn't exist, it's LGPL-2.1.

That's a very bad typo on my part, thanks for catching it.

>> +RAUC_LICENSE_FILES = COPYING
>> +RAUC_AUTORECONF = YES
>
>  With the uploaded tarball this shouldn't be needed anymore.

Understood.

>> +RAUC_DEPENDENCIES = libcurl openssl libglib2 json-glib dbus-glib host-pkgconf \
>> +                                     dbus util-linux
>
>  It seems that most of these are optional:
>
> libcurl is only needed if --enable-network
> json-glib is only needed if --enable-json

I debated about this and thought users would generally want both
features, I now see that in buildroot it's more common to make them
optional so I'll add networking and JSON support as high-level options
and make them conditional on that (I suppose someone may be building a
non-networked device that still needs rauc to perform updates from a
USB disk).

>  And configure.ac has no dependency at all on dbus-glib, dbus or libmount.

You're right, I missed that they use the GIO dbus interface instead
and indeed dbus-glib isn't needed. Is d-bus acceptable as a runtime
dependency? That is, rauc won't be terribly useful if the target
doesn't have d-bus at runtime.

>  On the other hand, configure uses pkg-config to determine the systemd install
> directories, so you should have a conditional dependency on this package:
>
> ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> # configure uses pkg-config --variable=systemdsystemunitdir systemd
> RAUC_DEPENDENCIES += systemd
> endif

Will do, thanks again for all of the feedback.
