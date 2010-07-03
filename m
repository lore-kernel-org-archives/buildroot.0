From: Mitch Davis <mjd+buildroot@afork.com>
Date: Sun, 4 Jul 2010 09:26:05 +1000
Subject: [Buildroot] kernel modules & embedded linux
In-Reply-To: <AANLkTim7hTnNTC5z-cOKnbbyXe8lFWaixTL9jobwjZQD@mail.gmail.com>
References: <AANLkTilauXcR4dwy7PUrelaKdREP4xgMBad2i0ixYfqG@mail.gmail.com> 
	<AANLkTikCi6vziDJANiDx03Fhic26UKGCg2dyn6ZrdU9K@mail.gmail.com> 
	<AANLkTil4dNZojTv1HZ89UZ25HEXNUaBrhPJLKnvntysH@mail.gmail.com> 
	<AANLkTim7hTnNTC5z-cOKnbbyXe8lFWaixTL9jobwjZQD@mail.gmail.com>
Message-ID: <AANLkTiktMqECqn1H-6zUP0OhSgpVpLbduw5aizxlaiET@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 3, 2010 at 4:34 AM, Mohamed Mohamed Nour El-Din
<eng.mohamed.nour.eldin@gmail.com> wrote:
>
> i built this system with qt to run gui,
> but the booting & the system in general is somehow slow, so i wanted to list
> the modules loaded with the system startup to see if i can remove some of
> them

If you turn off Qt and just boot to a text "root" prompt, does that
take a long time?  When you do this, then do the boot messages give
you an idea of what is taking the most time?

> after the system starts & when i run lsmod, i get nothing, /proc/modules is
> empty

That means you have no modules loaded.  In my experience, it's
unlikely that any module can cause slow booting, except if there's
some bad hardware error.  For example, a driver for some kind of disk
might take a while to finish if there's a problem with the disk.  But
you'll see that in the log messages.

One thing that can take a long time is if startup scripts try to do
use DNS before the network is set up (or it's not connected to
anything).

Here's something to try.  If you can modify your kernel command line,
try adding this:

  init=/bin/sh

If that is still slow, then the delay may well be in the kernel.
Otherwise it's likely to be something in the startup scripts.

Do the kernel messages in /var/log/messages contain timestamps?  If
not, have a look here:

  http://www.digitalprognosis.com/linuxtips/timestamping-linux-kernel-printk-output-in-dmesg-for-fun-and-profit/

> i didn't know what to search for in /var/log/messages, it contains a lot of data

A lot of useful data :-)

If /var/log/messages is less than (say) 50k, please attach it to your
reply.  Otherwise please put it on some site like http://pastebin.org/
and reply with the URL.

If you've used the "init=/bin/sh" trick, your root filesystem will be
read-only.  If you want to copy /var/log/messages to this filesystem,
you can make it read-write like this:

  mount -t proc none /proc
  mount -o remount,rw /

When you've finished copying the log to your filesystem, do this:

  mount -o remount,ro /
  sync

I hope this helps.

Mitch.
