From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Sep 2020 14:33:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-09-05
In-Reply-To: <20200906070725.EBCC820464@silver.osuosl.org>
References: <20200906070725.EBCC820464@silver.osuosl.org>
Message-ID: <20200906123329.GN14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2020-09-06 07:07 -0000, Thomas Petazzoni spake thusly:
> Classification of failures by reason for master
>     mips     |          systemd-246           | NOK | http://autobuild.buildroot.net/results/229866ea234097b5d6c6104bf040f47fd22ffacc |     

So this is a reproducible build issue:

  - systemd #defines PROJECT_FILE (&__FILE__[STRLEN(RELATIVE_SOURCE_PATH) + 1])
    in an attempt to report only the basename of the files in messages;

  - so it has a static assert that __FILE__ is indeed longer that
    RELATIVE_SOURCE_PATH, otherwise the above would be an out-of-bound
    access;

  - RELATIVE_SOURCE_PATH is set by the systemd's meson.build, and
    contains the path of the sources relative to build directory; in
    Buildroot, if I understand systemd's code correctly, this will
    always be '.' .

  - but Buildroot, when BR2_REPRODUCIBLE=y, #defines __FILE__="" (i.e.
    an empty string, so that binaries do not embed local paths, and are
    thus bit-for-bit reproducible (except for other non-reproducibility
    causes).

As such, when Buildroot tries to do a reproducible build, the length of
__FILE__ will always be shorter than the length of RELATIVE_SOURCE_PATH + 1,
the former always being 0, while the latter being 2.

So we have a few avenues:

  - talk with upstream so they stop using __FILE__ altogether

  - talk to upstream so they optionally not use __FILE__

  - patch systemd ourselves and live for ever after with that patch

  - change our toolchain wrapper to use an arbitrarily long __FILE__

I've looked at Debian and Fedora, and they do not have a patch to get
rid of that.

Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
