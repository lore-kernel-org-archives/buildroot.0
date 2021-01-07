From: Schwarz, Konrad <konrad.schwarz@siemens.com>
Date: Thu, 7 Jan 2021 09:57:34 +0000
Subject: [Buildroot] [PATCH 2/3] package/environment-setup: make script
 idempotent
In-Reply-To: <CANQCQpZzAiF1AsrJThuH_H+cc3TXRykEMFkEXWkbPczPaN48yQ@mail.gmail.com>
References: <20201231212949.2415485-1-konrad.schwarz@siemens.com>
 <20201231212949.2415485-3-konrad.schwarz@siemens.com>
 <CANQCQpZzAiF1AsrJThuH_H+cc3TXRykEMFkEXWkbPczPaN48yQ@mail.gmail.com>
Message-ID: <8ad435cc3aa244418144fe451e23430f@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

> -----Original Message-----
> From: Matthew Weber <matthew.weber@collins.com>
> Sent: Wednesday, January 6, 2021 18:34
> To: Schwarz, Konrad (T RDA IOT SES-DE) <konrad.schwarz@siemens.com>
> Cc: buildroot <buildroot@buildroot.org>
> Subject: Re: [Buildroot] [PATCH 2/3] package/environment-setup: make script idempotent
> 
> > One (slight) problem with this kind of environment setup files is when
> > they are executed repeatedly (e.g., because something else is not
> > quite right yet), they tend to extend the PATH variable with the same
> > directory, creating a very unwieldy search path and potentially
> > slowing down searches for executable files.
> >
> > This fix adds a test such that PATH is extended only when necessary.
> >
[...]
> +       'export "CROSS_COMPILE=$(TARGET_CROSS)"\n'\
[...]
> > +       'if ! command -v $${CROSS_COMPILE}gcc > /dev/null\n'\
> > +       'then   export PATH="$$SDK_PATH/bin:$$SDK_PATH/sbin:$$PATH"\n'\
> > +       'fi\n'\
> 
> Does this new path check work as you intend if the main system has the normal gcc tools installed?  Maybe checking for the cross
> variable not being empty would be a better option?

As an aside: if the main system hast the "normal gcc tools" installed (I'm assuming you mean the native tools) and visible on PATH you wouldn't want PATH extended either, right?

As written, the code extends PATH only when the Buildroot-specific cross-compilation toolchain cannot be found (using a PATH search).  Conversely: if the Buildroot-specific toolchain is already in PATH, PATH won't be extended.

The only situation I see in which this might be undesirable is if an identically-prefixed toolchain that should not be used were already in the PATH; the original code would simply override that (because it prefixes PATH).   I consider this a remote possibility, because the "vendor" part of the GNU target triplet should be unique to Buildroot, at least when using the internal compilation toolchain option; but fundamentally the same reasoning should apply to the external toolchain option (e.g., buildroot assumes the user knows what he is doing in this case).

When debugging PATH problems, I'd much prefer to have as clean of a PATH as possible; elimination of (redundant) duplicates is a key part of this.

Note that the script itself sets CROSS_COMPILE at the start, so I don't see when it would be empty.

--
Konrad
