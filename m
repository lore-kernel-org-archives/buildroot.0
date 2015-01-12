From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 20:57:06 +0100
Subject: [Buildroot] [git commit] squid: fix automake breakage
Message-ID: <20150112195711.D3F88807A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e27ccbabc1fe5cafdd0b56098bb04e7213319002
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Squid bundles a copy of libltdl (from libtool) which autoreconfigures on
its own.
For some odd reason when automake was bumped to version 1.15 and if the host
system has another automake version, for example 1.14, the ACLOCAL and
AUTOMAKE variables don't expand properly when the internal autoreconf is
triggered hence calling the missing handler which in turn tries to use
an incorrect automake version.
The solution is to pass unexpanded ACLOCAL and AUTOMAKE variables that
defer the evaluation to a later moment and avoid the issue.

Fixes:
http://autobuild.buildroot.net/results/73f/73fcffafbea320f8c64378bbe8a96922b5e7c6b5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index e9e821d..403818a 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -20,7 +20,9 @@ SQUID_CONF_ENV = \
 	ac_cv_func_va_copy=yes \
 	ac_cv_func___va_copy=yes \
 	ac_cv_func_strnstr=no \
-	ac_cv_have_squid=yes
+	ac_cv_have_squid=yes \
+	ACLOCAL="$(ACLOCAL)" \
+	AUTOMAKE="$(AUTOMAKE)"
 SQUID_CONF_OPTS = \
 	--enable-async-io=8 \
 	--enable-linux-netfilter \
