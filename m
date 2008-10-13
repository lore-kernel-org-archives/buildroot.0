From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 13 Oct 2008 03:29:35 -0700
Subject: [Buildroot] [buildroot 0005384]: xclock should not be linked
	against iconv
Message-ID: <de47e1d27834026ef9a5df9590080697@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5384 
====================================================================== 
Reported By:                tpetazzoni
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5384
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-13-2008 03:29 PDT
Last Modified:              10-13-2008 03:29 PDT
====================================================================== 
Summary:                    xclock should not be linked against iconv
Description: 
The current xapp_xclock.mk does:

XAPP_XCLOCK_CONF_OPT = LDFLAGS="-liconv"

which forces the library flags -liconv to be passed on every compilation.
However, with uClibc, the iconv functions (iconv_open(), iconv_close())
are directly part of the C library, and not part of a separate iconv
library. So with this LDFLAGS value, the compilation fails.

The configure.ac file of xclock contains:

AC_SEARCH_LIBS([iconv], [iconv], 
        [AC_DEFINE(HAVE_ICONV, 1, [Define to 1 if iconv() is
available.])])

so it should already automatically link with -liconv if needed, or without
-liconv if not needed.

The attached patch fixes the problem by simply dropping
XAPP_XCLOCK_CONF_OPT.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-13-08 03:29  tpetazzoni     New Issue                                    
10-13-08 03:29  tpetazzoni     Status                   new => assigned     
10-13-08 03:29  tpetazzoni     Assigned To               => buildroot       
10-13-08 03:29  tpetazzoni     File Added: xapp-xclock-remove-liconv            
       
======================================================================
