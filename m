From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  6 Dec 2013 11:58:49 +0000 (UTC)
Subject: [Buildroot] [Bug 6722] Usage of $($(PKG)_DIR_PREFIX) is an issue
 with linux package
In-Reply-To: <bug-6722-163@https.bugs.busybox.net/>
References: <bug-6722-163@https.bugs.busybox.net/>
Message-ID: <20131206115849.41F269BF4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6722

--- Comment #8 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2013-12-06 11:58:49 UTC ---
Thanks Ryan.

If I understand the problem correctly, then it will be fixed with my additional
patches. In the current code, if you print out PATCH_BASE_DIRS for busybox and
linux, you get:

>>> busybox 1.21.1 Patching PATCH_BASE_DIRS='package//busybox /busybox'
>>> linux 3.10.2 Patching PATCH_BASE_DIRS='/linux /linux'

with PATCH_BASE_DIRS calculated as:
PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call
qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)


and with my modified code, it becomes:
>>> busybox 1.21.1 Patching PATCH_BASE_DIRS='package/busybox/ /busybox'
>>> linux 3.10.4 Patching PATCH_BASE_DIRS='linux/ /linux'

with PATCH_BASE_DIRS calculated as:
PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX) $(call
qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)


Ryan, can you confirm that what I describe above is the problem you have seen,
and that the 'fixed' output is indeed what you expect?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
