From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Aug 2018 00:06:17 +0200
Subject: [Buildroot] [PATCH 0/3] linux: drop dependency on host-{bison, flex}
Message-ID: <cover.1533333972.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

host{bison,flex} are only needed to build the kconfig parser. The
kconfig parser is not part of any host tool that would be used by
any other package; instead, it is purely internal to the kernel,
and are only used to generate the .config file.

As such, we don't care much what version of bison or flex are used
to generate the parser; those comonly available in the distros are
good enough for the task.

So, add bison and flex to the list of pre-requisites, check for
them as part of the dependencies check, and finally drop the host
variants from linux' dependencies.

This series implements the solution discussed in this thread, with
suggestion by Thomas and Arnout (same thread, span three months):
    http://lists.busybox.net/pipermail/buildroot/2018-May/221243.html
    http://lists.busybox.net/pipermail/buildroot/2018-July/226840.html
    http://lists.busybox.net/pipermail/buildroot/2018-August/226971.html

Eventually, when we update our own version of kconfig, we may decide
to also drop the generated parser, or keep bundling them. If we go
the former route, we'll have to revisit how we check for bison and
flex, so it also works even in the face of an unconfigured tree.
But that can be done then.

Note that this series does conflict with one I sent earlier:
    https://patchwork.ozlabs.org/project/buildroot/list/?series=59249

Probaby we want this one to be applied first, and leave the other for
later (linux-4.18 is not cwevenyet out yet, and probably won't be
before we freeze for 2018.08 anyway).


Regards,
Yann E. MORIN.


The following changes since commit 81ea4a243b63d7bb1fec580910c553af4ae072c1

  package/lttng-tools: bump version to 2.10.5 (2018-08-01 14:28:30 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 0c44ca5ddc27dfe13152a08b4bdd48ce3b8599dc

  linux: drop dependency on host-{bison,flex} (2018-08-03 23:32:14 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      docs/manual: add flex+bison to pre-requisites
      support/dependencies: also check for flex+bison
      linux: drop dependency on host-{bison,flex}

 docs/manual/prerequisite.txt         | 3 ++-
 linux/linux.mk                       | 2 +-
 support/dependencies/dependencies.sh | 6 +++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
