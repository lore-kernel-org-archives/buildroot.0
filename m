From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 13 Oct 2008 09:04:22 -0700
Subject: [Buildroot] [buildroot 0005404]: Bogus check on internal toolchain
	configuration
Message-ID: <c3e871adb00e5206e786f8945d11a38d@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5404 
====================================================================== 
Reported By:                tpetazzoni
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5404
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-13-2008 09:04 PDT
Last Modified:              10-13-2008 09:04 PDT
====================================================================== 
Summary:                    Bogus check on internal toolchain configuration
Description: 
package/libglib2/libglib2.mk and package/libglib2/Config.in both test
BR2_ENABLE_LOCALE to know whether libiconv shoud be compiled (when
BR2_ENABLE_LOCALE is not set, the toolchain doesn't have support for
locales, so an external iconv library is needed, while when
BR2_ENABLE_LOCALE is set, we can use the internal iconv implementation of
the C library).

The problem is that these checks are completely bogus when using an
external toolchain, which is a common use case with Buildroot.
BR2_ENABLE_LOCALE is not set, but the toolchain might have iconv support.
So, because of libglib2's dependency, Buildroot compiles GNU libiconv and
installs it to the staging_dir. The configure script of libglib then
detects that an internal iconv implementation is available and decides to
use. But the compilation of libglib2 fails later due to the following test
in glib/gconvert.c:

#if !defined(USE_LIBICONV_GNU) && defined (_LIBICONV_H)
#error GNU libiconv not in use but included iconv.h is from libiconv
#endif

USE_LIBICONV_GNU is not defined because the ./configure script has found
that the internal implementation of iconv by the C library was present.
_LIBICONV_H is defined because GNU libiconv has been installed in the
staging_dir, including its header file.

I don't know how such a problem should be handled. What's the Buildroot
policy for that kind of internal vs. external toolchain configuration
issues ?
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-13-08 09:04  tpetazzoni     New Issue                                    
10-13-08 09:04  tpetazzoni     Status                   new => assigned     
10-13-08 09:04  tpetazzoni     Assigned To               => buildroot       
======================================================================
