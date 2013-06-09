From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Jun 2013 12:26:53 +0000 (UTC)
Subject: [Buildroot] [Bug 6308] New: dosfstools download link is wrong
Message-ID: <bug-6308-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6308

           Summary: dosfstools download link is wrong
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: uclibc-bugzilla at loowis.durge.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I was making buildroot last night, and trying to build dosfstools failed, which
broke the whole build.
Took me a while to figure out what was going on, but it turns out that even
though buildroot was specifically trying to download
http://fossies.org/linux/misc/dosfstools-3.0.16.tar.gz the fossies.org
webserver was erroneously serving up dosfstools-3.0.18.tar.gz instead! (in the
latest version of dosfstools the tools have been renamed, which is what was
breaking the build)

I've now emailed the fossies.org webmaster and he's corrected the problem on
his webserver, and trying to download dosfstools-3.0.16.tar.gz now results in a
"410 Gone", so the DOSFSTOOLS_SITE setting in package/dosfstools/dosfstools.mk
needs to be changed from http://fossies.org/linux/misc to
http://www.daniel-baumann.ch/software/dosfstools

I checked with a "find -exec grep" and dosfstools is the only package that was
being downloaded from fossies.org. And checking in the dosfstools.mk history,
this bug basically needs to "undo"
http://git.buildroot.net/buildroot/commit/?id=0810280fec7745b2534c2fa9d0526115e05b26f7
( proposed here: http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/51618
)

It's funny how similar this is to my previous bug #6302 ;-)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
