From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 17:11:49 +0100
Subject: [Buildroot] [PATCH] rtptools: disable for MIPS Codescape
 toolchains
In-Reply-To: <56DEF7EC.20904@imgtec.com>
References: <1457446983-17165-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160308163256.764be70e@free-electrons.com>
 <56DEF7EC.20904@imgtec.com>
Message-ID: <20160308171149.7dff6ff4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Mar 2016 16:03:56 +0000, Vicente Olivert Riera wrote:

> > Isn't the problem that the Codescape toolchain don't provide RPC
> > support at all ? 
> 
> Yes, that's the problem.

Ah, OK. That's a different problem indeed.

> > I don't really like to add random toolchain exclusions without a more
> > serious explanation than "header file is not in toolchain".
> 
> Ok. Perhaps we should make rtptools package depeding on
> BR2_TOOLCHAIN_HAS_NATIVE_RPC?

Well, I just built rtptools with
http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config,
which does *not* have RPC support, and it builds fine. So it is not
simply that rtptools unconditionally needs RPC support. Looking at the
code, it does:

#ifndef __UCLIBC__
#define HAVE_YP
#endif

#ifdef HAVE_YP
#include <rpcsvc/ypclnt.h>   /* YP */
#endif


So it seems like it has special handling for uClibc. I think you should
replace this with an AC_CHECK_HEADERS test for rpcsvc/ypclnt.h, and use
the HAVE_<foo> variable that will be defined by this test.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
