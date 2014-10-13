From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Oct 2014 14:12:43 -0500
Subject: [Buildroot] [PATCH 1/1] iptables: fix userspace compilation of ip
	tables with C++
Message-ID: <1413227563-5383-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 ...ix-userspace-compilation-of-ip_tables_c_h.patch |   43 ++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/iptables/iptables-03-fix-userspace-compilation-of-ip_tables_c_h.patch

diff --git a/package/iptables/iptables-03-fix-userspace-compilation-of-ip_tables_c_h.patch b/package/iptables/iptables-03-fix-userspace-compilation-of-ip_tables_c_h.patch
new file mode 100644
index 0000000..5b769b1
--- /dev/null
+++ b/package/iptables/iptables-03-fix-userspace-compilation-of-ip_tables_c_h.patch
@@ -0,0 +1,43 @@
+From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
+Date: Sun, 30 Sep 2012 22:49:11 -0600
+Subject: [PATCH] Fix userspace compilation of ip_tables.h/ip6_tables.h in
+	C++ mode
+
+The implicit cast from void * is not allowed for C++ compilers, and the
+arithmetic on void * generates warnings in C++ mode.
+
+$ g++ -c t.cc
+ip_tables.h:221:24: warning: pointer of type 'void *' used in arithmetic
+ip_tables.h:221:24: error: invalid conversion from 'void*' to 'xt_entry_target*'
+
+Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
+---
+ include/linux/netfilter_ipv4/ip_tables.h  |    2 +-
+ include/linux/netfilter_ipv6/ip6_tables.h |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+diff --git a/include/linux/netfilter_ipv4/ip_tables.h b/include/linux/netfilter_ipv4/ip_tables.h
+index db79231..050ad8a 100644
+--- a/include/linux/netfilter_ipv4/ip_tables.h
++++ b/include/linux/netfilter_ipv4/ip_tables.h
+@@ -226,7 +226,7 @@ struct ipt_get_entries {
+ static __inline__ struct xt_entry_target *
+ ipt_get_target(struct ipt_entry *e)
+ {
+-	return (void *)e + e->target_offset;
++	return (struct xt_entry_target *)((__u8 *)e + e->target_offset);
+ }
+ 
+ /*
+diff --git a/include/linux/netfilter_ipv6/ip6_tables.h b/include/linux/netfilter_ipv6/ip6_tables.h
+index 08c2cbb..3349bf1 100644
+--- a/include/linux/netfilter_ipv6/ip6_tables.h
++++ b/include/linux/netfilter_ipv6/ip6_tables.h
+@@ -263,7 +263,7 @@ struct ip6t_get_entries {
+ static __inline__ struct xt_entry_target *
+ ip6t_get_target(struct ip6t_entry *e)
+ {
+-	return (void *)e + e->target_offset;
++	return (struct xt_entry_target *)((__u8 *)e + e->target_offset);
+ }
+ 
+ /*
-- 
1.7.9.5
