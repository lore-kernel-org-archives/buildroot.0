From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Feb 2016 23:30:43 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/numactl: Fix uClibc compile
 breakage after musl compile fix
In-Reply-To: <6ie6pcx556.ln2@ID-313208.user.individual.net>
References: <1455393768-26580-1-git-send-email-bernd.kuhls@t-online.de>
 <20160214135141.3b0cbd49@free-electrons.com>
 <6ie6pcx556.ln2@ID-313208.user.individual.net>
Message-ID: <20160215233043.39f36d97@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 14 Feb 2016 15:11:50 +0100, Bernd Kuhls wrote:

> the code you mentioned above was the first PR I sent on github[1] and 
> received this answer: 
> https://github.com/numactl/numactl/pull/4#issuecomment-183441544
> 
> "I don't think the patch is correct. If GLIBC_PREREQ fails the #elif 
> defined(__x86_64) path still needs to be taken. So you need to combine 
> the two #ifs into one line"
> 
> And combining the two #ifs into one line breaks compilation on musl so I 
> wrote the current patch.

Can you try the below patch instead?

Index: b/syscall.c
===================================================================
--- a/syscall.c
+++ b/syscall.c
@@ -115,7 +115,13 @@
 
 #endif
 
-#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 11)
+#if defined(__GLIBC__)
+# if __GLIBC_PREREQ(2, 11)
+#  define GLIBC_HAS_WORKING_SYSCALL6
+# endif
+#endif
+
+#if defined(GLIBC_HAS_WORKING_SYSCALL6)
 
 /* glibc 2.11 seems to have working 6 argument sycall. Use the
    glibc supplied syscall in this case.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
