From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Dec 2017 09:36:14 +0100
Subject: [Buildroot] [PATCH] utils/checkpackagelib: exclude two files
 from Config.in indentation check
In-Reply-To: <5a3871cd6f3a9_bd01603ab4851a3@ultri3.mail>
References: <20171218084303.12472-1-thomas.petazzoni@free-electrons.com>
 <5a3871cd6f3a9_bd01603ab4851a3@ultri3.mail>
Message-ID: <20171219093614.24bdc185@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Dec 2017 23:56:29 -0200, Ricardo Martincoski wrote:

> On Mon, Dec 18, 2017 at 06:43 AM, Thomas Petazzoni wrote:
> 
> > package/x11r7/Config.in and package/kodi/Config.in do not comply with
> > the normal Config.in indentation rules. However, this violation of the
> > rule is legitimate, so let's skip them in check-package for this
> > specific indentation check.
> > 
> > This removes the last 314 remaining warnings on Config.in files.  
> 
> There are also 7 warnings for Config.in.host
> They can obviously be fixed in another patch(es).

Ah, right, forgot about Config.in.host.

> After this/these we can add
> -o -name 'Config.in'
> or
> -o -name 'Config.*'
> to the check-package job in the gitlab yml, but I guess it is your plan already.

This is obviously the plan.

> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > 
> > ---
> > Note: I am not totally sure about this patch. Indeed package/Config.in
> > uses the same rule as package/{x11r7,kodi}/Config.in, but
> > check-package doesn't report warnings about it. Perhaps I'm missing
> > something in the check-package logic.  
> 
> See FILE_IS_FROM_A_PACKAGE in the main script.
> I first limited the script to files in the package directory because there are
> a lot of false warnings from other directories, many of them for historical
> reasons. And... well... it also named check-"package".
> I planned to expand it first to boot, then to to linux and toolchain, but I
> didn't get to it yet.

Ah, ok, makes sense. I think we will progressively want to extend it
indeed, starting first with bootloaders, linux and toolchain as you
suggest.

> > +                if self.filename in [ "./package/x11r7/Config.in",
> > +                                      "./package/kodi/Config.in" ]:  
> 
> The 4 warnings from flake8 already in the file I plan to fix in a series for
> all flake8 warnings in the tree (those 4 actually adding '# noqa' since
> check-package uses 'inspect' to know which check functions to run).
> 
> But (in the case you stick to this solution, see the other e-mail) could you
> fix those 2 new warnings?
> utils/checkpackagelib/lib_config.py:137:38: E201 whitespace after '['
> utils/checkpackagelib/lib_config.py:138:65: E202 whitespace before ']'

ACK. I don't use flake8, so I don't notice such warnings. I'll fix and
resend if we agree that this is the appropriate solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
