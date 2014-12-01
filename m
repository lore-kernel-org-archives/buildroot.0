From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 1 Dec 2014 12:33:42 +0000
Subject: [Buildroot] [PATCH] xserver_xorg-server: libunwind support is
 broken on MIPS64 n32
In-Reply-To: <1417436666-54652-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1417436666-54652-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <547C6026.2080501@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, the former patch was a bit weird. In the commit log you said you
wanted to disable libunwind support for MIPS64, but you only did it for
MIPS64 Little Endian (BR2_mips64el). Why only the little endian variant
and not both big and little endian variants?

Anyway, this is not related to the endianess or the bitness. It's
related to the ABI. In the bug report is explained that it fails only
for the n32 ABI because libunwind assumes a 64bit word size for all
MIPS64 variants, which is wrong. MIPS64 n32 has a 32bit word size. Then,
xorg-server tries to do a conversion of a 64bit variable provided by
libunwind into a (void *), which is 32bit in MIPS64 n32, and it fails
with a message like this one:

backtrace.c:90:20: error: cast to pointer from integer of different size
[-Werror=int-to-pointer-cast]

-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
