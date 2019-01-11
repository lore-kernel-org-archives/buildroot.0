From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 10 Jan 2019 23:47:32 -0700
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <6c1edf5d-e6b3-9453-96a3-4f7aa9480a44@mind.be>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
 <d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr>
 <6c1edf5d-e6b3-9453-96a3-4f7aa9480a44@mind.be>
Message-ID: <CADvTj4q9gUeu-XYmeEX5npSrGM69PM2jBcS+Z+k6A-RcAuuBTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 10, 2019 at 4:47 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 26/12/2018 09:52, Yann E. MORIN wrote:
> > Since systemd-boot is really part of systemd, when systemd is enabled
> > (as an init system), we rely on it to build the boot blobs, and
> > systemd-boot (this package) is not available.
> >
> > Now, when systemd is not enabled, systemd-boot (this package) will
> > actually build the boot blobs, and only that. No userspace tool is
> > built.
>
>  I really don't like this approach of copying systemd.
>
>  I would instead try harder to keep the standalone version part of the systemd
> package itself. Yes, I realize that I'm coming very late with this... The only
> reason we got here is this statement from Yann:
>
> >> What is wrong is that it makes the systemd package *and* the init
> >> selectionmuch more copmplex, and this is not acceptable (IMHO).
> >>
> >> I'd rather have a second package that is trivial, with mimimum, if at
> >> all, changes in the main systemd package.
>
>  The second package turns out not to be trivial at all...
>
>  So, looking back to James's original v2 patch, I'd structure the Config.in
> something like this:
>
> config BR2_PACKAGE_SYSTEMD
>         bool
>         depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
>         depends on ...
>         # select any dependency that is relevant for system-boot
>
> config BR2_PACKAGE_SYSTEMD_BOOT
>         bool
>
> menuconfig BR2_PACKAGE_SYSTEMD_SYSTEMD
>         depends on BR2_PACKAGE_SYSTEMD
>         # addition depends/selects that are relevant for full systemd
>
> # rest of the file stays the same
>
>
>  Note that BR2_PACKAGE_SYSTEMD was never user-selectable because it was always
> implicit from BR2_INIT_SYSTEMD, so it's OK to turn it into a blind option.
>
>  Note that we will need to declare the symbol BR2_PACKAGE_SYSTEMD_BOOT option
> twice: in the standalone systemd-boot case, we need the symbol declared
> somewhere so it can be selected by BR2_TARGET_SYSTEMD_BOOT.
>
>  Finally note that I fully agree that we should not even start support for
> standalone systemd-boot until upstream progresses into making it buildable
> standalone. I really don't want that huge patch either. But that's independent
> of how standalone systemd-boot is implemented.
I came up with a significantly smaller patch I'm working on getting
merged into upstream
https://github.com/systemd/systemd/pull/11294/files.
>
>  Regards,
>  Arnout
