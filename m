From: Weber, Bernd <BWEBE@dolby.com>
Date: Wed, 17 Sep 2008 08:53:39 -0700
Subject: [Buildroot] Problem cross compiling for MIPS and shared
	libgcc_snot found
In-Reply-To: <05BB196AB3DA6C4BBE11AB6C957581FE0FBECF4F@sfo-exch-01.dolby.net>
References: <05BB196AB3DA6C4BBE11AB6C957581FE0FBECF4F@sfo-exch-01.dolby.net>
Message-ID: <05BB196AB3DA6C4BBE11AB6C957581FE0FD0D22B@sfo-exch-01.dolby.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I didn't get any expert advise on this yet but I found a way around the
issue. I know that his is probably a dirty hack and will not end up in
the repository but if anybody else ever has this problem and needs a
solution here is one:

--- gcc-4.0.4.bak/Makefile.in         2006-04-04 14:04:37.000000000
-0700

+++ gcc-4.0.4/Makefile.in    2008-09-16 12:06:36.150561000 -0700

@@ -214,7 +214,8 @@

 RAW_CXX_TARGET_EXPORTS = \

          $(BASE_TARGET_EXPORTS) \

          CXX_FOR_TARGET="$(RAW_CXX_FOR_TARGET)"; export CXX_FOR_TARGET;
\

-        CXX="$(RAW_CXX_FOR_TARGET)"; export CXX;

+        CXX="$(RAW_CXX_FOR_TARGET)"; export CXX; \

+        CC="$(RAW_CXX_FOR_TARGET)"; export CC;

 

By redefining the CC variable in the gcc Makefile the libstdc++ build
has all necessary information and can build against the shared libgcc
and with symbolic versioning.

If anybody has a better, more permanent solution, please post. Thanks!

 

-Bernd

________________________________

This message (including any attachments) may contain confidential
information intended for a specific individual and purpose. If you are
not the intended recipient, delete this message. If you are not the
intended recipient, disclosing, copying, distributing, or taking any
action based on this message is strictly prohibited. 




-----------------------------------------
This message (including any attachments) may contain confidential
information intended for a specific individual and purpose.  If you
are not the intended recipient, delete this message.  If you are
not the intended recipient, disclosing, copying, distributing, or
taking any action based on this message is strictly prohibited.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080917/c0b09d6f/attachment.htm 
