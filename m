From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  5 Oct 2014 13:06:06 +0000 (UTC)
Subject: [Buildroot] [Bug 7478] Multiple chosen python modules are not built
 due to missing header files in include path
In-Reply-To: <bug-7478-163@https.bugs.busybox.net/>
References: <bug-7478-163@https.bugs.busybox.net/>
Message-ID: <20141005130606.8091BB094D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7478

--- Comment #4 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-10-05 13:06:05 UTC ---
I did some further investigation: 

a. the build message "Python build finished, but the necessary bits to build
these modules were not found" occurs when a python module requires some
external support but this support is not present.
For example, when SSL is not selected in the buildroot configuration, then you
get this message for the 'ssl' python module. In this case '_ssl' will be in
the list.

b. if I build your configuration (but use an external toolchain and disable the
kernel, htop, vlc, util-linux, and grub, to save build time), I do not see the
same issue. I do get a message about some bits not found, but not for ssl,
sqlite, nor any of the other modules you selected.
This makes sense: when these python modules are selected in the python
configuration, the corresponding dependencies like the ssl package, the sqlite
package, etc. are built automatically.

This makes me believe that there may be a one-time issue due to some particular
action you did on your buildroot directory.
Have you tried starting from a clean build, i.e. run
'make clean all'

Does the problem occur again?

Thanks,
Thomas

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
