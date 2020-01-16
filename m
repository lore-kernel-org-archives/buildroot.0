From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Jan 2020 16:45:27 +0100
Subject: [Buildroot] [PATCH] infra: add the transient download mechanism
In-Reply-To: <20200116110538.335a41b9@windsurf>
References: <20200115203753.12110-1-yann.morin.1998@free.fr>
 <534f269547ead6d86e7a571978b54d79cd24cd0d.camel@orolia.com>
 <20200116103120.7b41295a@windsurf>
 <e7e0088e1b76adf1492f06e81b386a0018b9336b.camel@orolia.com>
 <20200116110538.335a41b9@windsurf>
Message-ID: <20200116154527.GJ22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-01-16 11:05 +0100, Thomas Petazzoni spake thusly:
> On Thu, 16 Jan 2020 10:01:09 +0000
> Nicolas Carrier <nicolas.carrier@orolia.com> wrote:
> 
> > Just to be sure I understand, when you say "when TRANSIENT_DOWNLOAD is
> > NO.", it'd be the same as if TRANSIENT_DOWNLOAD download is not defined
> > at all, right?
> 
> Yes.
> 
> There is maybe a little bit of an issue in Yann's current
> implementation as he does:
> 
> 	$(if $($(2)_DOWNLOAD_TRANSIENT),-F) \
> 
> so in fact, -F would be passed as soon as <pkg>_DOWNLOAD_TRANSIENT is
> non-empty, so <pkg>_DOWNLOAD_TRANSIENT = NO would in fact pass -F.
> 
> But this bug already exists for <pkg>_GIT_SUBMODULES:
> 
> 	$(if $($(2)_GIT_SUBMODULES),-r) \

Yeah, I just mirrored for transient wghat we already had for git
submodules.

> And it is trivial to fix.

If ever needed...

    $(if $(filter YES,$($(2)_DOWNLOAD_TRANSIENT)),-F)

(note that there is no equality test in GNU make, but there is one
simple one described in GMSL).

> > If it's the case, then that seems to me like a good idea, because it
> > renders explicit the risk taken by the user when using a branch (which
> > can be done unknowingly ATM).

Yup.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
