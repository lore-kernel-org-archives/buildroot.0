From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Mar 2016 11:32:48 +0100
Subject: [Buildroot] [PATCH] sox: disable SSP when using MIPS Codescape
	toolchains
In-Reply-To: <1456763982-36511-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 29 Feb 2016 16:39:42 +0000")
References: <1456763982-36511-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87bn6ymqsv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > MIPS Codescape toolchains don't support stack-smashing protection
 > despite of using glibc, therefore we see failures like this one:

 > mips-img-linux-gnu/bin/ld: cannot find -lssp

 > Fixes:
 >   http://autobuild.buildroot.net/results/957/95721f7b88c46a20202fb02e408817097df965c3/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  package/sox/sox.mk | 6 ++++++
 >  1 file changed, 6 insertions(+)

 > diff --git a/package/sox/sox.mk b/package/sox/sox.mk
 > index f4d1608..61f5220 100644
 > --- a/package/sox/sox.mk
 > +++ b/package/sox/sox.mk
 > @@ -13,6 +13,12 @@ SOX_CONF_OPTS = --with-distro="Buildroot" --without-ffmpeg --disable-gomp \
 >  SOX_LICENSE = GPLv2+ (sox binary), LGPLv2.1+ (libraries)
 >  SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
 
 > +# MIPS Codescape toolchains don't support stack-smashing protection
 > +# despite of using glibc.
 > +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS)$(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
 > +SOX_CONF_OPTS += --disable-stack-protector
 > +endif

Committed, thanks (for 2016.02). Please consider generalizing it like
Thomas suggested for the 2016.05 cycle.

-- 
Bye, Peter Korsgaard
