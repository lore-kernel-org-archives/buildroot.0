From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 Apr 2019 07:00:08 +0000
Subject: [Buildroot] [Bug 11811] lsblk (util-linux) should depend on libudev
 if available
In-Reply-To: <bug-11811-163@https.bugs.busybox.net/>
References: <bug-11811-163@https.bugs.busybox.net/>
Message-ID: <bug-11811-163-nQJTnR4kuF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11811

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I don't think the fix can be that simple: it causes a circular dependency.

Indeed "udev" is provided either by the "eudev" or "systemd" packages. And both
eudev and systemd depend on util-linux:

EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod

SYSTEMD_DEPENDENCIES = \
        $(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
        host-gperf \
        host-intltool \
        kmod \
        libcap \
        util-linux

So, by adding a dependency on udev in util-linux, you create a circular
dependency.

I'm not sure how we can break this circular dependency, unfortunately :-/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
