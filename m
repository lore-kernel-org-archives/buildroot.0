From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Sep 2015 11:51:24 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/gdb: host-texinfo needed for
 full gdb
In-Reply-To: <55EF582F.1090407@mind.be>
References: <1441740443-7280-1-git-send-email-brendanheading@gmail.com>
 <55EF582F.1090407@mind.be>
Message-ID: <20150909115124.28919804@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Sep 2015 23:50:39 +0200, Arnout Vandecappelle wrote:

> Romain patches gdb to avoid recursing in the doc directory [1][2]
> Vicente does the same but with a sed instead of patch [3].
> Brendan adds host-texinfo to dependencies (this patch) [4].
> 
>  Which one do we choose?
> 
>  host-texinfo takes a bit of time to build because it also depends on
> host-ncurses, but it's not a huge problem.
> 
>  The best solution is adding an upstreamable --disable-doc, but that will take a
> bit of work still (esp. because we can't easily autoreconfigure).
> 
>  So for me Brendan's patch is fine. What do the others think?

On my side, I think I'd prefer for now a $(SED) to remove the doc
directory from the SUBDIRS, in Makefile.in (avoids autoreconf, avoids
per-gdb version patches). And then, Romain has contributed to gdb a
patch to disable the documentation, but as you said, it will take a
while before this patch 1/ gets accepted and 2/ is used in all gdb
versions packaged in Buildroot.

I think I would actually prefer to also do the same trick for all
packages that need host-texinfo, and remove the host-texinfo package.
The host-texinfo package (as is documented in texinfo.mk) was
originally added only because Crosstool-NG needed it as a dependency,
back when we had a Crosstool-NG backend. Now that this backend is done,
I'm not sure it make a lot of sense to build a tool to build
documentation, which nobody will ever use/read.

So I would favor Vicente's patch in fact. Yes, it is not nice to $(SED)
stuff, but it is a whole lot better than building host-texinfo,
host-ncurses, and some totally unused documentation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
