From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 22:12:02 +0200
Subject: [Buildroot] host-mtools 4.0.18 fails to install to host
	directory
In-Reply-To: <572DAF98.6070002@gmail.com> (Marco Trapanese's message of "Sat, 
 7 May 2016 11:04:24 +0200")
References: <572DAF98.6070002@gmail.com>
Message-ID: <87oa7mvvfx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marco" == Marco Trapanese <marcotrapanese@gmail.com> writes:

 > With Buildroot 2016.05-git-01197-gda433d6-dirty and .config attached,
 > host-mtools fails to install to the host directory:

 > file empty.
 > In fact /home/tech/dev/buildroot/output/host/usr/share/info/dir has 0
 > byte length.

Odd, I cannot reproduce it here. There's no point in calling
install-info though (as we don't use the info pages for anything), so
I've committed a change to disable it:

commit 102c4a4bad747221191a67fdced8d077e31aeb2c
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Tue May 31 21:57:15 2016 +0200

    mtools: ensure install-info isn't used

    mtools calls install-info at 'make install' time if available after
    installing the mtools info page - But as we don't use the info pages for
    anything / remove in target-finalize, this is a waste of time and a
    potential cause of build failures as reported on the list:

    http://lists.busybox.net/pipermail/buildroot/2016-May/160604.html

    So ensure configure doesn't find it.

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
