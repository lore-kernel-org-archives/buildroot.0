From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Tue, 8 Jun 2021 11:19:17 +0200
Subject: [Buildroot] patch version support
Message-ID: <CAOiXNkCC+kkmPBR4OMdTVpXXuSUZjT+P9_TRmitca2f0m9vBZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildrooters,

I am currently trying to add support for L-876e.A1 STM32MP1 board from Phytec.

https://www.phytec.de/en/produkte/single-board-computer/phyboard-sargas-stm32mp1/
https://www.phytec.de/cdocuments/?doc=d4PmEQ

There is Yocto-based BSP with a bunch of patches and required
configuration options. So I am trying to dig them out of Yocto and
pack them into Buildroot. One of the problems I've got is in the
Buildroot's support/scripts/apply-patches.sh script which actively
rejects patches in newer format ("Error: patch contains some renames,
not supported by old patch versions").

I found some old discussions about this decision and understand the
motivation (enterprises stuck with old distributions, etc.). However,
there has been quite some time since this discussion. If I am not
mistaken, this "newer" patch format is about 10 years old for now. So
my question is if it would make sense to remove this restriction?

My temporary solution is just to comment out corresponding lines in
the shell script as following:

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 9fb488c570..c3fad41189 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -113,11 +113,11 @@ function apply_patch {
         echo "  to be applied  : ${path}/${patch}"
         exit 1
     fi
-    if ${uncomp} "${path}/$patch" | grep -q "^rename from" && \
-       ${uncomp} "${path}/$patch" | grep -q "^rename to" ; then
-        echo "Error: patch contains some renames, not supported by
old patch versions"
-        exit 1
-    fi
+#    if ${uncomp} "${path}/$patch" | grep -q "^rename from" && \
+#       ${uncomp} "${path}/$patch" | grep -q "^rename to" ; then
+#        echo "Error: patch contains some renames, not supported by
old patch versions"
+#        exit 1
+#    fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E
--no-backup-if-mismatch -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then

Maybe it could be removed from mainline Buildroot as obsolete?

Regards,
Andrey.
