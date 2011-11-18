From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 18 Nov 2011 07:21:00 +0100
Subject: [Buildroot] [PATCH 2 of 5 v2] stripping: use findfileclauses
 utility function
In-Reply-To: <7fb9.4ec5b8f2.41d70@getafix.xdna.net>
References: <patchbomb.1321557989@devws108>
 <26239e4561037c19ccfc.1321557991@devws108>
 <7fb9.4ec5b8f2.41d70@getafix.xdna.net>
Message-ID: <CAAXf6LVfx-O305wGZzCt9G4H_MsUESSaM3F-7byrDyiVwApQ+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 18, 2011 at 2:46 AM, Cam Hutchison <camh@xdna.net> wrote:
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:
>
>>diff --git a/Makefile b/Makefile
>>--- a/Makefile
>>+++ b/Makefile
>>@@ -454,7 +454,7 @@ endif
>> ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
>> ? ? ? find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
>> endif
>>- ? ? ?find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so*' | \
>>+ ? ? ?find $(TARGET_DIR) -type f -perm +111 '!' $(call findfileclauses,libthread_db*.so*) | \
>
> This is less readable than what was there before. The findfileclauses
> macro only makes sense when it's expanding input from a variable.
> Literals should stay as they are...
>
>> ? ? ? ? ? ? ? xargs $(STRIPCMD) 2>/dev/null || true
>> ? ? ? find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
>
> ... just like this one.

The problem arises when you combine such a literal with files from a
variable: the variable may be empty or not, and then you don't know
whether or not to add '-o'.
If you do the following:
find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so*' -o
$(call findfileclauses,$(BR2_EXCLUDE_FILES))
while BR2_EXCLUDE_FILES is empty, the syntax is incorrect. Changing
the order doesn't help:
find $(TARGET_DIR) -type f -perm +111 '!' $(call
findfileclauses,$(BR2_EXCLUDE_FILES)) -o -name 'libthread_db*.so*'

I agree that this patch on its own is not good. However, I think it'll
be necessary in combination with the BR2_EXCLUDE_FILES patch.

Best regards,
Thomas
