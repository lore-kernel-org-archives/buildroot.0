From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 16:24:21 +0200
Subject: [Buildroot] [PATCH 1/1] packages/btrfs-progs: fix build issues
 under musl
In-Reply-To: <CA+BsyQ5rwfHxZTShaEum3A456-zFekijGV_+EsUH9=tGenUTBA@mail.gmail.com>
References: <1438195815-29424-1-git-send-email-brendanheading@gmail.com>
 <20150729224726.71925205@free-electrons.com>
 <CA+BsyQ5rwfHxZTShaEum3A456-zFekijGV_+EsUH9=tGenUTBA@mail.gmail.com>
Message-ID: <20150730162421.5a12b1aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Thu, 30 Jul 2015 15:16:04 +0100, Brendan Heading wrote:

> Unfortunately things moved a bit quickly - I'd submitted my patch to
> btrfs-progs yesterday and it was accepted earlier this morning before
> I had a chance to tell them about your more comprehensive approach.
> 
> Your inline patch had one small typo:
> =============================
> 
> --- a/kerncompat.h
> +++ b/kerncompat.h
> @@ -32,7 +32,7 @@
> 
>  #include <features.h>
> 
> -#ifdef HAVE_ALWAYS_INLINE
> +#ifndef HAVE_ALWAYS_INLINE
>  #define __always_inline __inline __attribute__ ((__always_inline__))

Humm, in fact my patch is wrong. So what they were doing is:

 #ifndef __GLIBC__
 #define __always_inline __inline __attribute__ ((__always_inline__))
 #endif

So in fact they are not testing that __always_inline__ is a valid gcc
function attribute.

They are defining __always_inline as a shortcut for marking a function
as always inline. This shortcut is defined by glibc, but not by other C
libraries, so they are doing it manually.

So, I think my patch should be adapted. You need to:

 * Remove the m4/ax_gcc_func_attribute.m4 file, revert my .gitignore
   change and remove the added AC_CONFIG_MACRO_DIR([m4]).

 * Add AC_CHECK_DECLS([__always_inline]) in configure.ac, and do
   #ifndef HAVE_DECL___ALWAYS_INLINE in kerncompat.h.

It will in fact make the patch a lot simpler, which is good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
