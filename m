From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 30 Jul 2015 15:16:04 +0100
Subject: [Buildroot] [PATCH 1/1] packages/btrfs-progs: fix build issues
 under musl
In-Reply-To: <20150729224726.71925205@free-electrons.com>
References: <1438195815-29424-1-git-send-email-brendanheading@gmail.com>
 <20150729224726.71925205@free-electrons.com>
Message-ID: <CA+BsyQ5rwfHxZTShaEum3A456-zFekijGV_+EsUH9=tGenUTBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> While this is a quick hack that works, I think it's really nothing more
> than a hack. I've implemented what I believe is a better solution, can
> you look at:
>
>         https://github.com/tpetazzoni/btrfs-progs/commits/configure-improvements
[..]
> Can you check if that continues to work fine with glibc and musl, and
> if so, submit the patches upstream?

Thomas,

Unfortunately things moved a bit quickly - I'd submitted my patch to
btrfs-progs yesterday and it was accepted earlier this morning before
I had a chance to tell them about your more comprehensive approach.

Your inline patch had one small typo:
=============================

--- a/kerncompat.h
+++ b/kerncompat.h
@@ -32,7 +32,7 @@

 #include <features.h>

-#ifdef HAVE_ALWAYS_INLINE
+#ifndef HAVE_ALWAYS_INLINE
 #define __always_inline __inline __attribute__ ((__always_inline__))
 #endif
=============================

Also, the build still requires that limits.h is included, but that was
not in the scope of what you were doing.

Therefore I propose to add three patches to buildroot - your two (with
the #ifndef fixed), plus one for limits.h.

For the upstream, I will modify your patch slightly so that it reverts
the relevant three-line part of my previous patch. OK ?

regards

Brendan
