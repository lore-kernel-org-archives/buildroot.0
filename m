From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  4 May 2010 20:19:46 +0000 (UTC)
Subject: [Buildroot] [Bug 1681] Cross-compiled binaries shouldn't be
 installed into staging
In-Reply-To: <bug-1681-163@https.bugs.busybox.net/>
References: <bug-1681-163@https.bugs.busybox.net/>
Message-ID: <20100504201947.093568F4B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1681

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
As discussed on IRC (but I think it's better to raise my comments in Bugzilla
or on the list), I don't really agree with such a change.

Actually, I think we should do quite the opposite: install all binaries in
$(STAGING_DIR)/bin and $(STAGING_DIR)/usr/bin.

To me $(STAGING_DIR) should be a *superset* of $(TARGET_DIR). In
$(STAGING_DIR), you should have everything: binaries compiled with debugging
symbols, documentation, headers, all the mess. $(TARGET_DIR) is simply the
result of filtering $(STAGING_DIR).

Now, the point that was made on IRC is that this doesn't work if people add
$(STAGING_DIR)/usr/bin to their PATH, because then their system would try to
run binaries that are compiled for the target. My answer is that people
shouldn't add $(STAGING_DIR)/usr/bin to the PATH.

So, either :
 * We install the toolchain outside $(STAGING_DIR), so that we don't mix host
binaries and target binaries in $(STAGING_DIR)/usr/bin
 * People refer to the toolchain inside $(STAGING_DIR)/usr/bin using absolute
paths

Of course, I'm open to discussion on having a different semantic for
$(STAGING_DIR), but that's something that should really be raised on the list,
to see how we solve the different problems.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
