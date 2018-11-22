From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Nov 2018 18:12:52 +0100
Subject: [Buildroot] [PATCH] package/systemd: needs glibc
In-Reply-To: <20181122174417.7e101a15@windsurf>
References: <20181121210556.18619-1-yann.morin.1998@free.fr>
 <87y39lm6e8.fsf@dell.be.48ers.dk>
 <20181122174417.7e101a15@windsurf>
Message-ID: <20181122171252.GN2601@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2018-11-22 17:44 +0100, Thomas Petazzoni spake thusly:
> On Thu, 22 Nov 2018 17:19:43 +0100, Peter Korsgaard wrote:
> 
> >  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >  > Cc: Waldemar Brodkorb <wbx@openadk.org>
> >  > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> >  > Cc: Peter Korsgaard <peter@korsgaard.com>  
> > 
> > So this has been broken since end of June? How come we don't have any
> > autobuilder failures?
> 
> Yes, this is really weird. Even with the issue fixed
> https://git.buildroot.org/buildroot/commit/utils/genrandconfig?id=3eb49f59d6804c452e784759d9b3869215a8098f,
> we should have had some systemd/uclibc configurations. I'll try to do
> some research in the DB, but my SQL is rusty and gives requests that
> are very slow to execute :/

Yeah, that's strange... But it sure as hell does not build at all.

Besides the prlimit() issue, it also unconditionally #include <gshadow.h>
which does not exist in uclibc-ng either. That one has been fixed upstream
now:
    https://github.com/systemd/systemd/commit/66a5b5ce9b991327d594f7b635de16999ca54093

(we don't need to backport it, now that we can't build on uClibc).

I may be looking into making a workaround by providing a missing.h
wrapper to prlimit() as they suggested, but that is definitely not
release material for us.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
