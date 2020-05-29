From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 30 May 2020 00:21:10 +0200
Subject: [Buildroot] [PATCH v2] package/cvs: fix mktime related compile
 failure
In-Reply-To: <20200529210705.0f1f9efe@windsurf.home>
References: <20200528215912.30258-1-ps.report@gmx.net>
 <20200529080948.0476a536@windsurf.home>
 <20200529204343.4b3c92bb@gmx.net>
 <20200529210705.0f1f9efe@windsurf.home>
Message-ID: <20200530002110.4e6fb1ee@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, 29 May 2020 21:07:05 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri, 29 May 2020 20:43:43 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > > With the time_t conversion to 64bit, time_t *is* larger than an
> > > unsigned int.
> > >
> > > So aren't you papering over the problem, and in fact potentially
> > > causing some issues in CVS, which seems to assume the time_t fits in
> > > 32-bit ?
> >
> > ....it is only the internal assumption of the local mktime implementation,
> > as far as I see all cvs callers of mktime use time_t to store the return
> > value....
>
> Hm, ok. But does it make sense to use the AlpineLinux patch instead ?

Did a short test (as the alpine linux patch patches configure directly):

	$ wget https://git.alpinelinux.org/aports/plain/main/cvs/mktime-configure.patch
	$ make cvs-patch
	$ cd build/cvs-1.12.13/
	$ patch -p 1 < mktime-configure.patch
	$ cd ../..
	$ make cvs
...still fails (as expected as the mktime check is a runtime check (?) which
is unfixable for cross-compile)...

Regards,
Peter

>
> Thomas
