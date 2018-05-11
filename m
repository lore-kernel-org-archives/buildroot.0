From: anisse at astier.eu <anisse@astier.eu>
Date: Fri, 11 May 2018 23:55:08 +0200
Subject: [Buildroot] Tesla is using Buildroot
In-Reply-To: <20180511172314.28ba9f80@windsurf.home>
References: <20180511172314.28ba9f80@windsurf.home>
Message-ID: <20180511215508.GA28572@jaya>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, May 11, 2018 at 05:23:14PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> I met a few engineers from Tesla at the Embedded Linux Conference in
> March, who told me they are using Buildroot. Now that their tree is
> publicly available online, I can share this information.
> 
> Their Buildroot tree is at:
> 
>   https://github.com/teslamotors/buildroot
> 
> Unfortunately, it looks a bit ugly in terms of commit history: just
> a few huge comments that mix tons of changes together. I was told the
> autopilot configurations are there for now, but infotainment
> configurations should be added in the near future.
> 
> It's of course very nice to see Buildroot being used on board of those
> vehicles!
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com


I've had a quick look at what's inside. Here is what I found:
 - it seems based on buildroot 2016.05, with backports from more recent
   versions; but at its core it's still a 2016.05
 - there are a few packages tesla-{findutils, grep, bash, gzip, which, rsync}
   that are here with old versions to work around GPLv3
 - there's a tesla-verity package which seems to be a custom init that
   checks the validity of the verity metadata and interacts with
   firmware to check soc lock status before calling dmsetup.
 - there are a few packages that look like backports: python-dateutil,
   nanomsg, python-pytz, python-jsonschema
 - tesla-binutils is a "real" host binutils (non-cross)
 - there's tesla-libsystemd stub that builds a libsystemd with stubbed
   functions
 - it has its own parallel building infrastructure, using the loglinear
   tool, first introduced in google fiber's buildroot implementation
   https://gfiber.googlesource.com/buildroot/
 - many packages are patched to modify behaviour, customize build
   options: business as usual
 - probably many things I've missed


I've added Olof in cc. 

Regards,

Anisse
