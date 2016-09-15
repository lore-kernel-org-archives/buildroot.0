From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Sep 2016 21:20:15 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix potential entire
 root filesystem removal
In-Reply-To: <aee7cccd-eb3a-d376-99b0-a9ba3cb950b2@mind.be>
References: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <aee7cccd-eb3a-d376-99b0-a9ba3cb950b2@mind.be>
Message-ID: <20160915212015.761725b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Sep 2016 18:19:01 +0200, Arnout Vandecappelle wrote:

>  I'm sure I had a reason to add the /*, but I can't remember and the commit
> message isn't helpful. The only difference (except for keeping the directory)
> that I can think of is that .stamp files are kept, but (a) they should be
> removed and (b) there aren't any stamp files in that directory...

I don't really see a reason for the /*, and it seems really dangerous :)

> [snip]
> >  # Normal handling of downloaded toolchain tarball extraction.
> > -ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
> > +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)  
> 
>  You've just made these two equivalent again. But it's better like that.

Absolutely. But I believe the $(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y test
is clearer and less likely to get broken.

> >  TOOLCHAIN_EXTERNAL_EXCLUDES = usr/lib/locale/*  
> 
>  I thought: hey, this can't be right, TOOLCHAIN_EXTERNAL_EXCLUDES should still
> be set for non-downloaded toolchains that do have a source. But since those
> don't exist, it doesn't matter.

When a toolchain is not downloaded, it is also not extracted: it is
also there somewhere on the filesystem. So there's nothing to exclude
when extracting, since we're not extracting.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
