From: Schwarz, Konrad <konrad.schwarz@siemens.com>
Date: Thu, 7 Jan 2021 21:15:52 +0000
Subject: [Buildroot] [External] RE: [PATCH 2/3]
 package/environment-setup: make script idempotent
In-Reply-To: <CANQCQpYkkgdV4Z9Dcry1C53zOt14-LHoZpVpt6qHfSaG1y3M1A@mail.gmail.com>
References: <20201231212949.2415485-1-konrad.schwarz@siemens.com>
 <20201231212949.2415485-3-konrad.schwarz@siemens.com>
 <CANQCQpZzAiF1AsrJThuH_H+cc3TXRykEMFkEXWkbPczPaN48yQ@mail.gmail.com>
 <8ad435cc3aa244418144fe451e23430f@siemens.com>
 <CANQCQpYkkgdV4Z9Dcry1C53zOt14-LHoZpVpt6qHfSaG1y3M1A@mail.gmail.com>
Message-ID: <9b8f9336839b4b628858e587242c3926@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

> -----Original Message-----
> From: Matthew Weber <matthew.weber@collins.com>
> Sent: Thursday, January 7, 2021 19:57
> To: Schwarz, Konrad (T RDA IOT SES-DE) <konrad.schwarz@siemens.com>
> Cc: buildroot <buildroot@buildroot.org>
> Subject: Re: [External] RE: [Buildroot] [PATCH 2/3] package/environment-setup: make script idempotent
> > As written, the code extends PATH only when the Buildroot-specific cross-compilation toolchain cannot be found (using a PATH
> search).  Conversely: if the Buildroot-specific toolchain is already in PATH, PATH won't be extended.
> >
> > The only situation I see in which this might be undesirable is if an identically-prefixed toolchain that should not be used were already
> in the PATH; the original code would simply override that (because it prefixes PATH).   I consider this a remote possibility, because the
> "vendor" part of the GNU target triplet should be unique to Buildroot, at least when using the internal compilation toolchain option;
> but fundamentally the same reasoning should apply to the external toolchain option (e.g., buildroot assumes the user knows what he
> is doing in this case).
> 
> Could you just grep the PATH to see if the SDK path is present instead of doing a command test?

	command -v executable
is _the_ POSIX compliant way of checking if an executable can be found via PATH.  See https://pubs.opengroup.org/onlinepubs/9699919799/utilities/command.html.  Trying to recreate this via grep or other means would seem to be clearly more error prone (and command -v, being a built-in, is faster to boot -- no pun intended). Additionally, environments such as MSYS, where the path separation character is not : (colon) but ; (semicolon), as in MS-DOS, additionally complicate a manual re-implementation of command -v.

--
Konrad
