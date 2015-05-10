From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 10 May 2015 16:43:49 +0300
Subject: [Buildroot] [PATCH] binutils: fix xtensa gas trampolines regression
Message-ID: <1431265429-32419-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xtensa trampolines relaxation optimization caused the following build
errors:
  Error: operand 1 of 'j' has out of range value '131643'
  Error: operand 1 of 'j' has out of range value '4294836162'
  Error: operand 1 of 'j' has out of range value '4294836072'

Extra condition 'abs (addr - trampaddr) < J_RANGE / 2' for trampoline
selection results in regressions: when relaxable jump is little longer
than J_RANGE so that single trampoline makes two new jumps, one longer
than J_RANGE / 2 and one shorter, correct trampoline cannot be found.

Drop that condition.

Upstream status: patch submitted.
Fix squashed into the optimization patch.
Fixes:
  http://autobuild.buildroot.net/results/5ba7d18262ce6a2dfd69db07d064a971267f1128/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 .../910-xtensa-optimize-trampolines-relaxation.patch    | 17 ++++++++---------
 .../910-xtensa-optimize-trampolines-relaxation.patch    | 17 ++++++++---------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/package/binutils/2.24/910-xtensa-optimize-trampolines-relaxation.patch b/package/binutils/2.24/910-xtensa-optimize-trampolines-relaxation.patch
index 852974b..043ff4d 100644
--- a/package/binutils/2.24/910-xtensa-optimize-trampolines-relaxation.patch
+++ b/package/binutils/2.24/910-xtensa-optimize-trampolines-relaxation.patch
@@ -64,11 +64,11 @@ Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
 Backported from: b76f99d702c3501ac320396ea06bc7f9237173c3
 Changes to ChangeLog are dropped.
 
- gas/config/tc-xtensa.c | 221 +++++++++++++++++++++++++++++++++++++++++++------
- 1 file changed, 194 insertions(+), 27 deletions(-)
+ gas/config/tc-xtensa.c | 220 +++++++++++++++++++++++++++++++++++++++++++------
+ 1 file changed, 194 insertions(+), 26 deletions(-)
 
 diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
-index 3e85b69..b1827fa 100644
+index 3e85b69..31c0b6b 100644
 --- a/gas/config/tc-xtensa.c
 +++ b/gas/config/tc-xtensa.c
 @@ -8785,6 +8785,154 @@ static long relax_frag_for_align (fragS *, long);
@@ -226,7 +226,7 @@ index 3e85b69..b1827fa 100644
  
  /* Return the number of bytes added to this fragment, given that the
     input has been stretched already by "stretch".  */
