From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jan 2014 06:04:25 +0800
Subject: [Buildroot] Why is sysroot under i686-buildroot-linux-gnu?
In-Reply-To: <CAJpxd048a0Yw7HhO3kh5Sc7opQPiOncNzUhgSLR3JuEXgvOiuQ@mail.gmail.com>
References: <CAJpxd07vs10v6uhOe3=_a=Rj-40x+Q8yWh0cK+YbTnP1HdzLTw@mail.gmail.com>
 <20140104222832.7a8dab5b@skate>
 <CAJpxd06=L5uMVHm2ZH2u5iRvB1CbRYQiJcaNfEheeNk-pqWc+w@mail.gmail.com>
 <20140107144553.15c189a4@skate>
 <CAJpxd048a0Yw7HhO3kh5Sc7opQPiOncNzUhgSLR3JuEXgvOiuQ@mail.gmail.com>
Message-ID: <20140108060425.59c340ca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bryce Schober,

On Tue, 7 Jan 2014 12:43:41 -0800, Bryce Schober wrote:
> On Mon, Jan 6, 2014 at 10:45 PM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
> 
> > Ok, I think I see what you mean. Can you test the following patch and
> > see if it fixes the problem for you?
> 
> I don't see how it could, at least not as I was thinking, since
> STAGING_SUBDIR still uses $(GNU_TARGET_NAME)...

Yes, but the name of the compiler in host/usr/bin now matches the
sysroot directory name, which is what you requested in the first place:

$ ls output/host/usr/
arm-buildroot-linux-uclibcgnueabi  bin  lib  share

$ ls output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc

Note that we are *not* interested in having the sysroot directory name
match the tuple of your original toolchain. What this patch is doing is
that it is making sure that the sysroot directory name matches the
tuple of the Buildroot generated toolchain (which is either a toolchain
fully built by Buildroot, or a set of symlinks+wrapper when an external
toolchain is used).

So the fact that the compiler in output/host/opt/ext-toolchain/ might
have a different tuple is expected.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
