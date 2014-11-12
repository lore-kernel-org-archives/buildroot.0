From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:26:05 +0100
Subject: [Buildroot] [PATCH 0/24 v3] ejabberd: XMPP server (branch
	yem/ejabberd)
Message-ID: <cover.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Since ejabberd build system relies on rebar to download its
dependencies, we've packaged all of them separately and modified
ejabberd makefile to not download any dependency.

Actually, every erlang package that is introduced here rely on the
rebar software. Thus, we also introduce a new infrastructure to
simplify the development of such packages in buildroot.


NOTES!

This series is just an RFC for now, the pkg-rebar infra was
largely mangled between v2 and v3, and so was the pkg-autotools
patch.

The autotools changes are no longer required by pkg-rebar, but still
they make for a godd cleanup and improvement in the code, so I kept
them. They can be moved out of this series and into their own later
on, if needed.

Since new variables have been added to the pkg-rebar infra, erlang
packages will no longer work, because I did not touch them.

Needless to say: I did not even try to build a package with that for
now, it may even not pass the smoke test. Use with caution.

==> For review up to the pkg-rebar infra.


Thanks a lot to Johan (and his colleague) for the initial work
of introducing this series! Kudos to both of you! :-)

(BTW, authorship of some patches are wrong, I forgot to set Johan
as author when splitting some of the patches. Sorry, I'll fix next
time this series flies by in my vincinity.)


Changes v2 -> v3:
  - split out the autotools patch into the 7 first ones
  - split out the pkg-rebar into patches 8-11
  - other packages left untouched

Changes v1 -> v2:
  - use BR_PATH instead of an hard-coded path in pkg-rebar.mk.
  - update erlang-p1-iconv version to fix a link error with libiconv.


Regards,
Yann E. MORIN.


