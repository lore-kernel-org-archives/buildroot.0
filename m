From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Jul 2017 16:35:16 +0200
Subject: [Buildroot] [PATCH 0/3 v3] skeleton: move ifupdown script to their
	own package
Message-ID: <cover.1499006091.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

The ifupdown scripts are currently provided by the skeleton, and they
are used by varioue network 'managers', like the standalone ifupdown,
the one in Busybox, or by systemd (without networkd).

But when we have a skeleton specific to systemd, we'd still need to have
those scripts.

Rather than duplicate or play special tricks, we first move them to
their own package.

Then we make sure we do not install them with systemd-networkd, as they
are useless in that case.

Finally, those scripts can now even be used by a custom skeleton.

Changes v2 -> v3:
  - don't select the new package at all, but default it to 'y' for the
    default skeleton, so as to really keep the current behaviour
    (Arnout)
  - split the patch in three  (Arnout)


Regards,
Yann E. MORIN.


The following changes since commit 824f3d9bebee5008ed4f21ab9857778b7d200802

  support/scripts: check-host-rpath now handles $ORIGIN as well (2017-07-02 15:49:25 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 7af4e1b5c5c358fd2a41e609ea250138a5565c18

  package/ifupdown-scripts: allow use with a custom skeleton (2017-07-02 16:14:08 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/ifupdown-scripts: new package
      package/ifupdown-scripts: not needed for systemd-networkd
      package/ifupdown-scripts: allow use with a custom skeleton

 package/Config.in                                  |  1 +
 package/ifupdown-scripts/Config.in                 |  7 +++
 .../init.d => ifupdown-scripts}/S40network         |  0
 package/ifupdown-scripts/ifupdown-scripts.mk       | 57 ++++++++++++++++++++++
 .../{systemd => ifupdown-scripts}/network.service  |  0
 .../ifupdown-scripts}/network/if-down.d/.empty     |  0
 .../network/if-post-down.d/.empty                  |  0
 .../network/if-pre-up.d/wait_iface                 |  0
 .../ifupdown-scripts}/network/if-up.d/.empty       |  0
 package/{skeleton => ifupdown-scripts}/nfs_check   |  0
 package/skeleton/skeleton.mk                       | 33 -------------
 package/systemd/systemd.mk                         |  8 ---
 12 files changed, 65 insertions(+), 41 deletions(-)
 create mode 100644 package/ifupdown-scripts/Config.in
 rename package/{initscripts/init.d => ifupdown-scripts}/S40network (100%)
 create mode 100644 package/ifupdown-scripts/ifupdown-scripts.mk
 rename package/{systemd => ifupdown-scripts}/network.service (100%)
 rename {system/skeleton/etc => package/ifupdown-scripts}/network/if-down.d/.empty (100%)
 rename {system/skeleton/etc => package/ifupdown-scripts}/network/if-post-down.d/.empty (100%)
 rename {system/skeleton/etc => package/ifupdown-scripts}/network/if-pre-up.d/wait_iface (100%)
 rename {system/skeleton/etc => package/ifupdown-scripts}/network/if-up.d/.empty (100%)
 rename package/{skeleton => ifupdown-scripts}/nfs_check (100%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
