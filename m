From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Jul 2021 23:25:18 +0200
Subject: [Buildroot] [PATCH v2 17/18] support/testing/tests: add test
 for check_bin_arch
In-Reply-To: <20210706202001.GP2521@scaer>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-18-herve.codina@bootlin.com>
 <20210706202001.GP2521@scaer>
Message-ID: <20210706212518.GS2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-07-06 22:20 +0200, Yann E. MORIN spake thusly:
> On 2021-07-06 16:25 +0200, Herve Codina spake thusly:
> > From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > 
> > This tests build a bogus package that installs a binary built for the
> > host architecture into $(TARGET_DIR), which should cause a build
> > failure, at least as long as the host architecture isn't ARM.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> https://patchwork.ozlabs.org/project/buildroot/patch/20200430095249.782597-11-thomas.petazzoni at bootlin.com/
[--SNIP--]
> > +        if logf_path:
> > +            s = 'ERROR: architecture for "/usr/bin/foo" is'
> > +            with open(logf_path, "r") as f:
> > +                lines = [l for l in f.readlines() if l.startswith(s)]
> > +            self.assertEqual(len(lines), 0)
> 
> So, this tests explicitly installs a host executable in target/, yet the
> assert is written to ensure there is no error: it compares against zero.
> So this test-case will fail, by design.

Ah, I think I see the issue: previously, the test by Thomas was calling
'grep', and was checking against '0', which meant that grep _had found_
the string...

So yeah, we really need to check that we _did_ find the error pattern:
    self.assertEqual(len(lines), 1)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
