From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  4 Jan 2013 09:43:05 +0000 (UTC)
Subject: [Buildroot] [Bug 5846] New: Extra slash added to last slash in URL
Message-ID: <bug-5846-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5846

           Summary: Extra slash added to last slash in URL
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: g at maral.me
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


This happens in 2012.11, I dunno about the older versions.

I noticed this with a few of my packages, but most recently with a custom
kernel tar file url.

For example, I have the following URL in my .config file:

BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/raspberrypi/linux/archive/rpi-3.6.y.tar.gz"

While make-ing, buildroot adds an extra slash to the URL and tries to download 
"https://github.com/raspberrypi/linux/archive//rpi-3.6.y.tar.gz" instead; this
results in an error (at least if the target server does some redirection
kung-fu like github does).

Example Output:

>>> linux custom Downloading
--2013-01-04 01:30:29-- 
https://github.com/raspberrypi/linux/archive//rpi-3.6.y.tar.gz
Resolving github.com... 207.97.227.239
Connecting to github.com|207.97.227.239|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://nodeload.github.com/raspberrypi/linux/tar.gz//rpi-3.6.y
[following]
--2013-01-04 01:30:30-- 
https://nodeload.github.com/raspberrypi/linux/tar.gz//rpi-3.6.y
Resolving nodeload.github.com... 207.97.227.252
Connecting to nodeload.github.com|207.97.227.252|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2013-01-04 01:30:30 ERROR 404: Not Found.

--2013-01-04 01:30:30--  http://sources.buildroot.net//rpi-3.6.y.tar.gz
Resolving sources.buildroot.net... 176.9.16.109
Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2013-01-04 01:30:31 ERROR 404: Not Found.

make: ***
[/home/gamaral/development/mm-buildroot/output/build/linux-custom/.stamp_downloaded]
Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