The following changes since commit 5f617ffa17537d701a2f645f36895fa0d695d221:

  sysv init scripts: fix == bashism (2014-11-11 23:08:46 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/ejabberd

for you to fetch changes up to 6dfd5938cc100d7f068c4ccb9456c56eea511d3a:

  ejabberd: new package. (2014-11-12 00:58:42 +0100)

----------------------------------------------------------------
Johan Oudinet (14):
      package/pkg-rebar: new infrastructure
      erlang-goldrush: new package.
      erlang-lager: new package.
      erlang-p1-zlib: new package.
      erlang-p1-yaml: new package.
      erlang-p1-xml: new package.
      erlang-p1-utils: new package.
      erlang-p1-tls: new package.
      erlang-p1-stun: new package.
      erlang-p1-stringprep: new package.
      erlang-p1-sip: new package.
      erlang-p1-iconv: new package.
      erlang-p1-cache-tab: new package.
      ejabberd: new package.

Yann E. MORIN (10):
      pkg-autotools: move common macros
      pkg-autotools: re-order cleaning up the host dependencies
      pkg-autotools: commonalise the libtool patching code
      pkg-autotools: move the libtool patching call out of the autoreconf hook
      pkg-autotools: remove redundant shell conditional
      pkg-autotools: fold the libtool patching code directly into the hook
      pkg-autotools: only apply libtool patch at the right moment
      package/erlang: export EI_VSN so other packages can use it
      package/erlang-rebar: new host package
      docs/manual: add documentation for the pkg-rebar infrastructure

 docs/manual/adding-packages-rebar.txt              | 157 +++++++++++++++++
 docs/manual/adding-packages.txt                    |   2 +
 package/Config.in                                  |  17 ++
 package/Makefile.in                                |   1 +
 package/ejabberd/0001-remove-deps.patch            |  20 +++
 package/ejabberd/0002-disable-rebar-deps.patch     |  70 ++++++++
 package/ejabberd/0003-disable-test.patch           |  21 +++
 package/ejabberd/0004-disable-version-check.patch  |  20 +++
 package/ejabberd/0005-fix-includes.patch           |  45 +++++
 package/ejabberd/0006-remove-doc.patch             |  26 +++
 package/ejabberd/0007-fix-init.patch               |  99 +++++++++++
 .../ejabberd/0008-fix-install-permissions.patch    |  76 ++++++++
 package/ejabberd/Config.in                         |  21 +++
 package/ejabberd/S50ejabberd                       |  35 ++++
 package/ejabberd/check-erlang-lib                  |  55 ++++++
 package/ejabberd/ejabberd.mk                       |  51 ++++++
 package/erlang-goldrush/Config.in                  |   6 +
 package/erlang-goldrush/erlang-goldrush.mk         |  14 ++
 package/erlang-lager/Config.in                     |  12 ++
 package/erlang-lager/erlang-lager.mk               |  14 ++
 package/erlang-p1-cache-tab/Config.in              |   6 +
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk |  13 ++
 package/erlang-p1-iconv/Config.in                  |   6 +
 package/erlang-p1-iconv/erlang-p1-iconv.mk         |  17 ++
 package/erlang-p1-sip/Config.in                    |   8 +
 .../erlang-p1-sip-01-fix-includes.patch            |  19 ++
 package/erlang-p1-sip/erlang-p1-sip.mk             |  14 ++
 package/erlang-p1-stringprep/Config.in             |   5 +
 .../erlang-p1-stringprep/erlang-p1-stringprep.mk   |  13 ++
 package/erlang-p1-stun/Config.in                   |   7 +
 package/erlang-p1-stun/erlang-p1-stun.mk           |  14 ++
 package/erlang-p1-tls/Config.in                    |   5 +
 package/erlang-p1-tls/erlang-p1-tls.mk             |  14 ++
 package/erlang-p1-utils/Config.in                  |   5 +
 package/erlang-p1-utils/erlang-p1-utils.mk         |  14 ++
 package/erlang-p1-xml/Config.in                    |   6 +
 package/erlang-p1-xml/erlang-p1-xml.mk             |  14 ++
 package/erlang-p1-yaml/Config.in                   |   6 +
 package/erlang-p1-yaml/erlang-p1-yaml.mk           |  13 ++
 package/erlang-p1-zlib/Config.in                   |   5 +
 package/erlang-p1-zlib/erlang-p1-zlib.mk           |  13 ++
 package/erlang-rebar/erlang-rebar.mk               |  31 ++++
 package/erlang/erlang.mk                           |   5 +
 package/pkg-autotools.mk                           | 135 +++++++-------
 package/pkg-rebar.mk                               | 195 +++++++++++++++++++++
 45 files changed, 1273 insertions(+), 72 deletions(-)
 create mode 100644 docs/manual/adding-packages-rebar.txt
 create mode 100644 package/ejabberd/0001-remove-deps.patch
 create mode 100644 package/ejabberd/0002-disable-rebar-deps.patch
 create mode 100644 package/ejabberd/0003-disable-test.patch
 create mode 100644 package/ejabberd/0004-disable-version-check.patch
 create mode 100644 package/ejabberd/0005-fix-includes.patch
 create mode 100644 package/ejabberd/0006-remove-doc.patch
 create mode 100644 package/ejabberd/0007-fix-init.patch
 create mode 100644 package/ejabberd/0008-fix-install-permissions.patch
 create mode 100644 package/ejabberd/Config.in
 create mode 100644 package/ejabberd/S50ejabberd
 create mode 100755 package/ejabberd/check-erlang-lib
 create mode 100644 package/ejabberd/ejabberd.mk
 create mode 100644 package/erlang-goldrush/Config.in
 create mode 100644 package/erlang-goldrush/erlang-goldrush.mk
 create mode 100644 package/erlang-lager/Config.in
 create mode 100644 package/erlang-lager/erlang-lager.mk
 create mode 100644 package/erlang-p1-cache-tab/Config.in
 create mode 100644 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
 create mode 100644 package/erlang-p1-iconv/Config.in
 create mode 100644 package/erlang-p1-iconv/erlang-p1-iconv.mk
 create mode 100644 package/erlang-p1-sip/Config.in
 create mode 100644 package/erlang-p1-sip/erlang-p1-sip-01-fix-includes.patch
 create mode 100644 package/erlang-p1-sip/erlang-p1-sip.mk
 create mode 100644 package/erlang-p1-stringprep/Config.in
 create mode 100644 package/erlang-p1-stringprep/erlang-p1-stringprep.mk
 create mode 100644 package/erlang-p1-stun/Config.in
 create mode 100644 package/erlang-p1-stun/erlang-p1-stun.mk
 create mode 100644 package/erlang-p1-tls/Config.in
 create mode 100644 package/erlang-p1-tls/erlang-p1-tls.mk
 create mode 100644 package/erlang-p1-utils/Config.in
 create mode 100644 package/erlang-p1-utils/erlang-p1-utils.mk
 create mode 100644 package/erlang-p1-xml/Config.in
 create mode 100644 package/erlang-p1-xml/erlang-p1-xml.mk
 create mode 100644 package/erlang-p1-yaml/Config.in
 create mode 100644 package/erlang-p1-yaml/erlang-p1-yaml.mk
 create mode 100644 package/erlang-p1-zlib/Config.in
 create mode 100644 package/erlang-p1-zlib/erlang-p1-zlib.mk
 create mode 100644 package/erlang-rebar/erlang-rebar.mk
 create mode 100644 package/pkg-rebar.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
