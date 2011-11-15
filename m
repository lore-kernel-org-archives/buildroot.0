From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Nov 2011 23:52:54 +0000
Subject: [Buildroot] [PATCH 5 of 5 RFC] dirs and dependencies should be
	executed before every package
In-Reply-To: <229371fcaeaf9f44e4e4.1320911670@devws108>
References: <patchbomb.1320911665@devws108>
 <229371fcaeaf9f44e4e4.1320911670@devws108>
Message-ID: <201111152352.54229.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 10 November 2011 19:32:02 Thomas De Schampheleire wrote:
[snip]
> To solve both problems, this patch changes the gentargets 'foo-source' target
> to explicitly depend on 'dirs' and 'dependencies'. This way, every package
> built with gentargets/autotargets/cmake will be built after dirs and
> dependencies.
> 
> But, certain problems remain:
> * When a dependency package is not using gentargets.

 packets not using gentargets are deprecated.  AFAICS there are only 14 left:
cups/cups.mk
customize/customize.mk
fis/fis.mk
games/doom-wad/doom-wads.mk
gettext/gettext.mk
java/concierge/concierge.mk
microperl/microperl.mk
netkitbase/netkitbase.mk
netkittelnet/netkittelnet.mk
newt/newt.mk
tinyhttpd/tinyhttpd.mk
ttcp/ttcp.mk
uemacs/uemacs.mk
vpnc/vpnc.mk
xfsprogs/xfsprogs.mk

 The only worrysome one is gettext.

> * In some cases, this patch introduces a circular make dependency, because e.g.
>   dependencies <-- host-tar
>   <any package>  <-- dirs dependencies

 This is of course much more important.

 For dirs it certainly isn't a problem.

 For the dependencies, I'm actually thinking that a much better solution
would be to add a dependencies step at the first build, that checks for all
potentially needed host packages.  It creates a hostpackages.mk file that
contains variable assignments for all potential dependencies.  Specifying
a rule for hostpackages.mk in the top-level Makefile will make sure that it is
generated if it doesn't exist.  This has the advantage that dependencies
have to be checked only at the first build and not every single time.  But
it is a lot more work to implement of course...

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout@mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
