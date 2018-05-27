From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 23:01:10 +0200
Subject: [Buildroot] [PATCH 0/2] package/binutils+elf2flt: fix for noMMU
 targets
In-Reply-To: <20180527153510.GB2965@scaer> (Yann E. MORIN's message of "Sun,
 27 May 2018 17:35:10 +0200")
References: <cover.1527280948.git.yann.morin.1998@free.fr>
 <db85fdbc-8767-4ada-bdab-872202ee5ce2@mind.be>
 <20180527153510.GB2965@scaer>
Message-ID: <87zi0kn78p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> I don't see a full solution yet, but basically I think that we should
 >> - detect when an executable has multiple hardlinks;
 >> - detect if it has already been "fixed" in this fix-rpath run;
 >> - if so, clone the file before fixing it proper.

 > What did you mean by "clone" in this context? Remove the hardlinks and
 > replace them by a copy of the file?

Yes, I guess that was what Arnout meant. "break" the hard link and
duplicate the file content.

 >> Alternatively we could consider that this is anyway only about the host tree,
 >> which is normally the smallest of the three trees (when you exclude external
 >> toolchain). So maybe we should just always clone for the host tree.

 > I'm afraid that detecting hardlinks will not be cheap, even when we
 > exclude staging/ (which is a sub-dir of host/) from the search...

Just detecting hard linked files should be easy (E.G. st_nlink > 1 when
stat'ing). Figuring out where the other hard links are is indeed hard,
but we afaik don't need to know that.


 >> I realize we're very close to the release, but I still think that always
 >> cloning is probably the safest way to do it.

 > Do we envision other impacted packages? I don't think so. Really,
 > binutils and elf2flt really seem to be the only two packages impacted
 > by the problem.

 > That we missed the noMMU and elf2flt cases previously is just an
 > oversight on our part...

 > Then. if I am wrong, we're still talking about only two packages for
 > now, and they only break because of the ARC archtecture, for which we
 > use bleeding-edge tools that require we have libfl.so. Two. Single.
 > Packages. We've always refused to add infra when only very few packages
 > were impacted.

 > Or were you suggesting that we do not add infra, but we replace the
 > current two hacks (Thomas' symlinks or my script wrappers) by an actual
 > copy, still just for binutils and elf2flt? In which case we would not
 > loose time detecting hard-links in a generic way, obviously.

I can follow Arnout, but I think the script wrappers (or simply copies
of the binaries) is good enough for 2018.05.

-- 
Bye, Peter Korsgaard
