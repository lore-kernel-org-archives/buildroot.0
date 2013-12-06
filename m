From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  6 Dec 2013 12:40:06 +0000 (UTC)
Subject: [Buildroot] [Bug 6722] Usage of $($(PKG)_DIR_PREFIX) is an issue
 with linux package
In-Reply-To: <bug-6722-163@https.bugs.busybox.net/>
References: <bug-6722-163@https.bugs.busybox.net/>
Message-ID: <20131206124006.BAC739BF4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6722

--- Comment #9 from Ryan Barnett <rjbarnet@rockwellcollins.com> 2013-12-06 12:40:06 UTC ---
(In reply to comment #8)
> Thanks Ryan.
> 
> If I understand the problem correctly, then it will be fixed with my additional
> patches. In the current code, if you print out PATCH_BASE_DIRS for busybox and
> linux, you get:
> 
> >>> busybox 1.21.1 Patching PATCH_BASE_DIRS='package//busybox /busybox'
> >>> linux 3.10.2 Patching PATCH_BASE_DIRS='/linux /linux'
                                             ^^^^^^
Yes this is the problem I'm was trying to communicate. The first instance of
/linux is incorrect. Sorry for the confusion.

> with PATCH_BASE_DIRS calculated as:
> PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call
> qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
> 
> 
> and with my modified code, it becomes:
> >>> busybox 1.21.1 Patching PATCH_BASE_DIRS='package/busybox/ /busybox'
> >>> linux 3.10.4 Patching PATCH_BASE_DIRS='linux/ /linux'
> 
> with PATCH_BASE_DIRS calculated as:
> PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX) $(call
> qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
> 
> 
> Ryan, can you confirm that what I describe above is the problem you have seen,
> and that the 'fixed' output is indeed what you expect?

Yes this is my problem and your patchset fixes it! Too much email traffic to
keep up on this stuff.

This brings up another interesting point. Should we make the $(call
qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME) conditional on BR2_GLOBAL_PATCH_DIR
being defined?

Are you going submit a new version of your patches soon? I'm working on trying
to make BR2_GLOBAL_PATCH have the ability to have multiple directories
specified.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
