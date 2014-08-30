From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Aug 2014 23:47:06 +0200
Subject: [Buildroot] [PATCH] hostname: fix conflicting installs of
	/bin/hostname
In-Reply-To: <1408568566-30391-1-git-send-email-andrew.ruder@elecsyscorp.com>
References: <1408568566-30391-1-git-send-email-andrew.ruder@elecsyscorp.com>
Message-ID: <5402465A.60608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/20/14 23:02, Andrew Ruder wrote:
> Surprisingly long-standing issue with conflicting /bin/hostname
> installs.  Reported as early as November 2005 by Joseph Dupre.
> 
> All together at one point or another there are at least 4 possible
> sources of /bin/hostname:
> 
>         busybox
>         util-linux
>         coreutils
>         net-tools
> 
> Buildroot depends on the -F flag being available in the default
> /etc/inittab.  Out of the 4 listed projects only net-tools and buildroot
> for sure support the -F flag.  I'm a little unclear on util-linux as it
> has been removed entirely (in favor of net-tools) for some time.
> 
> As of coreutils 6.9.90 (2007-12-01), coreutils does not install its
> /bin/hostname by default.  The following commit reenabled its build:
> 
> d6e58cb coreutils: fixed missing hostname (Sep 2010)
> 
> This was done to fix a build error in coreutils regarding help2man.  A
> later patch:
> 
> 30c5105 coreutils: bump to version 8.21
> 
> disabled the help2man functionality entirely but left hostname being
> installed.
> 
> On a very related note, net-tools now contains an obsolete check to add
> util-linux as a dependency to force it to build first (so that net-tools
> ends up with /bin/hostname).
> 
> This patch fixes both of these issues so that hostname always comes from
> one of two places:
> 
>     busybox
>     net-tools
> 
> Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Co-authored-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
