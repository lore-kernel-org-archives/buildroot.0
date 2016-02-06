From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 23:46:34 +0100
Subject: [Buildroot] [PATCH 1/6 v2] package/libgtk2: break a circular
 dependency
In-Reply-To: <b493e6d4ca04b6171c2c7613f9abfdd6c0129861.1453651102.git.yann.morin.1998@free.fr>
References: <cover.1453651102.git.yann.morin.1998@free.fr>
 <b493e6d4ca04b6171c2c7613f9abfdd6c0129861.1453651102.git.yann.morin.1998@free.fr>
Message-ID: <20160206234634.37caec35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, 24 Jan 2016 17:02:36 +0100, Yann E. MORIN wrote:
> We currently have a circular dependency chain:
> 
>     avahi -> libglade -> libgtk2 -> cups -> avahi
> 
> The cups -> avahi dependency makes sense, as cups would be able to use
> Bonjour and mDNS to find printers, so we want to keep that dependency.
> 
> The avahi -> libglade -> libgtk2 chain also makes some sense, to provide
> a GUI frontend for avahi.
> 
> Since the libgtk2 -> cups does not look that it would be tremendously
> useful, that's the one we drop in this patch.

I tend to disagree with this analysis. The avahi GUI programs seem
really useless to me. On Debian/Ubuntu distributions, they are not even
packaged within the main avahi packages, but as separate packages,
probably indicating that they are not very commonly used. It is also
highly unlikely that such ready-made applications will be used on
embedded systems.

On the other hand, when you enable Gtk2 or Gtk3 to create your
own graphical applications, you may be interested in being able to have
the print dialogs support CUPS.

So in the:

  avahi -> libglade -> libgtk2 -> cups -> avahi

I would rather tend to break the dependency between "avahi -> libglade"
rather than between "libgtk2 -> cups".

(This comment obviously also applies to your patch 2/6).

What do you think ? What do others think ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
