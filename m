From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 26 Dec 2018 05:16:41 -0600
Subject: [Buildroot] [PATCH v3 1/1] package/meson: fix cpu_family format
In-Reply-To: <20181226085059.GB14286@scaer>
References: <1545002062-20630-1-git-send-email-james.hilliard1@gmail.com>
 <20181225185624.GL2703@scaer> <20181226080049.GA14286@scaer>
 <CADvTj4oa7NxYjQTaaTQUUbwn8WoeWizf5foq5ZtZ-Hw=B50tdg@mail.gmail.com>
 <20181226085059.GB14286@scaer>
Message-ID: <CADvTj4r1Mjqzwajkof1ULgGv+uXwk3TXPoT5CW6Y7vK0Wrfi4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 26, 2018 at 2:51 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2018-12-26 02:34 -0600, James Hilliard spake thusly:
> > On Wed, Dec 26, 2018 at 2:00 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2018-12-25 19:56 +0100, Yann E. MORIN spake thusly:
> > > > On 2018-12-17 07:14 +0800, james.hilliard1 at gmail.com spake thusly:
> > > > > From: James Hilliard <james.hilliard1@gmail.com>
> > > > >
> > > > > Meson expects the cpu_family to be in a specific format for
> > > > > cross compilation, otherwise packages that use cpu_family
> > > > > detection may fail to build.
> > > >
> > > > As explained in:
> > > >     https://mesonbuild.com/Reference-tables.html#cpu-families
> > > >
> > > > > We also need to set needs_exe_wrapper = true to ensure that
> > > > > meson won't try and execute test binaries.
> > > >
> > > > As explained in:
> > > >     https://mesonbuild.com/Cross-compilation.html
> > > >
> > > > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > >
> > > Well, now I think this should have really been two patches, like Thomas
> > > initially suggested:
> > >
> > >  1- prevent meson from ever thinking it can run what it builds, and so
> > >     add needs_exe_wrapper on its own, because we may already have that
> > >     situation today (e.g. x86_64 targetting x86_64)
> > We actually never get that issue right now AFAICT because we are
> > setting the wrong cpu_family so the host target comparison always
> > fails to match.
>
> But for x86_64, we currently do pass the correct value 'x86_64', so the
> comparison does not fail when both the host and target are x86_64.
Ah, you're right, it's not an issue currently for x86_64 in that case
since the tests do succeed for x86_64(I tested this just now), the
failure happens for 32 bit x86 since meson incorrectly thinks it can
run x86 test binaries on x86_64. So fixing cpu_family without the exe
wrapper fix probably only causes regular x86 builds to fail. The x86
cpu_family was definitely incorrect so that's why the comparison would
fail and the build would succeed.
>
> And since meson only uses the CPU familly name and the 'system' name to
> decide, and that the 'system' name is linux in both cases, then we do
> have the issue currently, even if it never got triggered yet.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
