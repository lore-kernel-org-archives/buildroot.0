From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  6 Jan 2015 15:02:58 +0100
Subject: [Buildroot] [PATCH v5 00/16] ejabberd: XMPP server
Message-ID: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Since ejabberd build system relies on rebar to download its dependencies, we've
packaged all of them separately and modified ejabberd makefile to not download
any dependency.

Actually, every erlang package that is introduced here rely on the rebar
software. Thus, we also introduce a new infrastructure to simplify the
development of such packages in buildroot.

Changes v4 -> v5: (Thomas)
  - rename some variables in pkg-rebar.mk
  - rebar infrastructure adds the dependencies to erlang and host-erlang-rebar
  - update rebar manual accordingly
  - remove unnecessary dependency to erlang for erlang packages
  - add missing links and licenses to some erlang packages

Changes v3 -> v4:
  - fix build and install commands in pkg-rebar.mk.
  - look for erlang libraries in STAGING_DIR instead of TARGET_DIR.
  - run configure script for p1-xml, p1-iconv, and ejabberd packages.

Changes v2 -> v3:
  - split out the autotools patch into the 7 first ones
  - split out the pkg-rebar into patches 8-11
  - other packages left untouched

Changes v1 -> v2:
  - use BR_PATH instead of an hard-coded path in pkg-rebar.mk.
  - update erlang-p1-iconv version to fix a link error with libiconv.

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

Yann E. MORIN (2):
  package/erlang: export EI_VSN so other packages can use it
  docs/manual: add documentation for the pkg-rebar infrastructure

 docs/manual/adding-packages-rebar.txt              | 102 +++++++++
 docs/manual/adding-packages.txt                    |   2 +
 package/Config.in                                  |  17 ++
 package/Makefile.in                                |   1 +
 package/ejabberd/0001-remove-deps.patch            |  20 ++
 package/ejabberd/0002-disable-rebar-deps.patch     |  70 +++++++
 package/ejabberd/0003-disable-test.patch           |  21 ++
 package/ejabberd/0004-disable-version-check.patch  |  20 ++
 package/ejabberd/0005-fix-includes.patch           |  45 ++++
 package/ejabberd/0006-remove-doc.patch             |  26 +++
 package/ejabberd/0007-fix-init.patch               |  99 +++++++++
 .../ejabberd/0008-fix-install-permissions.patch    |  76 +++++++
 package/ejabberd/Config.in                         |  21 ++
 package/ejabberd/S50ejabberd                       |  35 ++++
 package/ejabberd/check-erlang-lib                  |  55 +++++
 package/ejabberd/ejabberd.mk                       |  52 +++++
 package/erlang-goldrush/Config.in                  |   7 +
 package/erlang-goldrush/erlang-goldrush.mk         |  14 ++
 package/erlang-lager/Config.in                     |  13 ++
 package/erlang-lager/erlang-lager.mk               |  14 ++
 package/erlang-p1-cache-tab/Config.in              |   7 +
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk |  13 ++
 package/erlang-p1-iconv/Config.in                  |   7 +
 package/erlang-p1-iconv/erlang-p1-iconv.mk         |  18 ++
 package/erlang-p1-sip/Config.in                    |   9 +
 .../erlang-p1-sip-01-fix-includes.patch            |  19 ++
 package/erlang-p1-sip/erlang-p1-sip.mk             |  14 ++
 package/erlang-p1-stringprep/Config.in             |   6 +
 .../erlang-p1-stringprep/erlang-p1-stringprep.mk   |  12 ++
 package/erlang-p1-stun/Config.in                   |   8 +
 package/erlang-p1-stun/erlang-p1-stun.mk           |  14 ++
 package/erlang-p1-tls/Config.in                    |   6 +
 package/erlang-p1-tls/erlang-p1-tls.mk             |  13 ++
 package/erlang-p1-utils/Config.in                  |   6 +
 package/erlang-p1-utils/erlang-p1-utils.mk         |  13 ++
 package/erlang-p1-xml/Config.in                    |   7 +
 package/erlang-p1-xml/erlang-p1-xml.mk             |  16 ++
 package/erlang-p1-yaml/Config.in                   |   7 +
 package/erlang-p1-yaml/erlang-p1-yaml.mk           |  13 ++
 package/erlang-p1-zlib/Config.in                   |   6 +
 package/erlang-p1-zlib/erlang-p1-zlib.mk           |  12 ++
 package/erlang/erlang.mk                           |   5 +
 package/pkg-rebar.mk                               | 229 +++++++++++++++++++++
 43 files changed, 1170 insertions(+)
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
 create mode 100644 package/pkg-rebar.mk

-- 
2.1.0
