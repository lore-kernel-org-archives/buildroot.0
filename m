From: Kim Kulak <kim@kulak.ca>
Date: Thu Jul 27 21:52:16 2006
Subject: [Buildroot] Busybox & Gcc
In-Reply-To: <20060727184451.GA13078@reid1.localdomain>
References: <20060727184451.GA13078@reid1.localdomain>
Message-ID: <44C989A9.5070103@kulak.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

don wrote:
> I am trying to compile busybox.  It is full of code which the newer
> gcc's don't like.  For example:
> 
> /home/don/Robots/Bot1/EPIA/buildroot/build_i486/busybox/modutils/lsmod.c: In function `lsmod_main':/home/don/Robots/Bot1/EPIA/buildroot/build_i486/busybox/modutils/lsmod.c:96:
> warning: dereferencing type-punned pointer will break strict-aliasing rules
> /home/don/Robots/Bot1/EPIA/buildroot/build_i486/busybox/modutils/lsmod.c:114:
> warning: dereferencing type-punned pointer will break strict-aliasing rules
> make[2]: *** [/home/don/Robots/Bot1/EPIA/buildroot/build_i486/busybox/modutils/lsmod.o] Error 1
> make[1]: *** [_all] Error 2
> make: *** [/home/don/Robots/Bot1/EPIA/buildroot/build_i486/busybox/busybox] Error 2

I had a problem with that too. Here are some patches:

diff -urN build_orig/busybox/modutils/insmod.c
build_i586/busybox/modutils/insmod.c
--- build_orig/busybox/modutils/insmod.c	2006-07-24 20:21:51.000000000 -0700
+++ build_i586/busybox/modutils/insmod.c	2006-07-25 19:50:45.000000000 -0700
@@ -349,7 +349,6 @@
 #ifndef MODUTILS_MODULE_H
 /* Why? static const int MODUTILS_MODULE_H = 1;*/

-#ident "$Id: insmod.c,v 1.126 2004/12/26 09:13:32 vapier Exp $"

 /*======================================================================*/
 /* For sizeof() which are related to the module platform and not to the
@@ -512,7 +511,6 @@
 #ifndef MODUTILS_OBJ_H
 /* Why? static const int MODUTILS_OBJ_H = 1; */

-#ident "$Id: insmod.c,v 1.126 2004/12/26 09:13:32 vapier Exp $"

 /* The relocatable object is manipulated using elfin types.  */

diff -urN build_orig/busybox/modutils/lsmod.c
build_i586/busybox/modutils/lsmod.c
--- build_orig/busybox/modutils/lsmod.c	2006-07-24 20:23:22.000000000 -0700
+++ build_i586/busybox/modutils/lsmod.c	2006-07-25 19:52:03.000000000 -0700
@@ -89,20 +89,25 @@
 int lsmod_main(int argc, char **argv)
 {
 	struct module_info info;
-	char *module_names, *mn, *deps, *dn;
+    union
+       {
+          char *buf;
+          void *ptr;
+       } module_names, deps;
+	char *mn, *dn;
 	size_t bufsize, depsize, nmod, count, i, j;

-	module_names = xmalloc(bufsize = 256);
-	if (my_query_module(NULL, QM_MODULES, (void **)&module_names, &bufsize,
+	module_names.buf = xmalloc(bufsize = 256);
+	if (my_query_module(NULL, QM_MODULES, (void **)&module_names.ptr,
&bufsize,
 				&nmod)) {
 		bb_perror_msg_and_die("QM_MODULES");
 	}

-	deps = xmalloc(depsize = 256);
+	deps.buf = xmalloc(depsize = 256);
 	printf("Module                  Size  Used by");
 	check_tainted();

-	for (i = 0, mn = module_names; i < nmod; mn += strlen(mn) + 1, i++) {
+	for (i = 0, mn = module_names.buf; i < nmod; mn += strlen(mn) + 1, i++) {
 		if (query_module(mn, QM_INFO, &info, sizeof(info), &count)) {
 			if (errno == ENOENT) {
 				/* The module was removed out from underneath us. */
@@ -111,7 +116,7 @@
 			/* else choke */
 			bb_perror_msg_and_die("module %s: QM_INFO", mn);
 		}
-		if (my_query_module(mn, QM_REFS, (void **)&deps, &depsize, &count)) {
+		if (my_query_module(mn, QM_REFS, (void **)&deps.ptr, &depsize, &count)) {
 			if (errno == ENOENT) {
 				/* The module was removed out from underneath us. */
 				continue;
@@ -132,7 +137,7 @@
 				printf(" (unused)");
 		}
 		if (count) printf(" [");
-		for (j = 0, dn = deps; j < count; dn += strlen(dn) + 1, j++) {
+		for (j = 0, dn = deps.buf; j < count; dn += strlen(dn) + 1, j++) {
 			printf("%s%s", dn, (j==count-1)? "":" ");
 		}
 		if (count) printf("]");
diff -urN build_orig/busybox/modutils/rmmod.c
build_i586/busybox/modutils/rmmod.c
--- build_orig/busybox/modutils/rmmod.c	2006-07-24 21:09:34.000000000 -0700
+++ build_i586/busybox/modutils/rmmod.c	2006-07-25 19:52:37.000000000 -0700
@@ -50,6 +50,7 @@
 	/* bb_common_bufsiz1 hold the module names which we ignore
 	   but must get */
 	size_t bufsize = sizeof(bb_common_bufsiz1);
+    void *bufptr = (void *)bb_common_bufsiz1;
 #endif

 	/* Parse command line. */
@@ -73,7 +74,7 @@
 			pnmod = nmod;
 #ifdef CONFIG_FEATURE_QUERY_MODULE_INTERFACE
 			/* 1 == QM_MODULES */
-			if (my_query_module(NULL, 1, &bb_common_bufsiz1, &bufsize, &nmod)) {
+			if (my_query_module(NULL, 1, &bufptr, &bufsize, &nmod)) {
 				bb_perror_msg_and_die("QM_MODULES");
 			}
 #endif
diff -urN build_orig/busybox/networking/ping.c
build_i586/busybox/networking/ping.c
--- build_orig/busybox/networking/ping.c	2006-07-24 21:28:10.000000000 -0700
+++ build_i586/busybox/networking/ping.c	2006-07-25 19:53:41.000000000 -0700
@@ -211,7 +211,7 @@
 	pkt->icmp_type = ICMP_ECHO;
 	pkt->icmp_code = 0;
 	pkt->icmp_cksum = 0;
-	pkt->icmp_seq = htons(ntransmitted++);
+	pkt->icmp_seq = htons(ntransmitted); ntransmitted += 1;
 	pkt->icmp_id = myid;
 	CLR(ntohs(pkt->icmp_seq) % MAX_DUP_CHK);


Busybox built clean after this for me with gcc 3.4.2.

Kim
