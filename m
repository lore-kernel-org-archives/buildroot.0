From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2021 22:42:55 +0100
Subject: [Buildroot] [PATCH 2/2] package/uboot-tools: env/script
 generation need BINARIES_DIR
In-Reply-To: <CANQCQpZvXB_w=VjTrPM45CYcCtxmvCZB7thxB8v=E6yNaWdw2A@mail.gmail.com>
References: <20210125145742.42460-1-matthew.weber@rockwellcollins.com>
 <20210125145742.42460-2-matthew.weber@rockwellcollins.com>
 <20210125221651.10112779@windsurf.home>
 <CANQCQpZvXB_w=VjTrPM45CYcCtxmvCZB7thxB8v=E6yNaWdw2A@mail.gmail.com>
Message-ID: <20210125214255.GS2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, Thomas, All,

On 2021-01-25 15:22 -0600, Matthew Weber via buildroot spake thusly:
> On Mon, Jan 25, 2021 at 3:18 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > On Mon, 25 Jan 2021 08:57:42 -0600
> > Matt Weber <matthew.weber@rockwellcollins.com> wrote:
> > > From: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> > > The host build of uboot-tools can occur early in the build process and may
> > > require the creation of BINARIES_DIR before generation of an enabled envimage
> > > and/or boot script binary.
> > >
> > > Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> > > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> >
> > Hum, while this works, I'm in fact not too happy with the proposed
> > solution. I would prefer that we move the mkenvimage/$(MKIMAGE)
> > invocations to a BUILD_CMDS step, that produces its results in $(@D),
> > and then INSTALL_CMDS does a $(INSTALL) ... of that file, which with
> > the -D option would create $(BINARIES_DIR).
> >
> > I know it's a bit bike-shedding, but it feels a little bit better. What
> > do you think ?
> 
> I've added Yann to the discussion as he suggested the mkdir :-)

On principle, I do agree with Thomas.

However, I would point out that this is way wider than just the script
image. Indeed, we also have HOST_UBOOT_TOOLS_GENERATE_ENV_IMAGE which
is only called at install time.

If we wanted to mandate clean, separate build and install steps for the
script image generation, so would we want for the environment image too.

Which is a wider endeavour than just catering for the script image.

Of course, if one would want to actually tackle the issue and actually
separate the build and install steps, that would be awesome.

Otherwise, I am fine with just the mkdir.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
