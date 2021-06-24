From: Herve Codina <herve.codina@bootlin.com>
Date: Thu, 24 Jun 2021 16:09:22 +0200
Subject: [Buildroot] [PATCH 01/15] package/pkg-generic.mk: detect files
 overwritten in TARGET_DIR and HOST_DIR
In-Reply-To: <20210622102433.GF44262@scaer>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-2-herve.codina@bootlin.com>
 <20210621213140.GA44262@scaer>
 <20210622094052.01c0a074@bootlin.com>
 <20210622113003.7cbf0136@windsurf>
 <e866365b-6244-303a-62d7-1cb00fda8897@green-communications.fr>
 <20210622102433.GF44262@scaer>
Message-ID: <20210624160922.5c3ba9dd@fedora>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 22 Jun 2021 12:24:33 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Nicolas, All,
> 
> On 2021-06-22 11:57 +0200, Nicolas Cavallari spake thusly:
> > On 22/06/2021 11:30, Thomas Petazzoni wrote:  
> > >On Tue, 22 Jun 2021 09:40:52 +0200
> > >Herve Codina <herve.codina@bootlin.com> wrote:
> > >  
> > >>    Compared to the first version, this patch has an improved commit message and
> > >>    generates the md5sum snapshot using
> > >>      'find -L $(1) -type f -print0 | xargs -0 -r md5sum > $($(PKG)_DIR)/.files$(2).md5;'  
> > >
> > >But is this better ? Due to not cd-ing into the directory, you will
> > >have full absolute paths in the .md5 file,  
> 
> But is that even an issue? Those paths are only used for one per-package
> directory; they do not follow files around into another package's ppd.
> 
> So, relative or absolute, we don't much care.
> 
> > >and adding LC_ALL=C is quite
> > >customary too.  
> 
> In this case, do we also even care or need it? I pretty sure the output
> of find is not sorted at all; it most probably depend on the order of
> dentries in the directory, and those have absolutely no ordering
> guarantee...
> 
> Note that if you really want to use LC_ALL, passing it in front of 'find'
> will not make LC_ALL available to anythin after the pipeline, so you'd
> still have xargs (and md5sum) run without it...
> 
> > > Ditto for using | xargs instead of -exec.  
> > xargs will run only start one md5sum process if the command line size
> > permits it, whereas "-exec md5sum {} ;" will start one md5sum per file.  
> 
> Agreed. But I think this is exactly what Thomas suggested to use, right?
> 
> > An alternative is "-exec md5sum {} +", which is essentially xargs-like.  
> 
> I once used that in the past, and it breaks on non-GNU find, because '+'
> is a GNUism. So I think using xargs is still better.
> 

Well, according to the different exchanges,

I think I can remove LC_ALL (we don't care about any order), and I keep
'... | xargs -0 -r md5sum'.
'cd' is not needed (we do not care about absolute or relative path).

So, the snapshot is taken using:
find -L $(1) -type f -print0 | xargs -0 -r md5sum > $($(PKG)_DIR)/.files$(2).md5;

and the detection is done using:
md5sum --quiet -c $($(PKG)_DIR)/.files$(2).md5

Is that ok for everyone ?


Regards,
Herv?

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
