From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Nov 2019 20:14:38 +0100
Subject: [Buildroot] [PATCH 01/11] package/chrony: use libedit for
 command line editing
In-Reply-To: <20191113185311.GJ3419@scaer> (Yann E. MORIN's message of "Wed,
 13 Nov 2019 19:53:11 +0100")
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-2-peter@korsgaard.com>
 <20191113185311.GJ3419@scaer>
Message-ID: <87imnnk2qp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2019-11-13 16:17 +0100, Peter Korsgaard spake thusly:
 >> chrony is licensed under GPL-2.0, which is not license compatible with
 >> readline (GPL-3.0+), so remove the optional readline handling and replace
 >> with libedit instead.
 >> 
 >> While we are at it, also explicitly disable the libedit backend when not
 >> available.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/chrony/chrony.mk | 7 ++++---
 >> 1 file changed, 4 insertions(+), 3 deletions(-)
 >> 
 >> diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
 >> index f6dcb11794..379745022c 100644
 >> --- a/package/chrony/chrony.mk
 >> +++ b/package/chrony/chrony.mk
 >> @@ -13,6 +13,7 @@ CHRONY_CONF_OPTS = \
 >> --host-system=Linux \
 >> --host-machine=$(BR2_ARCH) \
 >> --prefix=/usr \
 >> +	--without-readline \

 > Why is this --without-readline needed here...

 >> --without-tomcrypt \
 >> $(if $(BR2_PACKAGE_CHRONY_DEBUG_LOGGING),--enable-debug,--disable-debug)
 >> 
 >> @@ -35,10 +36,10 @@ else
 >> CHRONY_CONF_OPTS += --without-seccomp
 >> endif
 >> 
 >> -ifeq ($(BR2_PACKAGE_READLINE),y)
 >> -CHRONY_DEPENDENCIES += readline
 >> +ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 >> +CHRONY_DEPENDENCIES += libedit
 >> else
 >> -CHRONY_CONF_OPTS += --disable-readline
 >> +CHRONY_CONF_OPTS += --without-editline --disable-readline

 > ... with this other --disable-readline here?

Because they do two different things (chrony uses a hand written
configure script):

 --disable-readline     Disable line editing support
 --without-readline     Don't use GNU readline even if it is available
 --without-editline     Don't use editline even if it is available

-- 
Bye, Peter Korsgaard
