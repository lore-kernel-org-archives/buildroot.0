From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Nov 2017 17:49:55 +0100
Subject: [Buildroot] Bug in RPATH fixing logic
In-Reply-To: <20171112174013.25d90333@windsurf.home>
References: <20171112174013.25d90333@windsurf.home>
Message-ID: <20171112174955.18449728@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Nov 2017 17:40:13 +0100, Thomas Petazzoni wrote:

> So, we have two things that are a bit weird here:
> 
>  - Why are the binutils linked to libfl ? This happens only on the ARC
>    architecture, where we use a special version of binutils that gets
>    autoreconf'ed.

So this happens because the ARC binutils version is fetched from Git,
so we need to have host-flex installed, and binutils detects the flex
library and decides to use it.

>  - The absolute rpath in $(HOST_DIR)/<tuple>/bin/ar is wrong in the
>    first place, but I'm not sure how to fix this.

I'm wrong on this: $(HOST_DIR)/<tuple>/bin/ar RPATH is totally fine:

$ readelf -d arc-buildroot-linux-uclibc/bin/ar  | grep rpath
 0x000000000000000f (RPATH)              Library rpath: [/opt/br-arcle-hs38-full-2017.11-rc1/lib]

The problem is that this gets turned into $ORIGIN/../lib by patchelf.

I don't see any other solution than de-duplicating such binaries.

Do you see another option ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
