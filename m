From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 22:31:30 +0100
Subject: [Buildroot] [PATCH] package/gdb: ARC version has stringent
 dependencies on host gcc
In-Reply-To: <20171102212543.GE30054@scaer>
References: <20171102181405.6476-1-yann.morin.1998@free.fr>
 <20171102221215.1250bc0b@windsurf> <20171102212543.GE30054@scaer>
Message-ID: <20171102223130.5354ecd5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 22:25:43 +0100, Yann E. MORIN wrote:

> > Why do we have a dependency on the target compiler version for
> > host-gdb ?  
> 
> For two reasons:
> 
> 1. you said so in your analysis. OK, you could be wrong, so...
> 2. that is the case for gdb-8.0.x, later in that same file.

I think I know the logic for gdb 8.x. The logic is that:

 * If you chose only target gdb (and not host gdb), you don't have a
   version choice, and we currently use gdb 7.11, which doesn't have a
   compiler version requirement.

 * If you chose to build both host gdb and target gdb, then the
   selection of the gdb version for the host gdb affects the version
   used to build target gdb. I.e, you select gdb 8.0 as the host-gdb,
   and gdb 8.0 will also be built as the target gdb. Therefore we need
   to ensure that the host gdb 8.0 option can only be selected if both
   the host *and* the target compiler are >= 4.8.

That is a bit tricky, and would warrant a comment in the Config.in file
I guess.

But anyway, this means your patch is correct! :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
