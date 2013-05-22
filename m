From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 May 2013 09:40:30 +0000 (UTC)
Subject: [Buildroot] [Bug 5516] appended device tree blobs on uImage fails
In-Reply-To: <bug-5516-163@https.bugs.busybox.net/>
References: <bug-5516-163@https.bugs.busybox.net/>
Message-ID: <20130522094030.AB7B39A45E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5516

--- Comment #12 from richard.genoud at gmail.com 2013-05-22 09:39:21 UTC ---
As I didn't see this bug happening for quite some time (I even forgot about
it), I did some investigations:
With v3.7+, zImage is not overwritten when we are doing a "make uImage", so DTB
is appended correctly.
But versions before v3.7 overwrite the zImage.

bisecting:
cd linux
git bisect start
git bisect good v3.6
git bisect bad v3.7
git bisect run ../test_zImage_overwrite.sh

(script provided)

here is the bisect result :
c353acba28fb3fa1fd05fd6b85a9fc7938330f9c
kbuild: make: fix if_changed when command contains backslashes

=> that means that appending DTB to uImage only works for kernel >=
v3.6-6674-gc353acb in buildroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
