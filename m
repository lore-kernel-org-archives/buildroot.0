From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Dec 2014 22:29:44 +0100
Subject: [Buildroot] [PATCH] xserver_xorg-server: disable libunwind on
	MIPS with 32-bit pointers
In-Reply-To: <1417778222-19910-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 5 Dec 2014 11:17:02 +0000")
References: <1417778222-19910-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87tx17up13.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

Hi,

 > libunwind support in xorg-server is not only broken for MIPS64 n32 but
 > for all MIPS variants with 32-bit pointers. The reason is exactly the
 > same one. libunwind defines a uint64 variable to store the words. Then,
 > xorg-server casts that variable (64-bit) into a pointer (32-bit), and
 > the compilation fails:

 > backtrace.c:98:13: error: cast to pointer from integer of different size
 > [-Werror=int-to-pointer-cast]

 > Related:
 >   https://bugs.freedesktop.org/show_bug.cgi?id=79939

 > Fixes:
 >   http://autobuild.buildroot.net/results/87b/87be2c95957f9925c1258812e536df72689fc5da/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  .../xserver_xorg-server/xserver_xorg-server.mk     |    5 +++--
 >  1 files changed, 3 insertions(+), 2 deletions(-)

 > diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
 > index 4164ccf..91b4f03 100644
 > --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
 > +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
 > @@ -144,10 +144,11 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 >  XSERVER_XORG_SERVER_DEPENDENCIES += freetype
 >  endif
 
 > -# libunwind support is broken on MIPS64 n32
 > +# libunwind support is broken on all MIPS variants with 32-bit pointers
 >  # https://bugs.freedesktop.org/show_bug.cgi?id=79939
 > -ifeq ($(BR2_PACKAGE_LIBUNWIND)-$(BR2_MIPS_NABI32),y-)
 > +ifeq ($(BR2_PACKAGE_LIBUNWIND)-$(BR2_MIPS_OABI32)-$(BR2_MIPS_NABI32),y--)

The dash (-) between _OABI32 and _NABI32 is not strictly needed. The
only reason we had it before is that we wanted to detect libunwind AND
!NABI32, so when they expand to 'y' and '', and not confuse it with
!libunwind ('') AND NABI32 ('y'), so we needed a separator.

-- 
Bye, Peter Korsgaard
