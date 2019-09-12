From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 12 Sep 2019 15:50:57 -0500
Subject: [Buildroot] [PATCH] package/bc: bump to 1.07.1
Message-ID: <20190912205057.40777-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 * Added license hash files
 * Updated site to new GNU location
 * Reconfig required to use newer automake
 * Dropped patch for 01_array_initialize.patch as it was fixed
   in the latest
 * Refactored patches for makeinfo variable and write io errs
 * Added new dc fix exit code patch from Debian sid
 * Added new libmath offline gen cross-compile patch from Yocto

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...01-bc-use-MAKEINFO-variable-for-docs.patch |  34 ++
 ...nd-write-errors-on-input-and-output.patch} | 350 ++++++++++--------
 .../0003-dc-fix-exit-code-of-q-command.patch  |  46 +++
 package/bc/0004-no-gen-libmath.patch          |  97 +++++
 package/bc/01_array_initialize.patch          |  20 -
 package/bc/03_use_appropiate_makeinfo.patch   |  17 -
 package/bc/bc.hash                            |   4 +-
 package/bc/bc.mk                              |   9 +-
 8 files changed, 384 insertions(+), 193 deletions(-)
 create mode 100644 package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
 rename package/bc/{02_notice_read_write_errors.patch => 0002-notice-read-and-write-errors-on-input-and-output.patch} (63%)
 create mode 100644 package/bc/0003-dc-fix-exit-code-of-q-command.patch
 create mode 100644 package/bc/0004-no-gen-libmath.patch
 delete mode 100644 package/bc/01_array_initialize.patch
 delete mode 100644 package/bc/03_use_appropiate_makeinfo.patch

diff --git a/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch b/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
new file mode 100644
index 0000000000..6f82e9f82e
--- /dev/null
+++ b/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
@@ -0,0 +1,34 @@
+From 66d30778ec5bf98dbd106a3287d17fe0b5123490 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Wed, 11 Sep 2019 21:57:35 -0500
+Subject: [PATCH] bc: use MAKEINFO variable for docs
+
+Use the appropiate MAKEINFO variable rather than the hardcoded makeinfo
+command directly, otherwise missing logic never works.
+
+Fixes:
+http://autobuild.buildroot.net/results/b0b/b0b9dced0014a5a8026fa972f95085e8bd16a07b/
+
+[Recreated for 1.0.7.1 by Matt W]
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ doc/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/Makefile.in b/doc/Makefile.in
+index 55aa316..2ca37ff 100644
+--- a/doc/Makefile.in
++++ b/doc/Makefile.in
+@@ -214,7 +214,7 @@ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+ LIBOBJS = @LIBOBJS@
+ LIBS = @LIBS@
+ LTLIBOBJS = @LTLIBOBJS@
+-MAKEINFO = makeinfo --no-split
++MAKEINFO = @MAKEINFO@ --no-split
+ MKDIR_P = @MKDIR_P@
+ OBJEXT = @OBJEXT@
+ PACKAGE = @PACKAGE@
+-- 
+2.17.1
+
diff --git a/package/bc/02_notice_read_write_errors.patch b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
similarity index 63%
rename from package/bc/02_notice_read_write_errors.patch
rename to package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
index 73e6ec91ca..98a9c5dc23 100644
--- a/package/bc/02_notice_read_write_errors.patch
+++ b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
@@ -1,27 +1,53 @@
-Description: notice read and write errors on input and output
- Quoting from the bug report:
-    +bc (1.06-19ubuntu1) dapper; urgency=low
-    +
-    +  * Make dc notice read and write errors on its input and output.
-    +    I grepped for mentions of the strings `putc', `print', `getc', `FILE',
-    +    `stdin', `stdout' and `stderr' and added calls to new error-checking
-    +    functions unless it was clear from the immediately-surrounding code
-    +    that the program was exiting nonzero, or would exit nonzero if the
-    +    call failed.  I ignored hits in lib/getopt*, which seems to
-    +    pervasively ignore write errors when printing usage messages, in the
-    +    hope that these were correct.  I _think_ I got them all.  -iwj.
-    +
-    + -- Ian Jackson <iwj@ubuntu.com>  Tue,  4 Apr 2006 17:21:02 +0100
+From 4419cdd3850f153a5ad79a83cfffa455593651ac Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Thu, 12 Sep 2019 15:04:35 -0500
+Subject: [PATCH] notice read and write errors on input and output
+
+Quoting from the bug report:
+   bc (1.06-19ubuntu1) dapper; urgency=low
+   * Make dc notice read and write errors on its input and output.
+     I grepped for mentions of the strings `putc', `print', `getc',
+     `FILE', `stdin', `stdout' and `stderr' and added calls to new
+     error-checking functions unless it was clear from the
+     immediately-surrounding code that the program was exiting
+     nonzero, or would exit nonzero if the call failed.  I ignored
+     hits in lib/getopt*, which seems to pervasively ignore write
+     errors when printing usage messages, in the hope that these
+     were correct.  I _think_ I got them all.  -iwj.
+     -- Ian Jackson <iwj@ubuntu.com>  Tue,  4 Apr 2006 17:21:02 +0100
+
+Upsteam:
+https://sources.debian.org/patches/bc/1.07.1-2/05_notice_read_write_errors.diff/
+
+[Reformatted to GIT for 1.0.7.1 by Matt W]
+Updated by Ryan Kavanagh <rak@debian.org> for 1.0.7.1 on 26 July 2017.
 Author: Ian Jackson <iwj@ubuntu.com>
 Origin: other
 Bug-Debian: http://bugs.debian.org/488735
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 ---
-This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+ bc/execute.c | 10 +++++++++-
+ bc/main.c    |  3 +++
+ bc/sbc.y     |  2 ++
+ bc/scan.c    |  2 ++
+ bc/scan.l    |  3 +++
+ bc/util.c    | 15 ++++++++++++--
+ dc/dc.c      |  3 +++
+ dc/eval.c    | 55 +++++++++++++++++++++++++++++++++++++++-------------
+ dc/misc.c    |  1 +
+ dc/numeric.c |  9 +++++++++
+ dc/stack.c   | 11 ++++++++++-
+ dc/string.c  |  2 ++
+ h/number.h   | 11 +++++++----
+ lib/number.c | 24 +++++++++++++++++++++++
+ 14 files changed, 129 insertions(+), 22 deletions(-)
+
 diff --git a/bc/execute.c b/bc/execute.c
-index e4e8ef7..8787048 100644
+index 256e4b7..50eac49 100644
 --- a/bc/execute.c
 +++ b/bc/execute.c
