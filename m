From: Avraham Shukron <avraham.shukron@gmail.com>
Date: Wed, 13 Nov 2019 22:22:00 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/qemu: add host-python as an
 explicit dependency
In-Reply-To: <20191112220534.531a470f@windsurf>
References: <20191111213154.19409-1-avraham.shukron@gmail.com>
 <20191111213154.19409-2-avraham.shukron@gmail.com>
 <20191112220534.531a470f@windsurf>
Message-ID: <CAJX3zAuwNz7zzdrxupT+o_ZWR7AYRrk6h1XpRuYHk778pMU0ZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 12, 2019 at 11:05 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:
>
>
> qemu needs python 2 *or* python 3, so we can do something like this:
>
> QEMU_DEPENDENCIES = host-pkgconf libglib2 zlib pixman $(if
$(BR2_PACKAGE_PYTHON3),host-python3,host-python)
>
> This way, if you have Python 3.x enabled for the target (and therefore
> you are already building host-python3), it will use host-python3.
>
> Could you test this in a configuration that has BR2_PACKAGE_QEMU=y and
> BR2_PACKAGE_PYTHON3=y, and check it works properly ?

Your suggestion works. If python3 is selected - host-python3 is used.
BUT - host-qemu also depends on host-libglib2 which depends on host-meson
which depends on python3,
so even if you **don't** select python3 you end up with host-python3
because of meson, and also
host-python because now host-qemu directly depends on it. Attached a
dependency graph depicting
the scenario.

So - since host-python3 will be used anyway - I suggest we just depend on
it exclusively.
What do you think?

BTW - I'm pretty sure that there aren't really so many packages that truly
depends on **host**-python2 (except maybe python2 itself)
So in general I think it could be a good idea to just replace **all**
host-python with host-python3 (again - except python2 itself) and
just see what happens.
It might just work.

Avi.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191113/a331bcf6/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: host-qemu-graph-depends.png
Type: image/png
Size: 203002 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191113/a331bcf6/attachment-0001.png>
