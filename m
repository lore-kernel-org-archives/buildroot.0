From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 08:57:48 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <ff04b0db-d3d5-2314-9d9c-3ead377eb981@mind.be>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
 <20171016185248.0463ac82@windsurf.lan>
 <20171016211842.GA32198@bifrost>
 <20171017091152.67d7ad28@windsurf.lan>
 <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
 <20171017141133.4d57ee87@windsurf.lan>
 <9955dbb8-0447-5a3d-9e78-a0f6f42e7e6c@mind.be>
 <20171017210354.38d89b3c@windsurf.lan>
 <ff04b0db-d3d5-2314-9d9c-3ead377eb981@mind.be>
Message-ID: <20171018085748.20a3a9f5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 01:11:54 +0200, Arnout Vandecappelle wrote:

>  I mean that maybe the user doesn't want to gather the output with -Orecurse or
> -Otarget but really wants -Onone. If you hardcode -Orecurse in the Makefile,
> it's impossible for a user who does want to see output immediately.

Yes, hence my idea of BR2_PARALLEL_BUILD to preserve the existing
behavior when it is disabled. However, the .config is not included in
the top-level make invocation, only in the sub-make.

So, here is my plan:

 * Introduce BR2_PARALLEL_BUILD

 * Make the sub-make invocation mandatory. Right now it's only if the
   umask is not correct or if O is not a canonical path. Let's just
   always recurse into a sub-make, it costs essentially nothing.

 * Do a grep ^BR2_PARALLEL_BUILD=y in the config file in the top-level
   make to decide whether we pass -Orecurse to the sub-make invocation.
   If .config doesn't exist, then we don't pass -Orecurse because it
   means we're about to configure Buildroot and we anyway don't care
   about -Orecurse.

Thoughts?

I'm not sure how to handle the MESSAGE macro. One suggestion you made
was to output directly to the tty. But a big drawback of that is that
if you redirect the build output (make 2>&1 | tee logfile) then the
messages displayed by the MESSAGE macro will no longer be stored in the
logfile, which is super annoying: I always use them to navigate in the
logfile to the appropriate place. So I believe directly writing to the
tty in the MESSAGE macro is not a good option.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
