From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Sep 2014 09:39:33 +0200
Subject: [Buildroot] [PATCH 12/12] libffi and python: need threads
	support
In-Reply-To: <1410537011-29662-13-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Fri, 12 Sep 2014 17:50:11 +0200")
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
 <1410537011-29662-13-git-send-email-jezz@sysmic.org>
Message-ID: <87oauk9dfu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > libffi depends on pthreads.
 > Python depends on libffi (it can provide a builtin libffi, but also depends on
 > pthreads). Thus this patch also disable Python support if toolchain is compiled
 > w/o treads support.

 > Fixes http://sysmic.org/~jezz/results/204099dd:

 > ../src/closures.c:119:21: fatal error: pthread.h: No such file or directory

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
 > ---
 >  package/libffi/Config.in | 4 ++++
 >  package/python/Config.in | 4 +++-

python is not the only user of libffi. From a quick look, they all
depends on threads except for python3, so I've made the same change to
python3.

 >  2 files changed, 7 insertions(+), 1 deletion(-)

 > diff --git a/package/libffi/Config.in b/package/libffi/Config.in
 > index 7211f8f..6edf570 100644
 > --- a/package/libffi/Config.in
 > +++ b/package/libffi/Config.in
 > @@ -1,5 +1,6 @@
 >  config BR2_PACKAGE_LIBFFI
 >  	bool "libffi"
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS
 >  	help
 >  	  The libffi library provides a portable, high level
 >  	  programming interface to various calling conventions. This
 > @@ -7,3 +8,6 @@ config BR2_PACKAGE_LIBFFI
 >  	  interface description at run-time.
 
 >  	  http://sourceware.org/libffi/
 > +
 > +comment "libffi needs a toolchain w/ threads"
 > +	depends on !BR2_TOOLCHAIN_HAS_THREADS
 > diff --git a/package/python/Config.in b/package/python/Config.in
 > index a0c78c6..85438a4 100644
 > --- a/package/python/Config.in
 > +++ b/package/python/Config.in
 > @@ -3,15 +3,17 @@ config BR2_PACKAGE_PYTHON
 >  	depends on BR2_USE_WCHAR
 >  	# uses fork()
 >  	depends on BR2_USE_MMU
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 >  	select BR2_PACKAGE_LIBFFI
 >  	help
 >  	  The python language interpreter.
 
 >  	  http://www.python.org/
 
 > -comment "python needs a toolchain w/ wchar"
 > +comment "python needs a toolchain w/ wchar and threads"
 >  	depends on BR2_USE_MMU
 >  	depends on !BR2_USE_WCHAR
 > +	depends on !BR2_TOOLCHAIN_HAS_THREADS

That's wrong. Seperate 'depends on' gets ANDed together, E.G. they all
have to be true, whereas we want to display the line whenever
mmu and either !wchar OR !threads, so it should be

depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