-@@ -108,6 +108,7 @@ execute ()
+@@ -104,6 +104,7 @@ execute (void)
  	      }
  	    out_char ('\n');
  	  }
@@ -29,7 +55,7 @@ index e4e8ef7..8787048 100644
        }
  #endif
  
-@@ -222,6 +223,7 @@ execute ()
+@@ -224,6 +225,7 @@ execute (void)
  		}
  	    }
  	fflush (stdout);
@@ -37,7 +63,7 @@ index e4e8ef7..8787048 100644
  	break;
  
        case 'R' : /* Return from function */
-@@ -257,6 +259,7 @@ execute ()
+@@ -259,6 +261,7 @@ execute (void)
  	if (inst == 'W') out_char ('\n');
  	store_var (4);  /* Special variable "last". */
  	fflush (stdout);
@@ -45,7 +71,7 @@ index e4e8ef7..8787048 100644
  	pop ();
  	break;
  
-@@ -338,6 +341,7 @@ execute ()
+@@ -342,6 +345,7 @@ execute (void)
        case 'w' : /* Write a string to the output. */
  	while ((ch = byte(&pc)) != '"') out_schar (ch);
  	fflush (stdout);
@@ -53,7 +79,7 @@ index e4e8ef7..8787048 100644
  	break;
  		   
        case 'x' : /* Exchange Top of Stack with the one under the tos. */
-@@ -545,7 +549,10 @@ execute ()
+@@ -549,7 +553,10 @@ execute (void)
      {
        signal (SIGINT, use_quit);
        if (had_sigint)
@@ -65,7 +91,7 @@ index e4e8ef7..8787048 100644
      }
  }
  
-@@ -580,6 +587,7 @@ input_char ()
+@@ -584,6 +591,7 @@ input_char (void)
  	  out_col = 0;  /* Saw a new line */
  	}
      }
@@ -73,34 +99,22 @@ index e4e8ef7..8787048 100644
  
    /* Classify and preprocess the input character. */
    if (isdigit(in_ch))
-diff --git a/bc/load.c b/bc/load.c
-index 1035198..4039e86 100644
---- a/bc/load.c
-+++ b/bc/load.c
-@@ -217,6 +217,7 @@ load_code (code)
- 		if (label_no > 65535L)
- 		  {  /* Better message? */
- 		    fprintf (stderr,"Program too big.\n");
-+		    checkferror_output(stderr);
- 		    exit(1);
- 		  }
- 		addbyte ( (char) (label_no & 0xFF));
 diff --git a/bc/main.c b/bc/main.c
-index 9a2461e..3ae427d 100644
+index 012075c..c96207b 100644
 --- a/bc/main.c
 +++ b/bc/main.c
-@@ -358,6 +358,9 @@ use_quit (sig)
+@@ -353,6 +353,9 @@ use_quit (int sig)
    errno = save;
  #else
    write (1, "\n(interrupt) Exiting bc.\n", 26);
 +#ifdef READLINE
 +  rl_initialize (); /* Clear readline buffer */
 +#endif
- #if defined(LIBEDIT)
-   if (edit != NULL)
-     el_end(edit);
+   bc_exit(0);
+ #endif
+ }
 diff --git a/bc/sbc.y b/bc/sbc.y
-index 0ded29e..6fcc1fa 100644
+index 586686b..921ab1e 100644
 --- a/bc/sbc.y
 +++ b/bc/sbc.y
 @@ -86,7 +86,9 @@ program			: /* empty */
@@ -114,10 +128,10 @@ index 0ded29e..6fcc1fa 100644
  			    }
  			| program input_item
 diff --git a/bc/scan.c b/bc/scan.c
-index 1f78ec2..2b5eeb4 100644
+index b237f55..8dee4e9 100644
 --- a/bc/scan.c
 +++ b/bc/scan.c
-@@ -799,6 +799,7 @@ bcel_input (buf, result, max)
+@@ -791,6 +791,7 @@ bcel_input (char *buf, yy_size_t  *result, int max)
        if (bcel_len != 0)
  	history (hist, &histev, H_ENTER, bcel_line); 
        fflush (stdout);
@@ -125,7 +139,7 @@ index 1f78ec2..2b5eeb4 100644
      }
  
    if (bcel_len <= max)
-@@ -874,6 +875,7 @@ rl_input (buf, result, max)
+@@ -863,6 +864,7 @@ rl_input (char *buf, int *result, int max)
  	add_history (rl_line); 
        rl_line[rl_len-1] = '\n';
        fflush (stdout);
@@ -134,10 +148,10 @@ index 1f78ec2..2b5eeb4 100644
  
    if (rl_len <= max)
 diff --git a/bc/scan.l b/bc/scan.l
-index 841c3df..16cd62e 100644
+index eb2e2dd..79186bb 100644
 --- a/bc/scan.l
 +++ b/bc/scan.l
-@@ -111,6 +111,7 @@ bcel_input (buf, result, max)
+@@ -99,6 +99,7 @@ bcel_input (char *buf, yy_size_t  *result, int max)
        if (bcel_len != 0)
  	history (hist, &histev, H_ENTER, bcel_line); 
        fflush (stdout);
@@ -145,7 +159,7 @@ index 841c3df..16cd62e 100644
      }
  
    if (bcel_len <= max)
-@@ -186,6 +187,7 @@ rl_input (buf, result, max)
+@@ -171,6 +172,7 @@ rl_input (char *buf, int *result, int max)
  	add_history (rl_line); 
        rl_line[rl_len-1] = '\n';
        fflush (stdout);
@@ -153,7 +167,7 @@ index 841c3df..16cd62e 100644
      }
  
    if (rl_len <= max)
-@@ -310,6 +312,7 @@ limits return(Limits);
+@@ -295,6 +297,7 @@ limits return(Limits);
  	    if (c == EOF)
  	      {
  		fprintf (stderr,"EOF encountered in a comment.\n");
@@ -161,23 +175,11 @@ index 841c3df..16cd62e 100644
  		break;
  	      }
  	  }
-diff --git a/bc/storage.c b/bc/storage.c
-index 699729a..37b4c6c 100644
---- a/bc/storage.c
-+++ b/bc/storage.c
-@@ -99,6 +99,7 @@ more_functions (VOID)
-     {
-       f = &functions[indx];
-       f->f_defined = FALSE;
-+      f->f_void = FALSE;
-       f->f_body = (char *) bc_malloc (BC_START_SIZE);
-       f->f_body_size = BC_START_SIZE;
-       f->f_code_size = 0;
 diff --git a/bc/util.c b/bc/util.c
-index 30beaf9..669235f 100644
+index 8eba093..cacd796 100644
 --- a/bc/util.c
 +++ b/bc/util.c
-@@ -260,9 +260,10 @@ init_gen ()
+@@ -247,9 +247,10 @@ init_gen (void)
    continue_label = 0;
    next_label  = 1;
    out_count = 2;
@@ -190,7 +192,7 @@ index 30beaf9..669235f 100644
      init_load ();
    had_error = FALSE;
    did_gen = FALSE;
-@@ -286,6 +287,7 @@ generate (str)
+@@ -272,6 +273,7 @@ generate (const char *str)
  	  printf ("\n");
  	  out_count = 0;
  	}
