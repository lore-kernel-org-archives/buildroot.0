From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Sep 2019 18:38:17 +0200
Subject: [Buildroot] Disabling package initscripts
In-Reply-To: <CAGt4E5v+-iuZ_0ufjJ8Fmg7kP=TdZgrHwKgaUFm6ftx7RRbX-Q@mail.gmail.com>
References: <CAGt4E5v+-iuZ_0ufjJ8Fmg7kP=TdZgrHwKgaUFm6ftx7RRbX-Q@mail.gmail.com>
Message-ID: <b13ef392-36ce-6066-05d0-cca4703871b9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Markus,

On 05/09/2019 18:03, Markus Mayer wrote:
> Hi,
> 
> I am wondering if there is a way to disable the "initscripts" package.
> Currently, this doesn't seem to be possible, since it is forced on by
> "select" statements in system/Config.in.

 Indeed, the initscripts package is part of the init system. The init system
will not work without it.

 If you want to make your own init system, select BR2_INIT_NONE.

 Indeed, if you're writing a custom init system, you probably also don't want
the init scripts installed by various packages. BR2_INIT_NONE will make sure
they don't get installed.

 Note: if you do that, you can't select the sysvinit or systemd package.
Personally I think that that's a bug, because you may want to construct your own
init system, different from Buildroot's, that makes use of sysvinit or systemd.
However, nobody seems to care enough to send a patch that makes this possible.


> My problem is the following: I want to install a custom rcS script
> from our own package.

 That sounds like a bad idea... Well, unless you're writing your own init
system. But then maybe you should make it an actual init system, cfr. OpenRC.

 What do you do in that script that is not possible with a SXX script?

> That package's name is "brcm-skel." Therefore,
> it is being processed first. Package initsscripts comes later -- and
> promptly overwrites the already existing rcS, which I don't want it to
> do.

 If there are two packages that write the same file, make sure there is a
dependency between them. In other works, add initscripts to BRCM_SKEL_DEPENDENCIES.


 Regards,
 Arnout

> It also doesn't seem very good that alphabetical ordering decides
> who "wins." If I named our package "zzz-skel" it would work. But
> that's not really a workable solution.
> 
> Why do I want to take this approach rather than use a post-build
> script to copy custom skeleton files into place? Primarily, because of
> the XXX_OVERRIDE_SRC functionality. If the skeleton is a package, it
> can make use of the existing override functionality. And why is that
> important?
> 
> We use the feature in our continuous integration setup. We want to
> take developer's contributions *before* they are committed into the
> main repo and run compile and run-time tests on the changes. We also
> don't just want to build the developer's tree, but use an integration
> tree that may have more changes from other developers that are being
> queued up for inclusion and ensure the new contribution works with
> those changes, too. This is something the developer wouldn't have been
> able to test easily.
> 
> So, we can't just clone a tree and build it. We want to clone the
> integration tree and include the new changes by pointing to a custom
> source tree for the package in question. Hence XXX_OVERRIDE_SRC.
> 
> We do this for other packages, and it works really well. Do you guys
> have any recommendations for doing this the proper way with our
> skeleton and avoiding interference by package initscripts?
> 
> I experimented by switching package initscripts to "default y" instead
> of "selecting" it. This, then, allows me to put "#
> BR2_PACKAGE_INITSCRIPTS is not set" in my defconfig. So, the package
> is still on unless you explicitly turn it off. This works for me and
> produces the expected results. However, I am not sure if you'd be too
> happy accepting this change upstream... If you want to see it, by all
> means let me know. I am happy to submit it. In my opinion, it allows
> more flexibility for those who want it while preserving the default
> behaviour for the rest who don't care.
> 
> Thanks,
> -Markus
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
