From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 May 2013 13:17:17 +0200
Subject: [Buildroot] [PATCH] flex: fix autobuilder failures
In-Reply-To: <1369739147-17289-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 13:05:47 +0200")
References: <1369739147-17289-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ehcrbbgi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since fe6a9e5e9d (flex: needs M4 at runtime), the autobuilders have
 Thomas> been producing a number of flex related build failures. They have been
 Thomas> hard to track down, because even on the same machine, with the same
 Thomas> Git commit ID and the same configuration, the failure could not be
 Thomas> reproduced.

 Thomas> However, a close inspection of flex's config.log file allowed to find
 Thomas> out what the problem was. In its configure script, flex uses the
 Thomas> host-flex to generate a minimal example, and find out the name of the
 Thomas> output file of flex.

 Thomas> When the M4 environment is passed when building the target flex, it
 Thomas> also affects the *execution* of the host-flex, which tries to use
 Thomas> /usr/bin/m4 (which doesn't exist in the autobuilder machines) instead
 Thomas> of the one built in $(HOST_DIR)/usr/bin/m4. So generating the minimal
 Thomas> example fails. And this is where what I could reproduce and what the
 Thomas> autobuilders script produce differ: in my case, even though host-flex
 Thomas> fails to run, it creates an empty lex.yy.c, which is enough to make
 Thomas> the configure script happy. In the context of the autobuild scripts,
 Thomas> this file is apparently not created at all, for an unknown reason, and
 Thomas> this leads to the configure script to abort.

 Thomas> The fix is to set ac_cv_path_M4. This will affect the default m4 used
 Thomas> by the target flex, but it will not affect the m4 used by the
 Thomas> host-flex. It allows the test made during the configure script to work
 Thomas> properly, and therefore should fix the issue seen in the autobuilders.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
