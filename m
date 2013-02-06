From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Feb 2013 17:57:11 +0100
Subject: [Buildroot] makedevs and symbolic links
In-Reply-To: <CAJkQPOmpY_aT1DhDpxe2rw_endLzFkhmOWAkrbt1CzeG+7c=0Q@mail.gmail.com>
References: <CAJkQPOn=Pi+NhbRvVG_gk9ccQDaUoUuPH3aEsos032kAv6Y23A@mail.gmail.com>
 <20130206172641.4c042f87@skate>
 <CAJkQPOmpY_aT1DhDpxe2rw_endLzFkhmOWAkrbt1CzeG+7c=0Q@mail.gmail.com>
Message-ID: <20130206175711.51603415@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Aras Vaichas,

On Wed, 6 Feb 2013 16:50:37 +0000, Aras Vaichas wrote:

> I understand that it doesn't make sense if you approach it from a non-root
> user point of view.
> 
> From a maintenance point of view, it's a "nice to have" if the creation of
> the root fs can be defined in as few places as possible. I like how
> makedevs works because I can look at a single file and I see a nice list of
> all the files in my system. Ideally it would be great if I could remove my
> skeleton/ directory and put everything into the BR2_ROOTFS_DEVICE_TABLE
> file.

I don't see how this would be possible. The skeleton have files with
contents in them. makedevs doesn't allow to create a /etc/inittab that
contains something, a /etc/passwd that contains something, etc.

The current design is really:

 * We have a base skeleton in system/skeleton that generally never
   needs to be modified. The base system/device_table.txt and
   system/device_table_dev.txt take care of setting the appropriate
   permissions/ownerships on the files part of the base skeleton.

 * For each project, we encourage people to create a rootfs overlay in
   board/<company>/<project>/rootfs-overlay/, where they can add their
   specific configuration files, symbolic links and so on. And a
   project-specific device table in
   board/<company>/<project>/device_table.txt sets the appropriate
   owernship for the files part of the rootfs-overlay.

I think a real filesystem view (be it in the skeleton or in the
overlay) is much nicer to look at and modify than the device table.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
