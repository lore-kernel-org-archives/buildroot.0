From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Dec 2018 13:18:56 +0100
Subject: [Buildroot] [PATCH v2 2/2] boot/systemd-boot: new package
In-Reply-To: <CADvTj4rFtysDBbBe0RvJb6HS-Gwxr=bWyrhWoA2PJ8pdhw2FtA@mail.gmail.com>
References: <1545782200-1312-1-git-send-email-james.hilliard1@gmail.com>
 <1545782200-1312-2-git-send-email-james.hilliard1@gmail.com>
 <20181226085129.GC14286@scaer>
 <CADvTj4rFtysDBbBe0RvJb6HS-Gwxr=bWyrhWoA2PJ8pdhw2FtA@mail.gmail.com>
Message-ID: <20181226121856.GG14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-26 05:33 -0600, James Hilliard spake thusly:
> On Wed, Dec 26, 2018 at 2:51 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2018-12-26 07:56 +0800, james.hilliard1 at gmail.com spake thusly:
> > >   - remove more dependencies checks
> > Why? That was absolutely not necessary.
> Hmm, maybe my test setup is different than yours, it seemed to be
> neccesary to get a succesful compile. My setup where I was getting a
> failure was default everything other than adding the systemd-boot
> package .

Hm.. I only tested four setups:

  - x86_64, systemd with systemd-boot, external toolchain,
  - x86_64, systemd-boot standalone, external toolchain,
  - i686, systemd with systemd-boot, external toolchain,
  - i686, systemd-boot standalone, external toolchain.

Can you provide the .config file(s) that is(are) failing for you, please?

> > Besides, since that patch is not upstreamable, we will have to maintain
> > and fix it every time we bump systemd, which will be a maintainenance
> > burden. If only the strictly needed changes were made, then it would be
> > easier to update.>
> > >   - use custom build commands instead of ninja opts
> > Why did you not include the initial third patch to introduce NINJA_OPTS?
> > Even if that was not your change but mine, you could have carried it and
> > sent it; git is smart enough to carry proper authorship, if that were
> > your concern.
> It didn't seem to work properly when I tested it. I was seeing some
> stuff other than systemd-boot getting built.

Ah, that's weird, indeed, because here it really built only the 15
targets related to systemd-boot:

>>> systemd-boot 239 Building
PATH="/home/ymorin/dev/buildroot/O/host/bin:/home/ymorin/dev/buildroot/O/host/sbin:/home/ymorin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" PYTHONNOUSERSITE=y /home/ymorin/dev/buildroot/O/host/bin/ninja  -j9 src/boot/efi/systemd-bootia32.efi src/boot/efi/linuxia32.efi.stub -C /home/ymorin/dev/buildroot/O/build/systemd-boot-239//build
ninja: Entering directory `/home/ymorin/dev/buildroot/O/build/systemd-boot-239//build'
[1/15] Generating graphics.c.o with a custom command.
[2/15] Generating linux.c.o with a custom command.
[3/15] Generating measure.c.o with a custom command.
[4/15] Generating console.c.o with a custom command.
[5/15] Generating disk.c.o with a custom command.
[6/15] Generating util.c.o with a custom command.
[7/15] Generating pe.c.o with a custom command.
[8/15] Generating shim.c.o with a custom command.
[9/15] Generating stub.c.o with a custom command.
[10/15] Generating splash.c.o with a custom command.
[11/15] Generating stub.so with a custom command.
[12/15] Generating linuxia32.efi.stub with a custom command.
[13/15] Generating boot.c.o with a custom command.
[14/15] Generating systemd_boot.so with a custom command.
[15/15] Generating systemd-bootia32.efi with a custom command.

> I think the syntax requires those options to come at the end although
> I'm not 100% sure.

Let see what ?ric replies on the other mail.

> > It does make sense to have the possibility to pass arbitrary options to
> > the ninja backend to build arbitrary targets, like we have for autotools,
> > cmake, golang. luarocks, perl, python, and waf. meson/ninja and rebar
> > are the only two for which it's currently not possible...
> Yeah, I had only removed it since it didn't seem to be working
> properly, maybe I didn't test it correctly however.

Or there is indeed a difference between your env and mine that causes a
change in behaviour...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
