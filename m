From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 25 Oct 2018 20:03:13 +0200
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH=5D_mmc-utils=3A_Rely_on_our_?=
 =?iso-8859-1?q?own_=5FFORTIFY=5FSOURCE?=
In-Reply-To: <CANQCQpaJpUo1VRNtaRpu0QxiRaMJ5jjn7_FZTyAaeCBBbg1fSw@mail.gmail.com>
References: <48287dd12fcef0440cc49ff86343867d6cb8429e.1533656185.git.jan.kundrat@cesnet.cz>
 <20180808151709.2f35030c@windsurf>
 <CANQCQpaJpUo1VRNtaRpu0QxiRaMJ5jjn7_FZTyAaeCBBbg1fSw@mail.gmail.com>
Message-ID: <331ad777-5e2a-4e05-a464-a187db784250@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On p?tek 10. srpna 2018 4:56:39 CEST, Matthew Weber wrote:
> This isn't related to my hardening fixes patchset (ie those patches
> won't fix this issue).  Instead, I'd refactor this patch to move the
> AM_CFLAGS "-D_FORTIFY_SOURCE=2" into the CFLAGS ?= .  That should be
> an upstream-able change and preserve their intent.

Hi Matthew,
doing just this change, as you suggested:

-AM_CFLAGS = -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2
-CFLAGS ?= -g -O2
+AM_CFLAGS = -D_FILE_OFFSET_BITS=64
+CFLAGS ?= -g -O2 -D_FORTIFY_SOURCE=2

...stil results in an error when building this manually out-of-box, outside 
of Buildroot, on a Gentoo Linux with hardened GCC which enforces 
_FORTIFY_SOURCE via compiler spec files. The good news is that it is now 
possible to override the CFLAGS via an env var when invoking make. I guess 
I'll send this upstream, then.

It still doesn't work out-of-box everyhere, but it is no longer a Buildroot 
bug (and it will work in Buildroot).

With kind regards,
Jan
