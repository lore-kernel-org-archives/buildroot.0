From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Jan 2015 13:48:42 +0000 (UTC)
Subject: [Buildroot] [Bug 7766] New: logrotate default gzip path is usually
	wrong
Message-ID: <bug-7766-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7766

           Summary: logrotate default gzip path is usually wrong
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hjp at liab.dk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The default paths for gzip and gunzip in logrotate are located in /bin/,
however, both standalone gzip and busybox-gzip installs to /usr/bin by default
(as far as I can see, however).

As the standard logrotate.conf file enables delayed compression, this meant,
that only one rotation happened on our system (leading us to think that
logrotate worked), but after the first rotation, the memory was slowly filled
with logs due to logrotate not locating gzip and stopping:

rotating pattern: /var/log/modemd  524288 bytes (7 rotations)
empty log files are rotated, old logs are removed
considering log /var/log/modemd
  log needs rotating
rotating log /var/log/modemd, log->rotateCount is 7
dateext suffix '-20000101'
glob pattern '-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
compressing log with: /bin/gzip
error: failed to compress log /var/log/modemd.1

-----------
I consider three options for fixing this:

1) logrotate is "fixed" upstream with a function looking for gzip based on the
environment PATH variable. However, I dont see this as a likely option, as I
believe RedHat and Fedora still uses /bin/ for these kinds of programs, and
thus has no interest in changing it.

2) It is simply fixed in logrotate.mk by appending:
 -DCOMPRESS_COMMAND=/usr/bin/gzip -DUNCOMPRESS_COMMAND=/usr/bin/gunzip
to the CC part of:
 $(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LDFLAGS="$(LDFLAGS)" -C $(@D)

3) Patching the config.h file of logrotate to use /usr/bin

I don't see what seems more fit? I'll help as much as possible with testing and
implementation.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
