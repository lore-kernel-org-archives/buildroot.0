From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Jul 2015 18:05:08 +0200
Subject: [Buildroot] [PATCH 2/2] heimdal: disable parallel build
In-Reply-To: <1436544308-22652-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1436544308-22652-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1436544308-22652-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commit 2fc8be39edd610623d322c71e42a06b535cbadb7 enabled parallel
build, but this is causing build failures like this one:

Making all in kadm5
make[3]: Entering directory
`/home/test/autobuild/instance-0/output/build/host-heimdal-1.6rc2/lib/kadm5'
compile_et kadm5_err.et
compile_et kadm5_err.et
  CC       ad.lo
    CC       chpass_c.lo
    In file included from chpass_c.c:34:
    kadm5_locl.h:78:23: error: kadm5_err.h: No such file or directory

The file 'kadm5_err.h' is a generated header which is being requested
before being generated.

Fixes:

  http://autobuild.buildroot.net/results/3a4/3a42c5b294a9a8602844ed1127ec5eadb60a6bed/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/heimdal/heimdal.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 19bca5e..8c2aa2b 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -24,6 +24,7 @@ HOST_HEIMDAL_CONF_OPTS = \
 	--without-x \
 	--disable-heimdal-documentation
 HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
+HEIMDAL_MAKE = $(MAKE1)
 HEIMDAL_LICENSE = BSD-3c
 HEIMDAL_LICENSE_FILES = LICENSE
 
-- 
2.3.6
