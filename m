From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 05 Nov 2019 06:41:15 +0000
Subject: [Buildroot] [Bug 12311] New: Extra package download failure if the
 SITE include '+'
Message-ID: <bug-12311-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12311

            Bug ID: 12311
           Summary: Extra package download failure if the SITE include '+'
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jemy.zhang+buildroot+bugzilla at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

if the SITE URL includes '+', the SITE_MOTHOD will be prefixed to the download
url of the main package, but the extra download url would not be. If the SITE
URL accidentally include the sign of '+', url link before '+' would be parsed
as SITE MOTHOD by dl-wrapper, and the url broken.

Take android-tools package for example:

ANDROID_TOOLS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
ANDROID_TOOLS_EXTRA_DOWNLOADS =
android-tools_$(ANDROID_TOOLS_VERSION)-3ubuntu41.debian.tar.gz


while build the android-tools package, ALL_DOWNLOADS will be expended as:


for p in
https+https://launchpad.net/ubuntu/+archive/primary/+files/android-tools_4.2.2+git20130218.orig.tar.xz
  https://launchpad.ne
t/ubuntu/+archive/primary/+files/android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz;
do \
        if test ! -e
/mnt/fileroot/jun.zhang/buildroot-git/buildroot/dl/android-tools/`basename $p`
; then \
                echo ">>> android-tools 4.2.2+git20130218 Downloading" ; \
                break ; \
        fi ; \
done


there's no 'https+' prefixed to the url, SITE_MOTHOD missing.

and while downloading package, url corrupted:

--2019-11-05 14:10:29-- 
http://archive/primary/+files/android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz


with the following patch, problem resolved:


diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 893faba22a..63b6b25a7f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -523,8 +523,7 @@ endif
 $(2)_ALL_DOWNLOADS = \
        $$(if
$$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE)) \
        $$(foreach p,$$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
-               $$(if $$(findstring ://,$$(p)),$$(p),\
-                       $$($(2)_SITE)/$$(p)))
+               $$($(2)_SITE_METHOD)+$$(if $$(findstring
://,$$(p)),$$(p),$$($(2)_SITE)/$$(p)))

 ifndef $(2)_SITE
  ifdef $(3)_SITE

-- 
You are receiving this mail because:
You are on the CC list for the bug.
