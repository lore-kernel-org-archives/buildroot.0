From: Cam Hutchison <camh@xdna.net>
Date: Fri, 18 Nov 2011 01:46:26 -0000
Subject: [Buildroot] [PATCH 2 of 5 v2] stripping: use findfileclauses
	utility function
References: <patchbomb.1321557989@devws108>
 <26239e4561037c19ccfc.1321557991@devws108>
Message-ID: <7fb9.4ec5b8f2.41d70@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

>diff --git a/Makefile b/Makefile
>--- a/Makefile
>+++ b/Makefile
>@@ -454,7 +454,7 @@ endif
> ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
> 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
> endif
>-	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so*' | \
>+	find $(TARGET_DIR) -type f -perm +111 '!' $(call findfileclauses,libthread_db*.so*) | \

This is less readable than what was there before. The findfileclauses
macro only makes sense when it's expanding input from a variable.
Literals should stay as they are...

> 		xargs $(STRIPCMD) 2>/dev/null || true
> 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \

... just like this one.
