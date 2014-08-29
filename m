From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Aug 2014 09:16:00 +0200
Subject: [Buildroot] [git commit] ruby: should not use dl_iterate_phdr() on
	Blackfin
Message-ID: <20140829071721.D75629D577@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53bf889cdca77979814bc6b74170e2f104fc3b70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dl_iterate_phdr() C library function on Blackfin returns a
non-conventional structure format compared to other architectures,
which makes Ruby unable to use it. Since it's just an optional feature
of Ruby apparently used to generate more fancy backtraces, this commit
simply disables the usage of dl_iterate_phdr() on this architecture.

Fixes:

  http://autobuild.buildroot.org/results/1b0/1b0e2f5f95889eb26846927da45d128247d0ed89/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 66556c3..b84aaf3 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -28,6 +28,10 @@ RUBY_CFLAGS += -O2
 endif
 RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
 
+ifeq ($(BR2_bfin),y)
+RUBY_CONF_ENV = ac_cv_func_dl_iterate_phdr=no
+endif
+
 # Force optionals to build before we do
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 	RUBY_DEPENDENCIES += berkeleydb
