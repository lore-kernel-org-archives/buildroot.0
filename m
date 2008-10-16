From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 16 Oct 2008 17:11:41 -0600
Subject: [Buildroot] [PATCH 8/9] RFC: Remove HOSTCFLAGS from kernel
	compile
In-Reply-To: <20081016210912.GD11249@mx.loc>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203256.15826.17375.stgit@localhost.localdomain>
	<20081016210912.GD11249@mx.loc>
Message-ID: <fa686aa40810161611t2c9832d4hba6c35a765b37202@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 16, 2008 at 3:09 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On Thu, Oct 16, 2008 at 02:32:56PM -0600, Grant Likely wrote:
>>From: Grant Likely <grant.likely@secretlab.ca>
>>
>>Setting HOSTCFLAGS when calling make for the kernel compile messes up
>>the tools that the kernel builds for itself.  Specifically, the
>>building of the device tree compiler (dtc) in arch/powerpc adds some
>>required flags to HOSTCFLAGS.  However, if HOSTCFLAGS= is specified
>>when calling make, then the local flags are never added and the kernel
>>compile fails.
>
> One could argue that this is really a bug in the kernel.

Indeed, but in which case; how *should* the kernel be adding to the
list of HOSTCFLAGS?.  I'll need to do more research methinks.

>>This patch removes the HOSTCFLAGS= from $(LINUX26_MAKE_FLAGS).  I've
>>marked this patch as an RFC because I don't know what is really required
>>here.  Removing it works for me (of course), but it may break other users.
>>I just don't know if there is a better way to set HOSTCFLAGS so that it
>>doesn't override the settings that the kernel uses itself.
>
> you could append it to HOSTCC, but that didn't work either (at least for
> some earlier 2.6.x). The problem with HOSTCFLAGS and HOSTCC is that for
> some hosts the HOSTCFLAGS are integral part of having a working HOSTCC,
> you can't separate them without rendering your HOSTCC completely
> dysfunctional (since the stuff is supposed to run, too).

Yeah, I figured as much (grumble).

Thanks for the comments.
g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
