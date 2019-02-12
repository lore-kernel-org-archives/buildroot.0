From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Feb 2019 20:42:20 +0200
Subject: [Buildroot] [PATCH] package/ghostscript: add upstream security fixes
Message-ID: <e2baf8252ea41e27e6c874154851f2d4e6057bda.1549996940.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2019-6116: Remote code execution.

https://www.openwall.com/lists/oss-security/2019/01/23/5

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...nitize-op-stack-for-error-conditions.patch | 176 ++++++
 ...rocedures-that-call-.force-operators.patch | 441 +++++++++++++
 ...700317-Fix-logic-for-an-older-change.patch |  31 +
 ...Harden-some-uses-of-.force-operators.patch | 135 ++++
 ...-bunch-of-gs_fonts.ps-specific-procs.patch | 587 ++++++++++++++++++
 ....forcedef-and-harden-.force-ops-more.patch | 345 ++++++++++
 6 files changed, 1715 insertions(+)
 create mode 100644 package/ghostscript/0002-Sanitize-op-stack-for-error-conditions.patch
 create mode 100644 package/ghostscript/0003-Any-transient-procedures-that-call-.force-operators.patch
 create mode 100644 package/ghostscript/0004-Bug700317-Fix-logic-for-an-older-change.patch
 create mode 100644 package/ghostscript/0005-Harden-some-uses-of-.force-operators.patch
 create mode 100644 package/ghostscript/0006-Undefine-a-bunch-of-gs_fonts.ps-specific-procs.patch
 create mode 100644 package/ghostscript/0007-Remove-.forcedef-and-harden-.force-ops-more.patch

