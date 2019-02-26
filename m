From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Feb 2019 11:10:43 +0100
Subject: [Buildroot] [PATCH 1/3] runc: depend on linux headers >= 3.11
 for O_TMPFILE
In-Reply-To: <20190226101729.2b49ede8@windsurf> (Thomas Petazzoni's message of
 "Tue, 26 Feb 2019 10:17:29 +0100")
References: <20190219223530.15956-1-christian@paral.in>
 <20190220090108.6e2d1e9a@windsurf> <87o96zeapq.fsf@dell.be.48ers.dk>
 <20190226083225.2b23e850@windsurf.home>
 <87d0nfdk4q.fsf@dell.be.48ers.dk> <20190226101729.2b49ede8@windsurf>
Message-ID: <875zt6eu70.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> Just to make sure I understand the use case - These people are using old
 >> toolchains for some reason but uptodate Linux kernels? Why can the
 >> kernel be updated but not the toolchain?

 > To be honest, for the one customer I had in mind that still uses
 > ancient toolchains, I don't know which kernel version they are using.
 > Presumably something old, but I'm not sure how old.

;)

 > However, the thing here is that we're talking about an issue in "runc",
 > which is a fairly modern piece of software, unlikely to be used by
 > those companies that are stuck with old toolchains/kernels. What
 > bothers me is that we are going to raise our glibc version requirement
 > just because some modern/fancy/new software package like "runc" needs
 > it, even though it is practically not going to impact those users of
 > old toolchains/kernels that most likely don't use runc.

Correct, but what then when the next package breaks, E.G. systemd,
eudev, kodi, .. ?


 >> As the recent iproute2 patch showed, we do still have users on glibc <=
 >> 2.17 even though we do not officially support it, and do accept patches
 >> when they are simple - But people are on their own if some package
 >> doesn't build with such old toolchains, so the real impact of dropping
 >> official support for glibc 2.18 as well is not so big, E.G. it would
 >> just mean that we drop the preconfigured toolchains using it and stop
 >> testing on the autobuilders.

 > Dropping for the autobuilders just because of runc means we are not
 > going to catch any other build issue caused by glibc <= 2.18, some of
 > which might easily be fixed, which isn't really nice :-/

It is glibc == 2.18, not <=. We already dropped support for 2.17 and
older and (shouldn't be) testing such old toolchains any more.

I'm not sure how this differs from how we dropped 2.17 support back in
2017.08? glibc 2.18 was released just 6 months after 2.17 and we are now
close to 2 years later.


 > Should we just bite the bullet and have
 > BR2_TOOLCHAIN_GLIBC_HAS_AT_LEAST_X_Y ? It's annoying because of
 > glibc/uclibc/musl, but well...

I would prefer to just not support such old toolchains instead of this
extra complexity.

-- 
Bye, Peter Korsgaard
