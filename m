From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 19 Jun 2012 11:15:10 +0200
Subject: [Buildroot] Bug on host-only packages
In-Reply-To: <20120611105621.0aacd20c@skate>
References: <20120611105621.0aacd20c@skate>
Message-ID: <4FE0431E.9080909@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:
> Hello,
>
> I have the impression that there is a bug on the download step of
> host-only packages: the tarballs are named host-foobar-xxx.tar.gz
> instead of just foobar-xxx.tar.gz. For example, in my download
> directory, I have:
>
> host-lpc3250loader-1.0.tar.gz
> host-omap-u-boot-utils-8aff852322.tar.gz
>
> Even though those don't have target variants (so there is no
> problematic consequences to this bug), I think that for consistency
> reasons they should be named:
>
> lpc3250loader-1.0.tar.gz
> omap-u-boot-utils-8aff852322.tar.gz
>
> Most likely a bug in the GENTARGETS infrastructure. I haven't look at
> the code yet, I'm just reporting the issue (don't have the time to dig
> into it right now).

I noticed this problem as well. It seems to be caused by the fact that
DOWNLOAD_INNER passes $(1) and $(2) to the DOWNLOAD_WGET, which contain the
correct info, while it passes nothing to other downloaders, which have to
do on their own based on $($(PKG)_SOURCE). The latter is in turn undefined
for git (and other) methods, so it defaults to $(2)_BASE_NAME, which has the
"host-" prefix.

I had no time to go on and fix the issue properly.

Slightly off topic, I think we should consider having an extra argument to
GENTARGETS_INNER holding the lowercase package name, without the 
host-prefix,
as we do for the uppercase package name.
This would ease further operations and, ultimately, fixing the bug in 
discussion.

All of these are in my todo list (obviously unscheduled).

Luca
