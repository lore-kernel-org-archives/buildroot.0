From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Nov 2016 12:06:42 +0100
Subject: [Buildroot] [RFC PATCH 1/1] pkg-autotools: generic configure
 fix for powerpc64
In-Reply-To: <20161117110529.55c3578e@free-electrons.com>
References: <56063c394c473bf4292658511bae0dd99583be07.1479356115.git.sam.bobroff@au1.ibm.com>
 <20161117110529.55c3578e@free-electrons.com>
Message-ID: <e9261df3-b71b-1591-8064-3d1c9d82972d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-11-16 11:05, Thomas Petazzoni wrote:
> Hello,
> 
[snip]
> I'm hesitating between this patch approach (with significant offsets)
> when applying, and an approach using a awk script. Here is an awk
> script that does the job:
> 
> /^\s*ppc\*-\*linux\*|powerpc\*-\*linux\*)$/ {

 How sure are you that no configure script will contain this line somewhere else
than in the shared library test? You *have* to match the context as well - in
particular the LD="${LD-ld} -m elf64ppc" part. This is possible with awk, but
the patch approach is a lot simpler IMHO, and anyway easier to read.

 Regards,
 Arnout

>     infix = 1;
>     print "         powerpcle-*linux*)";
>     print "           LD=\"${LD-ld} -m elf64lppc\"";
>     print "           ;;";
>     print "         powerpc-*linux*)";
>     print "           LD=\"${LD-ld} -m elf64ppc\"";
>     print "           ;;";
> }
> 
> /^\s*;;$/ {
>     if (infix) {
> 	infix = 0;
> 	next;
>     }
> }
> 
> // {
>     if (infix)
> 	next;
>     print;
> }
> 
> I'm not sure which of the two solutions is the most appropriate. The
> awk solution can probably be applied without doing the grep for the
> ppc*-*linux line, because the awk script only does the replacement if
> this line is found anyway.
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
