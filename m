From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Jun 2014 12:40:57 +0000 (UTC)
Subject: [Buildroot] [Bug 7172] Name collision of rpath token expansion and
 internal variables
In-Reply-To: <bug-7172-163@https.bugs.busybox.net/>
References: <bug-7172-163@https.bugs.busybox.net/>
Message-ID: <20140610124057.EF86A9CFB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7172

--- Comment #10 from Mike Z <minimod@morethan.org> 2014-06-10 12:40:57 UTC ---
Today's (non-)progress summary:

Two issues:

First, the "Target Linker Options" string field in the configuration tree:

This field is probably of too general a use to mark it "Broken".

Now:
But a note in the help text and in the manual that the internal handling
of any ld.so tokens ($ORIGIN, $PLATFORM, etc.) in the string will not be
handled as expected.

Later:
This will probably require that we capture the output of printf in a
variable rather than set it by assignment in critical locations of the
infrastructure.

I.E: BR_SOMETHING = `printf "%s" '$' 'ORIGIN'`
or even: BR_SOMETHING = `printf "%q" '$' 'ORIGIN'`

and possibly the equivalent Make command of that shell command.

I agree with adding the note(s) now because this will probably
take a long time to resolve.

Second, the BR_TARGET_LDFLAGS handling:

The result of this handling appears to be a per-package situation.

The cases so far:
*) Not recognized
*) Correctly recognized and handled
*) Added (first) in a rpath or runpath that includes the
trusted directories.

In my (non-developer) mind, this is a matter of "normal package
maintenance" and to be fixed as found.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
