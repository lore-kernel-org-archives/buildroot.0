From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 11 Sep 2007 22:56:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config:  lxdialog
Message-ID: <20070912055643.8ED9FA65C3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-11 22:56:42 -0700 (Tue, 11 Sep 2007)
New Revision: 19825

Log:
 Watching all the warnings on package/config finally got to me.
 
A patch that clears the gcc warnings from config with cast changes only.
 
 thanks, I feel better now,

Rick Foos <rick@synchromeshcomputing.com>


Modified:
   trunk/buildroot/package/config/conf.c
   trunk/buildroot/package/config/confdata.c
   trunk/buildroot/package/config/lxdialog/inputbox.c
   trunk/buildroot/package/config/mconf.c


Changeset:
Modified: trunk/buildroot/package/config/conf.c
===================================================================
--- trunk/buildroot/package/config/conf.c	2007-09-12 05:20:26 UTC (rev 19824)
+++ trunk/buildroot/package/config/conf.c	2007-09-12 05:56:42 UTC (rev 19825)
@@ -44,7 +44,7 @@
 
 	while ((isspace(*p)))
 		p++;
-	l = strlen(p);
+	l = strlen((char *)p);
 	if (p != str)
 		memmove(str, p, l + 1);
 	if (!l)
@@ -101,7 +101,7 @@
 		check_stdin();
 	case ask_all:
 		fflush(stdout);
-		fgets(line, 128, stdin);
+		fgets((char *)line, 128, stdin);
 		return;
 	case set_default:
 		printf("%s\n", def);
@@ -194,8 +194,8 @@
 				break;
 			}
 		default:
-			line[strlen(line)-1] = 0;
-			def = line;
+			line[strlen((char *)line)-1] = 0;
+			def = (char *)line;
 		}
 		if (def && sym_set_string_value(sym, def))
 			return 0;
@@ -243,7 +243,7 @@
 		case 'n':
 		case 'N':
 			newval = no;
-			if (!line[1] || !strcmp(&line[1], "o"))
+			if (!line[1] || !strcmp((char *)&line[1], "o"))
 				break;
 			continue;
 		case 'm':
@@ -255,7 +255,7 @@
 		case 'y':
 		case 'Y':
 			newval = yes;
-			if (!line[1] || !strcmp(&line[1], "es"))
+			if (!line[1] || !strcmp((char *)&line[1], "es"))
 				break;
 			continue;
 		case 0:
@@ -356,7 +356,7 @@
 			check_stdin();
 		case ask_all:
 			fflush(stdout);
-			fgets(line, 128, stdin);
+			fgets((char *)line, 128, stdin);
 			strip(line);
 			if (line[0] == '?') {
 				printf("\n%s\n", menu->sym->help ?
@@ -366,7 +366,7 @@
 			if (!line[0])
 				cnt = def;
 			else if (isdigit(line[0]))
-				cnt = atoi(line);
+				cnt = atoi((char *)line);
 			else
 				continue;
 			break;
@@ -390,7 +390,7 @@
 		}
 		if (!child)
 			continue;
-		if (line[strlen(line) - 1] == '?') {
+		if (line[strlen((char *)line) - 1] == '?') {
 			printf("\n%s\n", child->sym->help ?
 				child->sym->help : nohelp_text);
 			continue;

Modified: trunk/buildroot/package/config/confdata.c
===================================================================
--- trunk/buildroot/package/config/confdata.c	2007-09-12 05:20:26 UTC (rev 19824)
+++ trunk/buildroot/package/config/confdata.c	2007-09-12 05:56:42 UTC (rev 19825)
@@ -51,8 +51,8 @@
 
 	res_value[0] = 0;
 	dst = name;
-	while ((src = strchr(in, '$'))) {
-		strncat(res_value, in, src - in);
+	while ((src = (signed char *) strchr((const char *)in, '$'))) {
+		strncat(res_value, (char *)in, src - in);
 		src++;
 		dst = name;
 		while (isalnum(*src) || *src == '_')
@@ -63,7 +63,7 @@
 		strcat(res_value, sym_get_string_value(sym));
 		in = src;
 	}
-	strcat(res_value, in);
+	strcat(res_value, (const char *)in);
 
 	return res_value;
 }
@@ -74,7 +74,7 @@
 	static char fullname[PATH_MAX+1];
 	char *env, *name;
 
-	name = conf_expand_value(conf_defname);
+	name = conf_expand_value((const signed char *)conf_defname);
 	env = getenv(SRCTREE);
 	if (env) {
 		sprintf(fullname, "%s/%s", env, name);

Modified: trunk/buildroot/package/config/lxdialog/inputbox.c
===================================================================
--- trunk/buildroot/package/config/lxdialog/inputbox.c	2007-09-12 05:20:26 UTC (rev 19824)
+++ trunk/buildroot/package/config/lxdialog/inputbox.c	2007-09-12 05:56:42 UTC (rev 19825)
@@ -52,7 +52,7 @@
 	if (!init)
 		instr[0] = '\0';
 	else
-		strcpy(instr, init);
+		strcpy((char *)instr, init);
 
 do_resize:
 	if (getmaxy(stdscr) <= (height - 2))
@@ -105,7 +105,7 @@
 		for (i = 0; i < box_width - 1; i++)
 			waddch(dialog, instr[scroll + i]);
 	} else {
-		waddstr(dialog, instr);
+		waddstr(dialog, (char *)instr);
 	}
 
 	wmove(dialog, box_y, box_x + input_x);
@@ -136,7 +136,7 @@
 							waddch(dialog,
 							       instr[scroll + input_x + i] ?
 							       instr[scroll + input_x + i] : ' ');
-						input_x = strlen(instr) - scroll;
+						input_x = strlen((char *)instr) - scroll;
 					} else
 						input_x--;
 					instr[scroll + input_x] = '\0';

Modified: trunk/buildroot/package/config/mconf.c
===================================================================
--- trunk/buildroot/package/config/mconf.c	2007-09-12 05:20:26 UTC (rev 19824)
+++ trunk/buildroot/package/config/mconf.c	2007-09-12 05:56:42 UTC (rev 19825)
@@ -413,7 +413,7 @@
 		return;
 	}
 
-	sym_arr = sym_re_search(dialog_input_result);
+	sym_arr = sym_re_search((char *)dialog_input_result);
 	res = get_relations_str(sym_arr);
 	free(sym_arr);
 	show_textbox(_("Search Results"), str_get(&res), 0, 0);
@@ -789,7 +789,7 @@
 				      sym_get_string_value(menu->sym));
 		switch (res) {
 		case 0:
-			if (sym_set_string_value(menu->sym, dialog_input_result))
+			if (sym_set_string_value(menu->sym, (char *)dialog_input_result))
 				return;
 			show_textbox(NULL, _("You have made an invalid entry."), 5, 43);
 			break;
@@ -814,7 +814,7 @@
 		case 0:
 			if (!dialog_input_result[0])
 				return;
-			if (!conf_read(dialog_input_result))
+			if (!conf_read((char *)dialog_input_result))
 				return;
 			show_textbox(NULL, _("File does not exist!"), 5, 38);
 			break;
@@ -838,7 +838,7 @@
 		case 0:
 			if (!dialog_input_result[0])
 				return;
-			if (!conf_write(dialog_input_result))
+			if (!conf_write((char *)dialog_input_result))
 				return;
 			show_textbox(NULL, _("Can't create file!  Probably a nonexistent directory."), 5, 60);
 			break;
