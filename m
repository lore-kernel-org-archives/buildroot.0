From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 22:08:42 +0200
Subject: [Buildroot] Report of the Buildroot Hackaton
Message-ID: <20150715220842.06a511ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As I announced in a mail last week [1], six Buildroot developers met
this week-end in Toulouse France for a 4-day long hackaton. We
started on Friday 10th and ended late on Tuesday 14th night.

Yann E. Morin, Samuel Martin, Romain Naour, Arnout Vandecappelle,
Maxime Hadjinlian and myself participated to this event. Each day, we
worked from around 10 AM to about 2/3 AM in the night. So as you can
imagine, a crazy number of hours have been spent working on Buildroot.

Our primary focus has been reducing the patchwork backlog, and I think
the efforts paid well: we started with a patchwork having 370 patches
waiting in the queue, and when we stopped, there were only 170 patches
left.

Globally, we reduced the patch queue by 200 patches, but in total many
more patches have been handled since 105 new patches came in while we
processed them. Patches were handled either by applying them after
some rework, or by reviewing and asking for changes to be made. Also a
small number of patches have been rejected if they were not
appropriate.

For those loving data, here is a nice spreadsheet and graph showing
our progress over the 4 days (thanks Samuel!) :

   https://docs.google.com/spreadsheets/d/1bwzkbtwErpFX-_wFjxo1GjovgRfkY0RynU_mpSpkvxM/edit#gid=0

Amongst the things that were merged during this hackaton:

 * New packages: c-icap, c-icap-modules, libsodium, qpid-proton,
   racehound, libfm-extra, libfm, menu-cache, librtas, lua-iconv

 * Obviously, lots of bumps. Especially a bump of many Erlang related
   packages, and of the entire Freescale i.MX related patches. Thanks
   to Johan Oudinet and Gary Bisson respectively for providing those
   patches.

 * Introduction of the <pkg>_STRIP_COMPONENTS variable in the package
   infrastructure, to tell how many path components should be stripped
   when extracting tarballs. It allows to remove some custom extract
   code from several packages. Done by Luca Ceresoli, who joined the
   Hackaton remotely from his home.

 * Introduction of a "kernel-module" package infrastructure, which
   helps packaging kernel modules. Many packages were converted to
   this infrastructure where applicable. Done by Yann E. Morin.

 * Fixes in dropbear and nfs-utils to make them work properly with a
   read-only rootfs.

 * Merge of the patches fixing the umask issue: now Buildroot is
   independent of the umask configured in the system. Note that this
   also means that the permissions of the files in your
   skeleton/overlay are now ignored: we reset them to a sane value. If
   special permissions are needed, a permission table should be
   used. A note in the CHANGES file has been added about this.

 * Merge of many systemd service files for a number of
   packages. Thanks to Maxime Hadjinlian for reviewing them!

 * Fix of the X11 locale.dir file generation. This may seem like a
   detail, but it was the oldest patch we had still in patchwork,
   dating back from 2012. Thanks to Arnout for tackling the problem
   and doing related cleanups!

 * Move of the Busybox/SysV base init scripts from the skeleton to a
   new dedicated 'initscripts' package. This allows to not have those
   files installed in a systemd configuration, where they are
   useless. Done by Maxime Hadjinlian.

 * Related to that, move the skeleton logic to a skeleton package in
   package/skeleton/. Also done by Maxime Hadjinlian, with lots of
   reviews and comments from others.

 * Addition of a small linux-tools infrastructure that allows to more
   clearly package the userspace tools bundled with the kernel sources
   (perf, cpupower, etc.). Thanks to Romain Naour for taking the lead
   on this, and to Yann E. Morin for doing lots of review and
   development with Romain!

 * Switch from using $(shell ...) to run shell commands to using
   backticks (`...`). The motivation is that the backticks are
   evaluated later (i.e really when the variable is being used, and
   not defined), which has two benefits: 1/ allows 'make printvars' to
   not display a crazy number of errors and 2/ is a necessary
   preparation for the per-package staging directory which itself is
   needed to enable a safe and reliable top-level parallel build.

So as you can see, lots of things were worked on, and I'm still
skipping on all the smaller patches/topics that have been
discussed. Of course, we couldn't tackle all of the topics, but we
hope to continue working on these, and especially the SELinux support,
the webkit/midori bump and the top-level parallel build support.

During those four days, the weather was very nice, if not a bit
warm. We had some nice time on Saturday evening visiting the historic
Toulouse center and having dinner at a restaurant, on Sunday evening
we did a great barbecue with Argentinian wine provided by Gustavo
(thanks!) and on Monday evening we had a pizza party!

All the participants were really happy with this hackaton, and when
leaving, everyone was wondering: when are we doing the next one?

Best regards,

Thomas

[1] http://lists.busybox.net/pipermail/buildroot/2015-July/131836.html
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
