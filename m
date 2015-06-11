From: grepper <grepper@gmail.com>
Date: Thu, 11 Jun 2015 01:04:13 -0400
Subject: [Buildroot] [PATCH 1/1] bc: Bump to version 1.06.95
Message-ID: <1433999053-4479-1-git-send-email-grepper@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: grepper <grepper@gmail.com>
---
 package/bc/01_typo_in_bc.patch               |  19 +
 package/bc/02_hyphens_as_minus_in_man.patch  |  89 ++++
 package/bc/03_array_initialize.patch         |  20 +
 package/bc/04_info_dircategory.patch         |  30 ++
 package/bc/05_notice_read_write_errors.patch | 708 +++++++++++++++++++++++++++
 package/bc/06_read_dcrc.patch                |  92 ++++
 package/bc/07_bc_man.patch                   | 417 ++++++++++++++++
 package/bc/bc.hash                           |   2 +-
 package/bc/bc.mk                             |   5 +-
 9 files changed, 1379 insertions(+), 3 deletions(-)
 create mode 100644 package/bc/01_typo_in_bc.patch
 create mode 100644 package/bc/02_hyphens_as_minus_in_man.patch
 create mode 100644 package/bc/03_array_initialize.patch
 create mode 100644 package/bc/04_info_dircategory.patch
 create mode 100644 package/bc/05_notice_read_write_errors.patch
 create mode 100644 package/bc/06_read_dcrc.patch
 create mode 100644 package/bc/07_bc_man.patch

