From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 May 2010 10:27:15 +0200
Subject: [Buildroot] [PATCH 02/19] Make all package using gettext rely
	on BR2_NEEDS_GETTEXT
In-Reply-To: <87ocg8qti8.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Sat, 22 May 2010 09:34:55 +0200")
References: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
	<cover.1274428595.git.thomas.petazzoni@free-electrons.com>
	<542fbe8520c981f9c96705a57e4263f34f2ab2e6.1274428595.git.thomas.petazzoni@free-electrons.com>
	<87mxvtt4fe.fsf@macbook.be.48ers.dk> <20100522001149.2ef4a5bb@surf>
	<87ocg8qti8.fsf@macbook.be.48ers.dk>
Message-ID: <87k4qwqr30.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 Thomas> So we have two cases :

 Thomas> * Packages like Avahi. They understand --disable-nls and therefore
 Thomas> when locale support is not enabled, they don't need gettext.

 Thomas> * Packages like libglib2. They don't understand --disable-nls, so even
 Thomas> when locale is not enabled, they need gettext. libglib2 builds
 Thomas> fine in the previous situation, where BR2_NEEDS_GETTEXT was set
 Thomas> to yes as soon as an uClibc toolchain was used (regardless of
 Thomas> whether BR2_ENABLE_LOCALE is set or not). So it is possible to build
 Thomas> libglib2 with a !BR2_ENABLE_LOCALE toolchain, but it requires
 Thomas> gettext to be built.

 Peter> We could handle it in several different ways:
 Peter> - Make gettext a dummy kconfig/make target when glibc is used
 Peter> - Make BR2_NEEDS_GETTEXT simply be always enabled on uclibc and then
 Peter>   - select gettext if BR2_NEEDS_GETTEXT (and depends on BR2_USE_WCHAR)
 Peter>     for stuff like libglib2
 Peter>   - select getttext if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE) for
 Peter>     stuff like avahi

Thinking a bit more about it, the easiest might just be to introduce two
symbols, one for each of the cases, E.G.:

diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index fc6759d..233303a 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -56,13 +56,16 @@ config BR2_ENABLE_LOCALE_WHITELIST
          will be available on the target - That purely depends on the
          support for that locale in the selected packages.
 
+config BR2_TOOLCHAIN_HAS_GETTEXT
+       bool
+       default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
+
 # uClibc toolchains require a separatly-compiled gettext/libintl when
 # locale support is enabled. This isn't necessary with glibc
 #  toolchains as glibc includes gettext/libintl.
 config BR2_NEEDS_GETTEXT
        bool
-       default y if (BR2_TOOLCHAIN_BUILDROOT && BR2_ENABLE_LOCALE)
-       default y if (BR2_TOOLCHAIN_EXTERNAL_UCLIBC && BR2_ENABLE_LOCALE)
+       default y if (!BR2_TOOLCHAIN_HAS_GETTEXT && BR2_ENABLE_LOCALE)
 
 config BR2_USE_WCHAR
        bool "Enable WCHAR support"

And then let stuff like glib2 do:

    select GETTEXT if !BR2_TOOLCHAIN_HAS_GETTEXT (and depend on wchar)

And stuff like avahi stays:

    select GETTEXT if BR2_NEEDS_GETTEXT

The BR2_TOOLCHAIN_HAS_GETTEXT unfortunately needs to be used in it's
negative form, but I cannot think of a good name in the reverse form
that clearly seperates it from BR2_NEEDS_GETTEXT.

-- 
Bye, Peter Korsgaard
