From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:20:55 +0100
Subject: [Buildroot] RFC: systemd and service files cleanup
In-Reply-To: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <20150320142055.5ba1af4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

Adding Steven in Cc.

On Thu, 19 Mar 2015 13:56:32 -0400, Mike Williams wrote:

> Currently, package service files for systemd are installed by
> buildroot in a variety of locations: /etc, /lib, and /usr/lib. For
> systemd, split /lib is deprecated and only checked if a split /lib
> and /usr/lib is enabled. /etc is meant for local customizations to
> the default service files. It is my opinion that buildroot should
> install all upstream package and buildroot-provided service files
> in /usr/lib, and this series cleans up our packages to do exactly
> that. Enabling them by default by linking them
> to /etc/systemd/system/multi-user.target.wants has been preserved.
> 
> Upstream systemd's standard installation directory for its binaries
> is /usr/lib. It appears that historically, buildroot's systemd
> installation location has been switched between /lib and /usr/lib
> multiple times. I couldn't find any particular reason for this, so
> I've moved it back to /usr/lib along with its service files.

I am generally fine with the proposed changes, especially since other
systemd users looked at them.

However, there's one thing I'm not sure about: you're changing all the
relative symbolic links to absolute symbolic links:

-	ln -fs ../ntpd.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
+	ln -fs /usr/lib/systemd/system/ntpd.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service

While it causes no problem on the target, it means that when looking at
output/target/ on your build machine, now all those symbolic links are
broken. I find it quite nice when relative symlinks are used, since it
allows to have things in output/target looking somewhat sensible.

Is there any strong reason for switching to absolute symbolic links?

Also, there are *lots* of systemd related patches sitting in patchwork.
Could you and Steven have a look at those pending patches, and let me
know which ones can be applied, which ones cannot?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