diff --git a/package/bc/01_typo_in_bc.patch b/package/bc/01_typo_in_bc.patch
new file mode 100644
index 0000000..97f51a2
--- /dev/null
+++ b/package/bc/01_typo_in_bc.patch
@@ -0,0 +1,19 @@
+Description: Fix a typo in bc
+Author: Ryan Kavanagh <rak@debian.org>
+Origin: vendor
+Forwarded: no
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+Index: bc/bc/bc.c
+===================================================================
+--- bc.orig/bc/bc.c	2013-04-21 15:37:22.457003102 -0400
++++ bc/bc/bc.c	2013-04-21 16:17:44.649193374 -0400
+@@ -1922,7 +1922,7 @@
+ #line 460 "bc.y"
+     {
+ 			      if ((yyvsp[0].i_value) & EX_COMP)
+-				warn ("comparison in return expresion");
++				warn ("comparison in return expression");
+ 			      if (!((yyvsp[0].i_value) & EX_PAREN))
+ 				warn ("return expression requires parenthesis");
+ 			      if ((yyvsp[0].i_value) & EX_VOID)
diff --git a/package/bc/02_hyphens_as_minus_in_man.patch b/package/bc/02_hyphens_as_minus_in_man.patch
new file mode 100644
index 0000000..6544578
--- /dev/null
+++ b/package/bc/02_hyphens_as_minus_in_man.patch
@@ -0,0 +1,89 @@
+Description: Correct hyphens used as minus signs
+Author: Ryan Kavanagh <rak@debian.org>
+Origin: vendor
+Forwarded: no
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+Index: bc/doc/bc.1
+===================================================================
+--- bc.orig/doc/bc.1	2013-04-21 16:25:33.292838937 -0400
++++ bc/doc/bc.1	2013-04-21 16:25:33.288838837 -0400
+@@ -543,7 +543,7 @@
+ variable \fBpi\fR.
+ .RS
+ \f(CW
+-pi=$(echo "scale=10; 4*a(1)" | bc -l)
++pi=$(echo "scale=10; 4*a(1)" | bc \-l)
+ \fR
+ .RE
+ .PP
+@@ -565,7 +565,7 @@
+   /* Check the sign of x. */
+   if (x<0) {
+     m = 1
+-    x = -x
++    x = \-x
+   } 
+ 
+   /* Precondition x. */
+@@ -615,7 +615,7 @@
+   "current balance = "; bal
+   "transaction? "; trans = read()
+   if (trans == 0) break;
+-  bal -= trans
++  bal \-= trans
+   bal /= 1
+ }
+ quit
+@@ -641,7 +641,7 @@
+ to \fBbc\fR.  It also allows for a history of previous lines typed.
+ When this option is selected, \fBbc\fR has one more special variable.
+ This special variable, \fBhistory\fR is the number of lines of history
+-retained.  For \fBreadline\fR, a value of -1 means that an unlimited
++retained.  For \fBreadline\fR, a value of \-1 means that an unlimited
+ number of history lines are retained.  Setting the value of
+ \fBhistory\fR to a positive number restricts the number of history
+ lines to the number given.  The value of 0 disables the history
+@@ -658,7 +658,7 @@
+ It is not implemented in the traditional way using
+ .I dc(1).
+ This version is a single process which parses and runs a byte code
+-translation of the program.  There is an "undocumented" option (-c)
++translation of the program.  There is an "undocumented" option (\-c)
+ that causes the program to output the byte code to
+ the standard output instead of running it.  It was mainly used for
+ debugging the parser and preparing the math library.
+@@ -710,13 +710,13 @@
+ .IP "function format"
+ POSIX \fBbc\fR requires the opening brace on the same line as the 
+ \fBdefine\fR key word and the \fBauto\fR statement on the next line.
+-.IP "=+, =-, =*, =/, =%, =^"
++.IP "=+, =\-, =*, =/, =%, =^"
+ POSIX \fBbc\fR does not require these "old style" assignment operators to
+ be defined.  This version may allow these "old style" assignments.  Use
+ the limits statement to see if the installed version supports them.  If
+ it does support the "old style" assignment operators, the statement
+-"a =- 1" will decrement \fBa\fR by 1 instead of setting \fBa\fR to the
+-value -1.
++"a =\- 1" will decrement \fBa\fR by 1 instead of setting \fBa\fR to the
++value \-1.
+ .IP "spaces in numbers"
+ Other implementations of \fBbc\fR allow spaces in numbers.  For example,
+ "x=1 3" would assign the value 13 to the variable x.  The same statement
+Index: bc/doc/dc.1
+===================================================================
+--- bc.orig/doc/dc.1	2013-04-21 16:25:33.292838937 -0400
++++ bc/doc/dc.1	2013-04-21 16:25:42.769074416 -0400
+@@ -26,9 +26,9 @@
+ .SH NAME
+ dc \- an arbitrary precision calculator
+ .SH SYNOPSIS
+-dc [-V] [--version] [-h] [--help]
+-   [-e scriptexpression] [--expression=scriptexpression]
+-   [-f scriptfile] [--file=scriptfile]
++dc [\-V] [\-\-version] [\-h] [\-\-help]
++   [\-e scriptexpression] [\-\-expression=scriptexpression]
++   [\-f scriptfile] [\-\-file=scriptfile]
+    [file ...]
+ .SH DESCRIPTION
+ .PP
diff --git a/package/bc/03_array_initialize.patch b/package/bc/03_array_initialize.patch
new file mode 100644
index 0000000..9520d82
--- /dev/null
+++ b/package/bc/03_array_initialize.patch
@@ -0,0 +1,20 @@
+Description: Fix array initialization bug
+Author: Phil Nelson
+Origin: upstream
+Bug-Debian: http://bugs.debian.org/586969
+Bug-Debian: http://bugs.debian.org/671513
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+Index: bc/bc/storage.c
+===================================================================
+--- bc.orig/bc/storage.c	2013-06-02 20:34:09.401273864 -0400
++++ bc/bc/storage.c	2013-06-02 20:34:11.000000000 -0400
+@@ -179,7 +179,7 @@
+ 
+ 
+   /* Initialize the new elements. */
+-  for (; indx < v_count; indx++)
++  for (; indx < a_count; indx++)
+     arrays[indx] = NULL;
+ 
+   /* Free the old elements. */
diff --git a/package/bc/04_info_dircategory.patch b/package/bc/04_info_dircategory.patch
new file mode 100644
index 0000000..2918df2
--- /dev/null
+++ b/package/bc/04_info_dircategory.patch
@@ -0,0 +1,30 @@
+Description: Set the dircategory of info pages to Math
+ Converted from an inline patch introduced in 1.06.95-3 (git commit 9be25538) 
+Author: John G. Hasler <jhasler@debian.org>
+Origin: vendor
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+Index: bc/doc/bc.texi
+===================================================================
+--- bc.orig/doc/bc.texi	2013-05-03 16:34:41.604415944 -0400
++++ bc/doc/bc.texi	2013-05-03 16:34:49.760617149 -0400
+@@ -16,6 +16,7 @@
+ @c end tex
+ 
+ @ifinfo
++ at dircategory Math
+ @direntry
+ * bc: (bc).                    An arbitrary precision calculator language.
+ @end direntry
+Index: bc/doc/dc.texi
+===================================================================
+--- bc.orig/doc/dc.texi	2013-05-03 16:34:41.604415944 -0400
++++ bc/doc/dc.texi	2013-05-03 16:34:50.528636094 -0400
+@@ -23,6 +23,7 @@
+ @syncodeindex tp fn
+ 
+ @ifinfo
++ at dircategory Math
+ @direntry
+ * dc: (dc).                   Arbitrary precision RPN ``Desktop Calculator''.
+ @end direntry
diff --git a/package/bc/05_notice_read_write_errors.patch b/package/bc/05_notice_read_write_errors.patch
new file mode 100644
index 0000000..73e6ec9
--- /dev/null
+++ b/package/bc/05_notice_read_write_errors.patch
@@ -0,0 +1,708 @@
+Description: notice read and write errors on input and output
+ Quoting from the bug report:
+    +bc (1.06-19ubuntu1) dapper; urgency=low
+    +
+    +  * Make dc notice read and write errors on its input and output.
+    +    I grepped for mentions of the strings `putc', `print', `getc', `FILE',
+    +    `stdin', `stdout' and `stderr' and added calls to new error-checking
+    +    functions unless it was clear from the immediately-surrounding code
+    +    that the program was exiting nonzero, or would exit nonzero if the
+    +    call failed.  I ignored hits in lib/getopt*, which seems to
+    +    pervasively ignore write errors when printing usage messages, in the
+    +    hope that these were correct.  I _think_ I got them all.  -iwj.
+    +
+    + -- Ian Jackson <iwj@ubuntu.com>  Tue,  4 Apr 2006 17:21:02 +0100
+Author: Ian Jackson <iwj@ubuntu.com>
+Origin: other
+Bug-Debian: http://bugs.debian.org/488735
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+diff --git a/bc/execute.c b/bc/execute.c
+index e4e8ef7..8787048 100644
+--- a/bc/execute.c
++++ b/bc/execute.c
+@@ -108,6 +108,7 @@ execute ()
+ 	      }
+ 	    out_char ('\n');
+ 	  }
++	checkferror_output(stdout);
+       }
+ #endif
+ 
+@@ -222,6 +223,7 @@ execute ()
+ 		}
+ 	    }
+ 	fflush (stdout);
++	checkferror_output(stdout);
+ 	break;
+ 
+       case 'R' : /* Return from function */
+@@ -257,6 +259,7 @@ execute ()
+ 	if (inst == 'W') out_char ('\n');
+ 	store_var (4);  /* Special variable "last". */
+ 	fflush (stdout);
++	checkferror_output(stdout);
+ 	pop ();
+ 	break;
+ 
+@@ -338,6 +341,7 @@ execute ()
+       case 'w' : /* Write a string to the output. */
+ 	while ((ch = byte(&pc)) != '"') out_schar (ch);
+ 	fflush (stdout);
++	checkferror_output(stdout);
+ 	break;
+ 		   
+       case 'x' : /* Exchange Top of Stack with the one under the tos. */
+@@ -545,7 +549,10 @@ execute ()
+     {
+       signal (SIGINT, use_quit);
+       if (had_sigint)
+-	printf ("\ninterrupted execution.\n");
++	{
++	  printf ("\ninterrupted execution.\n");
++	  checkferror_output(stdout);
++	}
+     }
+ }
+ 
+@@ -580,6 +587,7 @@ input_char ()
+ 	  out_col = 0;  /* Saw a new line */
+ 	}
+     }
++  checkferror_input(stdin);
+ 
+   /* Classify and preprocess the input character. */
+   if (isdigit(in_ch))
+diff --git a/bc/load.c b/bc/load.c
+index 1035198..4039e86 100644
+--- a/bc/load.c
++++ b/bc/load.c
+@@ -217,6 +217,7 @@ load_code (code)
+ 		if (label_no > 65535L)
+ 		  {  /* Better message? */
+ 		    fprintf (stderr,"Program too big.\n");
++		    checkferror_output(stderr);
+ 		    exit(1);
+ 		  }
+ 		addbyte ( (char) (label_no & 0xFF));
+diff --git a/bc/main.c b/bc/main.c
+index 9a2461e..3ae427d 100644
+--- a/bc/main.c
++++ b/bc/main.c
+@@ -358,6 +358,9 @@ use_quit (sig)
+   errno = save;
+ #else
+   write (1, "\n(interrupt) Exiting bc.\n", 26);
++#ifdef READLINE
++  rl_initialize (); /* Clear readline buffer */
++#endif
+ #if defined(LIBEDIT)
+   if (edit != NULL)
+     el_end(edit);
+diff --git a/bc/sbc.y b/bc/sbc.y
+index 0ded29e..6fcc1fa 100644
+--- a/bc/sbc.y
++++ b/bc/sbc.y
+@@ -86,7 +86,9 @@ program			: /* empty */
+ 			      if (interactive && !quiet)
+ 				{
+ 				  show_bc_version ();
++				  checkferror_output(stdout);
+ 				  welcome ();
++				  checkferror_output(stdout);
+ 				}
+ 			    }
+ 			| program input_item
+diff --git a/bc/scan.c b/bc/scan.c
+index 1f78ec2..2b5eeb4 100644
+--- a/bc/scan.c
++++ b/bc/scan.c
+@@ -799,6 +799,7 @@ bcel_input (buf, result, max)
+       if (bcel_len != 0)
+ 	history (hist, &histev, H_ENTER, bcel_line); 
+       fflush (stdout);
++      checkferror_output(stdout);
+     }
+ 
+   if (bcel_len <= max)
+@@ -874,6 +875,7 @@ rl_input (buf, result, max)
+ 	add_history (rl_line); 
+       rl_line[rl_len-1] = '\n';
+       fflush (stdout);
++      checkferror_output(stdout);
+     }
+ 
+   if (rl_len <= max)
+diff --git a/bc/scan.l b/bc/scan.l
+index 841c3df..16cd62e 100644
+--- a/bc/scan.l
++++ b/bc/scan.l
+@@ -111,6 +111,7 @@ bcel_input (buf, result, max)
+       if (bcel_len != 0)
+ 	history (hist, &histev, H_ENTER, bcel_line); 
+       fflush (stdout);
++      checkferror_output(stdout);
+     }
+ 
+   if (bcel_len <= max)
+@@ -186,6 +187,7 @@ rl_input (buf, result, max)
+ 	add_history (rl_line); 
+       rl_line[rl_len-1] = '\n';
+       fflush (stdout);
++      checkferror_output(stdout);
+     }
+ 
+   if (rl_len <= max)
+@@ -310,6 +312,7 @@ limits return(Limits);
+ 	    if (c == EOF)
+ 	      {
+ 		fprintf (stderr,"EOF encountered in a comment.\n");
++                checkferror_output(stderr);
+ 		break;
+ 	      }
+ 	  }
+diff --git a/bc/storage.c b/bc/storage.c
+index 699729a..37b4c6c 100644
+--- a/bc/storage.c
++++ b/bc/storage.c
+@@ -99,6 +99,7 @@ more_functions (VOID)
+     {
+       f = &functions[indx];
+       f->f_defined = FALSE;
++      f->f_void = FALSE;
+       f->f_body = (char *) bc_malloc (BC_START_SIZE);
+       f->f_body_size = BC_START_SIZE;
+       f->f_code_size = 0;
+diff --git a/bc/util.c b/bc/util.c
+index 30beaf9..669235f 100644
+--- a/bc/util.c
++++ b/bc/util.c
+@@ -260,9 +260,10 @@ init_gen ()
+   continue_label = 0;
+   next_label  = 1;
+   out_count = 2;
+-  if (compile_only) 
++  if (compile_only) {
+     printf ("@i");
+-  else
++    checkferror_output(stdout);
++  } else
+     init_load ();
+   had_error = FALSE;
+   did_gen = FALSE;
+@@ -286,6 +287,7 @@ generate (str)
+ 	  printf ("\n");
+ 	  out_count = 0;
+ 	}
++      checkferror_output(stdout);
+     }
+   else
+     load_code (str);
+@@ -303,6 +305,7 @@ run_code()
+       if (compile_only)
+ 	{
+ 	  printf ("@r\n"); 
++	  checkferror_output(stdout);
+ 	  out_count = 0;
+ 	}
+       else
+@@ -341,6 +344,7 @@ out_char (ch)
+ 	}
+       putchar (ch);
+     }
++  checkferror_output(stdout);
+ }
+ 
+ /* Output routines: Write a character CH to the standard output.
+@@ -371,6 +375,7 @@ out_schar (ch)
+ 	}
+       putchar (ch);
+     }
++  checkferror_output(stdout);
+ }
+ 
+ 
+@@ -657,6 +662,7 @@ limits()
+ #ifdef OLD_EQ_OP
+   printf ("Old assignment operatiors are valid. (=-, =+, ...)\n");
+ #endif 
++  checkferror_output(stdout);
+ }
+ 
+ /* bc_malloc will check the return value so all other places do not
+@@ -721,6 +727,7 @@ yyerror (str, va_alist)
+   fprintf (stderr,"%s %d: ",name,line_no);
+   vfprintf (stderr, str, args);
+   fprintf (stderr, "\n");
++  checkferror_output(stderr);
+   had_error = TRUE;
+   va_end (args);
+ }
+@@ -761,6 +768,7 @@ warn (mesg, va_alist)
+       fprintf (stderr,"%s %d: Error: ",name,line_no);
+       vfprintf (stderr, mesg, args);
+       fprintf (stderr, "\n");
++      checkferror_output(stderr);
+       had_error = TRUE;
+     }
+   else
+@@ -773,6 +781,7 @@ warn (mesg, va_alist)
+ 	fprintf (stderr,"%s %d: (Warning) ",name,line_no);
+ 	vfprintf (stderr, mesg, args);
+ 	fprintf (stderr, "\n");
++	checkferror_output(stderr);
+       }
+   va_end (args);
+ }
+@@ -807,6 +816,7 @@ rt_error (mesg, va_alist)
+   va_end (args);
+   
+   fprintf (stderr, "\n");
++  checkferror_output(stderr);
+   runtime_error = TRUE;
+ }
+ 
+@@ -843,4 +853,5 @@ rt_warn (mesg, va_alist)
+   va_end (args);
+ 
+   fprintf (stderr, "\n");
++  checkferror_output(stderr);
+ }
+diff --git a/dc/dc.c b/dc/dc.c
+index e03f094..0faf03a 100644
+--- a/dc/dc.c
++++ b/dc/dc.c
+@@ -61,6 +61,7 @@ static void
+ bug_report_info DC_DECLVOID()
+ {
+ 	printf("Email bug reports to:  bug-dc at gnu.org .\n");
++	checkferror_output(stdout);
+ }
+ 
+ static void
+@@ -71,6 +72,7 @@ show_version DC_DECLVOID()
+ This is free software; see the source for copying conditions.  There is NO\n\
+ warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE,\n\
+ to the extent permitted by law.\n", DC_COPYRIGHT);
++	checkferror_output(stdout);
+ }
+ 
+ /* your generic usage function */
+@@ -87,6 +89,7 @@ Usage: %s [OPTION] [file ...]\n\
+ \n\
+ ", progname);
+ 	bug_report_info();
++	checkferror_output(f);
+ }
+ 
+ /* returns a pointer to one past the last occurance of c in s,
+diff --git a/dc/eval.c b/dc/eval.c
+index 4af7200..153d331 100644
+--- a/dc/eval.c
++++ b/dc/eval.c
+@@ -94,12 +94,15 @@ static int input_pushback;
+ static int
+ input_fil DC_DECLVOID()
+ {
++        int c;
+ 	if (input_pushback != EOF){
+-		int c = input_pushback;
++		c = input_pushback;
+ 		input_pushback = EOF;
+ 		return c;
+ 	}
+-	return getc(input_fil_fp);
++	c = getc(input_fil_fp);
++	checkferror_input(input_fil_fp);
++	return c;
+ }
+ 
+ /* passed as an argument to dc_getnum */
+@@ -298,11 +301,13 @@ dc_func DC_DECLARG((c, peekc, negcmp))
+ 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
+ 			if (2 <= tmpint  &&  tmpint <= DC_IBASE_MAX)
+ 				dc_ibase = tmpint;
+-			else
++			else {
+ 				fprintf(stderr,
+ 						"%s: input base must be a number \
+ between 2 and %d (inclusive)\n",
+ 						progname, DC_IBASE_MAX);
++				checkferror_output(stderr);
++			}
+ 		}
+ 		break;
+ 	case 'k':	/* set scale to value on top of stack */
+@@ -310,11 +315,12 @@ between 2 and %d (inclusive)\n",
+ 			tmpint = -1;
+ 			if (datum.dc_type == DC_NUMBER)
+ 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
+-			if ( ! (tmpint >= 0) )
++			if ( ! (tmpint >= 0) ) {
+ 				fprintf(stderr,
+ 						"%s: scale must be a nonnegative number\n",
+ 						progname);
+-			else
++				checkferror_output(stderr);
++			} else
+ 				dc_scale = tmpint;
+ 		}
+ 		break;
+@@ -338,11 +344,12 @@ between 2 and %d (inclusive)\n",
+ 			tmpint = 0;
+ 			if (datum.dc_type == DC_NUMBER)
+ 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
+-			if ( ! (tmpint > 1) )
++			if ( ! (tmpint > 1) ) {
+ 				fprintf(stderr,
+ 						"%s: output base must be a number greater than 1\n",
+ 						progname);
+-			else
++				checkferror_output(stderr);
++			} else
+ 				dc_obase = tmpint;
+ 		}
+ 		break;
+@@ -383,6 +390,7 @@ between 2 and %d (inclusive)\n",
+ 				fprintf(stderr,
+ 						"%s: square root of nonnumeric attempted\n",
+ 						progname);
++				checkferror_output(stderr);
+ 			}else if (dc_sqrt(datum.v.number, dc_scale, &tmpnum) == DC_SUCCESS){
+ 				dc_free_num(&datum.v.number);
+ 				datum.v.number = tmpnum;
+@@ -444,6 +452,7 @@ between 2 and %d (inclusive)\n",
+ 			fprintf(stderr,
+ 					"%s: Q command requires a number >= 1\n",
+ 					progname);
++			checkferror_output(stderr);
+ 		}
+ 		break;
+ #if 0
+@@ -489,11 +498,12 @@ between 2 and %d (inclusive)\n",
+ 			if (datum.dc_type == DC_NUMBER)
+ 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
+ 			if (dc_pop(&datum) == DC_SUCCESS){
+-				if (tmpint < 0)
++				if (tmpint < 0) {
+ 					fprintf(stderr,
+ 							"%s: array index must be a nonnegative integer\n",
+ 							progname);
+-				else
++					checkferror_output(stderr);
++				} else
+ 					dc_array_set(peekc, tmpint, datum);
+ 			}
+ 		}
+@@ -505,17 +515,19 @@ between 2 and %d (inclusive)\n",
+ 			tmpint = -1;
+ 			if (datum.dc_type == DC_NUMBER)
+ 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
+-			if (tmpint < 0)
++			if (tmpint < 0) {
+ 				fprintf(stderr,
+ 						"%s: array index must be a nonnegative integer\n",
+ 						progname);
+-			else
++				checkferror_output(stderr);
++			} else
+ 				dc_push(dc_array_get(peekc, tmpint));
+ 		}
+ 		return DC_EATONE;
+ 
+ 	default:	/* What did that user mean? */
+ 		fprintf(stderr, "%s: ", progname);
++		checkferror_output(stderr);
+ 		dc_show_id(stdout, c, " unimplemented\n");
+ 		break;
+ 	}
+@@ -544,6 +556,7 @@ dc_evalstr DC_DECLARG((string))
+ 		fprintf(stderr,
+ 				"%s: eval called with non-string argument\n",
+ 				progname);
++		checkferror_output(stderr);
+ 		return DC_OKAY;
+ 	}
+ 	interrupt_seen = 0;
+@@ -640,6 +653,7 @@ dc_evalstr DC_DECLARG((string))
+ 				return DC_FAIL;
+ 			}
+ 			fprintf(stderr, "%s: unexpected EOS\n", progname);
++			checkferror_output(stderr);
+ 			return DC_OKAY;
+ 		}
+ 	}
+@@ -665,6 +679,7 @@ dc_evalfile DC_DECLARG((fp))
+ 	stdin_lookahead = EOF;
+ 	for (c=getc(fp); c!=EOF; c=peekc){
+ 		peekc = getc(fp);
++		checkferror_input(stdin);
+ 		/*
+ 		 * The following if() is the only place where ``stdin_lookahead''
+ 		 * might be set to other than EOF:
+@@ -716,6 +731,7 @@ dc_evalfile DC_DECLARG((fp))
+ 							return DC_SUCCESS;
+ 						fprintf(stderr, "%s: Q command argument exceeded \
+ string execution depth\n", progname);
++						checkferror_output(stderr);
+ 					}
+ 				}else{
+ 					dc_garbage("at top of stack", -1);
+@@ -728,8 +744,11 @@ string execution depth\n", progname);
+ 			fprintf(stderr,
+ 					"%s: Q command argument exceeded string execution depth\n",
+ 					progname);
+-			if (stdin_lookahead != peekc  &&  fp == stdin)
++			checkferror_output(stderr);
++			if (stdin_lookahead != peekc  &&  fp == stdin) {
+ 				peekc = getc(fp);
++				checkferror_input(stdin);
++			}
+ 			break;
+ 
+ 		case DC_INT:
+@@ -771,6 +790,7 @@ string execution depth\n", progname);
+ 			if (ferror(fp))
+ 				goto error_fail;
+ 			fprintf(stderr, "%s: unexpected EOF\n", progname);
++			checkferror_output(stderr);
+ 			return DC_FAIL;
+ 		}
+ 	}
+diff --git a/dc/misc.c b/dc/misc.c
+index f2388b0..1be56fe 100644
+--- a/dc/misc.c
++++ b/dc/misc.c
+@@ -91,6 +91,7 @@ dc_show_id DC_DECLARG((fp, id, suffix))
+ 		fprintf(fp, "'%c' (%#o)%s", (unsigned int) id, id, suffix);
+ 	else
+ 		fprintf(fp, "%#o%s", (unsigned int) id, suffix);
++	checkferror_output(fp);
+ }
+ 
+ 
+diff --git a/dc/numeric.c b/dc/numeric.c
+index 8e5e70f..c875eba 100644
+--- a/dc/numeric.c
++++ b/dc/numeric.c
+@@ -134,6 +134,7 @@ dc_div DC_DECLARG((a, b, kscale, result))
+ 	bc_init_num(CastNumPtr(result));
+ 	if (bc_divide(CastNum(a), CastNum(b), CastNumPtr(result), kscale)){
+ 		fprintf(stderr, "%s: divide by zero\n", progname);
++		checkferror_output(stderr);
+ 		return DC_DOMAIN_ERROR;
+ 	}
+ 	return DC_SUCCESS;
+@@ -156,6 +157,7 @@ dc_divrem DC_DECLARG((a, b, kscale, quotient, remainder))
+ 	if (bc_divmod(CastNum(a), CastNum(b),
+ 						CastNumPtr(quotient), CastNumPtr(remainder), kscale)){
+ 		fprintf(stderr, "%s: divide by zero\n", progname);
++		checkferror_output(stderr);
+ 		return DC_DOMAIN_ERROR;
+ 	}
+ 	return DC_SUCCESS;
+@@ -174,6 +176,7 @@ dc_rem DC_DECLARG((a, b, kscale, result))
+ 	bc_init_num(CastNumPtr(result));
+ 	if (bc_modulo(CastNum(a), CastNum(b), CastNumPtr(result), kscale)){
+ 		fprintf(stderr, "%s: remainder by zero\n", progname);
++		checkferror_output(stderr);
+ 		return DC_DOMAIN_ERROR;
+ 	}
+ 	return DC_SUCCESS;
+@@ -226,6 +229,7 @@ dc_sqrt DC_DECLARG((value, kscale, result))
+ 	tmp = bc_copy_num(CastNum(value));
+ 	if (!bc_sqrt(&tmp, kscale)){
+ 		fprintf(stderr, "%s: square root of negative number\n", progname);
++		checkferror_output(stderr);
+ 		bc_free_num(&tmp);
+ 		return DC_DOMAIN_ERROR;
+ 	}
+@@ -429,8 +433,10 @@ dc_out_num DC_DECLARG((value, obase, newline_p, discard_p))
+ {
+ 	out_char('\0'); /* clear the column counter */
+ 	bc_out_num(CastNum(value), obase, out_char, 0);
+-	if (newline_p == DC_WITHNL)
++	if (newline_p == DC_WITHNL) {
+ 		putchar ('\n');
++		checkferror_output(stdout);
++	}
+ 	if (discard_p == DC_TOSS)
+ 		dc_free_num(&value);
+ }
+@@ -475,6 +481,7 @@ dc_dump_num DC_DECLARG((dcvalue, discard_p))
+ 
+ 	for (cur=top_of_stack; cur; cur=next) {
+ 		putchar(cur->digit);
++		checkferror_output(stdout);
+ 		next = cur->link;
+ 		free(cur);
+ 	}
+@@ -592,6 +599,7 @@ out_char (ch)
+ 			out_col = 1;
+ 		}
+ 		putchar(ch);
++		checkferror_output(stderr);
+ 	}
+ }
+ 
+@@ -631,6 +639,7 @@ rt_error (mesg, va_alist)
+ 	vfprintf (stderr, mesg, args);
+ 	va_end (args);
+ 	fprintf (stderr, "\n");
++	checkferror_output(stderr);
+ }
+ 
+ 
+@@ -664,6 +673,7 @@ rt_warn (mesg, va_alist)
+ 	vfprintf (stderr, mesg, args);
+ 	va_end (args);
+ 	fprintf (stderr, "\n");
++	checkferror_output(stderr);
+ }
+ 
+ 
+diff --git a/dc/stack.c b/dc/stack.c
+index 0730e9c..5db3975 100644
+--- a/dc/stack.c
++++ b/dc/stack.c
+@@ -38,7 +38,10 @@
+ #include "dc-regdef.h"
+ 
+ /* an oft-used error message: */
+-#define Empty_Stack	fprintf(stderr, "%s: stack empty\n", progname)
++#define Empty_Stack do{					\
++    fprintf(stderr, "%s: stack empty\n", progname);	\
++    checkferror_output(stderr);				\
++  }while(0)
+ 
+ 
+ /* simple linked-list implementation suffices: */
+@@ -94,6 +97,7 @@ dc_binop DC_DECLARG((op, kscale))
+ 	if (dc_stack->value.dc_type!=DC_NUMBER
+ 			|| dc_stack->link->value.dc_type!=DC_NUMBER){
+ 		fprintf(stderr, "%s: non-numeric value\n", progname);
++		checkferror_output(stderr);
+ 		return;
+ 	}
+ 	(void)dc_pop(&b);
+@@ -134,6 +138,7 @@ dc_binop2 DC_DECLARG((op, kscale))
+ 	if (dc_stack->value.dc_type!=DC_NUMBER
+ 			|| dc_stack->link->value.dc_type!=DC_NUMBER){
+ 		fprintf(stderr, "%s: non-numeric value\n", progname);
++		checkferror_output(stderr);
+ 		return;
+ 	}
+ 	(void)dc_pop(&b);
+@@ -172,6 +177,7 @@ dc_cmpop DC_DECLVOID()
+ 	if (dc_stack->value.dc_type!=DC_NUMBER
+ 			|| dc_stack->link->value.dc_type!=DC_NUMBER){
+ 		fprintf(stderr, "%s: non-numeric value\n", progname);
++		checkferror_output(stderr);
+ 		return 0;
+ 	}
+ 	(void)dc_pop(&b);
+@@ -209,6 +215,7 @@ dc_triop DC_DECLARG((op, kscale))
+ 			|| dc_stack->link->value.dc_type!=DC_NUMBER
+ 			|| dc_stack->link->link->value.dc_type!=DC_NUMBER){
+ 		fprintf(stderr, "%s: non-numeric value\n", progname);
++		checkferror_output(stderr);
+ 		return;
+ 	}
+ 	(void)dc_pop(&c);
+@@ -327,6 +334,7 @@ dc_register_get DC_DECLARG((regid, result))
+ 	r = dc_register[regid];
+ 	if (r==NULL || r->value.dc_type==DC_UNINITIALIZED){
+ 		fprintf(stderr, "%s: register ", progname);
++		checkferror_output(stderr);
+ 		dc_show_id(stderr, regid, " is empty\n");
+ 		return DC_FAIL;
+ 	}
+@@ -401,6 +409,7 @@ dc_register_pop DC_DECLARG((stackid, result))
+ 	r = dc_register[stackid];
+ 	if (r == NULL){
+ 		fprintf(stderr, "%s: stack register ", progname);
++		checkferror_output(stderr);
+ 		dc_show_id(stderr, stackid, " is empty\n");
+ 		return DC_FAIL;
+ 	}
+diff --git a/dc/string.c b/dc/string.c
+index ff1e7f1..e24092d 100644
+--- a/dc/string.c
++++ b/dc/string.c
+@@ -101,6 +101,7 @@ dc_out_str DC_DECLARG((value, newline, discard_flag))
+ 	fwrite(value->s_ptr, value->s_len, sizeof *value->s_ptr, stdout);
+ 	if (newline == DC_WITHNL)
+ 		putchar('\n');
++	checkferror_output(stdout);
+ 	if (discard_flag == DC_TOSS)
+ 		dc_free_str(&value);
+ }
+@@ -176,6 +177,7 @@ dc_readstring DC_DECLARG((fp, ldelim, rdelim))
+ 		}
+ 		*p++ = c;
+ 	}
++	checkferror_input(fp);
+ 	return dc_makestring(line_buf, (size_t)(p-line_buf));
+ }
+ 
+diff --git a/h/number.h b/h/number.h
+index 9b034b6..3a00a92 100644
+--- a/h/number.h
++++ b/h/number.h
+@@ -150,4 +150,7 @@ _PROTOTYPE(int bc_sqrt, (bc_num *num, int scale));
+ _PROTOTYPE(void bc_out_num, (bc_num num, int o_base, void (* out_char)(int),
+ 			     int leading_zero));
+ 
++_PROTOTYPE(void checkferror_input, (FILE*));
++_PROTOTYPE(void checkferror_output, (FILE*));
++
+ #endif
+diff --git a/lib/number.c b/lib/number.c
+index e211840..4d3ce46 100644
+--- a/lib/number.c
++++ b/lib/number.c
+@@ -1776,6 +1776,7 @@ static void
+ out_char (int c)
+ {
+   putchar(c);
++  checkferror_output(stdout);
+ }
+ 
+ 
+@@ -1785,6 +1786,7 @@ pn (num)
+ {
+   bc_out_num (num, 10, out_char, 0);
+   out_char ('\n');
++  checkferror_output(stdout);
+ }
+ 
+ 
+@@ -1799,6 +1801,28 @@ pv (name, num, len)
+   printf ("%s=", name);
+   for (i=0; i<len; i++) printf ("%c",BCD_CHAR(num[i]));
+   printf ("\n");
++  checkferror_output(stdout);
+ }
+ 
+ #endif
++
++/* check ferror() status and if so die */
++void
++checkferror_input (fp)
++	FILE *fp;
++{
++	if (ferror(fp)) {
++		perror("dc: could not read input file");
++		exit(EXIT_FAILURE);
++	}
++}
++
++void
++checkferror_output (fp)
++	FILE *fp;
++{
++	if (ferror(fp)) {
++		perror("dc: could not write output file");
++		exit(EXIT_FAILURE);
++	}
++}
diff --git a/package/bc/06_read_dcrc.patch b/package/bc/06_read_dcrc.patch
new file mode 100644
index 0000000..8d923c6
--- /dev/null
+++ b/package/bc/06_read_dcrc.patch
@@ -0,0 +1,92 @@
+Description: Read ~/.dcrc at startup of dc
+ Patch taken from old version of dc by Paul Dwerryhouse
+ Was initially applied by Francois Marier <francois@debian.org> in the NMU
+ 1.06.94-3.1 to close http://bugs.debian.org/472250 .
+ Then it disappeared along the way, until users asked for it again.
+ Jan Braun <janbraun@gmx.net> updated it to read .drcr before argument
+ processing so that
+     $ dc
+     $ dc -
+     $ dc -f -
+ all have the same behaviour
+Origin: vendor
+Author: upstream
+Author: Jan Brawn <janbraun@gmx.net>
+Bug-Debian: http://bugs.debian.org/582137
+Bug-Ubuntu: https://bugs.launchpad.net/debian/+source/bc/+bug/918836
+Forwarded: no
+Reviewed-by: Ryan Kavanagh <rak@debian.org>
+Last-Update: 2013-06-02
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+Index: bc/dc/dc.c
+===================================================================
+--- bc.orig/dc/dc.c	2013-06-02 20:32:45.379126266 -0400
++++ bc/dc/dc.c	2013-06-02 20:32:45.379126266 -0400
+@@ -45,6 +45,8 @@
+ # include <sys/stat.h>
+ #endif
+ #include <getopt.h>
++#include <pwd.h>
++#include <unistd.h>
+ #include "dc.h"
+ #include "dc-proto.h"
+ 
+@@ -248,6 +250,29 @@
+ 	return r;
+ }
+ 
++static void
++try_rcfile(void)
++{
++    char *homedir;
++    struct passwd *pw;
++    char *rcfile;
++    FILE *input;
++
++    homedir=getenv("HOME");
++    if (!homedir)
++    {
++	pw=getpwuid(getuid());
++	homedir=pw->pw_dir;
++    }
++    rcfile=malloc(strlen(homedir)+8);
++    sprintf(rcfile, "%s/.dcrc", homedir);
++    if (!(input=fopen(rcfile, "r")))
++	return;
++    if (dc_evalfile(input))
++	exit(EXIT_FAILURE);
++    fclose(input);
++}
++
+ 
+ int
+ main DC_DECLARG((argc, argv))
+@@ -274,6 +299,8 @@
+ 	dc_register_init();
+ 	dc_array_init();
+ 
++	try_rcfile();
++
+ 	while ((c = getopt_long(argc, argv, "hVe:f:", long_opts, (int *)0)) != EOF) {
+ 		switch (c) {
+ 		case 'e':
+Index: bc/doc/dc.1
+===================================================================
+--- bc.orig/doc/dc.1	2013-06-02 20:32:45.379126266 -0400
++++ bc/doc/dc.1	2013-06-02 20:32:45.379126266 -0400
+@@ -501,6 +501,14 @@
+ because the 2 was stored in an instance of 0:a that
+ was later popped.
+ .SH
++FILES
++.TP 15
++~/.dcrc
++The commands in this file will be executed when
++.I dc
++is first run.
++.PP
++.SH
+ BUGS
+ .PP
+ Email bug reports to
diff --git a/package/bc/07_bc_man.patch b/package/bc/07_bc_man.patch
new file mode 100644
index 0000000..7879428
--- /dev/null
+++ b/package/bc/07_bc_man.patch
@@ -0,0 +1,417 @@
+Description: Fix some formatting issues with bc man page
+ * Space at end of lines removed
+ * Removed or added word space
+ * Use "\(en" as a dash to indicate a range instead of "-"
+ * Added "\&" after a full stop if it is not an end of sentence
+ * Use "\e" to print a backslash
+ * Use either macros "IR" or "RI" when mixing these two styles in a row of
+   words
+ * Use "\," when mixing roman and italic, "\/" for italic and roman.
+ * The Word 'funtion' changed to 'function'.
+Author: Bjarni Ingi Gislason <bjarniig@rhi.hi.is>
+Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=725898
+Forwarded: no
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+Index: bc/doc/bc.1
+===================================================================
+--- bc.orig/doc/bc.1	2014-05-25 11:09:03.588481794 +0200
++++ bc/doc/bc.1	2014-05-25 11:12:42.954856934 +0200
+@@ -36,7 +36,7 @@
+ .SH DESCRIPTION
+ \fBbc\fR is a language that supports arbitrary precision numbers
+ with interactive execution of statements.  There are some similarities
+-in the syntax to the C programming language. 
++in the syntax to the C programming language.
+ A standard math library is available by command line option.
+ If requested, the math library is defined before processing any files.
+ \fBbc\fR starts by processing code from all the files listed
+@@ -47,8 +47,8 @@
+ .PP
+ This version of \fBbc\fR contains several extensions beyond
+ traditional \fBbc\fR implementations and the POSIX draft standard.
+-Command line options can cause these extensions to print a warning 
+-or to be rejected.  This 
++Command line options can cause these extensions to print a warning
++or to be rejected.  This
+ document describes the language accepted by this processor.
+ Extensions will be identified as such.
+ .SS OPTIONS
+@@ -87,13 +87,13 @@
+ arrays.  Both simple variables and array variables are named.  Names
+ begin with a letter followed by any number of letters, digits and
+ underscores.  All letters must be lower case.  (Full alpha-numeric
+-names are an extension. In POSIX \fBbc\fR all names are a single
++names are an extension.  In POSIX \fBbc\fR all names are a single
+ lower case letter.)  The type of variable is clear by the context
+ because all array variable names will be followed by brackets ([]).
+ .PP
+ There are four special variables, \fBscale, ibase, obase,\fR and
+ \fBlast\fR.  \fBscale\fR defines how some operations use digits after the
+-decimal point.  The default value of \fBscale\fR is 0. \fBibase\fR
++decimal point.  The default value of \fBscale\fR is 0.  \fBibase\fR
+ and \fBobase\fR define the conversion base for input and output
+ numbers.  The default for both input and output is base 10.
+ \fBlast\fR (an extension) is a variable that has the value of the last
+@@ -124,10 +124,10 @@
+ by the variable \fBibase\fR. (There is an exception in functions.)
+ The legal values of \fBibase\fR are 2 through 16.  Assigning a
+ value outside this range to \fBibase\fR will result in a value of 2
+-or 16.  Input numbers may contain the characters 0-9 and A-F. (Note:
++or 16.  Input numbers may contain the characters 0\(en9 and A\(enF. (Note:
+ They must be capitals.  Lower case letters are variable names.)
+ Single digit numbers always have the value of the digit regardless of
+-the value of \fBibase\fR. (i.e. A = 10.)  For multi-digit numbers,
++the value of \fBibase\fR. (i.e.\& A = 10.)  For multi-digit numbers,
+ \fBbc\fR changes all input digits greater or equal to ibase to the
+ value of \fBibase\fR-1.  This makes the number \fBFFF\fR always be
+ the largest 3 digit number of the input base.
+@@ -148,7 +148,8 @@
+ .RE
+ and an array variable is specified as
+ .RS
+-\fIname\fR[\fIexpr\fR]
++.\"\fIname\fR[\fIexpr\fR]
++.IR name [ expr ]
+ .RE
+ Unless specifically
+ mentioned the scale of the result is the maximum scale of the
+@@ -186,13 +187,13 @@
+ integer remainder function.
+ .IP "expr ^ expr"
+ The result of the expression is the value of the first raised to the
+-second. The second expression must be an integer.  (If the second
++second.  The second expression must be an integer.  (If the second
+ expression is not an integer, a warning is generated and the
+ expression is truncated to get an integer value.)  The scale of the
+ result is \fBscale\fR if the exponent is negative.  If the exponent
+ is positive the scale of the result is the minimum of the scale of the
+ first expression times the value of the exponent and the maximum of
+-\fBscale\fR and the scale of the first expression.  (e.g. scale(a^b)
++\fBscale\fR and the scale of the first expression.  (e.g.\& scale(a^b)
+ = min(scale(a)*b, max( \fBscale,\fR scale(a))).)  It should be noted
+ that expr^0 will always return the value of 1.
+ .IP "( expr )"
+@@ -225,7 +226,7 @@
+ The result is 1 if expr1 is not equal to expr2.
+ .PP
+ Boolean operations are also legal.  (POSIX \fBbc\fR does NOT have
+-boolean operations). The result of all boolean operations are 0 and 1
++boolean operations).  The result of all boolean operations are 0 and 1
+ (for false and true) as in relational expressions.  The boolean
+ operators are:
+ .IP "!expr"
+@@ -252,7 +253,7 @@
+ .fi
+ .PP
+ This precedence was chosen so that POSIX compliant \fBbc\fR programs
+-will run correctly. This will cause the use of the relational and
++will run correctly.  This will cause the use of the relational and
+ logical operators to have some unusual behavior when used with
+ assignment expressions.  Consider the expression:
+ .RS
+@@ -267,7 +268,7 @@
+ .PP
+ There are a few more special expressions that are provided in \fBbc\fR.
+ These have to do with user defined functions and standard
+-functions.  They all appear as "\fIname\fB(\fIparameters\fB)\fR".
++functions.  They all appear as "\,\fIname\/\fB(\,\fIparameters\/\fB)\fR".
+ See the section on functions for user defined functions.  The standard
+ functions are:
+ .IP "length ( expression )"
+@@ -280,7 +281,7 @@
+ The best use for this function is in a previously written program that
+ needs input from the user, but never allows program code to be input
+ from the user.  The value of the read function is the number read from
+-the standard input using the current value of the variable 
++the standard input using the current value of the variable
+ \fBibase\fR for the conversion base.
+ .IP "scale ( expression )"
+ The value of the scale function is the number of digits after the decimal
+@@ -293,7 +294,7 @@
+ expression evaluation.  In \fBbc\fR statements are executed "as soon
+ as possible."  Execution happens when a newline in encountered and
+ there is one or more complete statements.  Due to this immediate
+-execution, newlines are very important in \fBbc\fR. In fact, both a
++execution, newlines are very important in \fBbc\fR.  In fact, both a
+ semicolon and a newline are used as statement separators.  An
+ improperly placed newline will cause a syntax error.  Because newlines
+ are statement separators, it is possible to hide a newline by using
+@@ -311,7 +312,7 @@
+ is printed, a newline is printed.  For example, "a=1" is an assignment
+ statement and "(a=1)" is an expression that has an embedded
+ assignment.  All numbers that are printed are printed in the base
+-specified by the variable \fBobase\fR. The legal values for \fB
++specified by the variable \fBobase\fR.  The legal values for \fB
+ obase\fR are 2 through BC_BASE_MAX.  (See the section LIMITS.)  For
+ bases 2 through 16, the usual method of writing numbers is used.  For
+ bases greater than 16, \fBbc\fR uses a multi-character digit method
+@@ -324,13 +325,13 @@
+ last character on a line.  The maximum number of characters printed
+ per line is 70.  Due to the interactive nature of \fBbc\fR, printing
+ a number causes the side effect of assigning the printed value to the
+-special variable \fBlast\fR. This allows the user to recover the
++special variable \fBlast\fR.  This allows the user to recover the
+ last value printed without having to retype the expression that
+ printed the number.  Assigning to \fBlast\fR is legal and will
+ overwrite the last printed value with the assigned value.  The newly
+ assigned value will remain until the next number is printed or another
+-value is assigned to \fBlast\fR.  (Some installations may allow the 
+-use of a single period (.) which is not part of a number as a short
++value is assigned to \fBlast\fR.  (Some installations may allow the
++use of a single period (.\&) which is not part of a number as a short
+ hand notation for for \fBlast\fR.)
+ .IP "string"
+ The string is printed to the output.  Strings start with a double quote
+@@ -342,13 +343,13 @@
+ The "list" is a list of strings and expressions separated by commas.
+ Each string or expression is printed in the order of the list.  No
+ terminating newline is printed.  Expressions are evaluated and their
+-value is printed and assigned to the variable \fBlast\fR. Strings
++value is printed and assigned to the variable \fBlast\fR.  Strings
+ in the print statement are printed to the output and may contain
+ special characters.  Special characters start with the backslash
+ character (\e).  The special characters recognized by \fBbc\fR are
+ "a" (alert or bell), "b" (backspace), "f" (form feed), "n" (newline),
+ "r" (carriage return), "q" (double quote), "t" (tab), and "\e" (backslash).
+-Any other character following the backslash will be ignored.  
++Any other character following the backslash will be ignored.
+ .IP "{ statement_list }"
+ This is the compound statement.  It allows multiple statements to be
+ grouped together for execution.
+@@ -364,7 +365,7 @@
+ the statement.   Termination of the loop is caused by a zero
+ expression value or the execution of a break statement.
+ .IP "\fBfor\fR ( [expression1] ; [expression2] ; [expression3] ) statement"
+-The for statement controls repeated execution of the statement.  
++The for statement controls repeated execution of the statement.
+ Expression1 is evaluated before the loop.  Expression2 is evaluated
+ before each execution of the statement.  If it is non-zero, the statement
+ is evaluated.  If it is zero, the loop is terminated.  After each
+@@ -373,7 +374,7 @@
+ evaluated at the point they would be evaluated.
+ If expression2 is missing, it is the same as substituting
+ the value 1 for expression2.  (The optional expressions are an
+-extension. POSIX \fBbc\fR requires all three expressions.)
++extension.  POSIX \fBbc\fR requires all three expressions.)
+ The following is equivalent code for the for statement:
+ .nf
+ .RS
+@@ -388,7 +389,7 @@
+ This statement causes a forced exit of the most recent enclosing while
+ statement or for statement.
+ .IP "\fBcontinue\fR"
+-The continue statement (an extension)  causes the most recent enclosing
++The continue statement (an extension) causes the most recent enclosing
+ for statement to start the next iteration.
+ .IP "\fBhalt\fR"
+ The halt statement (an extension) is an executed statement that causes
+@@ -398,7 +399,7 @@
+ .IP "\fBreturn\fR"
+ Return the value 0 from a function.  (See the section on functions.)
+ .IP "\fBreturn\fR ( expression )"
+-Return the value of the expression from a function.  (See the section on 
++Return the value of the expression from a function.  (See the section on
+ functions.)  As an extension, the parenthesis are not required.
+ .SS PSEUDO STATEMENTS
+ These statements are not statements in the traditional sense.  They are
+@@ -414,7 +415,7 @@
+ Print a longer warranty notice.  This is an extension.
+ .SS FUNCTIONS
+ Functions provide a method of defining a computation that can be executed
+-later.  Functions in 
++later.  Functions in
+ .B bc
+ always compute a value and return it to the caller.  Function definitions
+ are "dynamic" in the sense that a function is undefined until a definition
+@@ -428,13 +429,13 @@
+ .RE
+ .fi
+ A function call is just an expression of the form
+-"\fIname\fB(\fIparameters\fB)\fR".
++"\,\fIname\/\fB(\,\fIparameters\/\fB)\fR".
+ .PP
+ Parameters are numbers or arrays (an extension).  In the function definition,
+ zero or more parameters are defined by listing their names separated by
+-commas.  All parameters are call by value parameters.  
++commas.  All parameters are call by value parameters.
+ Arrays are specified in the parameter definition by
+-the notation "\fIname\fB[]\fR".   In the function call, actual parameters
++the notation "\,\fIname\/\fB[]\fR".   In the function call, actual parameters
+ are full expressions for number parameters.  The same notation is used
+ for passing arrays as for defining array parameters.  The named array is
+ passed by value to the function.  Since function definitions are dynamic,
+@@ -463,7 +464,7 @@
+ are separated by semicolons or newlines.  Return statements cause the
+ termination of a function and the return of a value.  There are two
+ versions of the return statement.  The first form, "\fBreturn\fR", returns
+-the value 0 to the calling expression.  The second form, 
++the value 0 to the calling expression.  The second form,
+ "\fBreturn ( \fIexpression \fB)\fR", computes the value of the expression
+ and returns that value to the calling expression.  There is an implied
+ "\fBreturn (0)\fR" at the end of every function.  This allows a function
+@@ -493,7 +494,7 @@
+ .fi
+ .PP
+ Functions may be defined as \fBvoid\fR.  A void
+-funtion returns no value and thus may not be used in any place that needs
++function returns no value and thus may not be used in any place that needs
+ a value.  A void function does not produce any output when called by itself
+ on an input line.  The key word \fBvoid\fR is placed between the key word
+ \fBdefine\fR and the function name.  For example, consider the following
+@@ -501,8 +502,8 @@
+ .nf
+ .RS
+ \f(CW
+-define py (y) { print "--->", y, "<---", "\n"; }
+-define void px (x) { print "--->", x, "<---", "\n"; }
++define py (y) { print "--->", y, "<---", "\en"; }
++define void px (x) { print "--->", x, "<---", "\en"; }
+ py(1)
+ --->1<---
+ 0
+@@ -519,27 +520,27 @@
+ .PP
+ Also, call by variable for arrays was added.  To declare
+ a call by variable array, the declaration of the array parameter in the
+-function definition looks like "\fI*name\fB[]\fR".  The call to the
+-function remains the same as call by value arrays. 
++function definition looks like "\,\fI*name\/\fB[]\fR".  The call to the
++function remains the same as call by value arrays.
+ .SS MATH LIBRARY
+ If \fBbc\fR is invoked with the \fB-l\fR option, a math library is preloaded
+ and the default scale is set to 20.   The math functions will calculate their
+-results to the scale set at the time of their call.  
++results to the scale set at the time of their call.
+ The math library defines the following functions:
+-.IP "s (\fIx\fR)"
++.IP "s (\,\fIx\/\fR)"
+ The sine of x, x is in radians.
+-.IP "c (\fIx\fR)"
++.IP "c (\,\fIx\/\fR)"
+ The cosine of x, x is in radians.
+-.IP "a (\fIx\fR)"
++.IP "a (\,\fIx\/\fR)"
+ The arctangent of x, arctangent returns radians.
+-.IP "l (\fIx\fR)"
++.IP "l (\,\fIx\/\fR)"
+ The natural logarithm of x.
+-.IP "e (\fIx\fR)"
++.IP "e (\,\fIx\/\fR)"
+ The exponential function of raising e to the value x.
+-.IP "j (\fIn,x\fR)"
++.IP "j (\,\fIn,x\/\fR)"
+ The Bessel function of integer order n of x.
+ .SS EXAMPLES
+-In /bin/sh,  the following will assign the value of "pi" to the shell
++In /bin/sh, the following will assign the value of "pi" to the shell
+ variable \fBpi\fR.
+ .RS
+ \f(CW
+@@ -566,7 +567,7 @@
+   if (x<0) {
+     m = 1
+     x = \-x
+-  } 
++  }
+ 
+   /* Precondition x. */
+   z = scale;
+@@ -598,7 +599,7 @@
+ .PP
+ The following is code that uses the extended features of \fBbc\fR to
+ implement a simple program for calculating checkbook balances.  This
+-program is best kept in a file so that it can be used many times 
++program is best kept in a file so that it can be used many times
+ without having to retype it at every use.
+ .nf
+ .RS
+@@ -645,12 +646,12 @@
+ number of history lines are retained.  Setting the value of
+ \fBhistory\fR to a positive number restricts the number of history
+ lines to the number given.  The value of 0 disables the history
+-feature.  The default value is 100. For more information, read the
++feature.  The default value is 100.  For more information, read the
+ user manuals for the GNU \fBreadline\fR, \fBhistory\fR and BSD \fBlibedit\fR
+ libraries.  One can not enable both \fBreadline\fR and \fBlibedit\fR
+ at the same time.
+ .SS DIFFERENCES
+-This version of 
++This version of
+ .B bc
+ was implemented from the POSIX P1003.2/D11 draft and contains
+ several differences and extensions relative to the draft and
+@@ -665,7 +666,7 @@
+ .PP
+ A major source of differences is
+ extensions, where a feature is extended to add more functionality and
+-additions, where new features are added. 
++additions, where new features are added.
+ The following is the list of differences and extensions.
+ .IP "LANG environment"
+ This version does not conform to the POSIX standard in the processing
+@@ -682,7 +683,7 @@
+ must be included in strings.
+ .IP "last"
+ POSIX \fBbc\fR does not have a \fBlast\fR variable.  Some implementations
+-of \fBbc\fR use the period (.) in a similar way.  
++of \fBbc\fR use the period (.\&) in a similar way.
+ .IP "comparisons"
+ POSIX \fBbc\fR allows comparisons only in the if statement, the while
+ statement, and the second expression of the for statement.  Also, only
+@@ -696,7 +697,7 @@
+ .IP "read function"
+ POSIX \fBbc\fR does not have a read function.
+ .IP "print statement"
+-POSIX \fBbc\fR does not have a print statement .
++POSIX \fBbc\fR does not have a print statement.
+ .IP "continue statement"
+ POSIX \fBbc\fR does not have a continue statement.
+ .IP "return statement"
+@@ -708,7 +709,7 @@
+ is most likely an oversight in the grammar.)  Traditional implementations
+ of \fBbc\fR have only call by value array parameters.
+ .IP "function format"
+-POSIX \fBbc\fR requires the opening brace on the same line as the 
++POSIX \fBbc\fR requires the opening brace on the same line as the
+ \fBdefine\fR key word and the \fBauto\fR statement on the next line.
+ .IP "=+, =\-, =*, =/, =%, =^"
+ POSIX \fBbc\fR does not require these "old style" assignment operators to
+@@ -731,7 +732,7 @@
+ Syntax errors in the interactive execution code will invalidate the
+ current execution block.  The execution block is terminated by an
+ end of line that appears after a complete sequence of statements.
+-For example, 
++For example,
+ .nf
+ .RS
+ a = 1
+@@ -761,7 +762,7 @@
+ clean up process.  During a non-interactive
+ session, the SIGINT signal will terminate the entire run of \fBbc\fR.
+ .SS LIMITS
+-The following are the limits currently in place for this 
++The following are the limits currently in place for this
+ .B bc
+ processor.  Some of them may have been changed by an installation.
+ Use the limits statement to see the actual values.
+@@ -797,8 +798,8 @@
+ the user wants defined every time \fBbc\fR is run.
+ .IP "BC_LINE_LENGTH"
+ This should be an integer specifying the number of characters in an
+-output line for numbers. This includes the backslash and newline characters
+-for long numbers.  As an extension, the value of zero disables the 
++output line for numbers.  This includes the backslash and newline characters
++for long numbers.  As an extension, the value of zero disables the
+ multi-line feature.  Any other value of this variable that is less than
+ 3 sets the line length to 70.
+ .SH DIAGNOSTICS
+@@ -813,7 +814,7 @@
+ Be sure to include the word ``bc'' somewhere in the ``Subject:'' field.
+ .SH AUTHOR
+ .nf
+-Philip A. Nelson
++Philip A.\& Nelson
+ philnelson@acm.org
+ .fi
+ .SH ACKNOWLEDGEMENTS
diff --git a/package/bc/bc.hash b/package/bc/bc.hash
index 241e9a2..c9c786a 100644
--- a/package/bc/bc.hash
+++ b/package/bc/bc.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33  bc-1.06.tar.gz
+sha256  7ee4abbcfac03d8a6e1a8a3440558a3d239d6b858585063e745c760957725ecc  bc-1.06.95.tar.bz2
diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 60530bd..63948a0 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-BC_VERSION = 1.06
-BC_SITE = $(BR2_GNU_MIRROR)/bc
+BC_VERSION = 1.06.95
+BC_SITE = http://alpha.gnu.org/gnu/bc
+BC_SOURCE    = bc-$(BC_VERSION).tar.bz2
 BC_DEPENDENCIES = host-flex
 BC_LICENSE = GPLv2+ LGPLv2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.1.4
