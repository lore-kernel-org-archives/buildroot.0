From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Apr 2019 13:51:06 +0200
Subject: [Buildroot] [PATCH 00/10] infra: add solution to dump metadata from
 packages (branch yem/misc)
Message-ID: <cover.1554637858.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a proposal to allow extracting metadata about packages,
in a way that makes it reusable for tooling outside of Buildroot, that
is both reliable and extendable, without causing too much burden on
Buildroot own infrastructure.

This series introduces a global 'show-info' rule, and a per package and
per filesystem 'show-info' rule, that dump the pacakge metadata as a
JSON blob. JSON is a key-value based serialisation format. As such, it
is easy to parse (there are implementations in virtually all languages,
and there are even tools like jq, that can be used from shell scripts).
But most importantly, it is easy to extend without breakign existing
tools (as long as they use proper JSON parsers, that is).

This series first introduces 4 cleanup preparatory patches in the
download infra, so that it gets easy to get the list of URIs to report
them. Strictly speaking, only patches 1 and 2 are required for this
series, but the cleanup was extended to the infra with patches 3 and 4,
for consistency.

Then, the series introduces a per package and per filesystem show-info
rule, as well as a recursive variant. The per filesystem rule is needed
to be able to get the info about packages that are a dependency of
filesystems.

Finally, a global show-info rule is introduced that generates a JSON
array with all the information about a build.

In the end, the output for a packages would look like (beautified manually
for ease of reading):

    $ make cracklib-show-info
    {
      "name": "cracklib",
      "type": "target",
      "virtual": false,
      "version": "2.9.7",
      "licenses": "LGPL-2.1",
      "downloads": [
        {
          "source": "cracklib-2.9.7.tar.gz",
          "URIs": [
            "https+https://github.com/cracklib/cracklib/releases/download/v2.9.7",
            "http|urlencode+http://sources.buildroot.net/cracklib",
            "http|urlencode+http://sources.buildroot.net"
          ]
        },
        {
          "source": "cracklib-words-2.9.7.gz",
          "URIs": [
            "https://github.com/cracklib/cracklib/releases/download/v2.9.7",
            "http|urlencode+http://sources.buildroot.net/cracklib",
            "http|urlencode+http://sources.buildroot.net"
          ]
        },
        null
      ],
      "depends on": [
        "host-cracklib",
        "host-skeleton",
        "skeleton",
        "toolchain"
      ],
      "dependency of": [
        "libpwquality",
        "linux-pam"
      ]
    }

While the whole show-info would look like (elipsed for readbility):

    $ make show-info
    [
    { "name": "host-gcc-final", "type": "host", "virtual": false, ... },
    { "name": "host-binutils", "type": "host", "virtual": false, ... },
    { "name": "toolchain-buildroot", "type": "target", ... },
    { "name": "gettext-tiny", "type": "target", "virtual": false, ... },
    { "name": "gettext", "type": "target", "virtual": true, ... },
    { "name": "ifupdown-scripts", "type": "target", "virtual": false, ... },
    ...
    { "name": "rootfs-common", "type": "rootfs", ... },
    { "name": "rootfs-tar", "type": "rootfs", ... }
    ]


Regards,
Yann E. MORIN.


The following changes since commit 0ca17cdc925124d1b309788518e9d4834b9b2557

  boot/syslinux: fix build with binutils note gnu property section (2019-04-07 11:54:48 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 9e4d027c3a353fadde428fbba702dcc9dac15d75

  infra: introduce top-level, global show-info (2019-04-07 13:27:45 +0200)


----------------------------------------------------------------
Yann E. MORIN (10):
      infra/pkg-download: return just a list of URIs
      infra/pkg-download: make the URI list a callable macro
      infra/pkg-download: get rid of the FLOCK variable
      infra/pkg-download: make the DOWNLOAD macro fully parameterised
      infra/utils: add helper to generate comma-separated lists
      infra/pkg-generic: introduce foo-show-info
      infra/pkg-generic: introduce foo-show-recursive-info
      infra/fs: introduce rootfs-foo-show-info
      infar/fs: introduce rootfs-foo-show-recursive-info
      infra: introduce top-level, global show-info

 Makefile                |  6 ++++++
 fs/common.mk            | 32 ++++++++++++++++++++++++++++++++
 package/pkg-download.mk | 41 ++++++++++++++++++++++++-----------------
 package/pkg-generic.mk  | 49 ++++++++++++++++++++++++++++++++++++++++++++++++-
 support/misc/utils.mk   |  4 ++++
 5 files changed, 114 insertions(+), 18 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
