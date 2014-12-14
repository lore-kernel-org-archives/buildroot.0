From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 13:16:38 +0100
Subject: [Buildroot] [PATCH] package/mono: fixing shared/static handling
In-Reply-To: <CA+TH9VnvmaZRiLX2Rke6_bezKUdxYCWiQoOsOvkRKg94m8L0cQ@mail.gmail.com>
 (Angelo Compagnucci's message of "Sun, 14 Dec 2014 09:33:32 +0100")
References: <1418508052-25062-1-git-send-email-angelo.compagnucci@gmail.com>
 <87sigjp2if.fsf@dell.be.48ers.dk>
 <CA+TH9VnvmaZRiLX2Rke6_bezKUdxYCWiQoOsOvkRKg94m8L0cQ@mail.gmail.com>
Message-ID: <87oar6pgt5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > Hi Peter
 > 2014-12-14 0:13 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
 >>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
 >> 
 >> > Mono should always be compiled with --enable-static, this patch forces
 >> > --enable-static also in case of shared only libraries.
 >> 
 >> Why? If it is really required, then mono should depend on
 >> !BR2_SHARED_LIBS and show a comment to inform the user that it needs
 >> static library support.

 > Mono doesn't really uses shared libraries at all, it ships its own
 > glibc (eglib)

I don't know much about mono, but does this 'eglib' refer to the (GNU)
C-library or the GNOME glib?

From here it sounds like the latter:
http://www.mono-project.com/archived/eglib/

 > and its own libmono library, It should be compiled
 > statically for this reason, you can find further details here:
 > http://www.mono-project.com/docs/compiling-mono/unsupported-advanced-compile-options/#static-vs-dynamic-mono
 > Before the new shared/static handling, --enable-static was always
 > passed as a configure option.

As far as I read that, they *RECOMMEND* that you link it statically.,
but it should also work when linking dynamically.

 > Before the new shared/static handling, --enable-static was always
 > passed as a configure option.

Indeed. The point of the new handling is to ensure that only the shared
variant is built (so save build time).

With that said, I did a quick test and I couldn't get it to work with
--with-static_mono=no, and as it isn't supported by upstream just
sticking with static might be the best approach.

Looking at how E.G. Debian does it, it seems like they also link
mono(-sgen) statically:

https://packages.debian.org/jessie/mono-runtime-sgen

They do provide a libmono package:

https://packages.debian.org/jessie/libmono-2.0-1

But none of the other mono packages seem to use it, so it's presumably
for embedding mono in an application:

apt-cache rdepends libmono-2.0-1
libmono-2.0-1
Reverse Depends:
  libmono-2.0-1:i386
  mono-complete

-- 
Venlig hilsen,
Peter Korsgaard 
