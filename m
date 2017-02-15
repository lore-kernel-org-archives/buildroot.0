From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed, 15 Feb 2017 13:45:49 +1100
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <20170214142725.1b9e98ae@free-electrons.com>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
Message-ID: <20170215024549.GA25646@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 14, 2017 at 02:27:25PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> J?rg, Peter, Romain, Bernd, Gustavo, Carsten, Philippe, Yann, Fran?ois,
> Dagg, Baruch and ARC/Synopsys developers, there are some questions for
> you below.
> 
> Thanks!
> 

[snip]

> >    powerpc64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/f2d5b2459080bf9c67906b8b240150303bb61461
> 
> /usr/lib64/libexpat.so: error adding symbols: File in wrong format
> collect2: error: ld returned 1 exit status
> 
> It's picking some host library, which is wrong. Carsten, you're listed
> in the DEVELOPERS file for libsvg, could you have a look?

I've had a look at this, it seems to be that pkg-config is used to
locate libxml, but when expat is used instead it just adds '-lexpat' --
which can find the host library.

Unfortunately, the change needs to be in configure.in and AUTORECONF
fails. I've experimented with creating a patch to configure that does
what I believe autoreconf should do (adds a copy of the libxml
pkg-config code adjusted for expat). Does that seem a reasonable fix?
If so, I'll post it.

Cheers,
Sam.