@@ -198,7 +200,7 @@ index 30beaf9..669235f 100644
      }
    else
      load_code (str);
-@@ -303,6 +305,7 @@ run_code()
+@@ -289,6 +291,7 @@ run_code(void)
        if (compile_only)
  	{
  	  printf ("@r\n"); 
@@ -206,7 +208,7 @@ index 30beaf9..669235f 100644
  	  out_count = 0;
  	}
        else
-@@ -341,6 +344,7 @@ out_char (ch)
+@@ -326,6 +329,7 @@ out_char (int ch)
  	}
        putchar (ch);
      }
@@ -214,7 +216,7 @@ index 30beaf9..669235f 100644
  }
  
  /* Output routines: Write a character CH to the standard output.
-@@ -371,6 +375,7 @@ out_schar (ch)
+@@ -355,6 +359,7 @@ out_schar (int ch)
  	}
        putchar (ch);
      }
@@ -222,7 +224,7 @@ index 30beaf9..669235f 100644
  }
  
  
-@@ -657,6 +662,7 @@ limits()
+@@ -639,6 +644,7 @@ limits(void)
  #ifdef OLD_EQ_OP
    printf ("Old assignment operatiors are valid. (=-, =+, ...)\n");
  #endif 
@@ -230,7 +232,7 @@ index 30beaf9..669235f 100644
  }
  
  /* bc_malloc will check the return value so all other places do not
-@@ -721,6 +727,7 @@ yyerror (str, va_alist)
+@@ -703,6 +709,7 @@ yyerror (str, va_alist)
    fprintf (stderr,"%s %d: ",name,line_no);
    vfprintf (stderr, str, args);
    fprintf (stderr, "\n");
@@ -238,7 +240,7 @@ index 30beaf9..669235f 100644
    had_error = TRUE;
    va_end (args);
  }
-@@ -761,6 +768,7 @@ warn (mesg, va_alist)
+@@ -743,6 +750,7 @@ ct_warn (mesg, va_alist)
        fprintf (stderr,"%s %d: Error: ",name,line_no);
        vfprintf (stderr, mesg, args);
        fprintf (stderr, "\n");
@@ -246,7 +248,7 @@ index 30beaf9..669235f 100644
        had_error = TRUE;
      }
    else
-@@ -773,6 +781,7 @@ warn (mesg, va_alist)
+@@ -755,6 +763,7 @@ ct_warn (mesg, va_alist)
  	fprintf (stderr,"%s %d: (Warning) ",name,line_no);
  	vfprintf (stderr, mesg, args);
  	fprintf (stderr, "\n");
@@ -254,7 +256,7 @@ index 30beaf9..669235f 100644
        }
    va_end (args);
  }
-@@ -807,6 +816,7 @@ rt_error (mesg, va_alist)
+@@ -789,6 +798,7 @@ rt_error (mesg, va_alist)
    va_end (args);
    
    fprintf (stderr, "\n");
@@ -262,17 +264,19 @@ index 30beaf9..669235f 100644
    runtime_error = TRUE;
  }
  
-@@ -843,4 +853,5 @@ rt_warn (mesg, va_alist)
+@@ -823,6 +833,7 @@ rt_warn (const char *mesg)
    va_end (args);
  
    fprintf (stderr, "\n");
 +  checkferror_output(stderr);
  }
+ 
+ /* bc_exit: Make sure to reset the edit state. */
 diff --git a/dc/dc.c b/dc/dc.c
-index e03f094..0faf03a 100644
+index 6a2bb26..ccdb1c2 100644
 --- a/dc/dc.c
 +++ b/dc/dc.c
-@@ -61,6 +61,7 @@ static void
+@@ -59,6 +59,7 @@ static void
  bug_report_info DC_DECLVOID()
  {
  	printf("Email bug reports to:  bug-dc at gnu.org .\n");
@@ -280,7 +284,7 @@ index e03f094..0faf03a 100644
  }
  
  static void
-@@ -71,6 +72,7 @@ show_version DC_DECLVOID()
+@@ -69,6 +70,7 @@ show_version DC_DECLVOID()
  This is free software; see the source for copying conditions.  There is NO\n\
  warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE,\n\
  to the extent permitted by law.\n", DC_COPYRIGHT);
@@ -288,7 +292,7 @@ index e03f094..0faf03a 100644
  }
  
  /* your generic usage function */
-@@ -87,6 +89,7 @@ Usage: %s [OPTION] [file ...]\n\
+@@ -85,6 +87,7 @@ Usage: %s [OPTION] [file ...]\n\
  \n\
  ", progname);
  	bug_report_info();
@@ -297,14 +301,14 @@ index e03f094..0faf03a 100644
  
  /* returns a pointer to one past the last occurance of c in s,
 diff --git a/dc/eval.c b/dc/eval.c
-index 4af7200..153d331 100644
+index 05a3d9e..6c54e61 100644
 --- a/dc/eval.c
 +++ b/dc/eval.c
-@@ -94,12 +94,15 @@ static int input_pushback;
+@@ -97,12 +97,15 @@ static int input_pushback;
  static int
  input_fil DC_DECLVOID()
  {
-+        int c;
++		int c;
  	if (input_pushback != EOF){
 -		int c = input_pushback;
 +		c = input_pushback;
@@ -318,7 +322,7 @@ index 4af7200..153d331 100644
  }
  
  /* passed as an argument to dc_getnum */
-@@ -298,11 +301,13 @@ dc_func DC_DECLARG((c, peekc, negcmp))
+@@ -301,11 +304,13 @@ dc_func DC_DECLARG((c, peekc, negcmp))
  				tmpint = dc_num2int(datum.v.number, DC_TOSS);
  			if (2 <= tmpint  &&  tmpint <= DC_IBASE_MAX)
  				dc_ibase = tmpint;
@@ -333,7 +337,7 @@ index 4af7200..153d331 100644
  		}
  		break;
  	case 'k':	/* set scale to value on top of stack */
-@@ -310,11 +315,12 @@ between 2 and %d (inclusive)\n",
+@@ -313,11 +318,12 @@ between 2 and %d (inclusive)\n",
  			tmpint = -1;
  			if (datum.dc_type == DC_NUMBER)
  				tmpint = dc_num2int(datum.v.number, DC_TOSS);
