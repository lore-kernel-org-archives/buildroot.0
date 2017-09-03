From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 14:25:17 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: detect external glibc in
	symlinked /lib
In-Reply-To: <CABa6e=pwRghNUx+WHY_AH22_Wh8mtvR54x8ApqH3Y11732mhng@mail.gmail.com>
References: <20170903120835.16190-1-camh@xdna.net>
 <20170903141738.20c0d621@windsurf.lan>
 <CABa6e=pwRghNUx+WHY_AH22_Wh8mtvR54x8ApqH3Y11732mhng@mail.gmail.com>
Message-ID: <20170903142517.088907a8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 3 Sep 2017 22:22:24 +1000, Cam Hutchison wrote:

> > > When building a toolchain with buildroot and a merged /usr, /lib is
> > > a symlink to usr/lib. This is copied from the target to the staging
> > > directory, and then to the sysroot, and the ultimate location of the
> > > required files is in /usr/lib in the sysroot.  
> >
> > I don't understand this sentence. Nothing gets copied from target to
> > staging, and staging *is* the sysroot, so there's no copy. Could you
> > explain what you wanted to say here, we can perhaps find a better
> > phrasing.  
> 
> Ok, I wasn't sure on how staging became sysroot - I thought it was
> copied.
> 
> I misinterpreted 175a96c4909104bde706fa0e1f9010af8b252caa
> (package/skeleton-common: simplify staging install) to mean it was
> copying from the target, but it was the skeleton, not the target.
> 
> Would you like me to respin this with an updated comment, or will
> you take it and change it as appropriate?

In fact, I would first like to understand what you meant :)

Maybe what you meant is that: when the Buildroot toolchain is built
with a merged /usr, lib is a symlink to usr/lib in the staging
directory. Therefore, the resulting toolchain has such a symlink in its
sysroot, and such a symlink is present in the staging directory when
the toolchain is re-used as an external toolchain. The consequence is
that the dynamic linker is not located in /lib, but in /usr/lib, even
though it is accessible from /lib from a symlink.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
