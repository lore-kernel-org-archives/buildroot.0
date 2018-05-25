From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 May 2018 08:13:30 +0200
Subject: [Buildroot] [PATCH] utils/genrandconfig: filter microblaze GCC
 < 8 bug
In-Reply-To: <CANQCQpZfqWK4zaq_4hUZkzhX2WvdWwKGzRKsXPJ0NhubWQDfng@mail.gmail.com>
References: <1527112426-21842-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180524133029.1a7a22e9@windsurf>
 <CANQCQpaB5E1pQn+xttcWJFMgGWd7G0t477kUfd02SwkVc3hkMg@mail.gmail.com>
 <CANQCQpZfqWK4zaq_4hUZkzhX2WvdWwKGzRKsXPJ0NhubWQDfng@mail.gmail.com>
Message-ID: <20180525081330.270d00e7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 May 2018 22:49:07 -0500, Matthew Weber wrote:

> Looks like it doesn't really matter what you enable/disable for boost
> options as it's when the bjam tool is getting called that it gets
> stuck.  I  can start to look at all the reverse dependencies
> tomorrow....

bjam is Boost's build tool, so obviously it fails within a bjam
invocation. But basically, you can just try to do a minimal Boost
build, with no sub-option enabled. If that still triggers the infinite
loop with Microblaze gcc, then we don't have any other choice but to
add the BR2_TOOLCHAIN_GCC_HAS_BUG_xyz dependency on BR2_PACKAGE_BOOST
itself, and propagate it to the reverse dependencies.

Have you tried playing around with optimization levels, and see if they
all trigger this issue ? For example instead of using -Os, does the
issue also appear at -O2 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
