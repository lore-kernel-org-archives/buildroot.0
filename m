From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Nov 2017 23:41:18 +0100
Subject: [Buildroot] [RFCv1 2/4] core: change host RPATH handling
In-Reply-To: <20171105085756.GG2996@scaer>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-3-thomas.petazzoni@free-electrons.com>
 <20171105085756.GG2996@scaer>
Message-ID: <20171107234118.177ed856@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Nov 2017 09:57:56 +0100, Yann E. MORIN wrote:

> > An alternative strategy would have been to keep the
> > -Wl,-rpath,$(HOST_DIR) flag, and therefore the absolute RPATH in the
> > host binaries, and fix such RPATH at the end of the build of every
> > package. However, that would require calling fix-rpath after the
> > installation of every package, which is a bit expensive.  
> 
> I wonder how expensive that would be. It would be nice to time this.

OK, to time this, I did a quick hacky shell script
(http://code.bulix.org/uboevd-223829). What it does is:

 - Generate a mix of ELF files and random data files (half of the files
   are ELF files, half are random data files). This is the "generate"
   target of the script.

 - Fixup rpath to $ORIGIN/../lib if not already fixed. We don't want to
   fixup files repeatedly, as we don't want to duplicate files over and
   over by breaking hard links. So we really want to set the RPATH only
   once per binary.

Results are as follows:

$ ./rpath-evaluation.sh generate 0 500
... generate 250 random data files, 250 ELF programs with a crappy
rpath ...

$ time ./rpath-evaluation.sh fixup

real	0m0.976s
user	0m0.546s
sys	0m0.457s
$ time ./rpath-evaluation.sh fixup

real	0m0.610s
user	0m0.393s
sys	0m0.234s

So the first fixup pass, which actually fixes the RPATH of 250 binaries
takes about one second. The next fixup pass doesn't do anything, except
checking that all binaries already have a fixed RPATH.

So we see that it will take ~600ms to scan 500 files, provided half
of them are ELF files, verify that they already have the correct RPATH.

To me, this sounds very reasonable. What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
