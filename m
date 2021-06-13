From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 13 Jun 2021 13:25:33 +0000
Subject: [Buildroot] [Bug 13836] package build failure when target install
 set to no on pkg-generic pkg types
In-Reply-To: <bug-13836-163@https.bugs.busybox.net/>
References: <bug-13836-163@https.bugs.busybox.net/>
Message-ID: <bug-13836-163-54SI0f84hV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13836

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Matt, All,

I was thinking a proper solution to the issue would be something
along the lines of:

```diff
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9fbc63d19e..5e53d008e1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1120,6 +1120,12 @@ endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 # configuration
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)

+ifeq ($$($(2)_TYPE),target)
+ifeq ($$(filter YES,$$($(2)_INSTALL_STAGING) $$($(2)_INSTALL_IMAGES)
$$($(2)_INSTALL_TARGET)),)
+$$(error $(1) does not install anything anywhere)
+endif
+endif
+
 # Ensure the calling package is the declared provider for all the virtual
 # packages it claims to be an implementation of.
 ifneq ($$($(2)_PROVIDES),)
```

-- 
You are receiving this mail because:
You are on the CC list for the bug.
