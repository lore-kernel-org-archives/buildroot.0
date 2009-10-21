From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Oct 2009 13:26:03 +0200
Subject: [Buildroot] building toolchain fails
In-Reply-To: <598EFF531CAB4EC0A53CDCCD0CF8AC77@apexjs> (Sagaert Johan's
	message of "Wed\, 21 Oct 2009 12\:29\:52 +0200")
References: <598EFF531CAB4EC0A53CDCCD0CF8AC77@apexjs>
Message-ID: <87r5sxq984.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> i used the 2009.08 on 2 systems without problems and i decided to give the
 Sagaert> latest version a try:
 
 Sagaert> I failed in building on both machines :
 
 Sagaert> on my debian i ended up with :

Your subject seems to imply that you have a problem building toolchains,
but in both cases it's a problem building a package for the host?

 Sagaert> ....
 Sagaert> configure: error: C compiler cannot create executables
 Sagaert> make: *** [/home/johan/buildroot/output/build/ncurses-5.6/.configured] Error 77

Strange. Ncurses builds here (also on Debian). What configure check
fails? (have a look at config.log in build/ncurses-5.6)
 
 Sagaert> gcc is on the path,
 Sagaert>  under buildroot/output/build/staging_dir/usr/bin there is a softlink of
 Sagaert> arm-linux-gcc   pointing to executable ccache   ???

You have presumably enabled ccache support then.
 
 Sagaert> on my ubuntu 8.10 machine i ended with an error : error: no acceptable m4 could
 Sagaert> be found in $PATH.
 Sagaert> i have 1.4.11 on my system so that should be ok
 
 Sagaert> I have seen Noel Vellemans also reporting this issue, but no solution yet..
 
 Sagaert> Any clues ?
 Sagaert> for now i patched my 2009.08 version to use 2.6.31.4 and bbox 1.15.2
 
 Sagaert>  [7m>>> autoconf 2.64 Configuring [27m

This is autoconfig for the target - A pretty uncommon thing to build.

 Sagaert> checking for GNU M4 that supports accurate traces...
 Sagaert> configure: WARNING: unrecognized options: --disable-gtk-doc
 Sagaert> configure: error: no acceptable m4 could be found in $PATH.
 Sagaert> GNU M4 1.4.6 or later is required; 1.4.13 is recommended
 Sagaert> make: *** [/home/johan/buildroot/output/build/autoconf-2.64/.stamp_configured]

It seems like autoconf needs a dependency on m4. Could you try adding m4
to package/autoconf/autoconf.mk: AUTOCONF_DEPENDENCIES  and try again?

If that fails, check config.log to see what/why it fails.

-- 
Bye, Peter Korsgaard
