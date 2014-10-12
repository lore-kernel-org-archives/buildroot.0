From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Oct 2014 21:12:17 +0200
Subject: [Buildroot] systemd: write-up and packaging questions
In-Reply-To: <543AC16C.7000100@mailerd.de>
References: <543AC16C.7000100@mailerd.de>
Message-ID: <CAGduivzUiy3C6rykCd33GE5iAQh+YVJ5LueGp5c5MKTfDeM1-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Andr?, All

On Sun, Oct 12, 2014 at 7:59 PM, Andr? Erdmann <dywi@mailerd.de> wrote:
> Hi,
>
> Some of the issues pointed out below may be already known, but I couldn't
> find any report on this, so I'd like to share my experience with setting up a
> systemd-based system that does a little bit more than bringing up a console ;)
> Use case was tvheadend with avahi and nfs (+ dropbear etc.), running on a
> DreamPlug. Overall it works great, but requires some post-build actions:
>
> * installation of additional service files
>   (I'll propose patches for them sooner or later)
> * changes to the default rootfs skeleton
> * optional: removal of /etc/init.d etc.
I have a patch that I need to send that does just that.
>
>
> Filesystem Layout
> =================
>
> There are some issues with the default rootfs skeleton.
> For example, systemd-hostnamed fails to start with the error message
> "file exists", likely related to symlinks pointing to /tmp (/run, /var/...).
> After some trial-and-error I've figured out that both /run and /var/tmp
> symlinks must be replaced with real directories, and that it needs to be done
> before booting systemd (at build/image creation time or in initramfs/initrd).
>
> So, the minimum amount of necessary changes seems to be:
> * create /run as directory
>   and make /var/run->../run, /var/lock->run/lock link to it;
>   /run gets automatically mounted on boot
> * create /var/tmp as directory;
>   needs manual mount setup (fstab or .mount unit)
> * /var/lib/dbus is then a dead link pointing to /tmp/dbus,
>   not sure if /run/dbus would be the correct link dest
>
>
> Unit Files
> ==========
>
> This section is mostly about packaging guidelines,
> the manual doesn't answer the questions below.
You're right, the manual is really in need of update on that subject.
But there are some pending changes for which I already have patch that
I am currently finishing.
>
> Installation
> ------------
>
> systemd's libdir is /lib/system.
> Most unit files (.service et al) are installed to /etc/systemd/system,
> systemd's own unit files are installed to /lib/systemd/system and some
> packages(*) install their files to /usr/lib/systemd/system, which is rather
> confusing. Either dir works (search order is /etc > /lib > /usr/lib),
> but what's the recommended location?
If I'm reading the FHS correctly, /usr/lib/systemd/ would the the
targets and what nots for systemd itself, and so everything in /etc is
hosts specific so I would keep everything installed by our packages in
/etc/systemd/system.
> I'd prefer to have them installed in one dir (systemd's libdir).
>
> (*) grepping yields nginx and connman
>
>
> Auto-Enabling
> -------------
>
> Most packages enable their unit files by default(*), others don't.
> Example: lighttpd gets enabled, nginx does not.
> Is there any policy for when [not] to enable services?
>
> (*) "ln -s <unit> /etc/systemd/system/<target>.target.wants/<unit>"
IMHO, we should enable by default for the moment. The users can
disable everything through a post-build script.
A better way to handle that, would be, as Samuel Martin said on IRC,
to have some infra like the users table to handle what you want to be
enabled or not.
But that may needs an RFC so we could start discussing this.
>
>
> Maybe it'd make sense to introduce some SYSTEMD_ variables so that
> packages don't have to hardcode/guess systemd file paths, for example:
> * SYSTEMD_LIBDIR          (= /lib/systemd)
> * SYSTEMD_UNITDIR         (= $(SYSTEMD_LIBDIR)/system)
> * SYSTEMD_CONFDIR         (= /etc/systemd)
> * SYSTEMD_UNITCONFDIR     (= $(SYSTEMD_CONFDIR)/system)
> * relpath from <confdir> to <libdir> (= ../..$(SYSTEMD_LIBDIR))
> * relpath from <confdir>/system to <libdir>/system (= ../../$(SYSTEMD_UNITDIR))
>
> Bonus: export these variables to post-build scripts
Yes, it would be really nice.
>
>
> --
> Andr?
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
