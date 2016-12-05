From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 4 Dec 2016 19:24:17 -0800
Subject: [Buildroot] [PATCH] autossh: honour LDFLAGS
In-Reply-To: <20161204120637.GE14207@waldemar-brodkorb.de>
References: <20161125180016.GA360@waldemar-brodkorb.de>
 <20161128222834.37958cd9@free-electrons.com>
 <20161129041655.GK14207@waldemar-brodkorb.de>
 <20161129094321.656d1cb4@free-electrons.com>
 <CAMo8BfJAGT8cdvQ2xMx33HKDwW34XP6wVxHd1yn-UxAyQEYpRA@mail.gmail.com>
 <20161130050003.GS14207@waldemar-brodkorb.de>
 <CAMo8Bf+tDete50wsasrj=L1G=7XCJ9=dZBav4azY_PN1HTzrqw@mail.gmail.com>
 <20161202052526.GB14207@waldemar-brodkorb.de>
 <CAMo8BfLxFxaRGAsgAX+xqorPfJAH0ZTAVmpUfFb3mC_wHbKPMg@mail.gmail.com>
 <20161204120637.GE14207@waldemar-brodkorb.de>
Message-ID: <CAMo8Bf+Ny2X82BY__feRXp6poYsvppujHwvWCRx7K7nRzT4kOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 4, 2016 at 4:06 AM, Waldemar Brodkorb <wbx@openadk.org> wrote:
>> On Thu, Dec 1, 2016 at 9:25 PM, Waldemar Brodkorb <wbx@openadk.org> wrote:
>> >> Hello,
>> >>
>> >> TL;DR: -static is good, order of objects in libc.a is important.
>> >
>> > Thanks for the very detailed analysis.
>> > Do you have any idea how we could restore the old order and keep
>> > the binaries smaller?
>>
>> One ugly solution could be putting __uClibc-main.os before both libc-tls.os
>> and init.os, something like the following:
>>
>> diff --git a/libc/misc/internals/Makefile.in b/libc/misc/internals/Makefile.in
>> index ae094ee..d2400d2 100644
>> --- a/libc/misc/internals/Makefile.in
>> +++ b/libc/misc/internals/Makefile.in
>> @@ -25,7 +25,7 @@ libc-shared-y += $(MISC_INTERNALS_OUT)/__uClibc_main.oS
>>  else
>>  libc-shared-y += $(MISC_INTERNALS_OUT)/__uClibc_main.os
>>  endif
>> -libc-static-y += $(MISC_INTERNALS_OUT)/__uClibc_main.o
>> +libc-static-y := $(MISC_INTERNALS_OUT)/__uClibc_main.o $(libc-static-y)
>>  libc-static-$(UCLIBC_FORMAT_FLAT_SEP_DATA) += \
>>    $(MISC_INTERNALS_OUT)/shared_flat_initfini.o \
>>    $(MISC_INTERNALS_OUT)/shared_flat_add_library.o
>
> Thanks for the patch, I tried it.
> But unforunately it breaks other applications as busybox init.

Well, it shows that the current uClibc-ng is broken without pthread
code. The root cause of the init breakage is a call to
_pthread_cleanup_push_defer from mallopt, which currently points
to NULL, because _pthread_cleanup_push_defer is weak and its
definition was removed from __uClibc_main.c in the unification
patch. Restoring it fixes init for me.
I tried to follow the story of these definitions, but it seems to be a
chain of failures and attempted fixes. So I'm not sure this fixes
everything and doesn't break something else ): It sure needs testing.

diff --git a/libc/misc/internals/__uClibc_main.c
b/libc/misc/internals/__uClibc_main.c
index 46e24d8..0446b08 100644
--- a/libc/misc/internals/__uClibc_main.c
+++ b/libc/misc/internals/__uClibc_main.c
@@ -68,6 +68,42 @@ uintptr_t __stack_chk_guard attribute_relro;

 void internal_function _dl_aux_init (ElfW(auxv_t) *av);

+#ifdef __UCLIBC_HAS_THREADS__
+/*
+ * uClibc internal locking requires that we have weak aliases
+ * for dummy functions in case libpthread.a is not linked in.
+ * This needs to be in compilation unit that is pulled always
+ * in or linker will disregard these weaks.
+ */
+
+static int __pthread_return_0 (pthread_mutex_t *unused) { return 0; }
+weak_alias (__pthread_return_0, __pthread_mutex_lock)
+weak_alias (__pthread_return_0, __pthread_mutex_trylock)
+weak_alias (__pthread_return_0, __pthread_mutex_unlock)
+
+int weak_function
+__pthread_mutex_init(pthread_mutex_t *mutex, const pthread_mutexattr_t *attr)
+{
+        return 0;
+}
+
+void weak_function
+_pthread_cleanup_push_defer(struct _pthread_cleanup_buffer *__buffer,
+                            void (*__routine) (void *), void *__arg)
+{
+        __buffer->__routine = __routine;
+        __buffer->__arg = __arg;
+}
+
+void weak_function
+_pthread_cleanup_pop_restore(struct _pthread_cleanup_buffer *__buffer,
+                             int __execute)
+{
+        if (__execute)
+                __buffer->__routine(__buffer->__arg);
+}
+#endif /* __UCLIBC_HAS_THREADS__ */
+
 #endif /* !SHARED */

 /* Defeat compiler optimization which assumes function addresses are
never NULL */


-- 
Thanks.
-- Max
