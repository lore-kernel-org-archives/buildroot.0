From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Oct 2011 00:10:51 +0200
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <20111019145934.68b77389@skate>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
 <201110191135.53268.arnout@mind.be> <20111019145934.68b77389@skate>
Message-ID: <201110200010.52396.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 19 October 2011 14:59:34, Thomas Petazzoni wrote:
> Le Wed, 19 Oct 2011 11:35:52 +0200,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> 
> >  The recent kernel.org horror has convinced me that some form of
> > verification is needed, though.
> 
> Having hashes in Buildroot will not necessarily provide an additional
> security. Consider the following scenario:
> 
>  1. The world exists.
>  2. Project foo releases foo-2.1.tar.bz2
>  3. A BR packager bumps package foo to 2.1. He downloads the new
>     tarball, generates locally its hash and adds this hash to the
>     foo.mk.
>  4. The BR packager patch is merged in Buildroot.
> 
> Having hashes in the foo.mk will warn you if the foo website has been
> cracked after step 3. But if it has been cracked between 2) and 3),
> then you're doomed: the BR packager will assume foo-2.1.tar.bz2 is
> correct. 

 If the upstream source is cracked, then of course you're doomed.  What it does protect again is man-in-the-middle attacks (same as https is supposed to protect against but doesn't because of unreliable CAs).  If the packager generates a hash of a non-authorized tar, then most users will download packages with a different hash and will (hopefully) report this.

 Clearly there is still a vulnerability window, but it is much smaller than in the current situation.

> This packager will quite probably never check a GPG signature
> or do any kind of additional security check when bumping foo to 2.1.
> 
> Therefore, I fear that this mechanism would give an *impression* of
> higher security, but would in fact provide no additional security
> compared to not verifying the hashes.

 It does give higher security.  Perhaps not yet high security, though.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
