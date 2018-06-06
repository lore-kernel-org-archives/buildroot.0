From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 Jun 2018 12:32:31 +0000
Subject: [Buildroot] [Bug 11071] Building postgresql package on Debian 9.4
 x64 for armel target fails
In-Reply-To: <bug-11071-163@https.bugs.busybox.net/>
References: <bug-11071-163@https.bugs.busybox.net/>
Message-ID: <bug-11071-163-TuSrEpyvWM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11071

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Could you please build without your custom --with-libxml option ?

That's the reason for the failure. It ends up using xml2-config from your host
machine, which returns bogus linker flags, which breaks the build.

So it's basically your custom addition that breaks the build, the code in
Buildroot builds fine.

Please add:

POSTGRESQL_CONF_ENV += XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config

when enabling libxml2 support (i.e when you're passing --with-libxml). This
should solve your problem.

And please submit a Buildroot patch adding this, once everything works fine.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
