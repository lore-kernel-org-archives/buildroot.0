From: Ryota Kinukawa <pojiro.jp@gmail.com>
Date: Sun, 16 May 2021 17:18:08 +0900
Subject: [Buildroot] Suggestion to "support/scripts/apply-patches.sh: do
 not apply patches with renames"
In-Reply-To: <20210515094010.GA2506@scaer>
References: <CAALxPJ0qprnhxWtHGg7oeY=Ws4+w3Wt-_hdM1WvbL6B42jQO5g@mail.gmail.com>
 <87fsyopkcr.fsf@dell.be.48ers.dk> <20210515094010.GA2506@scaer>
Message-ID: <CAALxPJ0ghoLYBvUmdkAe3+ibwS5eSsHo_NLLRXwe+Tqkd6Gk_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann-san, All

> So, lets do it that way;
>  1. add a check in support/dependencies/dependencies.sh that patch >=
>     2.7 (just after/before the check for --no-backup-if-mismatch)
>  2. drop the test for renames in support/scripts/apply-patches.sh
> Ryota, would you care to work on that and send the patches to the list,
> please?

Here is the patch, could you confirm this?

diff --git a/support/dependencies/dependencies.sh
b/support/dependencies/dependencies.sh
index 1954f038be..030a2196f9 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -163,7 +163,7 @@ fi

 # Check that a few mandatory programs are installed
 missing_progs="no"
-for prog in patch perl tar wget cpio unzip rsync bc ${DL_TOOLS} ; do
+for prog in perl tar wget cpio unzip rsync bc ${DL_TOOLS} ; do
        if ! which $prog > /dev/null ; then
                echo "You must install '$prog' on your build machine";
                missing_progs="yes"
@@ -183,11 +183,24 @@ if test "${missing_progs}" = "yes" ; then
        exit 1
 fi

+# Check patch
+if ! which patch > /dev/null ; then
+       echo "You must install GNU patch on your build machine";
+       exit 1
+fi
 # apply-patches.sh needs patch with --no-backup-if-mismatch support (GNU,
busybox w/DESKTOP)
 if ! patch --no-backup-if-mismatch </dev/null 2>/dev/null; then
        echo "Your patch program does not support the
--no-backup-if-mismatch option. Install GNU patch"
        exit 1
 fi
+PATCH_VERSION=$(patch --version 2>&1 | sed -e 's/^.* \([0-9\.]\)/\1/g' -e
's/[-\ ].*//g' -e '1q')
+PATCH_MAJOR=$(echo $PATCH_VERSION | sed -e "s/\..*//g")
+PATCH_MINOR=$(echo $PATCH_VERSION | sed -e "s/^$PATCH_MAJOR\.//g" -e
"s/\..*//g" -e "s/[a-zA-Z].*//g")
+if [ $PATCH_MAJOR -lt 2 ] || [ $PATCH_MAJOR -eq 2 -a $PATCH_MINOR -lt 7 ]
; then
+       echo
+       echo "You have GNU patch '$PATCH_VERSION' installed.  GNU patch
>=2.7 is required"
+       exit 1;
+fi

 if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
        if ! which locale > /dev/null ; then
diff --git a/support/scripts/apply-patches.sh
b/support/scripts/apply-patches.sh
index 9fb488c570..e5a2fdd09e 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -113,11 +113,6 @@ function apply_patch {
         echo "  to be applied  : ${path}/${patch}"
         exit 1
     fi
-    if ${uncomp} "${path}/$patch" | grep -q "^rename from" && \
-       ${uncomp} "${path}/$patch" | grep -q "^rename to" ; then
-        echo "Error: patch contains some renames, not supported by old
patch versions"
-        exit 1
-    fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E --no-backup-if-mismatch
-d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then

Regards,
Ryota Kinukawa
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210516/07366cfd/attachment.html>
