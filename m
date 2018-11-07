From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Nov 2018 23:03:35 +0100
Subject: [Buildroot] systemd: build fails with meson
In-Reply-To: <CANTMe2VOTDZTx_BjaLJ1jo1TqdU37DSMK3XuKCzL8so6pa+2gg@mail.gmail.com>
 (=?utf-8?B?ItCi0LjQvNGD0YAg0J/RgNC+0LrQvtC/0LXQvdC60L4iJ3M=?= message of
 "Tue, 6 Nov 2018 13:29:51 +0300")
References: <CANTMe2VOTDZTx_BjaLJ1jo1TqdU37DSMK3XuKCzL8so6pa+2gg@mail.gmail.com>
Message-ID: <87va58a6ko.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "?????" == ????? ?????????? <prok.tim26@gmail.com> writes:

 > Hello,
 > I've been trying to build Buildroot with systemd v239. Regular build works
 > fine but when I try to do it using docker, the build fails with
 > bad interpreter: No such file or directory
 > which seems to be a python error which occurs when the absolute path length
 > to the interpreter exceeds the limit (in this case, the 1st line in
 > buildroot/output/host/bin/meson is over 128 symbols which is most likely
 > the problem).

The maximum shebang line is indeed limited by the kernel to 128
characters:

https://github.com/pypa/virtualenv/issues/596

I don't quite understand why building inside docker leads to longer path
names though?


 > Is there any way to solve this without shortening the absolute paths? Thank
 > you in advance.

You could try changing the definition of MESON in package/pkg-meson.mk
to be:

MESON = PYTHONNOUSERSITE=y $(HOST_DIR)/bin/python3 $(HOST_DIR)/bin/meson

But there may be other similar issues elsewhere.

-- 
Bye, Peter Korsgaard
