From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Nov 2013 22:54:24 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <20131121181248.3c606028@skate>
References: <1385046971-7707-1-git-send-email-rebillout@syscom.ch>
 <1385046971-7707-2-git-send-email-rebillout@syscom.ch>
 <20131121164242.64981c00@skate> <528E3223.1000401@syscom.ch>
 <20131121181248.3c606028@skate>
Message-ID: <528E8110.10406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/11/13 18:12, Thomas Petazzoni wrote:
> Dear Arnaud R?billout,
>
> On Thu, 21 Nov 2013 17:17:39 +0100, Arnaud R?billout wrote:
>
[snip]
>> But after that comes the second problem: the test is supposed to run
>> this piece of code. How are we supposed to run cross-compiled code on
>> the host ?
>> I can imagine it's a typical problem, but I don't know how it's supposed
>> to be handled.
>
> Yes, that's a typical problem, and of course, we cannot use configure
> scripts that try to run programs compiled for the target on the build
> machine.
>
> I believe we have two solutions here:
>
>   (1) Find the configure variable that can be passed in the configure
>       environment to tell configure that posix_fallocate() is not
>       available. Set it to "available" when a glibc/eglibc toolchain is
>       used and "not available" when an uClibc toolchain is used.
>
>   (2) Or, better, improve the configure test to be able to only do the
>       compile test and not the execution test, and assume that if a
>       posix_fallocate() program builds, then it means that it works. We
>       don't use those old glibcs or AIX that have broken
>       posix_fallocate().

  You can give AC_TRY_RUN a fourth argument with actions to take when 
cross-compiling. These actions are taken when compilation was successful. 
Basically, the following patch should work:

----------------------------------
Fix support for cross-compilation.

The check for posix_fallocate doesn't handle the cross-compilation case. 
Assume that it works, because cross-compilation for AIX or old glibc is 
unlikely.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
diff -Nrup lftp-4.4.10.orig/m4/lftp.m4 lftp-4.4.10/m4/lftp.m4
--- lftp-4.4.10.orig/m4/lftp.m4 2013-03-19 13:25:50.000000000 +0100
+++ lftp-4.4.10/m4/lftp.m4      2013-11-21 22:46:27.776820935 +0100
@@ -271,6 +271,8 @@ AC_DEFUN([LFTP_POSIX_FALLOCATE_CHECK],[
         i_cv_posix_fallocate_works=yes
       ], [
         i_cv_posix_fallocate_works=no
+     ], [
+       i_cv_posix_fallocate_works=yes
       ])
     ])
     if test x$i_cv_posix_fallocate_works = xyes; then
----------------------------------


  But of course I haven't tested it :-)

  If this patch is OK, can you also upstream it?

  Don't forget to add your own SOB BTW.

  Regards,
  Arnout




-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
