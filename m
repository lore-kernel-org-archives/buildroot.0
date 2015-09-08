From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Sep 2015 22:24:39 +0200
Subject: [Buildroot] What would it take to add LZIP support for package
 downloads?
In-Reply-To: <55EF176E.4050001@ou.edu>
References: <55EF176E.4050001@ou.edu>
Message-ID: <55EF4407.8040404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08-09-15 19:14, Steve Kenton wrote:
> I'm trying to set up a package for ddrescue
> https://www.gnu.org/software/ddrescue/
> 
> and it's only available compressed with lzip (tar.lz)
> http://www.nongnu.org/lzip/lzip.html
> 
> A manual trial run seems to indicate that it's not a supported format for downloaded packages
> 
>>>> ddrescue 1.19 Extracting
> /ssd/bcdist/buildroot-2015.05/dl/ddrescue-1.19.tar.lz | tar --strip-components=1 -C /ssd/bcdist/buildroot-2015.05/output/build/ddrescue-1.19  -xf -
> /bin/bash: /ssd/bcdist/buildroot-2015.05/dl/ddrescue-1.19.tar.lz: Permission denied
> tar: This does not look like a tar archive
> tar: Exiting with failure status due to previous errors
> 
> So, what would it take to add lzip support for downloaded packages?
> Easy or Oh My?

 The simple solution is to extend the suitable-extractor function with .lz ->
lzip, and let dependencies.sh check that it's installed on the host. That's a
one-line change. But I don't think that many distros have lzip installed, so
it's a bit of a hassle for the user.

 The intermediate solution is to make the ddrescue package depend on host-lzip
(which obviously you have to add as well), and define a custom extractor.

 The full solution is to extend the DL_TOOLS_DEPENDENCIES handling with
dependencies on the host package rather than checks in dependencies.sh.

 I propose you go for the simple solution :-)


 Regards,
 Arnout

> 
> Steve Kenton
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
