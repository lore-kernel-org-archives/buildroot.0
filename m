From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Apr 2019 21:47:30 +0200
Subject: [Buildroot] [PATCH 00/12 v3] infra: add solution to dump metadata
 from packages (branch yem/show-info-2)
Message-ID: <cover.1555357644.git.yann.morin.1998@free.fr>
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
per filesystem 'show-info' rule, that dump the package metadata as a
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
rule. The per filesystem rule is needed to be able to get the info about
packages that are a dependency of filesystems.

Finally, a global show-info rule is introduced that generates a JSON
array with all the information about a build.

In the end, the output for a packages would look like:

    $ make cracklib-show-info |jq . -
    {
      "cracklib": {
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
          }
        ],
        "dependencies": [
          "host-cracklib",
          "host-skeleton",
          "skeleton",
          "toolchain"
        ],
        "reverse_dependencies": [
          "libpwquality",
          "linux-pam"
        ]
      }
    }

While the whole show-info would look like (elipsed and manually indented
for readbility):

    $ make show-info
    {
      "host-gcc-final": { "type": "host", "virtual": false, ... },
      "host-binutils": { "type": "host", "virtual": false, ... },
      "toolchain-buildroot": { "type": "target", "virtual": true, ... },
      "gettext-tiny": { "type": "target", "virtual": false, ... },
      "gettext": { "type": "target", "virtual": true, ... },
      "ifupdown-scripts": { "type": "target", "virtual": false, ... },
      ...
      "rootfs-common": { "type": "rootfs", ... },
      "rootfs-tar": { "type": "rootfs", ... }
    }

Changes v2 -> v3:
  - set the virutal field in a single place  (Arnout)
  - rename internal macro  (Arnout)
  - don't add opening and closing {} in clean-json  (Arnout)
  - add to 'make help'

Changes v1 -> v2:
  - DOWNLOAD_URIS uses foreach instead of patsubst  (Thomas P.)
  - rename dependencies keys  (Thomas DS)
  - split DOWNLOAD/DOWNLOAD_URIS comments  (Thomas DS)
  - make-comma-list uses an explicit $(space)  (Thomas DS)
  - top-level show-info is a dictionary, not an array  (Arnout)
  - use a macro to generate a JSON element for an item  (Arnout)
  - drop the 'null' object in download list  (Arnout, Thomas DS)
  - change graph-depends to use that instead of show-dependency-graph
  - drop show-dependency-graph
  - fix double list of URIs
  - fix typoes


Regards,
Yann E. MORIN.


The following changes since commit a45a3997d8ee0aa592c6a64ce300ee727ad7dc54

  package/cjson: security bump to version 1.7.11 (2019-04-15 21:40:14 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to add67b53daa3c056dad8577f57d483c2bbda3fc6

  core: remove show-depednency-tree (2019-04-15 21:46:41 +0200)


----------------------------------------------------------------
Yann E. MORIN (12):
      infra/pkg-download: return just a list of URIs
      infra/pkg-download: make the URI list a callable macro
      infra/pkg-download: get rid of the FLOCK variable
      infra/pkg-download: make the DOWNLOAD macro fully parameterised
      infra/utils: add helper to generate comma-separated lists
      fs: introduce variables with name and type
      fs: introduce variable with all recursive dependencies
      fs: add all recursive dependencies to packages list
      core: introduce new global show-info
      core: add per-package and per-filesystem show-info
      support/scripts: use show-info to extract dependency graph
      core: remove show-depednency-tree

 Makefile                     | 21 ++++++++++++---
 fs/common.mk                 | 45 +++++++++++++++++++++++++------
 package/pkg-download.mk      | 46 ++++++++++++++++++-------------
 package/pkg-generic.mk       | 11 ++++----
 package/pkg-utils.mk         | 64 ++++++++++++++++++++++++++++++++++++++++++++
 support/misc/utils.mk        |  4 +++
 support/scripts/brpkgutil.py | 30 ++++++++++-----------
 7 files changed, 168 insertions(+), 53 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
