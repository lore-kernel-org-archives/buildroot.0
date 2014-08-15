From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Aug 2014 13:04:48 +0000 (UTC)
Subject: [Buildroot] [Bug 7322] libgomp dependency issue with imagemagick
In-Reply-To: <bug-7322-163@https.bugs.busybox.net/>
References: <bug-7322-163@https.bugs.busybox.net/>
Message-ID: <20140815130448.9D4949D463@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7322

--- Comment #3 from Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com> 2014-08-15 13:04:47 UTC ---
Yes, libgomp is not very big. It seems to be now present in most toolchains,
but it is optional.

I also think that doing something for imagemagick here is the wrong way to go,
not only because it complicates things, but also because other packages may
silently (unless they're run on the target) be affected by the same issue,
either for libgomp or for another toolchain library.

I agree that something like BR2_TOOLCHAIN_EXTERNAL_INET_RPC would be overkill,
because this is rather used for feature / package filtering than for library
installation.

Looking at copy_toolchain_lib_root, adding libgomp.so* to LIB_EXTERNAL_LIBS
should work even if this library is not available, so this is indeed a good
solution. And this will make it possible to easily add other optional standard
(i.e. non-exotic) libraries in the same way in the future if a similar issue
happens elsewhere.

I will probably send a patch next week if nobody beats me at it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
