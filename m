From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jul 2016 20:28:56 +0200
Subject: [Buildroot] [PATCH] package/systemd: import daemon needs
 headers >= 3.11
In-Reply-To: <20160716142624.1e045c31@free-electrons.com>
References: <1468182896-8355-1-git-send-email-yann.morin.1998@free.fr>
 <87eg709ccd.fsf@dell.be.48ers.dk> <20160711202325.GB5122@free.fr>
 <87r3az6y58.fsf@dell.be.48ers.dk>
 <20160716142624.1e045c31@free-electrons.com>
Message-ID: <20160716182856.GB3882@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All,

On 2016-07-16 14:26 +0200, Thomas Petazzoni spake thusly:
> On Tue, 12 Jul 2016 10:47:31 +0200, Peter Korsgaard wrote:
> 
> > I hadn't, no. I just did a test build with 3.10 headers and glibc 2.22,
> > and it built without problems - So I've dropped this patch.

Yes, it works because glibc 2.22 (which is >= 2.19) defines it even if
not available in the kernel headers).

> So the comment from Yann in https://patchwork.ozlabs.org/patch/646796/
> that both were needed is incorrect?

So, I built a toolchain with Linux headers 3.10 and glibc 2.18. And
systemd-importd does not build:

    src/import/export-raw.c: In function 'reflink_snapshot':
    src/import/export-raw.c:271:26: error: 'O_TMPFILE' undeclared (first use in this function)
             new_fd = open(d, O_TMPFILE|O_CLOEXEC|O_NOCTTY|O_RDWR, 0600);
                              ^
    src/import/export-raw.c:271:26: note: each undeclared identifier is reported only once for each function it appears in
    Makefile:16515: recipe for target 'src/import/systemd_export-export-raw.o' failed

O_TMPFILE was added in Linux 3.11; glibc added the corresponding
definition in glib-2.19.

    glibc \ linux   | <= 3.10   | >= 3.11   |
    ----------------+-----------+-----------+
    <= 2.18         | No        | No*       |
    >= 2.19         | Yes       | Yes       |

*: headers 3.12

So, not sure where to go from there...

Note: I have not tested uClibc or musl, because,well, systemd depends on
glibc...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
