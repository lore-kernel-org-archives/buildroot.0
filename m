From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 23:04:50 +0100
Subject: [Buildroot] [git commit] (e)glibc: add security patches for
	CVE-2014-9402
Message-ID: <20150108220455.4162E80841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=785843017c897806abbfaed529001a1fac71dbc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-9402 - denial of service in getnetbyname function.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../glibc/2.18-svnr23787/0004-CVE-2014-9402.patch  |   20 ++++++++++++++++
 .../glibc/2.19-svnr25243/0003-CVE-2014-9402.patch  |   20 ++++++++++++++++
 package/glibc/2.19/0003-CVE-2014-9402.patch        |   24 ++++++++++++++++++++
 package/glibc/2.20/0002-CVE-2014-9402.patch        |   24 ++++++++++++++++++++
 4 files changed, 88 insertions(+), 0 deletions(-)

diff --git a/package/glibc/2.18-svnr23787/0004-CVE-2014-9402.patch b/package/glibc/2.18-svnr23787/0004-CVE-2014-9402.patch
new file mode 100644
index 0000000..c7aa12c
--- /dev/null
+++ b/package/glibc/2.18-svnr23787/0004-CVE-2014-9402.patch
@@ -0,0 +1,20 @@
+Fix CVE-2014-9402 - denial of service in getnetbyname function.
+Backport from https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=11e3417af6e354f1942c68a271ae51e892b2814d
+See https://bugzilla.redhat.com/show_bug.cgi?id=1175369
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura eglibc-2.19.orig/libc/resolv/nss_dns/dns-network.c eglibc-2.19/libc/resolv/nss_dns/dns-network.c
+--- eglibc-2.19.orig/libc/resolv/nss_dns/dns-network.c	2015-01-08 16:12:35.024977879 -0300
++++ eglibc-2.19/libc/resolv/nss_dns/dns-network.c	2015-01-08 16:12:42.543992357 -0300
+@@ -398,8 +398,8 @@
+ 
+ 	case BYNAME:
+ 	  {
+-	    char **ap = result->n_aliases++;
+-	    while (*ap != NULL)
++	    char **ap;
++	    for (ap = result->n_aliases; *ap != NULL; ++ap)
+ 	      {
+ 		/* Check each alias name for being of the forms:
+ 		   4.3.2.1.in-addr.arpa		= net 1.2.3.4
diff --git a/package/glibc/2.19-svnr25243/0003-CVE-2014-9402.patch b/package/glibc/2.19-svnr25243/0003-CVE-2014-9402.patch
new file mode 100644
index 0000000..c7aa12c
--- /dev/null
+++ b/package/glibc/2.19-svnr25243/0003-CVE-2014-9402.patch
@@ -0,0 +1,20 @@
+Fix CVE-2014-9402 - denial of service in getnetbyname function.
+Backport from https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=11e3417af6e354f1942c68a271ae51e892b2814d
+See https://bugzilla.redhat.com/show_bug.cgi?id=1175369
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura eglibc-2.19.orig/libc/resolv/nss_dns/dns-network.c eglibc-2.19/libc/resolv/nss_dns/dns-network.c
+--- eglibc-2.19.orig/libc/resolv/nss_dns/dns-network.c	2015-01-08 16:12:35.024977879 -0300
++++ eglibc-2.19/libc/resolv/nss_dns/dns-network.c	2015-01-08 16:12:42.543992357 -0300
+@@ -398,8 +398,8 @@
+ 
+ 	case BYNAME:
+ 	  {
+-	    char **ap = result->n_aliases++;
+-	    while (*ap != NULL)
++	    char **ap;
++	    for (ap = result->n_aliases; *ap != NULL; ++ap)
+ 	      {
+ 		/* Check each alias name for being of the forms:
+ 		   4.3.2.1.in-addr.arpa		= net 1.2.3.4
diff --git a/package/glibc/2.19/0003-CVE-2014-9402.patch b/package/glibc/2.19/0003-CVE-2014-9402.patch
new file mode 100644
index 0000000..d6d753e
--- /dev/null
+++ b/package/glibc/2.19/0003-CVE-2014-9402.patch
@@ -0,0 +1,24 @@
+Fix CVE-2014-9402 - denial of service in getnetbyname function.
+Backport from https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=11e3417af6e354f1942c68a271ae51e892b2814d
+See https://bugzilla.redhat.com/show_bug.cgi?id=1175369
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff --git a/resolv/nss_dns/dns-network.c b/resolv/nss_dns/dns-network.c
+index 0a77c8b..08cf0a6 100644
+--- a/resolv/nss_dns/dns-network.c
++++ b/resolv/nss_dns/dns-network.c
+@@ -398,8 +398,8 @@ getanswer_r (const querybuf *answer, int anslen, struct netent *result,
+ 
+ 	case BYNAME:
+ 	  {
+-	    char **ap = result->n_aliases++;
+-	    while (*ap != NULL)
++	    char **ap;
++	    for (ap = result->n_aliases; *ap != NULL; ++ap)
+ 	      {
+ 		/* Check each alias name for being of the forms:
+ 		   4.3.2.1.in-addr.arpa		= net 1.2.3.4
+-- 
+1.7.1
+
diff --git a/package/glibc/2.20/0002-CVE-2014-9402.patch b/package/glibc/2.20/0002-CVE-2014-9402.patch
new file mode 100644
index 0000000..d6d753e
--- /dev/null
+++ b/package/glibc/2.20/0002-CVE-2014-9402.patch
@@ -0,0 +1,24 @@
+Fix CVE-2014-9402 - denial of service in getnetbyname function.
+Backport from https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=11e3417af6e354f1942c68a271ae51e892b2814d
+See https://bugzilla.redhat.com/show_bug.cgi?id=1175369
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff --git a/resolv/nss_dns/dns-network.c b/resolv/nss_dns/dns-network.c
+index 0a77c8b..08cf0a6 100644
+--- a/resolv/nss_dns/dns-network.c
++++ b/resolv/nss_dns/dns-network.c
+@@ -398,8 +398,8 @@ getanswer_r (const querybuf *answer, int anslen, struct netent *result,
+ 
+ 	case BYNAME:
+ 	  {
+-	    char **ap = result->n_aliases++;
+-	    while (*ap != NULL)
++	    char **ap;
++	    for (ap = result->n_aliases; *ap != NULL; ++ap)
+ 	      {
+ 		/* Check each alias name for being of the forms:
+ 		   4.3.2.1.in-addr.arpa		= net 1.2.3.4
+-- 
+1.7.1
+
