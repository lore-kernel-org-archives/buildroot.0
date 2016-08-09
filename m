From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Aug 2016 19:58:58 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-08
In-Reply-To: <20160809141535.4c9b8169@free-electrons.com>
References: <20160809063032.89898101A55@stock.ovh.net>
 <20160809141535.4c9b8169@free-electrons.com>
Message-ID: <20160809175858.GA5779@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-09 14:15 +0200, Thomas Petazzoni spake thusly:
> >          arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/1f005c46b927fbeeffb11d843c2c3f18308bb5b9/
> Lots and lots of errors. Maxime, Yann, any idea?

This is a static build, so it looks like it is missign a library to
link to. I've started a build here to investigate a bit more...

> >          arm |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/3bba46b91e6c2a2c5a8c7e0739ccf0b3d8efadff/
> src/import/export-raw.c: In function 'reflink_snapshot':
> src/import/export-raw.c:271:26: error: 'O_TMPFILE' undeclared (first use in this function)
>          new_fd = open(d, O_TMPFILE|O_CLOEXEC|O_NOCTTY|O_RDWR, 0600);
>                           ^
> Yann, Maxime, you are our systemd people, could you have a look?

I already sent two "fixes" for that:
    http://lists.busybox.net/pipermail/buildroot/2016-July/167292.html
    http://lists.busybox.net/pipermail/buildroot/2016-July/167296.html

Here it goes again:
  - O_TMPFILE was added in kernel headers 3.11
  - O_TMPFILE was added in glibc-2.18

However, even when the kernel headers are recent enough but glibc is
not, then O_TMPFILE is not available. One must have glibc >= 2.19;
having kernel headers older than 3.11 does not seem to be a problem:
    http://lists.busybox.net/pipermail/buildroot/2016-July/167793.html

The toolchain is the codesourcery ARM 2014.05 which is using kernel
headers 3.13 (OK) but a glibc-2.18 (not OK).

Since we do not have symbols with the version of the C library, we can't
have systemd hidden whn glibc is "too old".

Except for that second patch of mine, above, which just hid systemd for
this toolchain, I don;t see what we could do, baring adding AT_LEAST_X_Y
symbols for glibc...

> >        nios2 |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/f49a9cbb7bdc5d9e05dcf0a20bd83f059e234e74/
> src/compositor-rdp.c:875:2: error: stray '\302' in program

I've had a look at the code, and indeed there is a "non-breakable space"
which is U8+C2A0 (U+A0) in the definition of the NSC_RESET macro on line
61 for the RDP compositor.

I'll send a patch upstream tonight.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
