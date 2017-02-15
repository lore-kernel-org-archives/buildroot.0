From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 09:37:23 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <20170215024549.GA25646@tungsten.ozlabs.ibm.com>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
 <20170215024549.GA25646@tungsten.ozlabs.ibm.com>
Message-ID: <20170215093723.00b3d499@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 13:45:49 +1100, Sam Bobroff wrote:

> > >    powerpc64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/f2d5b2459080bf9c67906b8b240150303bb61461  
> > 
> > /usr/lib64/libexpat.so: error adding symbols: File in wrong format
> > collect2: error: ld returned 1 exit status
> > 
> > It's picking some host library, which is wrong. Carsten, you're listed
> > in the DEVELOPERS file for libsvg, could you have a look?  
> 
> I've had a look at this, it seems to be that pkg-config is used to
> locate libxml, but when expat is used instead it just adds '-lexpat' --
> which can find the host library.

Just passing -lexpat to the cross compiler does not lead the
cross-compiler to look in /usr/lib64. The cross-compiler normally only
looks in its sysroot for libraries.

So there must be some -L/usr/lib64 option that tells the cross-compiler
to look into this folder.

> Unfortunately, the change needs to be in configure.in and AUTORECONF
> fails. I've experimented with creating a patch to configure that does
> what I believe autoreconf should do (adds a copy of the libxml
> pkg-config code adjusted for expat). Does that seem a reasonable fix?
> If so, I'll post it.

Posting the patch would already give us some details on the conclusions
of your analysis. Not sure we will apply it as-is though.

What are the autoreconf issues? Can they be fixed easily?

BTW, do you have a minimal defconfig to reproduce the failure?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
