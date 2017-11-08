From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Nov 2017 09:55:45 +0100
Subject: [Buildroot] [RFCv1 2/4] core: change host RPATH handling
In-Reply-To: <8f6dece3-96bf-d71d-085f-117c92d6447b@mind.be>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-3-thomas.petazzoni@free-electrons.com>
 <20171105085756.GG2996@scaer> <20171107234118.177ed856@windsurf>
 <8f6dece3-96bf-d71d-085f-117c92d6447b@mind.be>
Message-ID: <20171108095545.64debde9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Nov 2017 00:50:15 +0100, Arnout Vandecappelle wrote:

> > To me, this sounds very reasonable. What do you think?  
> 
>  500 files is not a lot if you include staging as well

Why would I include staging? I don't see at all why fixing up RPATH in
staging after each package build would be necessary.

> so I've repeated the experiment with 50000 files and on a HDD. First
> pass takes 3m34, second pass 3m43. Hm, perhaps I should have left my
> computer alone for a while during this experiment :-).

It's not very logical that the second pass is longer than the first
pass, since the first pass does do patchelf invocations per file, while
the second pass does only one patchelf invocation per file.

>  Anyway, I think the bottom line is that the fixup script should
> avoid going over staging.

Why would it need to go over staging?

> But $(HOST_DIR)/{bin,sbin,lib} should be enough anyway.

Yes, that was my intent. If needed, we could optimize it by only doing
the fixup at the end of a host package installation. But since we have
a few target packages installing host stuff (toolchain, qt, etc.), it
would require them to explicitly state that they need host rpath
fixups. Perhaps it's easiest for now to just do the rpath fixup after
every package installation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
