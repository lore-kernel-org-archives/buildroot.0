From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 17:16:22 +0200
Subject: [Buildroot] [PATCH 00/38] systemd support for various packages
In-Reply-To: <20150524021840.GA13994@vostro>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <7cec.556127b6.37b1a@xdna.net> <20150524021840.GA13994@vostro>
Message-ID: <20150705171622.1b2b98dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex, Cam,

Could you reach to an agreement on this point? I am not a systemd
expert, and from a quick reading of Lucas Nussbaum blog post, there
does not seem to be a perfect solution (besides changing the service
source code itself to make it more systemd aware).

It would be great to be able to move forward with this patch series.

Thanks for your help,

Thomas

On Sun, 24 May 2015 05:18:40 +0300, Alex Suykov wrote:
> Sun, May 24, 2015 at 01:21:58AM -0000, Cam Hutchison wrote:
> 
> > Type=simple is not necessarily the best way to do this. Handling errors
> > is done differently by systemd with Type=simple vs Type=forking.
> 
> The difference in error handling is actually why I consider non-forking
> services to be the only valid kind of services for anything more capable
> that sysv initscripts.
> 
> > A recent blog post by Lucas Nussbaum has more details:
> > http://www.lucas-nussbaum.net/blog/?p=877
> > 
> > With Type=simple, systemd considers the service started right after
> > executing it. It will not flag errors on startup if the process exits
> > soon after due to a config error, etc. With Type=forking, systemd will
> > only consider the service started after the parent exits. As many
> > daemons will check config files and command line args before forking,
> > these errors will be detected and propagated to systemd.
> 
> Non-forking services signal initial configuration errors as well as any
> errors past initial configuration phase by exiting with non-zero status.
> Which systemd can take immediate action on, like restarting the service
> or marking it as failed. It's mentioned in the blog post.
> 
> Forking daemons gain marginally better *initial* error reporting by losing
> the ability to report errors at later stages. Detecting the state of a forked
> daemon (as in running or dead), or killing it, is non-trivial and generally
> involves time of check time of use race condition. With non-forking services,
> both operations are trivial and reliable.
> 
> Does knowing the fine distiction between initial and non-initial failure
> is worth the loss of control over the child process? I don't think so.
> 
> Reporting initial config status via parent process exit() is a specific
> case of startup notification, the post mentions that too.
> Any reliance on any kind of startup notification inherently results in
> time of check time of use race conditon.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
