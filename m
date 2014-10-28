From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 28 Oct 2014 14:33:37 +0100
Subject: [Buildroot] [PATCH 00/15] ejabberd: XMPP server
Message-ID: <1414503232-28314-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since ejabberd build system relies on rebar to download its
dependencies, we've packaged all of them separately and modified
ejabberd makefile to not download any dependency.

Actually, every erlang package that is introduced here rely on the
rebar software. Thus, we also introduce a new infrastructure to
simplify the development of such packages in buildroot.

Johan Oudinet (15):
  package/pkg-autotools.mk: Factorize hooks.
  rebar package infrastructure: new infrastructure.
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

 docs/manual/adding-packages-rebar.txt              | 157 ++++++++++++++
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
 package/ejabberd/ejabberd.mk                       |  51 +++++
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
 package/erlang-rebar/erlang-rebar.mk               |  20 ++
 package/pkg-autotools.mk                           | 119 +++++------
 package/pkg-rebar.mk                               | 229 +++++++++++++++++++++
 support/scripts/erlang-ei-vsn                      |  19 ++
 45 files changed, 1303 insertions(+), 63 deletions(-)
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
 create mode 100755 support/scripts/erlang-ei-vsn

-- 
2.1.0
