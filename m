From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  4 Apr 2010 16:22:04 +0000 (UTC)
Subject: [Buildroot] [Bug 851] Add option to specify --sysroot value for
 external toolchain
In-Reply-To: <bug-851-163@https.bugs.busybox.net/>
References: <bug-851-163@https.bugs.busybox.net/>
Message-ID: <20100404162204.875F67F9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=851





--- Comment #3 from Grant Edwards <grant.b.edwards@gmail.com>  2010-04-04 16:22:04 UTC ---

The use case is when the external toolchain was built in a location
other where it is located at the time buildroot is using it.

Buildroot assumes that it should copy library/include files from the
"sysroot" location printed by gcc -v.  However, that is the location
where the toolchain was _built_.

That may or may not be the where the toolchain is currently located.

The libraries/include files need to be copied from where the toolchain
_is_now_, not from where it was built.

This patch specifies the "sysroot" option appropriate for the current
location of the toolchain.  The patch implements two new option values:


BR2_TOOLCHAIN_EXTERNAL_NEEDS_SYSROOT

  This is a boolean indicating that the location of the external
  toolchain is not the same as the location where that toolchain was
  built, therefore the proper "sysroot" value for the toolchain is
  _not_ the one printed by gcc -v.  [That is the value that buildroot
  uses now.]

BR2_TOOLCHAIN_EXTERNAL_SYSROOT_VALUE

  This is the proper sysroot value for the external toolchain in its
  current location.  This is the value that buildroot should use when
  copying library/include files.  It will default to a value that is
  usually appropriate for the current location of the external
  toolchain.

Without this patch, buildroot cannot use an external toolchain unless
it is located in the place it was built.  Here are three use cases
where you might want to be able to use an external toolchain that is
located in a directory other than the one where it was built:

  * You might want to be able to switch back and forth between
    different toolchains.  Building the toolchains with unique
    install paths is painful.

  * Developers want to be able to do development in "isolated"
    non-system directories without having to put the external
    toolchain in a global, hard-wired location -- a location
    that might be in use by a different project for a different
    version/flavor of the toolchain.

  * A developer may want to use an external toolchain that was built
    by somebody else on a different machine.  It may not be possible
    to place such a "third-party" toolchain in the exact same
    directory where it was built.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
