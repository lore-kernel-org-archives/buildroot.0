From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 29 Oct 2018 08:15:15 -0500
Subject: [Buildroot] [PATCH] mmc-utils: Rely on our own _FORTIFY_SOURCE
In-Reply-To: <331ad777-5e2a-4e05-a464-a187db784250@cesnet.cz>
References: <48287dd12fcef0440cc49ff86343867d6cb8429e.1533656185.git.jan.kundrat@cesnet.cz>
 <20180808151709.2f35030c@windsurf>
 <CANQCQpaJpUo1VRNtaRpu0QxiRaMJ5jjn7_FZTyAaeCBBbg1fSw@mail.gmail.com>
 <331ad777-5e2a-4e05-a464-a187db784250@cesnet.cz>
Message-ID: <CANQCQpbY+43JyN_irQwzv6ke8wU7P6TAiJMi06q0tmgbFJShYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan,

On Thu, Oct 25, 2018 at 1:03 PM Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:
>
> On p?tek 10. srpna 2018 4:56:39 CEST, Matthew Weber wrote:
> > This isn't related to my hardening fixes patchset (ie those patches
> > won't fix this issue).  Instead, I'd refactor this patch to move the
> > AM_CFLAGS "-D_FORTIFY_SOURCE=2" into the CFLAGS ?= .  That should be
> > an upstream-able change and preserve their intent.
>
> Hi Matthew,
> doing just this change, as you suggested:
>
> -AM_CFLAGS = -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2
> -CFLAGS ?= -g -O2
> +AM_CFLAGS = -D_FILE_OFFSET_BITS=64
> +CFLAGS ?= -g -O2 -D_FORTIFY_SOURCE=2
>
> ...stil results in an error when building this manually out-of-box, outside
> of Buildroot, on a Gentoo Linux with hardened GCC which enforces
> _FORTIFY_SOURCE via compiler spec files. The good news is that it is now
> possible to override the CFLAGS via an env var when invoking make. I guess
> I'll send this upstream, then.
>
> It still doesn't work out-of-box everyhere, but it is no longer a Buildroot
> bug (and it will work in Buildroot).

Good to note.

Wasn't sure if you saw the merge of the updated hardening feature set.
It is now handled in the toolchain wrapper and more packages (without
changes directly in the package to allow flags to be set) should build
with the hardening flags.  The wrapper appends them to the compiler
args transparently and doesn't depend on ?=.

Matt
