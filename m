From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 22 Jan 2016 20:10:53 -0500
Subject: [Buildroot] [PATCH 00/18] Erlang 18 and native atomic ops
Message-ID: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set pulls in a major update to Erlang. A couple build errors were
introduced by the upgrade which necessitated upgrading several Erlang
packages. It turns out that Erlang's native atomic ops code has been
improved since the last version so that it is now preferred over using
libatomic ops. The final commit that makes the switch away from libatomic_ops
fixes builds on aarch64 without affecting other builds (at least the
qemu_*_defconfigs w/ Erlang and a few other configs.) Erlang autobuilder errors
due to sparc_v8 atomics and musl are not addressed by this patch set.

Frank Hunleth (18):
  erlang: bump to version 18.2.1
  pkg-rebar.mk: pass C++ compiler path and options
  erlang-goldrush: bump to version 0.1.8
  erlang-lager: bump to version 2.2.0
  erlang-rebar: bump to version 2.6.1
  erlang-fast_tls: new package
  erlang-p1-cache-tab: bump to version 1.0.1
  erlang-p1-iconv: bump to version 0.9.0
  erlang-p1-stringprep: bump to version 1.0.0
  erlang-p1_stun: bump to version 0.9.0
  erlang-p1-sip: bump to version 1.0.0
  erlang-p1-tls: bump to version 1.0.0
  erlang-p1-utils: bump to version 1.0.3
  erlang-p1-xml: bump to version 1.1.1
  erlang-p1-yaml: bump to version 1.0.0
  erlang-p1-zlib: bump to version 1.0.0
  ejabberd: bump to version 16.01
  erlang: make libatomic_ops optional

 package/Config.in                                  |  3 +-
 ...001-remove-dependencies-from-rebar-config.patch | 83 ++++++++++++++++++++++
 package/ejabberd/0001-remove-deps.patch            | 22 ------
 package/ejabberd/0002-disable-rebar-deps.patch     | 76 --------------------
 .../0002-remove-make-targets-for-deps.patch        | 74 +++++++++++++++++++
 package/ejabberd/0003-disable-test.patch           | 27 -------
 .../0003-remove-checking-erlang-version.patch      | 30 ++++++++
 package/ejabberd/0004-correct-include.patch        | 56 +++++++++++++++
 package/ejabberd/0004-disable-version-check.patch  | 20 ------
 .../0005-disable-ERLANG_DEPRECATED_CHECK.patch     | 27 +++++++
 package/ejabberd/0005-fix-includes.patch           | 45 ------------
 ...006-disable-erlang-deprecated-types-check.patch | 20 ------
 ...ns.patch => 0006-fix-install-permissions.patch} | 41 +++++------
 ...jabberdctl.patch => 0007-fix-ejabberdctl.patch} | 21 ++++--
 package/ejabberd/Config.in                         |  5 +-
 package/ejabberd/ejabberd.hash                     |  6 +-
 package/ejabberd/ejabberd.mk                       |  2 +-
 package/erlang-fast_tls/Config.in                  |  7 ++
 package/erlang-fast_tls/erlang-fast_tls.mk         | 14 ++++
 package/erlang-goldrush/erlang-goldrush.mk         |  2 +-
 package/erlang-lager/erlang-lager.mk               |  2 +-
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk |  2 +-
 package/erlang-p1-iconv/erlang-p1-iconv.mk         |  2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk             |  4 +-
 package/erlang-p1-stringprep/Config.in             |  4 ++
 .../erlang-p1-stringprep/erlang-p1-stringprep.mk   |  2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk             |  2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk         |  2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk             |  2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk           |  2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk           |  2 +-
 .../{erlang-p1-stun => erlang-p1_stun}/Config.in   |  4 +-
 .../erlang-p1_stun.mk}                             |  6 +-
 package/erlang-rebar/erlang-rebar.mk               |  2 +-
 ...04-erts-fix-incorrect-use-of-ac-egrep-cpp.patch | 79 --------------------
 package/erlang/Config.in                           | 10 ++-
 package/erlang/erlang.hash                         |  2 +-
 package/erlang/erlang.mk                           | 10 +--
 package/pkg-rebar.mk                               |  2 +
 39 files changed, 375 insertions(+), 347 deletions(-)
 create mode 100644 package/ejabberd/0001-remove-dependencies-from-rebar-config.patch
 delete mode 100644 package/ejabberd/0001-remove-deps.patch
 delete mode 100644 package/ejabberd/0002-disable-rebar-deps.patch
 create mode 100644 package/ejabberd/0002-remove-make-targets-for-deps.patch
 delete mode 100644 package/ejabberd/0003-disable-test.patch
 create mode 100644 package/ejabberd/0003-remove-checking-erlang-version.patch
 create mode 100644 package/ejabberd/0004-correct-include.patch
 delete mode 100644 package/ejabberd/0004-disable-version-check.patch
 create mode 100644 package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch
 delete mode 100644 package/ejabberd/0005-fix-includes.patch
 delete mode 100644 package/ejabberd/0006-disable-erlang-deprecated-types-check.patch
 rename package/ejabberd/{0007-fix-install-permissions.patch => 0006-fix-install-permissions.patch} (73%)
 rename package/ejabberd/{0008-fix-ejabberdctl.patch => 0007-fix-ejabberdctl.patch} (56%)
 create mode 100644 package/erlang-fast_tls/Config.in
 create mode 100644 package/erlang-fast_tls/erlang-fast_tls.mk
 rename package/{erlang-p1-stun => erlang-p1_stun}/Config.in (70%)
 rename package/{erlang-p1-stun/erlang-p1-stun.mk => erlang-p1_stun/erlang-p1_stun.mk} (77%)
 delete mode 100644 package/erlang/0004-erts-fix-incorrect-use-of-ac-egrep-cpp.patch

--
2.5.0
