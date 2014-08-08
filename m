From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  8 Aug 2014 14:02:56 +0000 (UTC)
Subject: [Buildroot] [Bug 7262] Generating locale en_US.UTF-8 fails on 64bit
 fedora linux host
In-Reply-To: <bug-7262-163@https.bugs.busybox.net/>
References: <bug-7262-163@https.bugs.busybox.net/>
Message-ID: <20140808140256.AB5DE9D3E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7262

--- Comment #3 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-08-08 14:02:56 UTC ---
I find it very odd that creating a link in the _target_ directory would modify
the behavior of a host command (being localedef, which generates the error). 

Are you sure that the adding of the link is directly related to the solving of
the error? Can you reproduce that flow?
If so, could you provide more details on where the connection is between the
error scenario and the link?

I cannot reproduce this, but I looked at the source code of localedef, and the
error is generated in a path like this (based on string matching):

  /* Create a temporary file in the correct directory.  */
  fd = mkstemp (fname);
  if (fd == -1)
    error (EXIT_FAILURE, errno, _("cannot create temporary file"));

where as far as I understand this temporary file would be created in
output/target/usr/share/locale. The creation of this directory happens in the
buildroot Makefile, and this code has been there for a while now.

So currently I don't understand what really happens. Any feedback you can give,
possible with an 'strace -f' output would be very useful.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
