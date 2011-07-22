From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jul 2011 07:34:09 +0200
Subject: [Buildroot] [git commit] iproute2: bump to version 2.6.39
Message-ID: <20110722053532.6D71D8B3D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4e7283604f584c79b928a4d90a98a8037c36f08e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iproute2/iproute2-xt-v6.patch |   39 +++++++++++++++++++++++++++++++++
 package/iproute2/iproute2.mk          |    3 +-
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 package/iproute2/iproute2-xt-v6.patch

diff --git a/package/iproute2/iproute2-xt-v6.patch b/package/iproute2/iproute2-xt-v6.patch
new file mode 100644
index 0000000..4856e36
--- /dev/null
+++ b/package/iproute2/iproute2-xt-v6.patch
@@ -0,0 +1,39 @@
+From: Andreas Henriksson <andreas@fatal.se>
+Forwarded: yes
+Subject: [PATCH] iproute2: Fix building xt module against xtables version 6
+
+
+diff --git a/tc/m_xt.c b/tc/m_xt.c
+index 651a59e..13bf19f 100644
+--- a/tc/m_xt.c
++++ b/tc/m_xt.c
+@@ -160,9 +160,13 @@ static int parse_ipt(struct action_util *a,int *argc_p,
+ 					return -1;
+ 				}
+ 				tcipt_globals.opts =
+-				    xtables_merge_options(tcipt_globals.opts,
+-				                          m->extra_opts,
+-				                          &m->option_offset);
++				    xtables_merge_options(
++#if (XTABLES_VERSION_CODE >= 6)
++				        tcipt_globals.orig_opts,
++#endif
++				        tcipt_globals.opts,
++				        m->extra_opts,
++				        &m->option_offset);
+ 			} else {
+ 				fprintf(stderr," failed to find target %s\n\n", optarg);
+ 				return -1;
+@@ -305,7 +309,11 @@ print_ipt(struct action_util *au,FILE * f, struct rtattr *arg)
+ 			}
+ 
+ 			tcipt_globals.opts =
+-			    xtables_merge_options(tcipt_globals.opts,
++			    xtables_merge_options(
++#if (XTABLES_VERSION_CODE >= 6)
++				                  tcipt_globals.orig_opts,
++#endif
++				                  tcipt_globals.opts,
+ 			                          m->extra_opts,
+ 			                          &m->option_offset);
+ 		} else {
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 630fab4..fd78b3c 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,8 +4,7 @@
 #
 #############################################################
 
-IPROUTE2_VERSION = 2.6.38
-IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.bz2
+IPROUTE2_VERSION = 2.6.39
 IPROUTE2_SITE = http://devresources.linuxfoundation.org/dev/iproute2/download
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
 
-- 
1.7.3.4
