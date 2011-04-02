From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 02 Apr 2011 22:55:17 +0200
Subject: [Buildroot] [PATCH 2/2] qt: speed up qmake build
In-Reply-To: <66242e9ff64f81f9c0c3b11fc7c1fc7933eb4efc.1301763163.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sat, 2 Apr 2011 18:52:52 +0200")
References: <cover.1301763163.git.thomas.petazzoni@free-electrons.com>
	<cover.1301763163.git.thomas.petazzoni@free-electrons.com>
	<66242e9ff64f81f9c0c3b11fc7c1fc7933eb4efc.1301763163.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r59kz83u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> qmake is built during the execution of Qt ./configure script, so it is
 Thomas> built just with a normal make, not taking advantage of parallel
 Thomas> compilation. Passing MAKEFLAGS=-j$(BR2_JLEVEL) allows to speed up the
 Thomas> qmake compilation process quite a bit.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/qt/qt.mk |    2 +-
 Thomas>  1 files changed, 1 insertions(+), 1 deletions(-)

 Thomas> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
 Thomas> index 62ba869..c1f11ed 100644
 Thomas> --- a/package/qt/qt.mk
 Thomas> +++ b/package/qt/qt.mk
 Thomas> @@ -468,7 +468,7 @@ define QT_CONFIGURE_CMDS
 Thomas>  		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 Thomas>  		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 Thomas>  		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 Thomas> -		./configure \
 Thomas> +		MAKEFLAGS=-j$(BR2_JLEVEL) ./configure \

Maybe we should do MAKEFLAGS='$(MAKEFLAGS) -j$(BR2_LEVEL)' so other make
settings like -s are forwarded as well?

-- 
Bye, Peter Korsgaard
