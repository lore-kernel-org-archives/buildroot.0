From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Sep 2014 21:34:35 +0200
Subject: [Buildroot] [PATCH] openssh: fix static linking
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C68C8AE2F4@ex-mb3.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C68C8AE2F4@ex-mb3.corp.adtran.com>
Message-ID: <20140909213435.565e0234@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Sep 2014 18:29:31 +0000, ANDY KENNEDY wrote:

> When BR2_PREFER_STATIC_LIB is set, openssl is a static library, openssh
> attempts to build dynamically as the LDFLAGS are dropped out of this build.
> If PREFER_STATIC is set, add back in --static to the LDFLAGS of openssh
> to make the linker happy.
> 
> Signed-off-by:  Andy Kennedy <andy.kennedy@adtran.com>

Sorry, but it does not make sense, because:

ifeq ($(BR2_PREFER_STATIC_LIB),y)
SHARED_STATIC_LIBS_OPTS = --enable-static --disable-shared
TARGET_CFLAGS += -static
TARGET_CXXFLAGS += -static
TARGET_LDFLAGS += -static
else
SHARED_STATIC_LIBS_OPTS = --enable-static --enable-shared
endif

So, TARGET_CFLAGS does have -static.

Please make sure to test your patches against the latest master. I'm
sure you're again testing against 2014.02, and there has been quite a
few changes since then in terms of static library support.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