@@ -348,7 +352,7 @@ index 4af7200..153d331 100644
  				dc_scale = tmpint;
  		}
  		break;
-@@ -338,11 +344,12 @@ between 2 and %d (inclusive)\n",
+@@ -341,11 +347,12 @@ between 2 and %d (inclusive)\n",
  			tmpint = 0;
  			if (datum.dc_type == DC_NUMBER)
  				tmpint = dc_num2int(datum.v.number, DC_TOSS);
@@ -363,7 +367,7 @@ index 4af7200..153d331 100644
  				dc_obase = tmpint;
  		}
  		break;
-@@ -383,6 +390,7 @@ between 2 and %d (inclusive)\n",
+@@ -378,6 +385,7 @@ between 2 and %d (inclusive)\n",
  				fprintf(stderr,
  						"%s: square root of nonnumeric attempted\n",
  						progname);
@@ -371,15 +375,23 @@ index 4af7200..153d331 100644
  			}else if (dc_sqrt(datum.v.number, dc_scale, &tmpnum) == DC_SUCCESS){
  				dc_free_num(&datum.v.number);
  				datum.v.number = tmpnum;
-@@ -444,6 +452,7 @@ between 2 and %d (inclusive)\n",
+@@ -424,6 +432,7 @@ between 2 and %d (inclusive)\n",
+ 				dc_garbage("at top of stack", -1);
+ 		}
+ 		fflush(stdout);
++		checkferror_output(stdout);
+ 		break;
+ 	case 'Q':	/* quit out of top-of-stack nested evals;
+ 				 * pops value from stack;
+@@ -440,6 +449,7 @@ between 2 and %d (inclusive)\n",
  			fprintf(stderr,
  					"%s: Q command requires a number >= 1\n",
  					progname);
 +			checkferror_output(stderr);
  		}
  		break;
- #if 0
-@@ -489,11 +498,12 @@ between 2 and %d (inclusive)\n",
+ 	case 'R':	/* pop a value off of the evaluation stack,;
+@@ -483,11 +493,12 @@ between 2 and %d (inclusive)\n",
  			if (datum.dc_type == DC_NUMBER)
  				tmpint = dc_num2int(datum.v.number, DC_TOSS);
  			if (dc_pop(&datum) == DC_SUCCESS){
@@ -394,7 +406,7 @@ index 4af7200..153d331 100644
  					dc_array_set(peekc, tmpint, datum);
  			}
  		}
-@@ -505,17 +515,19 @@ between 2 and %d (inclusive)\n",
+@@ -499,18 +510,21 @@ between 2 and %d (inclusive)\n",
  			tmpint = -1;
  			if (datum.dc_type == DC_NUMBER)
  				tmpint = dc_num2int(datum.v.number, DC_TOSS);
@@ -414,9 +426,11 @@ index 4af7200..153d331 100644
  		fprintf(stderr, "%s: ", progname);
 +		checkferror_output(stderr);
  		dc_show_id(stdout, c, " unimplemented\n");
++		checkferror_output(stdout);
  		break;
  	}
-@@ -544,6 +556,7 @@ dc_evalstr DC_DECLARG((string))
+ 	return DC_OKAY;
+@@ -538,6 +552,7 @@ evalstr DC_DECLARG((string))
  		fprintf(stderr,
  				"%s: eval called with non-string argument\n",
  				progname);
@@ -424,7 +438,7 @@ index 4af7200..153d331 100644
  		return DC_OKAY;
  	}
  	interrupt_seen = 0;
-@@ -640,6 +653,7 @@ dc_evalstr DC_DECLARG((string))
+@@ -635,6 +650,7 @@ evalstr DC_DECLARG((string))
  				return DC_FAIL;
  			}
  			fprintf(stderr, "%s: unexpected EOS\n", progname);
@@ -432,7 +446,7 @@ index 4af7200..153d331 100644
  			return DC_OKAY;
  		}
  	}
-@@ -665,6 +679,7 @@ dc_evalfile DC_DECLARG((fp))
+@@ -692,6 +708,7 @@ dc_evalfile DC_DECLARG((fp))
  	stdin_lookahead = EOF;
  	for (c=getc(fp); c!=EOF; c=peekc){
  		peekc = getc(fp);
@@ -440,15 +454,48 @@ index 4af7200..153d331 100644
  		/*
  		 * The following if() is the only place where ``stdin_lookahead''
  		 * might be set to other than EOF:
-@@ -716,6 +731,7 @@ dc_evalfile DC_DECLARG((fp))
- 							return DC_SUCCESS;
+@@ -717,24 +734,30 @@ dc_evalfile DC_DECLARG((fp))
+ 		signal(SIGINT, sigint_handler);
+ 		switch (dc_func(c, peekc, negcmp)){
+ 		case DC_OKAY:
+-			if (stdin_lookahead != peekc  &&  fp == stdin)
++			if (stdin_lookahead != peekc  &&  fp == stdin) {
+ 				peekc = getc(fp);
++				checkferror_input(stdin);
++			}
+ 			break;
+ 		case DC_EATONE:
+ 			peekc = getc(fp);
++			checkferror_input(fp);
+ 			break;
+ 		case DC_EVALREG:
+ 			/*commands which send us here shall guarantee that peekc!=EOF*/
+ 			c = peekc;
+ 			peekc = getc(fp);
++			checkferror_input(fp);
+ 			stdin_lookahead = peekc;
+ 			if (dc_register_get(c, &datum) != DC_SUCCESS)
+ 				break;
+ 			dc_push(datum);
+ 			/*@fallthrough@*/
+ 		case DC_EVALTOS:
+-			if (stdin_lookahead != peekc  &&  fp == stdin)
++			if (stdin_lookahead != peekc  &&  fp == stdin) {
+ 				peekc = getc(fp);
++				checkferror_input(stdin);
++			}
+ 			if (dc_pop(&datum) == DC_SUCCESS){
+ 				if (datum.dc_type == DC_NUMBER){
+ 					dc_push(datum);
+@@ -744,6 +767,7 @@ dc_evalfile DC_DECLARG((fp))
+ 							goto reset_and_exit_quit;
  						fprintf(stderr, "%s: Q command argument exceeded \
  string execution depth\n", progname);
 +						checkferror_output(stderr);
  					}
  				}else{
  					dc_garbage("at top of stack", -1);
-@@ -728,8 +744,11 @@ string execution depth\n", progname);
+@@ -756,8 +780,11 @@ string execution depth\n", progname);
  			fprintf(stderr,
  					"%s: Q command argument exceeded string execution depth\n",
  					progname);
@@ -461,19 +508,11 @@ index 4af7200..153d331 100644
  			break;
  
  		case DC_INT:
-@@ -771,6 +790,7 @@ string execution depth\n", progname);
- 			if (ferror(fp))
- 				goto error_fail;
- 			fprintf(stderr, "%s: unexpected EOF\n", progname);
-+			checkferror_output(stderr);
- 			return DC_FAIL;
- 		}
- 	}
 diff --git a/dc/misc.c b/dc/misc.c
