From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 20:21:39 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: add host-zic dependency
In-Reply-To: <20140422164108.GA3601@free.fr>
References: <1398181285-4260-1-git-send-email-ps.report@gmx.net>
 <20140422175244.5efaa18d@skate> <20140422164108.GA3601@free.fr>
Message-ID: <20140422202139.1830d8b8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 22 Apr 2014 18:41:08 +0200, Yann E. MORIN wrote:

> host-zin only builds the 'zic' program, which pacakge can access using
> $(ZIC), so host-zip (our package) does not need the tz-data itslef.

Right.

> 
> But postgresql needs the time zone info. It can use either the system
> ones, or it has a limited set bundled in its source tree, in:
>     postgresql-9.3.3/src/timezone/data/

What I'm worried about here is *precisely* that even though we build
our own host-zic, it might end up time zone infos from the host system.
And nowhere we check that these are available/sane/etc.

So I think we should either (1) ensure that PostgreSQL only uses its
one limited set of time zone data when --with-system-data is *not*
passed, or (2) always build with tzdata.

> That's what the error message hints at:
> 
>     When cross-compiling, either use the option --with-system-tzdata to use
>     existing time-zone data, or set the environment variable ZIC to a zic
>     program to use during the build.

Yes, I've read this error message. But I'm worried that just pointing
ZIC to a zic program is papering over the fact that we in this case
rely on the time zone info from the host system.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
