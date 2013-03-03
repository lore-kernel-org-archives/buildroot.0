From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Mar 2013 19:54:36 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20130303195436.49654719@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Mar 2013 14:09:34 +0200, Olivier Schonken wrote:
> Made changes to config to allow for building systemd integrated udev
> rather than building udev and systemd separately.
> 
> Created the versions of the existing patches for the new systemd version
> 
> The page-size issue for which there was a patch fixed in the new version,
> thus deleted.
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>

Thanks for this proposal. Indeed something needs to be done about
systemd/udev handling in Buildroot. We used to package udev and systemd
separately so that we could build a system that uses udev but not
systemd. With udev now being part of systemd, building a udev-based
system that uses some other init system than systemd has become a lot
more complicated.

Here is what is in the report of the last Buildroot Developers meeting
regarding this topic:

   """
   What to do with systemd/udev/eudev: we try to use the udev from
   systemd without systemd. Exactly how we don't know yet... There's a
   risk that udev becomes unusable without systemd, but Leonard
   Poettering promised this would not happen. After a quick look, it
   turns out that you always end up building systemd, which requires
   dbus, even if you need only udev. So it makes the systemd source
   tarball a bit unpractical to build a system that uses udev only, and
   doesn't need systemd. Probably an indication that we should have a
   look at eudev? How would this interact with the systemd selection?
   What about incompatibilities between udev and eudev? 
   """

Note that we said "There's a risk that udev becomes unusable without
systemd, but Leonard Poettering promised this would not happen." In
fact we were mis-informed, see the mail from Lennart at
http://lists.freedesktop.org/archives/systemd-devel/2012-August/006066.html.
He says:

   """
   (Yes, udev on non-systemd systems is in our eyes a dead end, in case
   you haven't noticed it yet. I am looking forward to the day when we
   can drop that support entirely.)
   """

So in fact building udev only without systemd doesn't seem like a good
idea moving forward. Therefore, I see two options:

 (1) Follow the upstream decision, and simply make udev available only
     if the init system is systemd. Unlike some other distributions, we
     never had the the desire of fighting against upstream. If someone
     is dissatisfied with decisions made by upstream projects, then
     that someone should go upstream and fix the problem here.

     This is the solution I would personally prefer. If some were using
     udev for some reason and mdev doesn't work for them, then we can
     probably help make mdev better where needed.

 (2) Package eudev and use it for non-systemd systems, and use the
     built-in udev for systemd systems. There is of course the problem
     that udev is not stand-alone: it provides a library, and there are
     some uncertainties on whether the libudev library will remain
     source-compatible between eudev and system's udev.

Thoughts?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
