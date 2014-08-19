From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Aug 2014 16:44:46 +0000 (UTC)
Subject: [Buildroot] [Bug 7328] Git dl of versions in x/y broken
In-Reply-To: <bug-7328-163@https.bugs.busybox.net/>
References: <bug-7328-163@https.bugs.busybox.net/>
Message-ID: <20140819164446.C4C939D4BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7328

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |yann.morin.1998 at free.fr
         AssignedTo|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> 2014-08-19 16:44:46 UTC ---
Confirmed.

Here is a tentative patch to ifix the issue.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fb4b849..d04fd36 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -318,14 +318,14 @@ $(2)_RAWNAME            =  $$(patsubst host-%,%,$(1))
 # version control system branch or tag, for example
remotes/origin/1_10_stable.
 ifndef $(2)_VERSION
  ifdef $(3)_VERSION
-  $(2)_DL_VERSION = $$($(3)_VERSION)
+  $(2)_DL_VERSION := $$($(3)_VERSION)
   $(2)_VERSION := $$(subst /,_,$$($(3)_VERSION))
  else
   $(2)_VERSION = undefined
   $(2)_DL_VERSION = undefined
  endif
 else
-  $(2)_DL_VERSION = $$($(2)_VERSION)
+  $(2)_DL_VERSION := $$($(2)_VERSION)
   $(2)_VERSION := $$(subst /,_,$$($(2)_VERSION))
 endif

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
