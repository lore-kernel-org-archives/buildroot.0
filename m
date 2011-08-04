From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Aug 2011 21:52:43 +0200
Subject: [Buildroot] [PATCH] initramfs/init: make sure that 0, 1,
	2 fds are available
In-Reply-To: <1312486739-29747-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 4 Aug 2011 21:38:59 +0200")
References: <1312486739-29747-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y5z9lzsk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> As the kernel doesn't automatically mount devtmpfs when an initramfs
 Thomas> is used, commit 424888e47431db738f5f9b3c6392435bfce7a842 has
 Thomas> introduced a small wrapper script that mounts devtmpfs before starting
 Thomas> the real init.

 Thomas> Unfortunately, the problem is that in this case, the init process runs
 Thomas> without any 0, 1 and 2 file descriptors, so none of the
 Thomas> messages/errors printed by the various initialization scripts can be
 Thomas> seen. This is due to the fact the init process relies on 0, 1 and 2
 Thomas> being opened by the kernel before init is started. However, as
 Thomas> /dev/console isn't present on the filesystem at the time the kernel
 Thomas> tries to open the console to create the 0, 1 and 2 file descriptors,
 Thomas> the kernel fails on this and prints the famous "Warning: unable to
 Thomas> open an initial console".

 Thomas> The proposed workaround is to actually open 0, 1 and 2 to /dev/console
 Thomas> in the wrapper script, right after mounting the devtmpfs filesystem,
 Thomas> and before starting the real init. The "Warning" from the kernel is
 Thomas> still shown, but at least the messages from the init scripts are
 Thomas> visible.

Committed, thanks.

-- 
Bye, Peter Korsgaard
