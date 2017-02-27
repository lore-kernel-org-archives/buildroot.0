From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Feb 2017 22:00:03 +0100
Subject: [Buildroot] [git commit] assimp: work around gcc bug on SuperH
In-Reply-To: <20170227203901.6122181861@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 27 Feb 2017 21:38:49 +0100")
References: <20170227203901.6122181861@busybox.osuosl.org>
Message-ID: <878torl57w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=68cebedeb977396f64f5f591f5e93f34fab8e0a8
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > gcc versions earlier than gcc 6.x fail to build assimp on SuperH when
 > static linking:

 >   AssxmlExporter.cpp:623:1: error: unable to find a register to spill in class 'GENERAL_REGS'

 > It's the combination of -Os and *not* having -fPIC that makes gcc
 > fail, which explains why configurations with dynamic linking work
 > fine.

 >  -Os -fPIC -> works
 >  -Os       -> fails
 >  -O2 -fPIC -> works
 >  -O2       -> works

 > Therefore, as a workaround, we are forcing the use of -O2 on SuperH
 > when the gcc version is older than gcc 6.x and we're statically
 > linking.

 > Fixes:

 >   http://autobuild.buildroot.net/results/ec88aa8118179e30e24603cc45292047dca19216/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/assimp/assimp.mk | 8 ++++++++
 >  1 file changed, 8 insertions(+)

 > diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
 > index 08893ff..298e121 100644
 > --- a/package/assimp/assimp.mk
 > +++ b/package/assimp/assimp.mk
 > @@ -16,6 +16,14 @@ ifeq ($(BR2_m68k),y)
 >  ASSIMP_CXXFLAGS += -mxgot
 >  endif
 
 > +# workaround SuperH compiler failure when static linking (i.e -fPIC is
 > +# not passed) in gcc versions 5.x or older. The -Os optimization level
 > +# causes a "unable to find a register to spill in class
 > +# ??GENERAL_REGS??" error. -O2 works fine.

Any specific reason for the unicode quotes?

> +ifeq ($(BR2_sh):$(BR2_STATIC_LIBS):$(BR2_HOST_GCC_AT_LEAST_6),y:y:)

HOST_GCC? Don't you mean BR2_TOOLCHAIN_GCC_AT_LEAST_6?

-- 
Bye, Peter Korsgaard