diff --git a/package/ghostscript/0002-Sanitize-op-stack-for-error-conditions.patch b/package/ghostscript/0002-Sanitize-op-stack-for-error-conditions.patch
new file mode 100644
index 000000000000..7909cfec70cb
--- /dev/null
+++ b/package/ghostscript/0002-Sanitize-op-stack-for-error-conditions.patch
@@ -0,0 +1,176 @@
+From a1de1e6ab51ab37a17975aad1193f2523e7e7e84 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 5 Dec 2018 12:22:13 +0000
+Subject: [PATCH] Sanitize op stack for error conditions
+
+We save the stacks to an array and store the array for the error handler to
+access.
+
+For SAFER, we traverse the array, and deep copy any op arrays (procedures). As
+we make these copies, we check for operators that do *not* exist in systemdict,
+when we find one, we replace the operator with a name object (of the form
+"/--opname--").
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 13b0a36f818
+
+ psi/int.mak  |  3 +-
+ psi/interp.c |  8 ++++++
+ psi/istack.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ psi/istack.h |  3 ++
+ 4 files changed, 91 insertions(+), 1 deletion(-)
+
+diff --git a/psi/int.mak b/psi/int.mak
+index 6ab5bf0069dd..6b349cb042dd 100644
+--- a/psi/int.mak
++++ b/psi/int.mak
+@@ -204,7 +204,8 @@ $(PSOBJ)iparam.$(OBJ) : $(PSSRC)iparam.c $(GH)\
+ $(PSOBJ)istack.$(OBJ) : $(PSSRC)istack.c $(GH) $(memory__h)\
+  $(ierrors_h) $(gsstruct_h) $(gsutil_h)\
+  $(ialloc_h) $(istack_h) $(istkparm_h) $(istruct_h) $(iutil_h) $(ivmspace_h)\
+- $(store_h) $(INT_MAK) $(MAKEDIRS)
++ $(store_h) $(icstate_h) $(iname_h) $(dstack_h) $(idict_h) \
++ $(INT_MAK) $(MAKEDIRS)
+ 	$(PSCC) $(PSO_)istack.$(OBJ) $(C_) $(PSSRC)istack.c
+ 
+ $(PSOBJ)iutil.$(OBJ) : $(PSSRC)iutil.c $(GH) $(math__h) $(memory__h) $(string__h)\
+diff --git a/psi/interp.c b/psi/interp.c
+index 6dc0ddae1b3c..aa5779c51420 100644
+--- a/psi/interp.c
++++ b/psi/interp.c
+@@ -761,6 +761,7 @@ copy_stack(i_ctx_t *i_ctx_p, const ref_stack_t * pstack, int skip, ref * arr)
+     uint size = ref_stack_count(pstack) - skip;
+     uint save_space = ialloc_space(idmemory);
+     int code, i;
++    ref *safety, *safe;
+ 
+     if (size > 65535)
+         size = 65535;
+@@ -778,6 +779,13 @@ copy_stack(i_ctx_t *i_ctx_p, const ref_stack_t * pstack, int skip, ref * arr)
+                 make_null(&arr->value.refs[i]);
+         }
+     }
++    if (pstack == &o_stack && dict_find_string(systemdict, "SAFETY", &safety) > 0 &&
++        dict_find_string(safety, "safe", &safe) > 0 && r_has_type(safe, t_boolean) &&
++        safe->value.boolval == true) {
++        code = ref_stack_array_sanitize(i_ctx_p, arr, arr);
++        if (code < 0)
++            return code;
++    }
+     ialloc_set_space(idmemory, save_space);
+     return code;
+ }
+diff --git a/psi/istack.c b/psi/istack.c
+index 8fe151fa5628..f1a3e511534d 100644
+--- a/psi/istack.c
++++ b/psi/istack.c
+@@ -27,6 +27,10 @@
+ #include "iutil.h"
+ #include "ivmspace.h"		/* for local/global test */
+ #include "store.h"
++#include "icstate.h"
++#include "iname.h"
++#include "dstack.h"
++#include "idict.h"
+ 
+ /* Forward references */
+ static void init_block(ref_stack_t *pstack, const ref *pblock_array,
+@@ -294,6 +298,80 @@ ref_stack_store_check(const ref_stack_t *pstack, ref *parray, uint count,
+     return 0;
+ }
+ 
++int
++ref_stack_array_sanitize(i_ctx_t *i_ctx_p, ref *sarr, ref *darr)
++{
++    int i, code;
++    ref obj, arr2;
++    ref *pobj2;
++    gs_memory_t *mem = (gs_memory_t *)idmemory->current;
++
++    if (!r_is_array(sarr) || !r_has_type(darr, t_array))
++        return_error(gs_error_typecheck);
++
++    for (i = 0; i < r_size(sarr); i++) {
++        code = array_get(mem, sarr, i, &obj);
++        if (code < 0)
++            make_null(&obj);
++        switch(r_type(&obj)) {
++          case t_operator:
++          {
++            int index = op_index(&obj);
++
++            if (index > 0 && index < op_def_count) {
++                const byte *data = (const byte *)(op_index_def(index)->oname + 1);
++                if (dict_find_string(systemdict, (const char *)data, &pobj2) <= 0) {
++                    byte *s = gs_alloc_bytes(mem, strlen((char *)data) + 5, "ref_stack_array_sanitize");
++                    if (s) {
++                        s[0] =  '\0';
++                        strcpy((char *)s, "--");
++                        strcpy((char *)s + 2, (char *)data);
++                        strcpy((char *)s + strlen((char *)data) + 2, "--");
++                    }
++                    else {
++                        s = (byte *)data;
++                    }
++                    code = name_ref(imemory, s, strlen((char *)s), &obj, 1);
++                    if (code < 0) make_null(&obj);
++                    if (s != data)
++                        gs_free_object(mem, s, "ref_stack_array_sanitize");
++                }
++            }
++            else {
++                make_null(&obj);
++            }
++            ref_assign(darr->value.refs + i, &obj);
++            break;
++          }
++          case t_array:
++          case t_shortarray:
++          case t_mixedarray:
++          {
++            int attrs = r_type_attrs(&obj) & (a_write | a_read | a_execute | a_executable);
++            /* We only want to copy executable arrays */
++            if (attrs & (a_execute | a_executable)) {
++                code = ialloc_ref_array(&arr2, attrs, r_size(&obj), "ref_stack_array_sanitize");
++                if (code < 0) {
++                    make_null(&arr2);
++                }
++                else {
++                    code = ref_stack_array_sanitize(i_ctx_p, &obj, &arr2);
++                }
++                ref_assign(darr->value.refs + i, &arr2);
++            }
++            else {
++                ref_assign(darr->value.refs + i, &obj);
++            }
++            break;
++          }
++          default:
++            ref_assign(darr->value.refs + i, &obj);
++        }
++    }
++    return 0;
++}
++
++
+ /*
+  * Store the top 'count' elements of a stack, starting 'skip' elements below
+  * the top, into an array, with or without store/undo checking.  age=-1 for
+diff --git a/psi/istack.h b/psi/istack.h
+index 051dcbe216cf..54be405adfb3 100644
+--- a/psi/istack.h
++++ b/psi/istack.h
+@@ -129,6 +129,9 @@ int ref_stack_store(const ref_stack_t *pstack, ref *parray, uint count,
+                     uint skip, int age, bool check,
+                     gs_dual_memory_t *idmem, client_name_t cname);
+ 
++int
++ref_stack_array_sanitize(i_ctx_t *i_ctx_p, ref *sarr, ref *darr);
++
+ /*
+  * Pop the top N elements off a stack.
+  * The number must not exceed the number of elements in use.
+-- 
+2.20.1
+
diff --git a/package/ghostscript/0003-Any-transient-procedures-that-call-.force-operators.patch b/package/ghostscript/0003-Any-transient-procedures-that-call-.force-operators.patch
new file mode 100644
index 000000000000..f4c1db11f0d9
--- /dev/null
+++ b/package/ghostscript/0003-Any-transient-procedures-that-call-.force-operators.patch
@@ -0,0 +1,441 @@
+From f0397dbfbe5eea325613ff375b30eb0db5551ffe Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Thu, 13 Dec 2018 15:28:34 +0000
+Subject: [PATCH] Any transient procedures that call .force* operators
+
+(i.e. for conditionals or loops) make them executeonly.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 2db98f9c661
+
+ Resource/Init/gs_diskn.ps |  2 +-
+ Resource/Init/gs_dps1.ps  |  4 ++--
+ Resource/Init/gs_fntem.ps |  4 ++--
+ Resource/Init/gs_fonts.ps | 12 ++++++------
+ Resource/Init/gs_init.ps  |  4 ++--
+ Resource/Init/gs_lev2.ps  | 11 ++++++-----
+ Resource/Init/gs_pdfwr.ps |  2 +-
+ Resource/Init/gs_res.ps   |  4 ++--
+ Resource/Init/gs_setpd.ps |  2 +-
+ Resource/Init/pdf_base.ps | 13 ++++++++-----
+ Resource/Init/pdf_draw.ps | 16 +++++++++-------
+ Resource/Init/pdf_font.ps |  6 +++---
+ Resource/Init/pdf_main.ps |  4 ++--
+ Resource/Init/pdf_ops.ps  |  7 ++++---
+ 14 files changed, 49 insertions(+), 42 deletions(-)
+
+diff --git a/Resource/Init/gs_diskn.ps b/Resource/Init/gs_diskn.ps
+index fd694bc44b5a..8bf20542040d 100644
+--- a/Resource/Init/gs_diskn.ps
++++ b/Resource/Init/gs_diskn.ps
+@@ -51,7 +51,7 @@ systemdict begin
+     mark 5 1 roll ] mark exch { { } forall } forall ]
+     //systemdict /.searchabledevs 2 index .forceput
+     exch .setglobal
+-  }
++  } executeonly
+   if
+ } .bind executeonly odef % must be bound and hidden for .forceput
+ 
+diff --git a/Resource/Init/gs_dps1.ps b/Resource/Init/gs_dps1.ps
+index ec5db61b9f03..4fae2839940c 100644
+--- a/Resource/Init/gs_dps1.ps
++++ b/Resource/Init/gs_dps1.ps
+@@ -78,7 +78,7 @@ level2dict begin
+    .currentglobal
+     {		% Current mode is global; delete from local directory too.
+       //systemdict /LocalFontDirectory .knownget
+-       { 1 index .forceundef }		% LocalFontDirectory is readonly
++       { 1 index .forceundef } executeonly		% LocalFontDirectory is readonly
+       if
+     }
+     {		% Current mode is local; if there was a shadowed global
+@@ -126,7 +126,7 @@ level2dict begin
+           }
+          ifelse
+        } forall
+-      pop counttomark 2 idiv { .forceundef } repeat pop		% readonly
++      pop counttomark 2 idiv { .forceundef } executeonly repeat pop		% readonly
+     }
+    if
+    //SharedFontDirectory exch .forcecopynew pop
+diff --git a/Resource/Init/gs_fntem.ps b/Resource/Init/gs_fntem.ps
+index c1f7651f18cc..6eb672a6840e 100644
+--- a/Resource/Init/gs_fntem.ps
++++ b/Resource/Init/gs_fntem.ps
+@@ -401,12 +401,12 @@ currentdict end def
+       .forceput % FontInfo can be read-only.
+       pop                                                        % bool <font>
+       exit
+-    } if
++    } executeonly if
+     dup /FontInfo get                                            % bool <font> <FI>
+     /GlyphNames2Unicode /Unicode /Decoding findresource
+     .forceput % FontInfo can be read-only.
+     exit
+-  } loop
++  } executeonly loop
+   exch setglobal
+ } .bind executeonly odef % must be bound and hidden for .forceput
+ 
+diff --git a/Resource/Init/gs_fonts.ps b/Resource/Init/gs_fonts.ps
+index 803faca4918d..290da0cd6819 100644
+--- a/Resource/Init/gs_fonts.ps
++++ b/Resource/Init/gs_fonts.ps
+@@ -374,7 +374,7 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+ /.setnativefontmapbuilt { % set whether we've been run
+   dup type /booleantype eq {
+       systemdict exch /.nativefontmapbuilt exch .forceput
+-  }
++  } executeonly
+   {pop}
+   ifelse
+ } .bind executeonly odef
+@@ -1007,11 +1007,11 @@ $error /SubstituteFont { } put
+ { 2 index gcheck currentglobal
+   2 copy eq {
+     pop pop .forceput
+-  } {
++  } executeonly {
+     5 1 roll setglobal
+     dup length string copy
+     .forceput setglobal
+-  } ifelse
++  } executeonly ifelse
+ } .bind executeonly odef % must be bound and hidden for .forceput
+ 
+ % Attempt to load a font from a file.
+@@ -1084,7 +1084,7 @@ $error /SubstituteFont { } put
+            .FontDirectory 3 index .forceundef		% readonly
+            1 index (r) file .loadfont .FontDirectory exch
+            /.setglobal .systemvar exec
+-         }
++         } executeonly
+          { .loadfont .FontDirectory
+          }
+         ifelse
+@@ -1105,7 +1105,7 @@ $error /SubstituteFont { } put
+         dup 3 index .fontknownget
+          { dup /PathLoad 4 index .putgstringcopy
+            4 1 roll pop pop pop //true exit
+-         } if
++         } executeonly if
+ 
+                 % Maybe the file had a different FontName.
+                 % See if we can get a FontName from the file, and if so,
+@@ -1134,7 +1134,7 @@ $error /SubstituteFont { } put
+               ifelse  % Stack: origfontname fontdict
+               exch pop //true exit
+                       % Stack: fontdict
+-            }
++            } executeonly
+            if pop % Stack: origfontname fontdirectory path
+          }
+         if pop pop  % Stack: origfontname
+diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
+index d733124b96d1..56c0bd268b53 100644
+--- a/Resource/Init/gs_init.ps
++++ b/Resource/Init/gs_init.ps
+@@ -2357,7 +2357,7 @@ SAFER { .setsafeglobal } if
+         % Update the copy of the user parameters.
+   mark .currentuserparams counttomark 2 idiv {
+     userparams 3 1 roll .forceput	% userparams is read-only
+-  } repeat pop
++  } executeonly repeat pop
+         % Turn on idiom recognition, if available.
+   currentuserparams /IdiomRecognition known {
+     /IdiomRecognition //true .definepsuserparam
+@@ -2376,7 +2376,7 @@ SAFER { .setsafeglobal } if
+         % Remove real system params from pssystemparams.
+   mark .currentsystemparams counttomark 2 idiv {
+     pop pssystemparams exch .forceundef
+-  } repeat pop
++  } executeonly repeat pop
+ } if
+ 
+ % Set up AlignToPixels :
+diff --git a/Resource/Init/gs_lev2.ps b/Resource/Init/gs_lev2.ps
+index 44fe61956659..0f0d57331c23 100644
+--- a/Resource/Init/gs_lev2.ps
++++ b/Resource/Init/gs_lev2.ps
+@@ -154,7 +154,8 @@ end
+       % protect top level of parameters that we copied
+       dup type dup /arraytype eq exch /stringtype eq or { readonly } if
+       /userparams .systemvar 3 1 roll .forceput  % userparams is read-only
+-    } {
++    } executeonly
++    {
+       pop pop
+     } ifelse
+   } forall
+@@ -224,7 +225,7 @@ end
+          % protect top level parameters that we copied
+          dup type dup /arraytype eq exch /stringtype eq or { readonly } if
+          //pssystemparams 3 1 roll .forceput	% pssystemparams is read-only
+-       }
++       } executeonly
+        { pop pop
+        }
+       ifelse
+@@ -934,7 +935,7 @@ mark
+   dup /PaintProc get
+   1 index /Implementation known not {
+     1 index dup /Implementation //null .forceput readonly pop
+-  } if
++  } executeonly if
+   exec
+ }.bind odef
+ 
+@@ -958,7 +959,7 @@ mark
+   dup /PaintProc get
+   1 index /Implementation known not {
+     1 index dup /Implementation //null .forceput readonly pop
+-  } if
++  } executeonly if
+   /UNROLLFORMS where {/UNROLLFORMS get}{false}ifelse not
+   %% [CTM] <<Form>> PaintProc .beginform -
+   {
+@@ -1005,7 +1006,7 @@ mark
+         %% Form dictioanry using the /Implementation key).
+         1 dict dup /FormID 4 -1 roll put
+         1 index exch /Implementation exch .forceput readonly pop
+-      }
++      } executeonly
+       ifelse
+     }
+     {
+diff --git a/Resource/Init/gs_pdfwr.ps b/Resource/Init/gs_pdfwr.ps
+index 58e75d3a4831..b425103d1cf3 100644
+--- a/Resource/Init/gs_pdfwr.ps
++++ b/Resource/Init/gs_pdfwr.ps
+@@ -650,7 +650,7 @@ currentdict /.pdfmarkparams .undef
+             } ifelse
+           } bind .makeoperator .forceput
+           systemdict /.pdf_hooked_DSC_Creator //true .forceput
+-        } if
++        } executeonly if
+         pop
+       } if
+     } {
+diff --git a/Resource/Init/gs_res.ps b/Resource/Init/gs_res.ps
+index 8eb8bb0e5829..d9b34599e7c2 100644
+--- a/Resource/Init/gs_res.ps
++++ b/Resource/Init/gs_res.ps
+@@ -152,7 +152,7 @@ setglobal
+                 % use .forceput / .forcedef later to replace the dummy,
+                 % empty .Instances dictionary with the real one later.
+           readonly
+-        } {
++        }{
+           /defineresource cvx /typecheck signaloperror
+         } ifelse
+ } bind executeonly odef
+@@ -424,7 +424,7 @@ status {
+                         % As noted above, Category dictionaries are read-only,
+                         % so we have to use .forcedef here.
+                   /.Instances 1 index .forcedef	% Category dict is read-only
+-                } if
++                } executeonly if
+               }
+               { .LocalInstances dup //.emptydict eq
+                  { pop 3 dict localinstancedict Category 2 index put
+diff --git a/Resource/Init/gs_setpd.ps b/Resource/Init/gs_setpd.ps
+index e22597ebb5f3..7875d1f2f131 100644
+--- a/Resource/Init/gs_setpd.ps
++++ b/Resource/Init/gs_setpd.ps
+@@ -634,7 +634,7 @@ NOMEDIAATTRS {
+   SETPDDEBUG { (Rolling back.) = pstack flush } if
+   3 index 2 index 3 -1 roll .forceput
+   4 index 1 index .knownget
+-  { 4 index 3 1 roll .forceput }
++  { 4 index 3 1 roll .forceput } executeonly
+   { 3 index exch .undef }
+   ifelse
+ } bind executeonly odef
+diff --git a/Resource/Init/pdf_base.ps b/Resource/Init/pdf_base.ps
+index b45e9803165e..73127296c221 100644
+--- a/Resource/Init/pdf_base.ps
++++ b/Resource/Init/pdf_base.ps
+@@ -130,26 +130,29 @@ currentdict /num-chars-dict .undef
+ 
+ /.pdfexectoken {		% <count> <opdict> <exectoken> .pdfexectoken ?
+   PDFDEBUG {
+-    pdfdict /PDFSTEPcount known not { pdfdict /PDFSTEPcount 1 .forceput } if
++    pdfdict /PDFSTEPcount known not { pdfdict /PDFSTEPcount 1 .forceput } executeonly if
+     PDFSTEP {
+       pdfdict /PDFtokencount 2 copy .knownget { 1 add } { 1 } ifelse .forceput
+       PDFSTEPcount 1 gt {
+         pdfdict /PDFSTEPcount PDFSTEPcount 1 sub .forceput
+-      } {
++      } executeonly
++      {
+         dup ==only
+         (    step # ) print PDFtokencount =only
+         ( ? ) print flush 1 //false .outputpage
+         (%stdin) (r) file 255 string readline {
+           token {
+             exch pop pdfdict /PDFSTEPcount 3 -1 roll .forceput
+-          } {
++          } executeonly
++          {
+             pdfdict /PDFSTEPcount 1 .forceput
+-          } ifelse % token
++          } executeonly ifelse % token
+         } {
+           pop /PDFSTEP //false def	 % EOF on stdin
+         } ifelse % readline
+       } ifelse % PDFSTEPcount > 1
+-    } {
++    } executeonly
++    {
+       dup ==only () = flush
+     } ifelse % PDFSTEP
+   } if % PDFDEBUG
+diff --git a/Resource/Init/pdf_draw.ps b/Resource/Init/pdf_draw.ps
+index 6b0ba93e1e73..40c6ac80acce 100644
+--- a/Resource/Init/pdf_draw.ps
++++ b/Resource/Init/pdf_draw.ps
+@@ -1118,14 +1118,14 @@ currentdict end readonly def
+           pdfdict /.Qqwarning_issued //true .forceput
+           .setglobal
+           pdfformaterror
+-        } ifelse
++        } executeonly ifelse
+       }
+       {
+         currentglobal pdfdict gcheck .setglobal
+         pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+-      } ifelse
++      } executeonly ifelse
+       end
+     } ifelse
+   } loop
+@@ -1141,14 +1141,14 @@ currentdict end readonly def
+         pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+-      } ifelse
++      } executeonly ifelse
+     }
+     {
+       currentglobal pdfdict gcheck .setglobal
+       pdfdict /.Qqwarning_issued //true .forceput
+       .setglobal
+       pdfformaterror
+-    } ifelse
++    } executeonly ifelse
+   } if
+   pop
+ 
+@@ -2350,9 +2350,10 @@ currentdict /last-ditch-bpc-csp undef
+ /IncrementAppearanceNumber {
+   pdfdict /AppearanceNumber .knownget {
+     1 add pdfdict /AppearanceNumber 3 -1 roll .forceput
+-  }{
++  } executeonly
++  {
+     pdfdict /AppearanceNumber 0 .forceput
+-  } ifelse
++  } executeonly ifelse
+ }bind executeonly odef
+ 
+ /MakeAppearanceName {
+@@ -2510,7 +2511,8 @@ currentdict /last-ditch-bpc-csp undef
+     %% want to preserve it.
+     pdfdict /.PreservePDFForm false .forceput
+     /q cvx /execform cvx 5 -2 roll
+-  }{
++  } executeonly
++  {
+     /q cvx /PDFexecform cvx 5 -2 roll
+   } ifelse
+ 
+diff --git a/Resource/Init/pdf_font.ps b/Resource/Init/pdf_font.ps
+index bea9ea95ad1d..4cd62b9d9bb4 100644
+--- a/Resource/Init/pdf_font.ps
++++ b/Resource/Init/pdf_font.ps
+@@ -714,7 +714,7 @@ currentdict end readonly def
+     pop pop pop
+     currentdict /.stackdepth .forceundef
+     currentdict /.dstackdepth .forceundef
+-  }
++  } executeonly
+   {pop pop pop}
+   ifelse
+ 
+@@ -1232,7 +1232,7 @@ currentdict /eexec_pdf_param_dict .undef
+                 (\n   **** Warning: Type 3 glyph has unbalanced q/Q operators \(too many q's\)\n               Output may be incorrect.\n)
+                 pdfformatwarning
+                 pdfdict /.Qqwarning_issued //true .forceput
+-              } if
++              } executeonly if
+               Q
+             } repeat
+             Q
+@@ -2016,7 +2016,7 @@ currentdict /CMap_read_dict undef
+               /CIDFallBack /CIDFont findresource
+             } if
+             exit
+-          } if
++          } executeonly if
+         } if
+       } if
+ 
+diff --git a/Resource/Init/pdf_main.ps b/Resource/Init/pdf_main.ps
+index 00da47a48711..37e69b39ac98 100644
+--- a/Resource/Init/pdf_main.ps
++++ b/Resource/Init/pdf_main.ps
+@@ -2701,14 +2701,14 @@ currentdict /PDF2PS_matrix_key undef
+           pdfdict /.Qqwarning_issued //true .forceput
+           .setglobal
+           pdfformaterror
+-        } ifelse
++        } executeonly ifelse
+       }
+       {
+         currentglobal pdfdict gcheck .setglobal
+         pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+-      } ifelse
++      } executeonly ifelse
+     } if
+   } if
+   pop
+diff --git a/Resource/Init/pdf_ops.ps b/Resource/Init/pdf_ops.ps
+index 8672d617f363..aa0964139a56 100644
+--- a/Resource/Init/pdf_ops.ps
++++ b/Resource/Init/pdf_ops.ps
+@@ -184,14 +184,14 @@ currentdict /gput_always_allow .undef
+         pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+-      } ifelse
++      } executeonly ifelse
+     }
+     {
+       currentglobal pdfdict gcheck .setglobal
+       pdfdict /.Qqwarning_issued //true .forceput
+       .setglobal
+       pdfformaterror
+-    } ifelse
++    } executeonly ifelse
+   } if
+ } bind executeonly odef
+ 
+@@ -439,7 +439,8 @@ currentdict /gput_always_allow .undef
+   dup type /booleantype eq {
+     .currentSMask type /dicttype eq {
+       .currentSMask /Processed 2 index .forceput
+-    } {
++  } executeonly
++  {
+       .setSMask
+   }ifelse
+   }{
+-- 
+2.20.1
+
diff --git a/package/ghostscript/0004-Bug700317-Fix-logic-for-an-older-change.patch b/package/ghostscript/0004-Bug700317-Fix-logic-for-an-older-change.patch
new file mode 100644
index 000000000000..65ebd44df2d9
--- /dev/null
+++ b/package/ghostscript/0004-Bug700317-Fix-logic-for-an-older-change.patch
@@ -0,0 +1,31 @@
+From af9a9dceb7be7df743d55c4d078a1ae846b6f556 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Sat, 15 Dec 2018 09:08:32 +0000
+Subject: [PATCH] Bug700317: Fix logic for an older change
+
+Unlike almost every other function in gs, dict_find_string() returns 1 on
+success 0 or <0 on failure. The logic for this case was wrong.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 99f13091a3
+
+ psi/interp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/psi/interp.c b/psi/interp.c
+index aa5779c51420..f6c45bbe24dc 100644
+--- a/psi/interp.c
++++ b/psi/interp.c
+@@ -703,7 +703,7 @@ again:
+                  * i.e. it's an internal operator we have hidden
+                  */
+                 code = dict_find_string(systemdict, (const char *)bufptr, &tobj);
+-                if (code < 0) {
++                if (code <= 0) {
+                     buf[0] = buf[1] = buf[rlen + 2] = buf[rlen + 3] = '-';
+                     rlen += 4;
+                     bufptr = buf;
+-- 
+2.20.1
+
diff --git a/package/ghostscript/0005-Harden-some-uses-of-.force-operators.patch b/package/ghostscript/0005-Harden-some-uses-of-.force-operators.patch
new file mode 100644
index 000000000000..f5a70ac467c1
--- /dev/null
+++ b/package/ghostscript/0005-Harden-some-uses-of-.force-operators.patch
@@ -0,0 +1,135 @@
+From b197ea0e528c20b7ee67785c50b4e06e0aa990f8 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 18 Dec 2018 10:42:10 +0000
+Subject: [PATCH] Harden some uses of .force* operators
+
+by adding a few immediate evalutions
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 59d8f4deef90
+
+ Resource/Init/gs_dps1.ps  |  4 ++--
+ Resource/Init/gs_fonts.ps | 20 ++++++++++----------
+ Resource/Init/gs_init.ps  |  6 +++---
+ 3 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/Resource/Init/gs_dps1.ps b/Resource/Init/gs_dps1.ps
+index 4fae2839940c..b75ea14e77a3 100644
+--- a/Resource/Init/gs_dps1.ps
++++ b/Resource/Init/gs_dps1.ps
+@@ -74,7 +74,7 @@ level2dict begin
+  } odef
+ % undefinefont has to take local/global VM into account.
+ /undefinefont		% <fontname> undefinefont -
+- { .FontDirectory 1 .argindex .forceundef	% FontDirectory is readonly
++ { //.FontDirectory 1 .argindex .forceundef	% FontDirectory is readonly
+    .currentglobal
+     {		% Current mode is global; delete from local directory too.
+       //systemdict /LocalFontDirectory .knownget
+@@ -85,7 +85,7 @@ level2dict begin
+                 % definition, copy it into the local directory.
+       //systemdict /SharedFontDirectory .knownget
+        { 1 index .knownget
+-          { .FontDirectory 2 index 3 -1 roll { put } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse } % readonly
++          { //.FontDirectory 2 index 3 -1 roll { put } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse } % readonly
+          if
+        }
+       if
+diff --git a/Resource/Init/gs_fonts.ps b/Resource/Init/gs_fonts.ps
+index 290da0cd6819..c13a2fcc2d43 100644
+--- a/Resource/Init/gs_fonts.ps
++++ b/Resource/Init/gs_fonts.ps
+@@ -516,7 +516,7 @@ buildfontdict 3 /.buildfont3 cvx put
+       if
+     }
+    if
+-   dup .FontDirectory 4 -2 roll { .growput } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse	% readonly
++   dup //.FontDirectory 4 -2 roll { .growput } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse	% readonly
+                 % If the font originated as a resource, register it.
+    currentfile .currentresourcefile eq { dup .registerfont } if
+    readonly
+@@ -943,7 +943,7 @@ $error /SubstituteFont { } put
+ % Try to find a font using only the present contents of Fontmap.
+ /.tryfindfont {         % <fontname> .tryfindfont <font> true
+                         % <fontname> .tryfindfont false
+-  .FontDirectory 1 index .fontknownget
++  //.FontDirectory 1 index .fontknownget
+     {                   % Already loaded
+       exch pop //true
+     }
+@@ -975,7 +975,7 @@ $error /SubstituteFont { } put
+                {                % Font with a procedural definition
+                  exec           % The procedure will load the font.
+                                 % Check to make sure this really happened.
+-                 .FontDirectory 1 index .knownget
++                 //.FontDirectory 1 index .knownget
+                   { exch pop //true exit }
+                  if
+                }
+@@ -1081,11 +1081,11 @@ $error /SubstituteFont { } put
+                 % because it's different depending on language level.
+            .currentglobal exch /.setglobal .systemvar exec
+                 % Remove the fake definition, if any.
+-           .FontDirectory 3 index .forceundef		% readonly
+-           1 index (r) file .loadfont .FontDirectory exch
++           //.FontDirectory 3 index .forceundef		% readonly
++           1 index (r) file .loadfont //.FontDirectory exch
+            /.setglobal .systemvar exec
+          } executeonly
+-         { .loadfont .FontDirectory
++         { .loadfont //.FontDirectory
+          }
+         ifelse
+                 % Stack: fontname fontfilename fontdirectory
+@@ -1119,8 +1119,8 @@ $error /SubstituteFont { } put
+                       % Stack: origfontname fontdirectory filefontname fontdict
+               3 -1 roll pop
+                       % Stack: origfontname filefontname fontdict
+-              dup /FontName get dup FontDirectory exch .forceundef
+-              GlobalFontDirectory exch .forceundef
++              dup /FontName get dup //.FontDirectory exch .forceundef
++              /GlobalFontDirectory .systemvar exch .forceundef
+               dup length dict .copydict dup 3 index /FontName exch put
+               2 index exch definefont
+               exch
+@@ -1176,10 +1176,10 @@ currentdict /.putgstringcopy .undef
+       {
+         {
+           pop dup type /stringtype eq { cvn } if
+-          .FontDirectory 1 index known not {
++          //.FontDirectory 1 index known not {
+             2 dict dup /FontName 3 index put
+             dup /FontType 1 put
+-            .FontDirectory 3 1 roll { put } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse   % readonly
++            //.FontDirectory 3 1 roll { put } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse   % readonly
+           } {
+             pop
+           } ifelse
+diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
+index 56c0bd268b53..d9a0829f7f97 100644
+--- a/Resource/Init/gs_init.ps
++++ b/Resource/Init/gs_init.ps
+@@ -1168,8 +1168,8 @@ errordict /unknownerror .undef
+     }ifelse
+   }forall
+   noaccess pop
+-  systemdict /.setsafeerrors .forceundef
+-  systemdict /.SAFERERRORLIST .forceundef
++  //systemdict /.setsafeerrors .forceundef
++  //systemdict /.SAFERERRORLIST .forceundef
+ } bind executeonly odef
+ 
+ SAFERERRORS {.setsafererrors} if
+@@ -2114,7 +2114,7 @@ currentdict /tempfilepaths undef
+ 
+ /.locksafe {
+   .locksafe_userparams
+-  systemdict /getenv {pop //false} .forceput
++  //systemdict /getenv {pop //false} .forceput
+   % setpagedevice has the side effect of clearing the page, but
+   % we will just document that. Using setpagedevice keeps the device
+   % properties and pagedevice .LockSafetyParams in agreement even
+-- 
+2.20.1
+
diff --git a/package/ghostscript/0006-Undefine-a-bunch-of-gs_fonts.ps-specific-procs.patch b/package/ghostscript/0006-Undefine-a-bunch-of-gs_fonts.ps-specific-procs.patch
new file mode 100644
index 000000000000..4bbdef9dd126
--- /dev/null
+++ b/package/ghostscript/0006-Undefine-a-bunch-of-gs_fonts.ps-specific-procs.patch
@@ -0,0 +1,587 @@
+From 5628be1c41d23298aa5fce2f6dd48e2eb81f4be1 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 9 Jan 2019 14:24:07 +0000
+Subject: [PATCH] Undefine a bunch of gs_fonts.ps specific procs
+
+Also reorder and add some immediate evaluation, so it still works with the
+undefining.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 2768d1a6dddb
+
+ Resource/Init/gs_dps1.ps  |   3 +-
+ Resource/Init/gs_fonts.ps | 275 +++++++++++++++++++++-----------------
+ Resource/Init/gs_res.ps   |   6 +-
+ 3 files changed, 156 insertions(+), 128 deletions(-)
+
+diff --git a/Resource/Init/gs_dps1.ps b/Resource/Init/gs_dps1.ps
+index b75ea14e77a3..8700c8cb304b 100644
+--- a/Resource/Init/gs_dps1.ps
++++ b/Resource/Init/gs_dps1.ps
+@@ -67,7 +67,8 @@ level2dict begin
+ 
+ /selectfont		% <fontname> <size> selectfont -
+  {
+-   { 1 .argindex findfont
++   {
++     1 .argindex findfont
+      1 index dup type /arraytype eq { makefont } { scalefont } ifelse
+      setfont pop pop
+    } stopped { /selectfont .systemvar $error /errorname get signalerror } if
+diff --git a/Resource/Init/gs_fonts.ps b/Resource/Init/gs_fonts.ps
+index c13a2fcc2d43..056223544340 100644
+--- a/Resource/Init/gs_fonts.ps
++++ b/Resource/Init/gs_fonts.ps
+@@ -100,7 +100,7 @@ userdict /.nativeFontmap .FontDirectory maxlength dict put
+        { 2 index token not
+           { (Fontmap entry for ) print 1 index =only
+             ( ends prematurely!  Giving up.) = flush
+-            {.loadFontmap} 0 get 1 .quit
++            {//.loadFontmap exec} 0 get 1 .quit
+           } if
+          dup /; eq { pop 3 index 3 1 roll .growput exit } if
+          pop
+@@ -202,6 +202,14 @@ NOFONTPATH { /FONTPATH () def } if
+  { pop }
+  { /FONTPATH (GS_FONTPATH) getenv not { () } if def }
+ ifelse
++
++% The following are dummy definitions that, if we have a FONTPATH, will
++% be replaced in the following section.
++% They are here so immediately evaulation will work, and allow them to
++% undefined at the bottom of the file.
++/.scanfontbegin{} bind def
++/.scanfontdir {} bind def
++
+ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+ /FONTPATH [ FONTPATH .pathlist ] def
+ 
+@@ -242,12 +250,12 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+ /.scanfontbegin
+  {      % Construct the table of all file names already in Fontmap.
+    currentglobal //true setglobal
+-   .scanfontdict dup maxlength Fontmap length 2 add .max .setmaxlength
++   //.scanfontdict dup maxlength Fontmap length 2 add .max .setmaxlength
+    Fontmap
+     { exch pop
+        { dup type /stringtype eq
+-          { .splitfilename pop .fonttempstring copy .lowerstring cvn
+-            .scanfontdict exch //true put
++          { //.splitfilename exec pop //.fonttempstring copy //.lowerstring exec cvn
++            //.scanfontdict exch //true put
+           }
+           { pop
+           }
+@@ -280,9 +288,9 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+   /txt //true
+ .dicttomark def
+ /.scan1fontstring 8192 string def
+-% %%BeginFont: is not per Adobe documentation, but a few fonts have it.
++% BeginFont: is not per Adobe documentation, but a few fonts have it.
+ /.scanfontheaders [(%!PS-Adobe*) (%!FontType*) (%%BeginFont:*)] def
+-0 .scanfontheaders { length .max } forall 6 add % extra for PFB header
++0 //.scanfontheaders { length .max } forall 6 add % extra for PFB header
+ /.scan1fontfirst exch string def
+ /.scanfontdir           % <dirname> .scanfontdir -
+  { currentglobal exch //true setglobal
+@@ -291,10 +299,10 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+    0 0 0 4 -1 roll      % found scanned files
+     {           % stack: <fontcount> <scancount> <filecount> <filename>
+       exch 1 add exch                   % increment filecount
+-      dup .splitfilename .fonttempstring copy .lowerstring
++      dup //.splitfilename exec //.fonttempstring copy //.lowerstring exec
+                 % stack: <fontcount> <scancount> <filecount+1> <filename>
+                 %       <BASE> <ext>
+-      .scanfontskip exch known exch .scanfontdict exch known or
++      //.scanfontskip exch known exch //.scanfontdict exch known or
+        { pop
+                 % stack: <fontcount> <scancount> <filecount+1>
+        }
+@@ -309,7 +317,7 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+                 % On some platforms, the file operator will open directories,
+                 % but an error will occur if we try to read from one.
+                 % Handle this possibility here.
+-            dup .scan1fontfirst { readstring } .internalstopped
++            dup //.scan1fontfirst { readstring } .internalstopped
+              { pop pop () }
+              { pop }
+             ifelse
+@@ -322,7 +330,7 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+           { dup length 6 sub 6 exch getinterval }
+          if
+                 % Check for font file headers.
+-         //false .scanfontheaders
++         //false //.scanfontheaders
+           { 2 index exch .stringmatch or
+           }
+          forall exch pop
+@@ -335,7 +343,7 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+                 { exch copystring exch
+                   DEBUG { ( ) print dup =only flush } if
+                   1 index .definenativefontmap
+-                  .splitfilename pop //true .scanfontdict 3 1 roll .growput
++                  //.splitfilename exec pop //true //.scanfontdict 3 1 roll .growput
+                         % Increment fontcount.
+                   3 -1 roll 1 add 3 1 roll
+                 }
+@@ -352,7 +360,7 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+        }
+       ifelse
+     }
+-   .scan1fontstring filenameforall
++   //.scan1fontstring filenameforall
+    QUIET
+     { pop pop pop }
+     { ( ) print =only ( files, ) print =only ( scanned, ) print
+@@ -422,7 +430,6 @@ systemdict /NONATIVEFONTMAP known .setnativefontmapbuilt
+     //true .setnativefontmapbuilt
+   } ifelse
+ } bind def
+-currentdict /.setnativefontmapbuilt .forceundef
+ 
+ % Create the dictionary that registers the .buildfont procedure
+ % (called by definefont) for each FontType.
+@@ -526,7 +533,8 @@ buildfontdict 3 /.buildfont3 cvx put
+ % We use this only for explicitly aliased fonts, not substituted fonts:
+ % we think this matches the observed behavior of Adobe interpreters.
+ /.aliasfont             % <name> <font> .aliasfont <newFont>
+- { .currentglobal 3 1 roll dup .gcheck .setglobal
++ {
++   currentglobal 3 1 roll dup gcheck setglobal
+                              % <bool> <name> <font>
+    dup length 2 add dict     % <bool> <name> <font> <dict>
+    dup 3 -1 roll             % <bool> <name> <dict> <dict> <font>
+@@ -541,7 +549,7 @@ buildfontdict 3 /.buildfont3 cvx put
+                 % whose FontName is a local non-string, if someone passed a
+                 % garbage value to findfont.  In this case, just don't
+                 % call definefont at all.
+-   2 index dup type /stringtype eq exch .gcheck or 1 index .gcheck not or
++    2 index dup type /stringtype eq exch gcheck or 1 index gcheck not or
+     { pop                              % <bool> <name> <dict>
+       1 index dup type /stringtype eq { cvn } if
+                                        % <bool> <name> <dict> <name1>
+@@ -566,10 +574,11 @@ buildfontdict 3 /.buildfont3 cvx put
+                 % Don't bind in definefont, since Level 2 redefines it.
+       /definefont .systemvar exec
+     }
+-    { /findfont cvx {.completefont} .errorexec pop exch pop
++    {
++      /findfont cvx {.completefont} //.errorexec exec pop exch pop
+     }
+    ifelse
+-   exch .setglobal
++   exch setglobal
+  } odef         % so findfont will bind it
+ 
+ % Define .loadfontfile for loading a font.  If we recognize Type 1 and/or
+@@ -669,10 +678,19 @@ buildfontdict 3 /.buildfont3 cvx put
+   [(Cn) 4] [(Cond) 4] [(Narrow) 4] [(Pkg) 4] [(Compr) 4]
+   [(Serif) 8] [(Sans) -8]
+ ] readonly def
++
++/.fontnamestring {              % <fontname> .fontnamestring <string|name>
++  dup type dup /nametype eq {
++    pop .namestring
++  } {
++    /stringtype ne { pop () } if
++  } ifelse
++} bind def
++
+ /.fontnameproperties {          % <int> <string|name> .fontnameproperties
+                                 %   <int'>
+-  .fontnamestring
+-  .substituteproperties {
++  //.fontnamestring exec
++  //.substituteproperties {
+     2 copy 0 get search {
+       pop pop pop dup length 1 sub 1 exch getinterval 3 -1 roll exch {
+         dup 0 ge { or } { neg not and } ifelse
+@@ -710,13 +728,7 @@ buildfontdict 3 /.buildfont3 cvx put
+                                 % <other> .nametostring <other>
+   dup type /nametype eq { .namestring } if
+ } bind def
+-/.fontnamestring {              % <fontname> .fontnamestring <string|name>
+-  dup type dup /nametype eq {
+-    pop .namestring
+-  } {
+-    /stringtype ne { pop () } if
+-  } ifelse
+-} bind def
++
+ /.substitutefontname {          % <fontname> <properties> .substitutefontname
+                                 %   <altname|null>
+         % Look for properties and/or a face name in the font name.
+@@ -724,7 +736,7 @@ buildfontdict 3 /.buildfont3 cvx put
+         % base font; otherwise, use the default font.
+         % Note that the "substituted" font name may be the same as
+         % the requested one; the caller must check this.
+-  exch .fontnamestring {
++  exch //.fontnamestring exec {
+     defaultfontname /Helvetica-Oblique /Helvetica-Bold /Helvetica-BoldOblique
+     /Helvetica-Narrow /Helvetica-Narrow-Oblique
+     /Helvetica-Narrow-Bold /Helvetica-Narrow-BoldOblique
+@@ -734,12 +746,12 @@ buildfontdict 3 /.buildfont3 cvx put
+   } 3 1 roll
+         % Stack: facelist properties fontname
+         % Look for a face name.
+-  .substitutefaces {
++  //.substitutefaces {
+     2 copy 0 get search {
+       pop pop pop
+         % Stack: facelist properties fontname [(pattern) family properties]
+       dup 2 get 4 -1 roll or 3 1 roll
+-      1 get .substitutefamilies exch get
++      1 get //.substitutefamilies exch get
+       4 -1 roll pop 3 1 roll
+     } {
+       pop pop
+@@ -748,7 +760,7 @@ buildfontdict 3 /.buildfont3 cvx put
+   1 index length mod get exec
+ } bind def
+ /.substitutefont {              % <fontname> .substitutefont <altname>
+-  dup 0 exch .fontnameproperties .substitutefontname
++  dup 0 exch //.fontnameproperties exec .substitutefontname
+         % Only accept fonts known in the Fontmap.
+    Fontmap 1 index known not
+    {
+@@ -814,7 +826,7 @@ FAKEFONTS not { (%END FAKEFONTS) .skipeof } if
+   counttomark 1 sub { .aliasfont } repeat end
+                       % <fontname> mark <font>
+   exch pop exch pop
+-} odef
++} bind odef
+ /findfont {
+   .findfont
+ } bind def
+@@ -860,7 +872,7 @@ FAKEFONTS not { (%END FAKEFONTS) .skipeof } if
+       } {
+         dup .substitutefont
+         2 copy eq { pop defaultfontname } if
+-        .checkalias
++        //.checkalias exec
+         QUIET not {
+           SHORTERRORS {
+             (%%[) print 1 index =only
+@@ -886,8 +898,8 @@ $error /SubstituteFont { } put
+   //null 0 1 FONTPATH length 1 sub {
+     FONTPATH 1 index get //null ne { exch pop exit } if pop
+   } for dup //null ne {
+-    dup 0 eq { .scanfontbegin } if
+-    FONTPATH 1 index get .scanfontdir
++    dup 0 eq { //.scanfontbegin exec} if
++    FONTPATH 1 index get //.scanfontdir exec
+     FONTPATH exch //null put //true
+   } {
+     pop //false
+@@ -897,11 +909,10 @@ $error /SubstituteFont { } put
+ % scanning of FONTPATH.
+ /.dofindfont {   %  mark <fontname> .dofindfont % mark <alias> ... <font>
+   .tryfindfont not {
+-
+                         % We didn't find the font.  If we haven't scanned
+                         % all the directories in FONTPATH, scan the next one
+                         % now and look for the font again.
+-    .scannextfontdir {
++    //.scannextfontdir exec {
+                         % Start over with an empty alias list.
+       counttomark 1 sub { pop } repeat    % mark <fontname>
+       .dofindfont
+@@ -927,6 +938,7 @@ $error /SubstituteFont { } put
+         } if
+                         % Substitute for the font.  Don't alias.
+                         % Same stack as at the beginning of .dofindfont.
++
+         $error /SubstituteFont get exec
+                          %
+                          % igorm: I guess the surrounding code assumes that .stdsubstfont
+@@ -935,72 +947,11 @@ $error /SubstituteFont { } put
+                          % used in .dofindfont and through .stdsubstfont
+                          % just to represent a simple iteration,
+                          % which accumulates the aliases after the mark.
+-        .stdsubstfont
++        //.stdsubstfont exec
+       } ifelse
+     } ifelse
+   } if
+ } bind def
+-% Try to find a font using only the present contents of Fontmap.
+-/.tryfindfont {         % <fontname> .tryfindfont <font> true
+-                        % <fontname> .tryfindfont false
+-  //.FontDirectory 1 index .fontknownget
+-    {                   % Already loaded
+-      exch pop //true
+-    }
+-    {
+-       dup Fontmap exch .knownget
+-       { //true //true }
+-       {                % Unknown font name.  Look for a file with the
+-                        % same name as the requested font.
+-         dup .tryloadfont
+-         { exch pop //true //false }
+-         {
+-           % if we can't load by name check the native font map
+-           dup .nativeFontmap exch .knownget
+-           { //true //true }
+-           { //false //false } ifelse
+-         } ifelse
+-       } ifelse
+-
+-       {                % Try each element of the Fontmap in turn.
+-         pop
+-         //false exch   % (in case we exhaust the list)
+-                        % Stack: fontname false fontmaplist
+-         { exch pop
+-           dup type /nametype eq
+-            {                   % Font alias
+-              .checkalias .tryfindfont exit
+-            }
+-            { dup dup type dup /arraytype eq exch /packedarraytype eq or exch xcheck and
+-               {                % Font with a procedural definition
+-                 exec           % The procedure will load the font.
+-                                % Check to make sure this really happened.
+-                 //.FontDirectory 1 index .knownget
+-                  { exch pop //true exit }
+-                 if
+-               }
+-               {                % Font file name
+-                 //true .loadfontloop { //true exit } if
+-               }
+-              ifelse
+-            }
+-           ifelse //false
+-         }
+-         forall
+-                        % Stack: font true -or- fontname false
+-         { //true
+-         }
+-         {                      % None of the Fontmap entries worked.
+-                                % Try loading a file with the same name
+-                                % as the requested font.
+-           .tryloadfont
+-         }
+-        ifelse
+-       }
+-      if
+-    }
+-   ifelse
+- } bind def
+ 
+ % any user of .putgstringcopy must use bind and executeonly
+ /.putgstringcopy  %   <dict> <name> <string> .putgstringcopy -
+@@ -1014,25 +965,6 @@ $error /SubstituteFont { } put
+   } executeonly ifelse
+ } .bind executeonly odef % must be bound and hidden for .forceput
+ 
+-% Attempt to load a font from a file.
+-/.tryloadfont {         % <fontname> .tryloadfont <font> true
+-                        % <fontname> .tryloadfont false
+-  dup .nametostring
+-                % Hack: check for the presence of the resource machinery.
+-  /.genericrfn where {
+-    pop
+-    pop dup .fonttempstring /FontResourceDir getsystemparam .genericrfn
+-    {//false .loadfontloop} .internalstopped {//false} if {
+-      //true
+-    } {
+-      dup .nametostring
+-      {//true .loadfontloop} .internalstopped {//false} if
+-    } ifelse
+-  } {
+-    {//true .loadfontloop} .internalstopped {//false} if
+-  } ifelse
+-} bind def
+-
+ /.loadfontloop {        % <fontname> <filename> <libflag> .loadfontloop
+                         %   <font> true
+                         % -or-
+@@ -1102,7 +1034,7 @@ $error /SubstituteFont { } put
+          } if
+ 
+                 % Check to make sure the font was actually loaded.
+-        dup 3 index .fontknownget
++        dup 3 index //.fontknownget exec
+          { dup /PathLoad 4 index .putgstringcopy
+            4 1 roll pop pop pop //true exit
+          } executeonly if
+@@ -1113,7 +1045,7 @@ $error /SubstituteFont { } put
+         exch dup      % Stack: origfontname fontdirectory path path
+         (r) file .findfontname
+          {            % Stack: origfontname fontdirectory path filefontname
+-           2 index 1 index .fontknownget
++           2 index 1 index //.fontknownget exec
+             {   % Yes.  Stack: origfontname fontdirectory path filefontname fontdict
+               dup 4 -1 roll /PathLoad exch .putgstringcopy
+                       % Stack: origfontname fontdirectory filefontname fontdict
+@@ -1136,7 +1068,7 @@ $error /SubstituteFont { } put
+                       % Stack: fontdict
+             } executeonly
+            if pop % Stack: origfontname fontdirectory path
+-         }
++         } executeonly
+         if pop pop  % Stack: origfontname
+ 
+                 % The font definitely did not load correctly.
+@@ -1150,7 +1082,87 @@ $error /SubstituteFont { } put
+ 
+  } bind executeonly odef % must be bound and hidden for .putgstringcopy
+ 
+-currentdict /.putgstringcopy .undef
++% Attempt to load a font from a file.
++/.tryloadfont {         % <fontname> .tryloadfont <font> true
++                        % <fontname> .tryloadfont false
++  dup //.nametostring exec
++                % Hack: check for the presence of the resource machinery.
++  /.genericrfn where {
++    pop
++    pop dup //.fonttempstring /FontResourceDir getsystemparam .genericrfn
++    {//false .loadfontloop} .internalstopped {//false} if {
++      //true
++    } {
++      dup //.nametostring exec
++      {//true .loadfontloop} .internalstopped {//false} if
++    } ifelse
++  } {
++    {//true .loadfontloop} .internalstopped {//false} if
++  } ifelse
++} bind def
++
++% Try to find a font using only the present contents of Fontmap.
++/.tryfindfont {         % <fontname> .tryfindfont <font> true
++                        % <fontname> .tryfindfont false
++  //.FontDirectory 1 index //.fontknownget exec
++    {                   % Already loaded
++      exch pop //true
++    }
++    {
++       dup Fontmap exch .knownget
++       { //true //true }
++       {                % Unknown font name.  Look for a file with the
++                        % same name as the requested font.
++         dup //.tryloadfont exec
++         { exch pop //true //false }
++         {
++           % if we can't load by name check the native font map
++           dup .nativeFontmap exch .knownget
++           { //true //true }
++           { //false //false } ifelse
++         } ifelse
++       } ifelse
++
++       {                % Try each element of the Fontmap in turn.
++         pop
++         //false exch   % (in case we exhaust the list)
++                        % Stack: fontname false fontmaplist
++         { exch pop
++           dup type /nametype eq
++            {                   % Font alias
++              //.checkalias exec
++              .tryfindfont exit
++            }
++            { dup dup type dup /arraytype eq exch /packedarraytype eq or exch xcheck and
++               {                % Font with a procedural definition
++                 exec           % The procedure will load the font.
++                                % Check to make sure this really happened.
++                 //.FontDirectory 1 index .knownget
++                  { exch pop //true exit }
++                 if
++               }
++               {                % Font file name
++                 //true .loadfontloop { //true exit } if
++               }
++              ifelse
++            }
++           ifelse //false
++         }
++         forall
++                        % Stack: font true -or- fontname false
++         { //true
++         }
++         {                      % None of the Fontmap entries worked.
++                                % Try loading a file with the same name
++                                % as the requested font.
++           //.tryloadfont exec
++         }
++        ifelse
++       }
++      if
++    }
++   ifelse
++ } bind def
+ 
+ % Define a procedure to load all known fonts.
+ % This isn't likely to be very useful.
+@@ -1192,9 +1204,9 @@ FAKEFONTS { exch } if pop def   % don't bind, .current/setglobal get redefined
+ /.loadinitialfonts
+  { NOFONTMAP not
+     { /FONTMAP where
+-          { pop [ FONTMAP .pathlist ]
++          { pop [ FONTMAP //.pathlist exec]
+              { dup VMDEBUG findlibfile
+-                { exch pop .loadFontmap }
++                { exch pop //.loadFontmap exec }
+                 { /undefinedfilename signalerror }
+                ifelse
+              }
+@@ -1208,7 +1220,7 @@ FAKEFONTS { exch } if pop def   % don't bind, .current/setglobal get redefined
+                    pop pop
+                    defaultfontmap_content { .definefontmap } forall
+                  } {
+-                   .loadFontmap
++                   //.loadFontmap exec
+                  } ifelse
+                } {
+                  pop pop
+@@ -1272,3 +1284,18 @@ FAKEFONTS { exch } if pop def   % don't bind, .current/setglobal get redefined
+  { .makemodifiedfont
+    dup /FontName get exch definefont pop
+  } bind def
++
++% Undef these, not needed outside this file
++[
++ % /.fonttempstring /.scannextfontdir - are also used in gs_res.ps, so are undefined there
++ % /.fontnameproperties - is used in pdf_font.ps
++ % /.scanfontheaders - used in gs_cff.ps, gs_ttf.ps
++ /.loadfontloop /.tryloadfont /.findfont /.pathlist /.loadFontmap /.lowerstring
++ /.splitfilename /.scanfontdict /.scanfontbegin
++ /.scanfontskip /.scan1fontstring
++ /.scan1fontfirst /.scanfontdir
++ /.setnativefontmapbuilt /.aliasfont
++ /.setloadingfont /.substitutefaces /.substituteproperties /.substitutefamilies
++ /.nametostring /.fontnamestring /.checkalias /.fontknownget /.stdsubstfont
++ /.putgstringcopy
++] {systemdict exch .forceundef} forall
+diff --git a/Resource/Init/gs_res.ps b/Resource/Init/gs_res.ps
+index d9b34599e7c2..fd7eaf953ae9 100644
+--- a/Resource/Init/gs_res.ps
++++ b/Resource/Init/gs_res.ps
+@@ -961,7 +961,7 @@ userdict /.localcsdefaults //false put
+     dup type /nametype eq { .namestring } if
+     dup type /stringtype ne { //false exit } if
+                 % Check the resource directory.
+-    dup .fonttempstring /FontResourceDir getsystemparam .genericrfn
++    dup //.fonttempstring /FontResourceDir getsystemparam .genericrfn
+     status {
+       pop pop pop pop //true exit
+     } if
+@@ -969,7 +969,7 @@ userdict /.localcsdefaults //false put
+                 % as the font.
+     findlibfile { closefile //true exit } if
+                 % Scan a FONTPATH directory and try again.
+-    .scannextfontdir not { //false exit } if
++    //.scannextfontdir exec not { //false exit } if
+   } loop
+ } bind def
+ 
+@@ -1008,7 +1008,7 @@ currentdict /.fontstatusaux .undef
+         } ifelse
+ } bind executeonly
+ /ResourceForAll {
+-        { .scannextfontdir not { exit } if } loop
++        { //.scannextfontdir exec not { exit } if } loop
+         /Generic /Category findresource /ResourceForAll get exec
+ } bind executeonly
+ /.ResourceFileStatus {
+-- 
+2.20.1
+
diff --git a/package/ghostscript/0007-Remove-.forcedef-and-harden-.force-ops-more.patch b/package/ghostscript/0007-Remove-.forcedef-and-harden-.force-ops-more.patch
new file mode 100644
index 000000000000..8c21c34edefc
--- /dev/null
+++ b/package/ghostscript/0007-Remove-.forcedef-and-harden-.force-ops-more.patch
@@ -0,0 +1,345 @@
+From ba2336b3b1ca5cfe1e67dbe37a084c9644a65ac7 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Fri, 11 Jan 2019 13:36:36 +0000
+Subject: [PATCH] Remove .forcedef, and harden .force* ops more
+
+Remove .forcedef and replace all uses with a direct call to .forceput instead.
+
+Ensure every procedure (named and trasient) that calls .forceput is
+executeonly.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 49c8092da88e
+
+ Resource/Init/gs_dps1.ps  | 15 +++++++-----
+ Resource/Init/gs_init.ps  | 28 ++++++++-------------
+ Resource/Init/gs_lev2.ps  | 51 +++++++++++++++++++--------------------
+ Resource/Init/gs_ll3.ps   |  5 ++--
+ Resource/Init/gs_res.ps   | 29 +++++++++++-----------
+ Resource/Init/gs_statd.ps |  4 +--
+ 6 files changed, 63 insertions(+), 69 deletions(-)
+
+diff --git a/Resource/Init/gs_dps1.ps b/Resource/Init/gs_dps1.ps
+index 8700c8cb304b..3d2cf7a1ad01 100644
+--- a/Resource/Init/gs_dps1.ps
++++ b/Resource/Init/gs_dps1.ps
+@@ -33,14 +33,17 @@ systemdict begin
+ 
+ /SharedFontDirectory .FontDirectory .gcheck
+  { .currentglobal //false .setglobal
++   currentdict
+    /LocalFontDirectory .FontDirectory dup maxlength dict copy
+-   .forcedef	% LocalFontDirectory is local, systemdict is global
++   .forceput	% LocalFontDirectory is local, systemdict is global
+    .setglobal .FontDirectory
+- }
+- { /LocalFontDirectory .FontDirectory
+-   .forcedef	% LocalFontDirectory is local, systemdict is global
++ } executeonly
++ {
++   currentdict
++   /LocalFontDirectory .FontDirectory
++   .forceput	% LocalFontDirectory is local, systemdict is global
+    50 dict
+- }
++ }executeonly
+ ifelse def
+ 
+ end				% systemdict
+@@ -55,7 +58,7 @@ level2dict begin
+     { //SharedFontDirectory }
+     { /LocalFontDirectory .systemvar }	% can't embed ref to local VM
+    ifelse .forceput pop	% LocalFontDirectory is local, systemdict is global
+- } .bind odef
++ } .bind executeonly odef
+ % Don't just copy (load) the definition of .setglobal:
+ % it gets redefined for LL3.
+ /setshared { /.setglobal .systemvar exec } odef
+diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
+index d9a0829f7f97..45bebf479bae 100644
+--- a/Resource/Init/gs_init.ps
++++ b/Resource/Init/gs_init.ps
+@@ -54,7 +54,7 @@ systemdict exch
+    dup /userdict
+    currentdict dup 200 .setmaxlength		% userdict
+    .forceput			% userdict is local, systemdict is global
+- }
++ } executeonly
+ if begin
+ 
+ % Define dummy local/global operators if needed.
+@@ -299,13 +299,6 @@ QUIET not { printgreeting flush } if
+   1 index exch .makeoperator def
+ } .bind def
+ 
+-% Define a special version of def for storing local objects into global
+-% dictionaries.  Like .forceput, this exists only during initialization.
+-/.forcedef {		% <key> <value> .forcedef -
+-  1 .argindex pop	% check # of args
+-  currentdict 3 1 roll .forceput
+-} .bind odef
+-
+ % Define procedures for accessing variables in systemdict and userdict
+ % regardless of the contents of the dictionary stack.
+ /.systemvar {		% <name> .systemvar <value>
+@@ -347,7 +340,7 @@ DELAYBIND
+        }
+       ifelse
+     } .bind def
+-} if
++} executeonly if
+ 
+ %**************** BACKWARD COMPATIBILITY ****************
+ /hwsizedict mark /HWSize //null .dicttomark readonly def
+@@ -655,7 +648,7 @@ currentdict /.typenames .undef
+       /ifelse .systemvar
+     ] cvx executeonly
+   exch .setglobal
+-} odef
++} executeonly odef
+ systemdict /internaldict dup .makeinternaldict .makeoperator
+ .forceput		% proc is local, systemdict is global
+ 
+@@ -1093,7 +1086,7 @@ def
+ 
+ % Define $error.  This must be in local VM.
+ .currentglobal //false .setglobal
+-/$error 40 dict .forcedef	% $error is local, systemdict is global
++currentdict /$error 40 dict .forceput	% $error is local, systemdict is global
+                 % newerror, errorname, command, errorinfo,
+                 % ostack, estack, dstack, recordstacks,
+                 % binary, globalmode,
+@@ -1112,8 +1105,8 @@ end
+ % Define errordict similarly.  It has one entry per error name,
+ %   plus handleerror.  However, some astonishingly badly written PostScript
+ %   files require it to have at least one empty slot.
+-/errordict ErrorNames length 3 add dict
+-.forcedef		% errordict is local, systemdict is global
++currentdict /errordict ErrorNames length 3 add dict
++.forceput		% errordict is local, systemdict is global
+ .setglobal		% back to global VM
+ %  gserrordict contains all the default error handling methods, but unlike
+ %  errordict it is noaccess after creation (also it is in global VM).
+@@ -1273,8 +1266,9 @@ end
+ (END PROCS) VMDEBUG
+ 
+ % Define the font directory.
++currentdict
+ /FontDirectory //false .setglobal 100 dict //true .setglobal
+-.forcedef		% FontDirectory is local, systemdict is global
++.forceput		% FontDirectory is local, systemdict is global
+ 
+ % Define the encoding dictionary.
+ /EncodingDirectory 16 dict def	% enough for Level 2 + PDF standard encodings
+@@ -2333,7 +2327,6 @@ SAFER { .setsafeglobal } if
+   //systemdict /UndefinePostScriptOperators get exec
+   //systemdict /UndefinePDFOperators get exec
+   //systemdict /.forcecopynew .forceundef	% remove temptation
+-  //systemdict /.forcedef .forceundef		% ditto
+   //systemdict /.forceput .forceundef		% ditto
+   //systemdict /.undef .forceundef		    % ditto
+   //systemdict /.forceundef .forceundef		% ditto
+@@ -2368,9 +2361,9 @@ SAFER { .setsafeglobal } if
+         % (and, if implemented, context switching).
+   .currentglobal //false .setglobal
+      mark userparams { } forall .dicttomark readonly
+-     /userparams exch .forcedef		% systemdict is read-only
++     currentdict exch /userparams exch .forceput		% systemdict is read-only
+   .setglobal
+-} if
++} executeonly if
+ /.currentsystemparams where {
+   pop
+         % Remove real system params from pssystemparams.
+@@ -2458,7 +2451,6 @@ end
+ DELAYBIND not {
+   systemdict /.bindnow .undef       % We only need this for DELAYBIND
+   systemdict /.forcecopynew .undef	% remove temptation
+-  systemdict /.forcedef .undef		% ditto
+   systemdict /.forceput .undef		% ditto
+   systemdict /.forceundef .undef	% ditto
+ } if
+diff --git a/Resource/Init/gs_lev2.ps b/Resource/Init/gs_lev2.ps
+index 0f0d57331c23..9c0c3a6fc485 100644
+--- a/Resource/Init/gs_lev2.ps
++++ b/Resource/Init/gs_lev2.ps
+@@ -304,31 +304,30 @@ end
+     psuserparams exch /.checkFilePermitparams load put
+   .setglobal
+ 
+-pssystemparams begin
+-  /CurDisplayList 0 .forcedef
+-  /CurFormCache 0 .forcedef
+-  /CurInputDevice () .forcedef
+-  /CurOutlineCache 0 .forcedef
+-  /CurOutputDevice () .forcedef
+-  /CurPatternCache 0 .forcedef
+-  /CurUPathCache 0 .forcedef
+-  /CurScreenStorage 0 .forcedef
+-  /CurSourceList 0 .forcedef
+-  /DoPrintErrors //false .forcedef
+-  /JobTimeout 0 .forcedef
+-  /LicenseID (LN-001) .forcedef     % bogus
+-  /MaxDisplayList 140000 .forcedef
+-  /MaxFormCache 100000 .forcedef
+-  /MaxImageBuffer 524288 .forcedef
+-  /MaxOutlineCache 65000 .forcedef
+-  /MaxPatternCache 100000 .forcedef
+-  /MaxUPathCache 300000 .forcedef
+-  /MaxScreenStorage 84000 .forcedef
+-  /MaxSourceList 25000 .forcedef
+-  /PrinterName product .forcedef
+-  /RamSize 4194304 .forcedef
+-  /WaitTimeout 40 .forcedef
+-end
++pssystemparams
++dup /CurDisplayList 0 .forceput
++dup /CurFormCache 0 .forceput
++dup /CurInputDevice () .forceput
++dup /CurOutlineCache 0 .forceput
++dup /CurOutputDevice () .forceput
++dup /CurPatternCache 0 .forceput
++dup /CurUPathCache 0 .forceput
++dup /CurScreenStorage 0 .forceput
++dup /CurSourceList 0 .forceput
++dup /DoPrintErrors //false .forceput
++dup /JobTimeout 0 .forceput
++dup /LicenseID (LN-001) .forceput     % bogus
++dup /MaxDisplayList 140000 .forceput
++dup /MaxFormCache 100000 .forceput
++dup /MaxImageBuffer 524288 .forceput
++dup /MaxOutlineCache 65000 .forceput
++dup /MaxPatternCache 100000 .forceput
++dup /MaxUPathCache 300000 .forceput
++dup /MaxScreenStorage 84000 .forceput
++dup /MaxSourceList 25000 .forceput
++dup /PrinterName product .forceput
++dup /RamSize 4194304 .forceput
++    /WaitTimeout 40 .forceput
+ 
+ % Define the procedures for handling comment scanning.  The names
+ % %ProcessComment and %ProcessDSCComment are known to the interpreter.
+@@ -710,7 +709,7 @@ pop		% currentsystemparams
+ /statusdict currentdict def
+ 
+ currentdict end
+-/statusdict exch .forcedef	% statusdict is local, systemdict is global
++currentdict exch /statusdict exch .forceput	% statusdict is local, systemdict is global
+ 
+ % The following compatibility operators are in systemdict.  They are
+ % defined here, rather than in gs_init.ps, because they require the
+diff --git a/Resource/Init/gs_ll3.ps b/Resource/Init/gs_ll3.ps
+index c86721f39fc0..881af44e9fd2 100644
+--- a/Resource/Init/gs_ll3.ps
++++ b/Resource/Init/gs_ll3.ps
+@@ -521,9 +521,8 @@ end
+ % Define additional user and system parameters.
+ /HalftoneMode 0 .definepsuserparam
+ /MaxSuperScreen 1016 .definepsuserparam
+-pssystemparams begin		% read-only, so use .forcedef
+-  /MaxDisplayAndSourceList 160000 .forcedef
+-end
++% read-only, so use .forceput
++pssystemparams  /MaxDisplayAndSourceList 160000 .forceput
+ 
+ % Define the IdiomSet resource category.
+ { /IdiomSet } {
+diff --git a/Resource/Init/gs_res.ps b/Resource/Init/gs_res.ps
+index fd7eaf953ae9..0b4e0514b2a1 100644
+--- a/Resource/Init/gs_res.ps
++++ b/Resource/Init/gs_res.ps
+@@ -41,10 +41,10 @@ level2dict begin
+ % However, Ed Taft of Adobe says their interpreters don't implement this
+ % either, so we aren't going to worry about it for a while.
+ 
+-currentglobal //false setglobal systemdict begin
+-  /localinstancedict 5 dict
+-  .forcedef	% localinstancedict is local, systemdict is global
+-end //true setglobal
++currentglobal //false setglobal
++  systemdict /localinstancedict 5 dict
++  .forceput	% localinstancedict is local, systemdict is global
++//true setglobal
+ /.emptydict 0 dict readonly def
+ setglobal
+ 
+@@ -149,7 +149,7 @@ setglobal
+           dup [ exch 0 -1 ] exch
+           .Instances 4 2 roll put
+                 % Make the Category dictionary read-only.  We will have to
+-                % use .forceput / .forcedef later to replace the dummy,
++                % use .forceput / .forceput later to replace the dummy,
+                 % empty .Instances dictionary with the real one later.
+           readonly
+         }{
+@@ -304,7 +304,8 @@ systemdict begin
+      dup () ne {
+      .file_name_directory_separator concatstrings
+     } if
+-    2 index exch //false .file_name_combine not {
++    2 index exch //false
++    .file_name_combine not {
+       (Error: .default_resource_dir returned ) print exch print ( that can't combine with ) print =
+       /.default_resource_dir cvx /configurationerror signalerror
+     } if
+@@ -317,14 +318,14 @@ currentdict /pssystemparams known not {
+ pssystemparams begin
+   .default_resource_dir
+   /FontResourceDir (Font) .resource_dir_name
+-     readonly .forcedef	% pssys'params is r-o
++     readonly currentdict 3 1 roll .forceput	% pssys'params is r-o
+   /GenericResourceDir () .resource_dir_name
+-     readonly .forcedef	% pssys'params is r-o
++     readonly currentdict 3 1 roll .forceput	% pssys'params is r-o
+   pop % .default_resource_dir
+   /GenericResourcePathSep
+-        .file_name_separator readonly .forcedef		% pssys'params is r-o
+-  (%diskFontResourceDir) cvn (/Resource/Font/) readonly .forcedef	% pssys'params is r-o
+-  (%diskGenericResourceDir) cvn (/Resource/) readonly .forcedef	% pssys'params is r-o
++        .file_name_separator readonly currentdict 3 1 roll .forceput		% pssys'params is r-o
++  currentdict (%diskFontResourceDir) cvn (/Resource/Font/) readonly .forceput	% pssys'params is r-o
++  currentdict (%diskGenericResourceDir) cvn (/Resource/) readonly .forceput	% pssys'params is r-o
+ end
+ end
+ 
+@@ -422,8 +423,8 @@ status {
+                 .Instances dup //.emptydict eq {
+                   pop 3 dict
+                         % As noted above, Category dictionaries are read-only,
+-                        % so we have to use .forcedef here.
+-                  /.Instances 1 index .forcedef	% Category dict is read-only
++                        % so we have to use .forceput here.
++                  currentdict /.Instances 2 index .forceput	% Category dict is read-only
+                 } executeonly if
+               }
+               { .LocalInstances dup //.emptydict eq
+@@ -441,7 +442,7 @@ status {
+            { /defineresource cvx /typecheck signaloperror
+            }
+         ifelse
+-} .bind executeonly .makeoperator		% executeonly to prevent access to .forcedef
++} .bind executeonly .makeoperator		% executeonly to prevent access to .forceput
+ /UndefineResource
+         {  { dup 2 index .knownget
+               { dup 1 get 1 ge
+diff --git a/Resource/Init/gs_statd.ps b/Resource/Init/gs_statd.ps
+index 20d4c96c4f8f..b6a76590dd09 100644
+--- a/Resource/Init/gs_statd.ps
++++ b/Resource/Init/gs_statd.ps
+@@ -21,10 +21,10 @@ systemdict begin
+         % We make statusdict a little larger for Level 2 stuff.
+         % Note that it must be allocated in local VM.
+  .currentglobal //false .setglobal
+- /statusdict 91 dict .forcedef		% statusdict is local, sys'dict global
++ currentdict /statusdict 91 dict .forceput		% statusdict is local, sys'dict global
+         % To support the Level 2 job control features,
+         % serverdict must also be in local VM.
+- /serverdict 10 dict .forcedef		% serverdict is local, sys'dict global
++ currentdict /serverdict 10 dict .forceput		% serverdict is local, sys'dict global
+  .setglobal
+ end
+ 
+-- 
+2.20.1
+
-- 
2.20.1