-index f2388b0..1be56fe 100644
+index cd23602..cd910b8 100644
 --- a/dc/misc.c
 +++ b/dc/misc.c
-@@ -91,6 +91,7 @@ dc_show_id DC_DECLARG((fp, id, suffix))
+@@ -89,6 +89,7 @@ dc_show_id DC_DECLARG((fp, id, suffix))
  		fprintf(fp, "'%c' (%#o)%s", (unsigned int) id, id, suffix);
  	else
  		fprintf(fp, "%#o%s", (unsigned int) id, suffix);
@@ -482,10 +521,10 @@ index f2388b0..1be56fe 100644
  
  
 diff --git a/dc/numeric.c b/dc/numeric.c
-index 8e5e70f..c875eba 100644
+index 37759de..60cfb85 100644
 --- a/dc/numeric.c
 +++ b/dc/numeric.c
-@@ -134,6 +134,7 @@ dc_div DC_DECLARG((a, b, kscale, result))
+@@ -133,6 +133,7 @@ dc_div DC_DECLARG((a, b, kscale, result))
  	bc_init_num(CastNumPtr(result));
  	if (bc_divide(CastNum(a), CastNum(b), CastNumPtr(result), kscale)){
  		fprintf(stderr, "%s: divide by zero\n", progname);
@@ -493,7 +532,7 @@ index 8e5e70f..c875eba 100644
  		return DC_DOMAIN_ERROR;
  	}
  	return DC_SUCCESS;
-@@ -156,6 +157,7 @@ dc_divrem DC_DECLARG((a, b, kscale, quotient, remainder))
+@@ -155,6 +156,7 @@ dc_divrem DC_DECLARG((a, b, kscale, quotient, remainder))
  	if (bc_divmod(CastNum(a), CastNum(b),
  						CastNumPtr(quotient), CastNumPtr(remainder), kscale)){
  		fprintf(stderr, "%s: divide by zero\n", progname);
@@ -501,7 +540,7 @@ index 8e5e70f..c875eba 100644
  		return DC_DOMAIN_ERROR;
  	}
  	return DC_SUCCESS;
-@@ -174,6 +176,7 @@ dc_rem DC_DECLARG((a, b, kscale, result))
+@@ -173,6 +175,7 @@ dc_rem DC_DECLARG((a, b, kscale, result))
  	bc_init_num(CastNumPtr(result));
  	if (bc_modulo(CastNum(a), CastNum(b), CastNumPtr(result), kscale)){
  		fprintf(stderr, "%s: remainder by zero\n", progname);
@@ -509,7 +548,7 @@ index 8e5e70f..c875eba 100644
  		return DC_DOMAIN_ERROR;
  	}
  	return DC_SUCCESS;
-@@ -226,6 +229,7 @@ dc_sqrt DC_DECLARG((value, kscale, result))
+@@ -225,6 +228,7 @@ dc_sqrt DC_DECLARG((value, kscale, result))
  	tmp = bc_copy_num(CastNum(value));
  	if (!bc_sqrt(&tmp, kscale)){
  		fprintf(stderr, "%s: square root of negative number\n", progname);
@@ -517,19 +556,7 @@ index 8e5e70f..c875eba 100644
  		bc_free_num(&tmp);
  		return DC_DOMAIN_ERROR;
  	}
-@@ -429,8 +433,10 @@ dc_out_num DC_DECLARG((value, obase, newline_p, discard_p))
- {
- 	out_char('\0'); /* clear the column counter */
- 	bc_out_num(CastNum(value), obase, out_char, 0);
--	if (newline_p == DC_WITHNL)
-+	if (newline_p == DC_WITHNL) {
- 		putchar ('\n');
-+		checkferror_output(stdout);
-+	}
- 	if (discard_p == DC_TOSS)
- 		dc_free_num(&value);
- }
-@@ -475,6 +481,7 @@ dc_dump_num DC_DECLARG((dcvalue, discard_p))
+@@ -470,6 +474,7 @@ dc_dump_num DC_DECLARG((dcvalue, discard_p))
  
  	for (cur=top_of_stack; cur; cur=next) {
  		putchar(cur->digit);
@@ -537,15 +564,16 @@ index 8e5e70f..c875eba 100644
  		next = cur->link;
  		free(cur);
  	}
-@@ -592,6 +599,7 @@ out_char (ch)
+@@ -587,6 +592,8 @@ out_char (ch)
  			out_col = 1;
  		}
  		putchar(ch);
++                checkferror_output(stdout);
 +		checkferror_output(stderr);
  	}
  }
  
-@@ -631,6 +639,7 @@ rt_error (mesg, va_alist)
+@@ -626,6 +633,7 @@ rt_error (mesg, va_alist)
  	vfprintf (stderr, mesg, args);
  	va_end (args);
  	fprintf (stderr, "\n");
@@ -553,7 +581,7 @@ index 8e5e70f..c875eba 100644
  }
  
  
-@@ -664,6 +673,7 @@ rt_warn (mesg, va_alist)
+@@ -659,6 +667,7 @@ rt_warn (mesg, va_alist)
  	vfprintf (stderr, mesg, args);
  	va_end (args);
  	fprintf (stderr, "\n");
@@ -562,10 +590,10 @@ index 8e5e70f..c875eba 100644
  
  
 diff --git a/dc/stack.c b/dc/stack.c
-index 0730e9c..5db3975 100644
+index 49422df..174411d 100644
 --- a/dc/stack.c
 +++ b/dc/stack.c
-@@ -38,7 +38,10 @@
+@@ -35,7 +35,10 @@
  #include "dc-regdef.h"
  
  /* an oft-used error message: */
@@ -577,7 +605,7 @@ index 0730e9c..5db3975 100644
  
  
  /* simple linked-list implementation suffices: */
-@@ -94,6 +97,7 @@ dc_binop DC_DECLARG((op, kscale))
+@@ -91,6 +94,7 @@ dc_binop DC_DECLARG((op, kscale))
  	if (dc_stack->value.dc_type!=DC_NUMBER
  			|| dc_stack->link->value.dc_type!=DC_NUMBER){
  		fprintf(stderr, "%s: non-numeric value\n", progname);
@@ -585,7 +613,7 @@ index 0730e9c..5db3975 100644
  		return;
  	}
  	(void)dc_pop(&b);
