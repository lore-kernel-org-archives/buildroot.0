From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Sep 2015 08:56:38 +0200
Subject: [Buildroot] First rootfile system build using buildroot
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474C3452F@svr-wa-exch1.atg.lc>
References: <CAKpDV8uVJjtssJDEx4knqtATvjXzy+kdKtwBoWWLcv-9v4cikg@mail.gmail.com>
 <CAKpDV8uLvtaLFK=Oxd5vw-zpkzB9C+m0_hhmx-9meZSRViW12g@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C344F7@svr-wa-exch1.atg.lc>
 <CAKpDV8tYxteVo=nKwMih_Ub-dxCQM=xh2G-AC3riPevrMySrNw@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C3452F@svr-wa-exch1.atg.lc>
Message-ID: <20150901085638.774989e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Aug 2015 13:58:04 -0700, Lee, Tommy wrote:

> Building the rootfilesystem into zImage resolves the rootfilesystem
> loading/linking issue clearly. I do not see any reason to build and
> load the rootfilesystem independently.

If by "building the root filesystem into zImage" you mean using the
initramfs mechanism, then clearly there is a reason to have the root
filesystem independently.

The initramfs mechanism is OK when the filesystem is relatively small.
When it starts to be bigger, then initramfs has a number of drawbacks:

 * The entire root filesystem must be loaded at boot time. If you have
   a 5 or 6 MB root filesystem, that's probably alright. But if you
   have a 100-200 MB root filesystem, then it's going to take a while.
   By using a normal root filesystem, it gets mounted at boot time, but
   not its entire contents are loaded into memory at boot time.

 * The entire root filesystem will always be in memory, consuming this
   memory. Again if your filesystem is 5, 6, 8 or 16 MB, this might be
   alright. But if your filesystem is 100-200 MB, you probably don't
   want those 100-200 MB to be permanently loaded into memory.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
