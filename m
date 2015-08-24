From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Aug 2015 21:15:44 +0000 (UTC)
Subject: [Buildroot] [Bug 8256] pointing to /usr/bin/objcopy old version
 (x86) instead of the generated one
In-Reply-To: <bug-8256-163@https.bugs.busybox.net/>
References: <bug-8256-163@https.bugs.busybox.net/>
Message-ID: <20150824211544.488BE81E39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8256

--- Comment #8 from Arnout Vandecappelle <arnout@mind.be> 2015-08-24 21:15:44 UTC ---
(In reply to comment #2)

> Before launcing gmake, I have  now executed the following command
> 
> setenv PATH
> "/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/x86_64-buildroot-linux-uclibc/bin:/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/bin:${PATH}"
> set PATH = "/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/x86_64-buildroot-linux-uclibc/bin:/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/bin:${PATH}"

I don't know why you think it's a good idea to add the target binaries to your
PATH. Don't do that.

The config.log of attachment 6136 is useless. Could you re-run a clean build
without hacking PATH, and then attach the full
output/build/grub2-2.00/config.log please?

My conjecture is that grub2 is using the wrong objcopy somewhere in configure.
Oh, indeed, now I see: we use HOST_CONFIGURE_OPTS, so it will have
OBJCOPY=/usr/bin/objcopy explicitly. I guess we should override that with
OBJCOPY=$(TARGET_OBJCOPY), but I'm not sure how that will affect other
host,target combinations...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