-@@ -134,6 +138,7 @@ dc_binop2 DC_DECLARG((op, kscale))
+@@ -131,6 +135,7 @@ dc_binop2 DC_DECLARG((op, kscale))
  	if (dc_stack->value.dc_type!=DC_NUMBER
  			|| dc_stack->link->value.dc_type!=DC_NUMBER){
  		fprintf(stderr, "%s: non-numeric value\n", progname);
@@ -593,7 +621,7 @@ index 0730e9c..5db3975 100644
  		return;
  	}
  	(void)dc_pop(&b);
-@@ -172,6 +177,7 @@ dc_cmpop DC_DECLVOID()
+@@ -169,6 +174,7 @@ dc_cmpop DC_DECLVOID()
  	if (dc_stack->value.dc_type!=DC_NUMBER
  			|| dc_stack->link->value.dc_type!=DC_NUMBER){
  		fprintf(stderr, "%s: non-numeric value\n", progname);
@@ -601,7 +629,7 @@ index 0730e9c..5db3975 100644
  		return 0;
  	}
  	(void)dc_pop(&b);
-@@ -209,6 +215,7 @@ dc_triop DC_DECLARG((op, kscale))
+@@ -206,6 +212,7 @@ dc_triop DC_DECLARG((op, kscale))
  			|| dc_stack->link->value.dc_type!=DC_NUMBER
  			|| dc_stack->link->link->value.dc_type!=DC_NUMBER){
  		fprintf(stderr, "%s: non-numeric value\n", progname);
@@ -610,34 +638,34 @@ index 0730e9c..5db3975 100644
  	}
  	(void)dc_pop(&c);
 @@ -327,6 +334,7 @@ dc_register_get DC_DECLARG((regid, result))
- 	r = dc_register[regid];
- 	if (r==NULL || r->value.dc_type==DC_UNINITIALIZED){
- 		fprintf(stderr, "%s: register ", progname);
+ 		*result = dc_int2data(0);
+ 	}else if (r->value.dc_type==DC_UNINITIALIZED){
+ 		fprintf(stderr, "%s: BUG: register ", progname);
 +		checkferror_output(stderr);
- 		dc_show_id(stderr, regid, " is empty\n");
+ 		dc_show_id(stderr, regid, " exists but is uninitialized?\n");
  		return DC_FAIL;
- 	}
-@@ -401,6 +409,7 @@ dc_register_pop DC_DECLARG((stackid, result))
+ 	}else{
+@@ -402,6 +410,7 @@ dc_register_pop DC_DECLARG((stackid, result))
  	r = dc_register[stackid];
- 	if (r == NULL){
+ 	if (r==NULL || r->value.dc_type==DC_UNINITIALIZED){
  		fprintf(stderr, "%s: stack register ", progname);
 +		checkferror_output(stderr);
  		dc_show_id(stderr, stackid, " is empty\n");
  		return DC_FAIL;
  	}
 diff --git a/dc/string.c b/dc/string.c
-index ff1e7f1..e24092d 100644
+index dee9169..389d899 100644
 --- a/dc/string.c
 +++ b/dc/string.c
-@@ -101,6 +101,7 @@ dc_out_str DC_DECLARG((value, newline, discard_flag))
+@@ -94,6 +94,7 @@ dc_out_str DC_DECLARG((value, discard_flag))
+ 	dc_discard discard_flag DC_DECLEND
+ {
  	fwrite(value->s_ptr, value->s_len, sizeof *value->s_ptr, stdout);
- 	if (newline == DC_WITHNL)
- 		putchar('\n');
-+	checkferror_output(stdout);
++        checkferror_output(stdout);
  	if (discard_flag == DC_TOSS)
  		dc_free_str(&value);
  }
-@@ -176,6 +177,7 @@ dc_readstring DC_DECLARG((fp, ldelim, rdelim))
+@@ -169,6 +170,7 @@ dc_readstring DC_DECLARG((fp, ldelim, rdelim))
  		}
  		*p++ = c;
  	}
@@ -646,22 +674,37 @@ index ff1e7f1..e24092d 100644
  }
  
 diff --git a/h/number.h b/h/number.h
-index 9b034b6..3a00a92 100644
+index abf6332..1983ab4 100644
 --- a/h/number.h
 +++ b/h/number.h
-@@ -150,4 +150,7 @@ _PROTOTYPE(int bc_sqrt, (bc_num *num, int scale));
- _PROTOTYPE(void bc_out_num, (bc_num num, int o_base, void (* out_char)(int),
- 			     int leading_zero));
+@@ -23,10 +23,10 @@
+     You may contact the author by:
+        e-mail:  philnelson at acm.org
+       us-mail:  Philip A. Nelson
+-                Computer Science Department, 9062
+-                Western Washington University
+-                Bellingham, WA 98226-9062
+-       
++		Computer Science Department, 9062
++		Western Washington University
++		Bellingham, WA 98226-9062
++
+ *************************************************************************/
+ 
+ #ifndef _NUMBER_H_
+@@ -140,4 +140,7 @@ void bc_out_num (bc_num num, int o_base, void (* out_char)(int),
+ 			     int leading_zero);
  
-+_PROTOTYPE(void checkferror_input, (FILE*));
-+_PROTOTYPE(void checkferror_output, (FILE*));
+ void bc_out_long (long val, int size, int space, void (*out_char)(int));
 +
++void checkferror_input (FILE*);
++void checkferror_output (FILE*);
  #endif
 diff --git a/lib/number.c b/lib/number.c
-index e211840..4d3ce46 100644
+index f394e92..80b33e3 100644
 --- a/lib/number.c
 +++ b/lib/number.c
-@@ -1776,6 +1776,7 @@ static void
+@@ -1713,6 +1713,7 @@ static void
  out_char (int c)
  {
    putchar(c);
@@ -669,7 +712,7 @@ index e211840..4d3ce46 100644
  }
  
  
-@@ -1785,6 +1786,7 @@ pn (num)
+@@ -1721,6 +1722,7 @@ pn (bc_num num)
  {
    bc_out_num (num, 10, out_char, 0);
    out_char ('\n');
@@ -677,7 +720,7 @@ index e211840..4d3ce46 100644
  }
  
  
-@@ -1799,6 +1801,28 @@ pv (name, num, len)
+@@ -1732,6 +1734,28 @@ pv (char *name, unsigned char *num, int len)
    printf ("%s=", name);
    for (i=0; i<len; i++) printf ("%c",BCD_CHAR(num[i]));
    printf ("\n");
