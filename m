From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 07 Apr 2017 09:37:18 +0000
Subject: [Buildroot] [Bug 9796] New: source-check broken for Github downloads
Message-ID: <bug-9796-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9796

            Bug ID: 9796
           Summary: source-check broken for Github downloads
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

source-check doesn't work for Github downloads it seems, see for example the
Linux kernel download for the raspberrypi_defconfig:

$ make raspberrypi_defconfig
$ make source-check
[...]
Spider mode enabled. Check if remote file exists.
--2017-04-07 08:00:27-- 
https://github.com/raspberrypi/linux.git/linux-935c7ce84c982a26f567a03a58a1537424569938.tar.gz
Resolving github.com (github.com)... 192.30.253.112, 192.30.253.113
Connecting to github.com (github.com)|192.30.253.112|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
Remote file does not exist -- broken link!!!

Spider mode enabled. Check if remote file exists.
--2017-04-07 08:00:27-- 
http://sources.buildroot.net/linux-935c7ce84c982a26f567a03a58a1537424569938.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
Remote file does not exist -- broken link!!!

Some source-check fails because the kernel is not available. But in practice,
if you do a build, it can download the kernel perfectly fine:

$ make linux-extract
>>> linux 935c7ce84c982a26f567a03a58a1537424569938 Downloading
Doing full clone
Cloning into 'linux-935c7ce84c982a26f567a03a58a1537424569938'...
remote: Counting objects: 5514757, done.
remote: Compressing objects: 100% (4789/4789), done.
remote: Total 5514757 (delta 3516), reused 11 (delta 11), pack-reused 5509948
Receiving objects: 100% (5514757/5514757), 1.55 GiB | 12.32 MiB/s, done.
Resolving deltas: 100% (4579570/4579570), done.
Checking connectivity... done.
Checking out files: 100% (56709/56709), done.
warning: refname '935c7ce84c982a26f567a03a58a1537424569938' is ambiguous.
Git normally never creates a ref that ends with 40 hex characters
because it will be ignored when you just specify 40-hex. These refs
may be created by mistake. For example,

  git checkout -b $br $(git rev-parse ...)

where "$br" is somehow empty and a 40-hex ref is created. Please
examine these refs and maybe delete them. Turn this message off by
running "git config advice.objectNameWarning false"
>>> linux 935c7ce84c982a26f567a03a58a1537424569938 Extracting
gzip -d -c
/home/thomas/buildroot/dl/linux-935c7ce84c982a26f567a03a58a1537424569938.tar.gz
| tar --strip-components=1 -C
/home/thomas/buildroot/buildroot/output/build/linux-935c7ce84c982a26f567a03a58a1537424569938
  -xf -

-- 
You are receiving this mail because:
You are on the CC list for the bug.
