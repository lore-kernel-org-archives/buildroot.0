From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Nov 2016 19:46:26 +0100
Subject: [Buildroot] auto-detecting toolchain metadata?
In-Reply-To: <c1d1dc6d-c815-1ea2-3de9-13a1da0adaec@mentor.com>
References: <c1d1dc6d-c815-1ea2-3de9-13a1da0adaec@mentor.com>
Message-ID: <20161101184626.GB30593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hollis, All,

On 2016-11-01 11:39 -0700, Hollis Blanchard spake thusly:
[--SNIP--]
> Another option I'm considering is a script to try to detect the necessary
> metadata from a given toolchain path. As far as I can see, every piece of it
> can be detected from external observation. It could be invoked outside
> Buildroot (modifying defconfig), but of course it could be invoked from
> within Buildroot's toolchain recipes too. Is there a reason this is a bad
> idea or hasn't already been done?

Such a script would be ideed very usefull.

The problem is that we need to know the characteristics of the toolchain
inside the menuconfig, so we can hide/show packages that have strict
requirements (e.g. on gcc version for C++11, on kernel headers, on the C
library...) but we only know the toolchain to use from inside the
menuconfig, so it is too late to run the script.

So what Buildroot currently does is check the settings after the fact,
because there is no way we can do otherwise.

But if there was a script that would look at a toolchain and spit out
the settings, like:

    ./support/scripts/scan-ext-toolchain /path/to/toolchain
    BR2_USES_MUSL=y
    BR2_GCC_ATLEAST_4_9=y
    [and so on]

with that output to be used as a base defconfig, then that would be
tremendously useful, indeed.

And probably not very dificult to do either...

Bonus would be if we could also use that script to check the current
configuration against the configured toolchain (that would mean
extracting a lot of logic out of the Makefiles, which is not necessarily
a bad idea either).

Waiting for your patch... ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
