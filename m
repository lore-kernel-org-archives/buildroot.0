From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 26 Dec 2018 16:07:33 -0600
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <20181226214100.GK14286@scaer>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
 <d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr>
 <20181226222329.18046c1c@windsurf> <20181226214100.GK14286@scaer>
Message-ID: <CADvTj4rPZqjx_iNHF7Q8DKa63P+OOX=v-YuhCfUZMR4VOa-zsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 26, 2018 at 3:41 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Thomas, All,
>
> Adding Peter in the loop; see at the end.
>
> On 2018-12-26 22:23 +0100, Thomas Petazzoni spake thusly:
> > On Wed, 26 Dec 2018 09:52:30 +0100, Yann E. MORIN wrote:
> > > From: James Hilliard <james.hilliard1@gmail.com>
> > >
> > > systemd-boot is the integration of gummiboot into systemd, and gummiboot
> > > is no longer maintained [0]. However, it is still interesting to use it
> > > as a simple, stand-alone bootloader.
> > >
> > > Since systemd-boot is really part of systemd, when systemd is enabled
> > > (as an init system), we rely on it to build the boot blobs, and
> > > systemd-boot (this package) is not available.
> > >
> > > Now, when systemd is not enabled, systemd-boot (this package) will
> > > actually build the boot blobs, and only that. No userspace tool is
> > > built.
> > >
> > > To avoid duplication, we just symlink the systemd patches as-is. We just
> > > need to add a specific patch, that just relaxes the dependency checks,
> > > since we're only interested in building the boot blobs.
> > >
> > > [0] https://cgit.freedesktop.org/gummiboot/commit/?id=55df1539c9d330732e88bd196afee386db6e4a1d
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >
> > Do we have a serious valid use-case for wanting to use systemd-boot
> > without systemd? This adds a fair bit of complexity, so I'd like to be
> > sure of what we're doing here.
> >
> > An example of the complexity is with the symlinks to the patches. Every
> > time a patch is added/removed in package/systemd/, one should remember
> > to adjust the symlinks in boot/systemd-boot/. This is something that
> > can very easily be missed.
>
> And I now even dropped all of them completely, with the v240 bump, so we
> no longer whare any patch with systemd. There is only one patch that is
> now needed to build systemd-boot standalone. We still need to investigate
> why James was not able to build it, though. James, care to give my series
> a new spin, please? (I've repushed the branch just now)
Did a fresh compilation run, I get a failure here
https://github.com/systemd/systemd/blob/v239/meson.build#L278
meson.build:293:8: ERROR:  Unknown compiler(s):
[['/home/buildroot/buildroot/output/host/bin/i586-buildroot-linux-uclibc-g++']]
>
> So, the only complexity that remains is the sharing of the boot files
> and their install commands.
>
> That, and the little trick to share the source file.
>
> > So it would be good to make sure we have a really solid use-case for
> > adding this complexity.
>
> Peter, care to elaborate your position, since you were advocating also
> for it, earlier? ;-)
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
