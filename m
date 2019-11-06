From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Nov 2019 08:57:33 +0100
Subject: [Buildroot] [PATCH v7 3/8] core: implement per-package SDK and
 target
In-Reply-To: <CAJ4jsafpnaBRuxtd-6RFAGVcFgkEgmqNbjDLgPEYQV5DXGMxMw@mail.gmail.com>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228104335.22379-4-thomas.petazzoni@bootlin.com>
 <b92540ca-37ad-42ad-9bf3-eee8f6f6ed26@cesnet.cz>
 <20191105173830.6c8fc5d1@windsurf>
 <CAJ4jsafpnaBRuxtd-6RFAGVcFgkEgmqNbjDLgPEYQV5DXGMxMw@mail.gmail.com>
Message-ID: <20191106085733.3b339da7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Nov 2019 16:05:50 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> > Or we could:
> >
> >  (1) Move the /etc/resolv.conf symlink from system/skeleton/ to
> >      package/skeleton-init-sysv/skeleton/etc.
> >
> >  (2) Tweak the systemd.mk so that it always creates resolv.conf, either
> >      pointing to ../run/systemd/resolve/resolv.conf when resolved is
> >      enabled, or to /tmp/resolv.conf otherwise.
> >
> > This would avoid the overwriting entirely.
> >
> > What do you think ?
> >
> > Best regards,
> >
> This would prevent NetworkManager from updating resolv.conf. See
> https://bugs.busybox.net/show_bug.cgi?id=9881

Then I guess the TARGET_FINALIZE_HOOKS is the only solution here.

But thinking more about this issue, it really means that no package
should overwrite any file installed by one of its dependencies: this
means that the check-uniq-files stuff that Yann recently removed was in
fact useful.

Indeed, if we have the following scenario:

 - Package A installs file /foo/bar

 - Package B depends on A, and overwrites /foo/bar with some contents

 - Package C depends on A

Then, at the end in the target root filesystem, we will have A's
version of /foo/bar, and not B's version. Just like Jan explained, the
final rsync will rsync the per-package target directories in this order
(due to alphabetic ordering):

 A, B, C

So, in the end, it is the version of /foo/bar in the per-package
directory of C that wins, and because C depends on A, the version of
/foo/bar in C's per-package directory is the one coming from package A.

So, it is really important for packages *not* to overwrite any file
installed by any other package, even if said package is in its
dependencies.

Am I missing something here ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
