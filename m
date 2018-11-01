From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Nov 2018 12:18:55 +0100
Subject: [Buildroot] [PATCH] Config.in: add BR2_DL_DIR_OPTS
In-Reply-To: <20181101120151.4d8e4055@windsurf>
References: <20181031213930.49837-1-mmayer@broadcom.com>
 <20181101090616.GQ28575@scaer> <20181101120151.4d8e4055@windsurf>
Message-ID: <20181101111855.GR28575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-01 12:01 +0100, Thomas Petazzoni spake thusly:
> On Thu, 1 Nov 2018 10:06:16 +0100, Yann E. MORIN wrote:
> > On 2018-10-31 14:39 -0700, Markus Mayer spake thusly:
> > > Provide a simple mechanism to pass extra arguments to "mkdir" when
> > > creating download directories. This can be helpful if one needs the
> > > download directories to be writable multiple users ("shared download
> > > cache").  
> > 
> > In retrospect, I think our enforcing of umask globally is wrong.
> > 
> > It was added in commit bee5745ccc2 (Makefile: don't depend on the umask)
> > under the requirements that modes in target/ be predicatble.
> > 
> > Although that is indeed a good reason, I think we should have instead
> > ensured those modes with a plain chmod on target/ during the
> > target-finalize step.
> 
> But is it possible to have a plain "chmod" on target/ that will
> properly preserve whatever packages have decided to use as permissions
> when installing files ?

Right, but specifying modes at install time is not reliable anyway, as
it is not running root. The reason for explicitly setting permissions at
install time is mostly due to packages wanting to set suid bits, which
can't work. There can be outliers too, but they mostly are corner cases
which should be fixed not to set permissions.

So packages should instead provide FOO_PERMISSIONS, or users should use
permissions tables.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
