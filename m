From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 22:30:45 +0200
Subject: [Buildroot] [PATCH 1/4] package/Makefile.in: Do not use
 CPPFLAGS for hardening options
In-Reply-To: <CANQCQpbaywbogjHpXaiQkBsS1Sas2R7tJiP2yW8mfxHrqq2_oQ@mail.gmail.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
 <CANQCQpbaywbogjHpXaiQkBsS1Sas2R7tJiP2yW8mfxHrqq2_oQ@mail.gmail.com>
Message-ID: <20180425223045.7d20bd11@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Apr 2018 07:50:37 -0500, Matthew Weber wrote:

> Thanks for sending this series.  When we added the initial support we
> debated on doing a few things differently at some point with how this
> is implemented.  First, Buildroot uses a toolchain wrapper where it
> could inject these flags vs appending like the current design does.
> This would allow all the packages with flag ordering issues and no
> formal releases, to not carry a patch in buildroot for the long term.

For the record: there is no flag ordering issue with PIE, contrary to
what we discussed in Brussels.

I think it is something I discussed further with my colleague Antoine
Tenart (in Cc). Basically, the issue is not that there is an ordering
requirement between -pie and -shared. The issue is that -pie and
-shared are incompatible with each other.

Passing -pie before -shared just papers over the problem, and basically
-shared "wins". Indeed, there is no point for a shared library to be
compiled PIE. PIE only makes sense for executables. Shared libraries
already need to be compiled as PIC, regardless of whether PIE is used
or not for executables.

The issue is of course that we hardly have control over when PIE is
used vs. PIC. But I think it's important to make it clear what the
exact problem is: it's not a flag ordering problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