-@@ -8896,35 +9044,43 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
+@@ -8896,35 +9044,42 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
      case RELAX_TRAMPOLINE:
        if (fragP->tc_frag_data.relax_seen)
          {
@@ -279,8 +279,7 @@ index 3e85b69..b1827fa 100644
 +
 +	      trampaddr = fragP->fr_address + fragP->fr_fix;
 +
-+	      if ((addr + J_RANGE < trampaddr) ||
-+		  abs (addr - trampaddr) < J_RANGE / 2)
++	      if (addr + J_RANGE < trampaddr)
  		continue;
 -              target = S_GET_VALUE (s);
 -              addr = fixP->fx_frag->fr_address;
@@ -295,7 +294,7 @@ index 3e85b69..b1827fa 100644
                if (delta > J_RANGE  || delta < -1 * J_RANGE)
                  { /* Found an out-of-range jump; scan the list of trampolines for the best match.  */
  		  struct trampoline_seg *ts = find_trampoline_seg (now_seg);
-@@ -8978,14 +9134,13 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
+@@ -8978,14 +9133,13 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
  		    }
  		  if (tf->fragP == fragP)
  		    {
@@ -311,7 +310,7 @@ index 3e85b69..b1827fa 100644
  
  			  new_stretch += init_trampoline_frag (tf);
  			  offset = fragP->fr_fix; /* Where to assemble the j insn.  */
-@@ -9009,10 +9164,20 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
+@@ -9009,10 +9163,20 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
  			  newfixP->tc_fix_data.X_add_symbol = lsym;
  			  newfixP->tc_fix_data.X_add_number = offset;
  			  newfixP->tc_fix_data.slot = slot;
@@ -332,7 +331,7 @@ index 3e85b69..b1827fa 100644
  			  /* Adjust the jump around this trampoline (if present).  */
  			  if (tf->fixP != NULL)
  			    {
-@@ -9027,6 +9192,8 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
+@@ -9027,6 +9191,8 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
  			      fragP->fr_subtype = 0;
  			      /* Remove from the trampoline_list.  */
  			      prev->next = tf->next;
diff --git a/package/binutils/2.25/910-xtensa-optimize-trampolines-relaxation.patch b/package/binutils/2.25/910-xtensa-optimize-trampolines-relaxation.patch
index 852974b..043ff4d 100644
--- a/package/binutils/2.25/910-xtensa-optimize-trampolines-relaxation.patch
+++ b/package/binutils/2.25/910-xtensa-optimize-trampolines-relaxation.patch
@@ -64,11 +64,11 @@ Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
 Backported from: b76f99d702c3501ac320396ea06bc7f9237173c3
 Changes to ChangeLog are dropped.
 
- gas/config/tc-xtensa.c | 221 +++++++++++++++++++++++++++++++++++++++++++------
- 1 file changed, 194 insertions(+), 27 deletions(-)
+ gas/config/tc-xtensa.c | 220 +++++++++++++++++++++++++++++++++++++++++++------
+ 1 file changed, 194 insertions(+), 26 deletions(-)
 
 diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
-index 3e85b69..b1827fa 100644
+index 3e85b69..31c0b6b 100644
 --- a/gas/config/tc-xtensa.c
 +++ b/gas/config/tc-xtensa.c
 @@ -8785,6 +8785,154 @@ static long relax_frag_for_align (fragS *, long);
@@ -226,7 +226,7 @@ index 3e85b69..b1827fa 100644
  
  /* Return the number of bytes added to this fragment, given that the
     input has been stretched already by "stretch".  */
-@@ -8896,35 +9044,43 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
+@@ -8896,35 +9044,42 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
      case RELAX_TRAMPOLINE:
        if (fragP->tc_frag_data.relax_seen)
          {
@@ -279,8 +279,7 @@ index 3e85b69..b1827fa 100644
 +
 +	      trampaddr = fragP->fr_address + fragP->fr_fix;
 +
-+	      if ((addr + J_RANGE < trampaddr) ||
-+		  abs (addr - trampaddr) < J_RANGE / 2)
++	      if (addr + J_RANGE < trampaddr)
  		continue;
 -              target = S_GET_VALUE (s);
 -              addr = fixP->fx_frag->fr_address;
@@ -295,7 +294,7 @@ index 3e85b69..b1827fa 100644
                if (delta > J_RANGE  || delta < -1 * J_RANGE)
                  { /* Found an out-of-range jump; scan the list of trampolines for the best match.  */
  		  struct trampoline_seg *ts = find_trampoline_seg (now_seg);
-@@ -8978,14 +9134,13 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
+@@ -8978,14 +9133,13 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
  		    }
  		  if (tf->fragP == fragP)
  		    {
@@ -311,7 +310,7 @@ index 3e85b69..b1827fa 100644
  
  			  new_stretch += init_trampoline_frag (tf);
  			  offset = fragP->fr_fix; /* Where to assemble the j insn.  */
-@@ -9009,10 +9164,20 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
+@@ -9009,10 +9163,20 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
  			  newfixP->tc_fix_data.X_add_symbol = lsym;
  			  newfixP->tc_fix_data.X_add_number = offset;
  			  newfixP->tc_fix_data.slot = slot;
@@ -332,7 +331,7 @@ index 3e85b69..b1827fa 100644
  			  /* Adjust the jump around this trampoline (if present).  */
  			  if (tf->fixP != NULL)
  			    {
-@@ -9027,6 +9192,8 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
+@@ -9027,6 +9191,8 @@ xtensa_relax_frag (fragS *fragP, long stretch, int *stretched_p)
  			      fragP->fr_subtype = 0;
  			      /* Remove from the trampoline_list.  */
  			      prev->next = tf->next;
-- 
1.8.1.4
