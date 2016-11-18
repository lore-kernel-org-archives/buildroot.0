From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri, 18 Nov 2016 11:35:14 +1100
Subject: [Buildroot] [RFC PATCH 1/1] pkg-autotools: generic configure
	fix	for powerpc64
In-Reply-To: <20161117095545.744c19df@free-electrons.com>
References: <56063c394c473bf4292658511bae0dd99583be07.1479356115.git.sam.bobroff@au1.ibm.com>
 <n500gdx8kc.ln2@ID-313208.user.individual.net>
 <20161117095545.744c19df@free-electrons.com>
Message-ID: <20161118003514.GB16063@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 17, 2016 at 09:55:45AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 17 Nov 2016 07:43:35 +0100, Bernd Kuhls wrote:
> 
> > good work! The minidlna package is fixed by your patch, but the 
> 
> How can minidlna be fixed by Sam's patch? I don't see the offending
> hunk in minidlna's configure script. Am I missing something:
> 
> $ grep powerpc minidlna-1.1.5/configure

Yes ;-)

Almost all the breakages due to this problem are of this type: old
configure scripts cause libraries to be built statically, but
successfully, and then packages that use them fail to link due to
undefined symbols.

In this case it's probally libid3tag or libexif, both of which are
affected by the patch.

> > because configure is re-created during the build phase. The quote from 
> > configure comes from the second run of it.
> 
> It's not good to have configure re-created during the build phase. We
> shouldn't find out why, and fix it.
> 
> Thomas

Some packages seem to do it based on dependency rules: I found that if
I patched the libtool input files, "make" would trigger a
re-autoconfigure but I haven't really investigated it.

Cheers,
Sam.