@@ -706,3 +749,6 @@ index e211840..4d3ce46 100644
 +		exit(EXIT_FAILURE);
 +	}
 +}
+-- 
+2.17.1
+
diff --git a/package/bc/0003-dc-fix-exit-code-of-q-command.patch b/package/bc/0003-dc-fix-exit-code-of-q-command.patch
new file mode 100644
index 0000000000..15dfdc3a2d
--- /dev/null
+++ b/package/bc/0003-dc-fix-exit-code-of-q-command.patch
@@ -0,0 +1,46 @@
+From a0ae58faaf14ec11b53bad7f59383bd2d7a04bbe Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Thu, 27 Jun 2019 13:10:47 +0800
+Subject: [PATCH] dc: fix exit code of q command
+
+The exit code for "echo q | dc" is 1 for dc-1.4.1;
+while the exit code for "echo q | dc" is 0 for dc-1.4.
+
+Here is the answer from ken at gnu.org:
+dc-1.4 was right.  There was a rewrite of a chunk of code for 1.4.1 to
+fix a corner case in the Q command, and somehow the placement of the
+clean-up label for the 'q' command got misplaced on the error-handling
+branch instead of the clean-exit branch.  The patch below fixes this
+(it is committed for whenever the next bc/dc release gets made).
+
+Thanks for the report,
+        --Ken Pizzini
+
+Upstream:
+https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-extended/bc/bc/0001-dc-fix-exit-code-of-q-command.patch
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ dc/eval.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dc/eval.c b/dc/eval.c
+index 6c54e61..9c28f18 100644
+--- a/dc/eval.c
++++ b/dc/eval.c
+@@ -841,10 +841,10 @@ error_fail:
+ 	fprintf(stderr, "%s: ", progname);
+ 	perror("error reading input");
+ 	return DC_FAIL;
+-reset_and_exit_quit:
+ reset_and_exit_fail:
+ 	signal(SIGINT, sigint_default);
+ 	return DC_FAIL;
++reset_and_exit_quit:
+ reset_and_exit_success:
+ 	signal(SIGINT, sigint_default);
+ 	return DC_SUCCESS;
+-- 
+2.17.1
+
diff --git a/package/bc/0004-no-gen-libmath.patch b/package/bc/0004-no-gen-libmath.patch
new file mode 100644
index 0000000000..0c2f4d32d3
--- /dev/null
+++ b/package/bc/0004-no-gen-libmath.patch
@@ -0,0 +1,97 @@
+From 9521a37e770d1721a3094f8c19ebc2f39bb0f52c Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Thu, 12 Sep 2019 15:12:40 -0500
+Subject: [PATCH] no gen libmath
+
+These rules are not cross-friendly so delete them.  libmath has been
+generated offline and included as part of this patch as the fbc tool
+used to generate that header is assuming the cross archtecture and
+can't execute.
+
+Upstream:
+https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-extended/bc/bc/no-gen-libmath.patch
+https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-extended/bc/bc/libmath.h
+
+[Reformatted to GIT for 1.0.7.1 by Matt W]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ bc/Makefile.am |  8 --------
+ bc/libmath.h   | 46 ++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 46 insertions(+), 8 deletions(-)
+ create mode 100644 bc/libmath.h
+
+diff --git a/bc/Makefile.am b/bc/Makefile.am
+index d9d412e..f244241 100644
+--- a/bc/Makefile.am
++++ b/bc/Makefile.am
+@@ -31,14 +31,6 @@ global.o: libmath.h
+ 
+ fbcOBJ = main.o bc.o scan.o execute.o load.o storage.o util.o warranty.o
+ 
+-libmath.h: libmath.b $(fbcOBJ) $(LIBBC)
+-	echo '{0}' > libmath.h
+-	$(MAKE) global.o
+-	$(LINK) -o fbc $(fbcOBJ) global.o $(LIBBC) $(LIBL) $(READLINELIB) $(LIBS)
+-	./fbc -c $(srcdir)/libmath.b </dev/null >libmath.h
+-	$(srcdir)/fix-libmath_h
+-	rm -f ./fbc ./global.o
+-
+ sbcOBJ = main.o sbc.o scan.o execute.o global.o load.o storage.o util.o \
+          warranty.o
+ sbc.o: sbc.c
+diff --git a/bc/libmath.h b/bc/libmath.h
+new file mode 100644
+index 0000000..63e1acb
+--- /dev/null
++++ b/bc/libmath.h
+@@ -0,0 +1,46 @@
++{"@iK20:s2:p at r",
++"@iF1,5.6,7,8,9,10,11,12,13,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C1,0:",
++"s14:pl7:s0:pl14:RN1:l5:0<Z2:1s12:pl5:ns5:pN2:l2:s15:pK6:l15:+",
++"K.44:l5:*+s13:pl5:cS1+s2:pN3:l5:1>Z4:l10:1+s10:pl5:K2:/s5:pl2:",
++"1+s2:pJ3:N4:l13:s2:p1l5:+s14:pl5:s6:p1s8:pK2:s11:pN6:1B7:J5:N8:",
++"l11:i11:pJ6:N7:l6:l5:*s6:l8:l11:*s8:/s9:pl9:0=Z9:l10:0>Z10:N11:",
++"l10:d10:Z12:l14:l14:*s14:pJ11:N12:N10:l15:s2:pl12:Z13:1l14:/R",
++"N13:l14:1/RN9:l14:l9:+s14:pJ8:N5:0R]@r",
++"@iF2,5.7,9,10,11,12,13,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C2,0:",
++"s14:pl7:s0:pl14:RN1:l5:0{Z2:1K10:l2:^-1/RN2:l2:s15:pK6:l2:+s2:",
++"pK2:s10:p0s11:pN3:l5:K2:}Z4:l10:K2:*s10:pl5:cRs5:pJ3:N4:N5:l5:",
++"K.5:{Z6:l10:K2:*s10:pl5:cRs5:pJ5:N6:l5:1-l5:1+/s13:s14:pl13:l13:",
++"*s12:pK3:s11:pN8:1B9:J7:N10:l11:K2:+s11:pJ8:N9:l13:l12:*s13:l11:",
++"/s9:pl9:0=Z11:l10:l14:*s14:pl15:s2:pl14:1/RN11:l14:l9:+s14:pJ10:N7:",
++"0R]@r",
++"@iF3,5.7,9,11,12,13,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C3,0:",
++"s14:pl7:s0:pl14:RN1:l2:s15:pK1.1:l15:*K2:+s2:p1C4,0:s14:pl5:0",
++"<Z2:1s12:pl5:ns5:pN2:0s2:pl5:l14:/K2:+K4:/s13:pl5:K4:l13:*l14:",
++"*-s5:pl13:K2:%Z3:l5:ns5:pN3:l15:K2:+s2:pl5:s9:s14:pl5:nl5:*s16:",
++"pK3:s11:pN5:1B6:J4:N7:l11:K2:+s11:pJ5:N6:l9:l16:l11:l11:1-*/*",
++"s9:pl9:0=Z8:l15:s2:pl12:Z9:l14:n1/RN9:l14:1/RN8:l14:l9:+s14:p",
++"J7:N4:0R]@r",
++"@iF5,5.7,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C5,0:s14:pl7:s0:pl14:",
++"RN1:l2:s15:pl2:K1.2:*s2:pl5:1C4,0:K2:*+C3,0:s14:pl15:s2:pl14:",
++"1/R0R]@r",
++"@iF4,5.6,7,9,10,11,12,13,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:",
++"C4,0:s14:pl7:s0:pl14:RN1:1s12:pl5:0<Z2:1ns12:pl5:ns5:pN2:l5:1",
++"=Z3:l2:K25:{Z4:K.7853981633974483096156608:l12:/RN4:l2:K40:{Z5:",
++"K.7853981633974483096156608458198757210492:l12:/RN5:l2:K60:{Z6:",
++"K.785398163397448309615660845819875721049292349843776455243736",
++":l12:/RN6:N3:l5:K.2:=Z7:l2:K25:{Z8:K.1973955598498807583700497",
++":l12:/RN8:l2:K40:{Z9:K.1973955598498807583700497651947902934475",
++":l12:/RN9:l2:K60:{Z10:K.197395559849880758370049765194790293447585103787852101517688",
++":l12:/RN10:N7:l2:s15:pl5:K.2:>Z11:l15:K5:+s2:pK.2:C4,0:s6:pN11:",
++"l15:K3:+s2:pN12:l5:K.2:>Z13:l10:1+s10:pl5:K.2:-1l5:K.2:*+/s5:",
++"pJ12:N13:l5:s13:s14:pl5:nl5:*s16:pK3:s11:pN15:1B16:J14:N17:l11:",
++"K2:+s11:pJ15:N16:l13:l16:*s13:l11:/s9:pl9:0=Z18:l15:s2:pl10:l6:",
++"*l14:+l12:/RN18:l14:l9:+s14:pJ17:N14:0R]@r",
++"@iF6,13,5.6,7,8,9,10,11,12,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl13:",
++"l5:C6,00:s14:pl7:s0:pl14:RN1:l2:s15:p0s2:pl13:1/s13:pl13:0<Z2:",
++"l13:ns13:pl13:K2:%1=Z3:1s12:pN3:N2:1s10:pK2:s11:pN5:l11:l13:{",
++"B6:J4:N7:l11:i11:pJ5:N6:l10:l11:*s10:pJ7:N4:K1.5:l15:*s2:pl5:",
++"l13:^K2:l13:^/l10:/s10:p1s9:s14:pl5:nl5:*K4:/s16:pK1.5:l15:*l10:",
++"cL+l10:cS-s2:p1s11:pN9:1B10:J8:N11:l11:i11:pJ9:N10:l9:l16:*l11:",
++"/l13:l11:+/s9:pl9:0=Z12:l15:s2:pl12:Z13:l10:nl14:*1/RN13:l10:",
++"l14:*1/RN12:l14:l9:+s14:pJ11:N8:0R]@r",0}
+-- 
+2.17.1
+
diff --git a/package/bc/01_array_initialize.patch b/package/bc/01_array_initialize.patch
deleted file mode 100644
index 9520d824af..0000000000
--- a/package/bc/01_array_initialize.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Description: Fix array initialization bug
-Author: Phil Nelson
-Origin: upstream
-Bug-Debian: http://bugs.debian.org/586969
-Bug-Debian: http://bugs.debian.org/671513
----
-This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
-Index: bc/bc/storage.c
-===================================================================
---- bc.orig/bc/storage.c	2013-06-02 20:34:09.401273864 -0400
-+++ bc/bc/storage.c	2013-06-02 20:34:11.000000000 -0400
-@@ -179,7 +179,7 @@
- 
- 
-   /* Initialize the new elements. */
--  for (; indx < v_count; indx++)
-+  for (; indx < a_count; indx++)
-     arrays[indx] = NULL;
- 
-   /* Free the old elements. */
diff --git a/package/bc/03_use_appropiate_makeinfo.patch b/package/bc/03_use_appropiate_makeinfo.patch
deleted file mode 100644
index e6f9262b09..0000000000
--- a/package/bc/03_use_appropiate_makeinfo.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Use the appropiate MAKEINFO variable rather than the hardcoded makeinfo
-command directly, otherwise missing logic never works.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura bc-1.06.95.orig/doc/Makefile.in bc-1.06.95/doc/Makefile.in
---- bc-1.06.95.orig/doc/Makefile.in	2015-06-13 09:39:46.946620294 -0300
-+++ bc-1.06.95/doc/Makefile.in	2015-06-13 09:40:10.019407630 -0300
-@@ -96,7 +96,7 @@
- LIBOBJS = @LIBOBJS@
- LIBS = @LIBS@
- LTLIBOBJS = @LTLIBOBJS@
--MAKEINFO = makeinfo --no-split
-+MAKEINFO = @MAKEINFO@ --no-split
- OBJEXT = @OBJEXT@
- PACKAGE = @PACKAGE@
- PACKAGE_BUGREPORT = @PACKAGE_BUGREPORT@
diff --git a/package/bc/bc.hash b/package/bc/bc.hash
index 5f1ed63536..6feca831d2 100644
--- a/package/bc/bc.hash
+++ b/package/bc/bc.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256 7ee4abbcfac03d8a6e1a8a3440558a3d239d6b858585063e745c760957725ecc  bc-1.06.95.tar.bz2
+sha256	62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a  bc-1.07.1.tar.gz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index ee0e43848b..afca0e8300 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-BC_VERSION = 1.06.95
-BC_SOURCE = bc-$(BC_VERSION).tar.bz2
-BC_SITE = http://alpha.gnu.org/gnu/bc
+BC_VERSION = 1.07.1
+BC_SOURCE = bc-$(BC_VERSION).tar.gz
+BC_SITE = http://ftp.gnu.org/gnu/bc
 BC_DEPENDENCIES = host-flex
 BC_LICENSE = GPL-2.0+, LGPL-2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
 
+# Need to reconf to fix automake-1.14: command not found
+BC_AUTORECONF = YES
+
 $(eval $(autotools-package))
-- 
2.17.1
