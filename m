From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 5 Sep 2019 09:03:58 -0700
Subject: [Buildroot] Disabling package initscripts
Message-ID: <CAGt4E5v+-iuZ_0ufjJ8Fmg7kP=TdZgrHwKgaUFm6ftx7RRbX-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am wondering if there is a way to disable the "initscripts" package.
Currently, this doesn't seem to be possible, since it is forced on by
"select" statements in system/Config.in.

My problem is the following: I want to install a custom rcS script
from our own package. That package's name is "brcm-skel." Therefore,
it is being processed first. Package initsscripts comes later -- and
promptly overwrites the already existing rcS, which I don't want it to
do. It also doesn't seem very good that alphabetical ordering decides
who "wins." If I named our package "zzz-skel" it would work. But
that's not really a workable solution.

Why do I want to take this approach rather than use a post-build
script to copy custom skeleton files into place? Primarily, because of
the XXX_OVERRIDE_SRC functionality. If the skeleton is a package, it
can make use of the existing override functionality. And why is that
important?

We use the feature in our continuous integration setup. We want to
take developer's contributions *before* they are committed into the
main repo and run compile and run-time tests on the changes. We also
don't just want to build the developer's tree, but use an integration
tree that may have more changes from other developers that are being
queued up for inclusion and ensure the new contribution works with
those changes, too. This is something the developer wouldn't have been
able to test easily.

So, we can't just clone a tree and build it. We want to clone the
integration tree and include the new changes by pointing to a custom
source tree for the package in question. Hence XXX_OVERRIDE_SRC.

We do this for other packages, and it works really well. Do you guys
have any recommendations for doing this the proper way with our
skeleton and avoiding interference by package initscripts?

I experimented by switching package initscripts to "default y" instead
of "selecting" it. This, then, allows me to put "#
BR2_PACKAGE_INITSCRIPTS is not set" in my defconfig. So, the package
is still on unless you explicitly turn it off. This works for me and
produces the expected results. However, I am not sure if you'd be too
happy accepting this change upstream... If you want to see it, by all
means let me know. I am happy to submit it. In my opinion, it allows
more flexibility for those who want it while preserving the default
behaviour for the rest who don't care.

Thanks,
-Markus
