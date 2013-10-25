From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2013 18:48:50 +0200
Subject: [Buildroot] [git commit] dnsmasq: bump to version 2.67
Message-ID: <20131025165054.DAAD69BBB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a88b4804ffebe5fbbd185a99e6b95ca96720295d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../dnsmasq-01-fix-wrong-size-in-memset-call.patch |   27 ----
 ...-number-zero-in-encapsulated-dhcp-options.patch |  143 --------------------
 package/dnsmasq/dnsmasq.mk                         |    2 +-
 3 files changed, 1 insertions(+), 171 deletions(-)

diff --git a/package/dnsmasq/dnsmasq-01-fix-wrong-size-in-memset-call.patch b/package/dnsmasq/dnsmasq-01-fix-wrong-size-in-memset-call.patch
deleted file mode 100644
index 536552a..0000000
--- a/package/dnsmasq/dnsmasq-01-fix-wrong-size-in-memset-call.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 4582c0efe7d7af93517b1f3bcc7af67685ab3e5c Mon Sep 17 00:00:00 2001
-From: Dave Reisner <d@falconindy.com>
-Date: Thu, 18 Apr 2013 09:47:49 +0100
-Subject: [PATCH] Fix wrong size in memset() call.
-
-Thanks to Dave Reisner.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- src/ipset.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/ipset.c b/src/ipset.c
-index a34ed96..f175fa4 100644
---- a/src/ipset.c
-+++ b/src/ipset.c
-@@ -110,7 +110,7 @@ static int new_add_to_ipset(const char *setname, const struct all_addr *ipaddr,
-       return -1;
-     }
-   
--  memset(buffer, 0, sizeof(buffer));
-+  memset(buffer, 0, BUFF_SZ);
- 
-   nlh = (struct nlmsghdr *)buffer;
-   nlh->nlmsg_len = NL_ALIGN(sizeof(struct nlmsghdr));
---
-1.8.1.5
diff --git a/package/dnsmasq/dnsmasq-02-allow-option-number-zero-in-encapsulated-dhcp-options.patch b/package/dnsmasq/dnsmasq-02-allow-option-number-zero-in-encapsulated-dhcp-options.patch
deleted file mode 100644
index 79f57bf..0000000
--- a/package/dnsmasq/dnsmasq-02-allow-option-number-zero-in-encapsulated-dhcp-options.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-From bd08ae67f9a0cae2ce15be885254cad9449d4551 Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Fri, 19 Apr 2013 10:22:06 +0100
-Subject: [PATCH] Allow option number zero in encapsulated DHCP options.
-
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- src/dhcp-common.c |  6 +++---
- src/dnsmasq.h     |  4 ++--
- src/option.c      | 33 ++++++++++++++++++++-------------
- 3 files changed, 25 insertions(+), 18 deletions(-)
-
-diff --git a/src/dhcp-common.c b/src/dhcp-common.c
-index f4fd088..8de4268 100644
---- a/src/dhcp-common.c
-+++ b/src/dhcp-common.c
-@@ -512,7 +512,7 @@ void display_opts6(void)
- }
- #endif
- 
--u16 lookup_dhcp_opt(int prot, char *name)
-+int lookup_dhcp_opt(int prot, char *name)
- {
-   const struct opttab_t *t;
-   int i;
-@@ -528,10 +528,10 @@ u16 lookup_dhcp_opt(int prot, char *name)
-     if (strcasecmp(t[i].name, name) == 0)
-       return t[i].val;
-   
--  return 0;
-+  return -1;
- }
- 
--u16 lookup_dhcp_len(int prot, u16 val)
-+int lookup_dhcp_len(int prot, int val)
- {
-   const struct opttab_t *t;
-   int i;
-diff --git a/src/dnsmasq.h b/src/dnsmasq.h
-index 69ae7a7..41e2798 100644
---- a/src/dnsmasq.h
-+++ b/src/dnsmasq.h
-@@ -1216,8 +1216,8 @@ void log_tags(struct dhcp_netid *netid, u32 xid);
- int match_bytes(struct dhcp_opt *o, unsigned char *p, int len);
- void dhcp_update_configs(struct dhcp_config *configs);
- void display_opts(void);
--u16 lookup_dhcp_opt(int prot, char *name);
--u16 lookup_dhcp_len(int prot, u16 val);
-+int lookup_dhcp_opt(int prot, char *name);
-+int lookup_dhcp_len(int prot, int val);
- char *option_string(int prot, unsigned int opt, unsigned char *val, 
- 		    int opt_len, char *buf, int buf_len);
- #ifdef HAVE_LINUX_NETWORK
-diff --git a/src/option.c b/src/option.c
-index b2596ec..2a61017 100644
---- a/src/option.c
-+++ b/src/option.c
-@@ -750,6 +750,7 @@ static int parse_dhcp_opt(char *errstr, char *arg, int flags)
-   struct dhcp_netid *np = NULL;
-   u16 opt_len = 0;
-   int is6 = 0;
-+  int option_ok = 0;
- 
-   new->len = 0;
-   new->flags = flags;
-@@ -769,16 +770,19 @@ static int parse_dhcp_opt(char *errstr, char *arg, int flags)
- 	{
- 	  new->opt = atoi(arg);
- 	  opt_len = 0;
-+	  option_ok = 1;
- 	  break;
- 	}
-       
-       if (strstr(arg, "option:") == arg)
- 	{
--	  new->opt = lookup_dhcp_opt(AF_INET, arg+7);
--	  opt_len = lookup_dhcp_len(AF_INET, new->opt);
--	  /* option:<optname> must follow tag and vendor string. */
--	  if ((opt_len & OT_INTERNAL) && flags != DHOPT_MATCH)
--	    new->opt = 0;
-+	  if ((new->opt = lookup_dhcp_opt(AF_INET, arg+7)) != -1)
-+	    {
-+	      opt_len = lookup_dhcp_len(AF_INET, new->opt);
-+	      /* option:<optname> must follow tag and vendor string. */
-+	      if (!(opt_len & OT_INTERNAL) || flags == DHOPT_MATCH)
-+		option_ok = 1;
-+	    }
- 	  break;
- 	}
- #ifdef HAVE_DHCP6
-@@ -792,13 +796,16 @@ static int parse_dhcp_opt(char *errstr, char *arg, int flags)
- 	    {
- 	      new->opt = atoi(arg+8);
- 	      opt_len = 0;
-+	      option_ok = 1;
- 	    }
- 	  else
- 	    {
--	      new->opt = lookup_dhcp_opt(AF_INET6, arg+8);
--	      opt_len = lookup_dhcp_len(AF_INET6, new->opt);
--	      if ((opt_len & OT_INTERNAL) && flags != DHOPT_MATCH)
--		new->opt = 0;
-+	      if ((new->opt = lookup_dhcp_opt(AF_INET6, arg+8)) != -1)
-+		{
-+		  opt_len = lookup_dhcp_len(AF_INET6, new->opt);
-+		  if (!(opt_len & OT_INTERNAL) || flags == DHOPT_MATCH)
-+		    option_ok = 1;
-+		}
- 	    }
- 	  /* option6:<opt>|<optname> must follow tag and vendor string. */
- 	  is6 = 1;
-@@ -821,7 +828,7 @@ static int parse_dhcp_opt(char *errstr, char *arg, int flags)
- 	  new->flags |= DHOPT_RFC3925;
- 	  if (flags == DHOPT_MATCH)
- 	    {
--	      new->opt = 1; /* avoid error below */
-+	      option_ok = 1;
- 	      break;
- 	    }
- 	}
-@@ -848,16 +855,16 @@ static int parse_dhcp_opt(char *errstr, char *arg, int flags)
-       
-       if (opt_len == 0 &&
- 	  !(new->flags & DHOPT_RFC3925))
--	opt_len = lookup_dhcp_len(AF_INET6 ,new->opt);
-+	opt_len = lookup_dhcp_len(AF_INET6, new->opt);
-     }
-   else
- #endif
-     if (opt_len == 0 &&
- 	!(new->flags & (DHOPT_VENDOR | DHOPT_ENCAPSULATE | DHOPT_RFC3925)))
--      opt_len = lookup_dhcp_len(AF_INET ,new->opt);
-+      opt_len = lookup_dhcp_len(AF_INET, new->opt);
-   
-   /* option may be missing with rfc3925 match */
--  if (new->opt == 0)
-+  if (!option_ok)
-     ret_err(_("bad dhcp-option"));
-   
-   if (comma)
---
-1.8.1.5
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 8b9c318..3474a41 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.66
+DNSMASQ_VERSION = 2.67
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
