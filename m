From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Sep 2009 09:28:40 +0200
Subject: [Buildroot] coreutils build failing
In-Reply-To: <4AA87826.5020506@rodgers.sdcoxmail.com> (Stephen Rodgers's
	message of "Wed\, 09 Sep 2009 20\:53\:10 -0700")
References: <4AA3EBC6.3080306@rodgers.sdcoxmail.com>
	<877hwbmi5k.fsf@macbook.be.48ers.dk>
	<4AA5300B.3060804@rodgers.sdcoxmail.com>
	<87r5ui63d1.fsf@macbook.be.48ers.dk>
	<4AA5529F.7050906@rodgers.sdcoxmail.com>
	<8763bu5twt.fsf@macbook.be.48ers.dk>
	<4AA58BB1.50906@rodgers.sdcoxmail.com>
	<87r5ugyywf.fsf@macbook.be.48ers.dk>
	<4AA87826.5020506@rodgers.sdcoxmail.com>
Message-ID: <87ocpjw95j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephen" == Stephen Rodgers <hwstar@rodgers.sdcoxmail.com> writes:

Hi,

 Stephen> As you requested, I tarred up the config.log from the failed
 Stephen> coreutils-7.4 build. You should be able to wget
 Stephen> config.log.tar.gz using the following url:

 Stephen> http://test.qrvc.com/config.log.tar.gz

Thanks. The bug is in the coreutils configure script:

grep -i -A1 -B1 '^[^|].*dest.*exists' config.log

configure:28670: result: yes
configure:28672: checking whether rename is broken when the destination exists
configure:28684: result: no
--
gl_cv_func_re_compile_pattern_working=no
gl_cv_func_rename_dest_exists_bug=no
gl_cv_func_rename_trailing_dest_slash_bug=yes
--
#define RENAME_TRAILING_SLASH_BUG 1
#define RENAME_DEST_EXISTS_BUG 1
#define rename rpl_rename_dest_slash

It correctly detects that you don't need the windows-only rename
workaround, but still it ends up defining RENAME_DEST_EXISTS_BUG.

The logic (m4/rename.m4) goes:

  if test $gl_cv_func_rename_trailing_slash_bug = yes ||
     test $gl_cv_func_rename_dest_exists_bug = yes; then
    AC_LIBOBJ([rename])
    AC_DEFINE([rename], [rpl_rename],
      [Define to rpl_rename if the replacement function should be used.])
    if test $gl_cv_func_rename_trailing_slash_bug; then
      AC_DEFINE([RENAME_TRAILING_SLASH_BUG], [1],
        [Define if rename does not work for source file names with a trailing
         slash, like the one from SunOS 4.1.1_U1.])
    fi
    if test $gl_cv_func_rename_dest_exists_bug; then
      AC_DEFINE([RENAME_DEST_EXISTS_BUG], [1],
        [Define if rename does not work when the destination file exists,
         as on Windows.])
    fi
    gl_PREREQ_RENAME
  fi

Notice that the 2nd test doesn't do 'test $var = yes', so if any of the
2 variables are true both defines will get set. Just above we see:

 dnl When crosscompiling, assume rename is broken.
 gl_cv_func_rename_trailing_slash_bug=yes)

So the quick fix is to tell configure that we don't need the trailing
slash bugfix (which also just adds to the size and isn't needed on
uclibc).

I've done that in git (dfca1b2e0e) - Please give it a try.

I've just checked, and all of this is removed in the recently released
coreutils 7.5, so we might consider upgrading to that.

-- 
Bye, Peter Korsgaard
