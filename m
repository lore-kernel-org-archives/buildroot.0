From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Oct 2017 21:42:49 +0100
Subject: [Buildroot] Libpng missing a link dependency in 2017-08?
In-Reply-To: <afc724e2-a455-82cd-80f8-ee329e2a3e47@ou.edu>
References: <afc724e2-a455-82cd-80f8-ee329e2a3e47@ou.edu>
Message-ID: <20171031214249.7db64df4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 15:36:37 -0500, Steve Kenton wrote:
> I recently began evaluating a switch to buildroot-2017.08 and started 
> getting the following message (transcribed from a screen shot)
> 
> ffprobe: Relink `/usr/lib64/libpng16.so.16' with 
> `/lib64/libpthread.so.0' for IFUNC symbol `longjmp'
> 
> As far as I can determine it is because libpng 1.6.31 uses longjmp() and 
> it needs another link dependency to avoid the runtime fixup above.
> 
> I did not see anything on the list about this and buildroot 2017-08.1 
> did not switch to libpng 1.6.32 although I'm building it anyway on 
> general principles.
> 
> So, is this likely a libpng build issue or should I start digging into? 
> ffmpeg?

It seems to be a glibc issue. Very similar to the report at
https://sourceware.org/bugzilla/show_bug.cgi?id=21041, which says the
bug is fixed by
https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=fc5ad7024c620cdfe9b76e94638aac83b99c5bf8
in glibc.

However, this patch is only available in glibc's master branch. It has
not been backported to the 2.25 and 2.26 branches apparently.

It would be nice to see if the patch fixes the problem on glibc 2.25
(which Buildroot 2017.08 is using).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
