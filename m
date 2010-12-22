From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Dec 2010 11:11:27 +0100
Subject: [Buildroot] [Bug 2875] Kernel doesn't build Ext2 support
	out-of-the-box
In-Reply-To: <20101222091404.B58E688F68@busybox.osuosl.org>
	(bugzilla@busybox.net's message of "Wed, 22 Dec 2010 09:14:04 +0000
	(UTC)")
References: <bug-2875-163@https.bugs.busybox.net/>
	<20101222091404.B58E688F68@busybox.osuosl.org>
Message-ID: <87mxnyung0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "bugzilla" == bugzilla  <bugzilla@busybox.net> writes:

Hi,

 bugzilla> https://bugs.busybox.net/show_bug.cgi?id=2875 --- Comment #1
 bugzilla> from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 bugzilla> --- Well, in general we only try to minimally interact with
 bugzilla> the kernel configuration. For example, regardless of whether
 bugzilla> IPv6 is enabled or not at the toolchain level, we do not
 bugzilla> enforce IPv6 configuration at the kernel level.

I agree, but you're giving a bad example:

linux/linux.mk:
ifeq ($(BR2_INET_IPV6),y)
        $(call KCONFIG_ENABLE_OPT,CONFIG_IPV6,$(@D)/.config)
else
        $(call KCONFIG_DISABLE_OPT,CONFIG_IPV6,$(@D)/.config)
endif

Which comes from:

commit 100c09a53b8806b2281a93ad21744d26f68bcc6b
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Tue Jun 8 13:56:19 2010 +0200

    linux: adjust kernel config according to the Buildroot configuration
    
    We only adjust the configuration or ARM EABI and IPv6. The (more
    complicated) initramfs case is handled in a separate commit. The user
    is expected to take care of all other configuration details (like
    having Netfilter enabled to make iptables work, etc.)
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

;)

 bugzilla> I will not mark the bug as WONTFIX, waiting for other
 bugzilla> Buildroot developers to comment.

I vote for WONTFIX.

-- 
Bye, Peter Korsgaard
