From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 14:42:48 +0200
Subject: [Buildroot] [PATCH 5/8] core/show-info: report whether a
 package is overriden
In-Reply-To: <20200411094436.GK29898@scaer>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <524b53bb81ecd33c55b242d239bee93f57c6c98b.1586592741.git.yann.morin.1998@free.fr>
 <20200411103602.75d8b9f2@windsurf.home>
 <20200411094436.GK29898@scaer>
Message-ID: <20200411144248.49090e99@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 11:44:36 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > I don't have a good suggestion, but I'm not sure "overriden" is the
> > most appropriate term. Indeed, the download/extract/patch steps are
> > also replaced by a rsync step for packages that use _SITE_METHOD =
> > local, and such packages are not "overriden".  
> 
> It is very unfortunate that we conflate the two conditions.

Well, from an internal implementation point of view, SITE_METHOD =
local and OVERRIDE_SRCDIR are just exactly the same thing.

Perhaps you could use:

	"rsynced": $(if $($(1)_OVERRIDE_SRCDIR),true,false),

as this is really annotates the fact that the package source code is
rsynced. You could even make it clearer with "source-rsynced" or
something like that.

> We can't even reconstruct the override by looking at whether
> _SITE_METHOD == local, because even local packages may be overriden...

Indeed.

> So, is it worth that I try and untangle the tow notions? Given the
> feedback on the rest of this eries, I don;t want to invest too much time
> if there is no chance of it getting in...

I think this particular patch is OK, even though admittedly the
external tool could just watch for the correct stamp files to show up:
if .stamp_downloaded shows up, we're downloading it normally, if
.stamp_rsynced shows up, we have a local or overridden package.

In the design of the tool, it would be good to make sure that top-level
parallel build is taken into account.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
