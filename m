From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 2 Nov 2018 14:05:30 +0100
Subject: [Buildroot] [PATCH 1/1] linux-firmware: bump version and fix
 hash
In-Reply-To: <20181101210640.GY28575@scaer>
References: <20180926223806.12704-1-nunes.erico@gmail.com>
 <87mus2vkos.fsf@dell.be.48ers.dk>
 <CAK4VdL0mu+5Od73gU4T7dRLVRHior7gYg6NQ3+bNKms9P5R=EQ@mail.gmail.com>
 <20181003194023.GA2383@scaer>
 <CAK4VdL0_csVF1ZpA=J+V1J9o1v-1DRUNn9P6p7XymG_SEonn2A@mail.gmail.com>
 <20181101141411.GU28575@scaer> <20181101210640.GY28575@scaer>
Message-ID: <CAK4VdL1pO5X4dnr+MupeNYe1K5bw6+9-Q5fPn-2FfeOYaq90NQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 1, 2018 at 10:06 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >     https://patchwork.ozlabs.org/project/buildroot/list/?series=43275
> The part of that series that was dealing with download dependencies has
> now been applied, so you should now be able to use 'make clean; make
> source' and get the expected host-tar when needed.
>
> Can you confirm that on your side with your fancy Fedora 28+ ? ;-)

Looks like you predicted this issue some time ago :)
And the new applied patches do fix it, a host-tar build gets triggered
even on 'make source' now and therefore the problem is gone.

> > Does pigz isdentifies itself as pigz, or does it really impersonate
> > gzip? If the former, then it will be easy to detect, but if the latter,
> > it becomes more complex (we'd have to compress a wellknown blob and see
> > if the compressed stream matches what we expect.)

So with the symlink setup, all of the gzip related commands point to
/usr/bin/pigz, which detects the called command name and then act
accordingly.
With the parallelism I was able to get significant performance
improvements on e.g. compressing large Buildroot built images with
this setup.
Too bad it seems to affect the reproducibility right now.

Looks like it is still detectable:

$ gzip --version
pigz 2.4

I think it is a much minor issue though, more likely my fault than an
issue with Buildroot. Would be better to be able to keep some of the
parallelism benefits while maintaining reproducibility than forcing a
host-gzip. I guess I'll just try some flags with it or maybe file an
issue on the project to figure that out better.


Thanks Yann for the support and the fix.

Erico
