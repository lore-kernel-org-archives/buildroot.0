From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 29 Sep 2007 13:21:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20070929202139.8729830043@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-29 13:21:38 -0700 (Sat, 29 Sep 2007)
New Revision: 20125

Log:
- pull "kconfig: oldconfig shall not set symbols if it does not need to"


Modified:
   trunk/buildroot/package/config/conf.c


Changeset:
Modified: trunk/buildroot/package/config/conf.c
===================================================================
--- trunk/buildroot/package/config/conf.c	2007-09-29 20:08:22 UTC (rev 20124)
+++ trunk/buildroot/package/config/conf.c	2007-09-29 20:21:38 UTC (rev 20125)
@@ -64,7 +64,7 @@
 	}
 }
 
-static void conf_askvalue(struct symbol *sym, const char *def)
+static int conf_askvalue(struct symbol *sym, const char *def)
 {
 	enum symbol_type type = sym_get_type(sym);
 	tristate val;
@@ -79,7 +79,7 @@
 		printf("%s\n", def);
 		line[0] = '\n';
 		line[1] = 0;
-		return;
+		return 0;
 	}
 
 	switch (input_mode) {
@@ -89,23 +89,23 @@
 	case set_random:
 		if (sym_has_value(sym)) {
 			printf("%s\n", def);
-			return;
+			return 0;
 		}
 		break;
 	case ask_new:
 	case ask_silent:
 		if (sym_has_value(sym)) {
 			printf("%s\n", def);
-			return;
+			return 0;
 		}
 		check_stdin();
 	case ask_all:
 		fflush(stdout);
 		fgets(line, 128, stdin);
-		return;
+		return 1;
 	case set_default:
 		printf("%s\n", def);
-		return;
+		return 1;
 	default:
 		break;
 	}
@@ -115,7 +115,7 @@
 	case S_HEX:
 	case S_STRING:
 		printf("%s\n", def);
-		return;
+		return 1;
 	default:
 		;
 	}
@@ -166,6 +166,7 @@
 		break;
 	}
 	printf("%s", line);
+	return 1;
 }
 
 int conf_string(struct menu *menu)
@@ -179,7 +180,8 @@
 		def = sym_get_string_value(sym);
 		if (sym_get_string_value(sym))
 			printf("[%s] ", def);
-		conf_askvalue(sym, def);
+		if (!conf_askvalue(sym, def))
+			return 0;
 		switch (line[0]) {
 		case '\n':
 			break;
@@ -236,7 +238,8 @@
 		if (sym->help)
 			printf("/?");
 		printf("] ");
-		conf_askvalue(sym, sym_get_string_value(sym));
+		if (!conf_askvalue(sym, sym_get_string_value(sym)))
+			return 0;
 		strip(line);
 
 		switch (line[0]) {
