From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Jun 2017 21:18:24 +0200
Subject: [Buildroot] [PATCH 1/4 v2] tools: add a directory to store some
 useful user-facing tools
In-Reply-To: <46aa3c8c-7085-b024-ea77-d610b8971780@mind.be>
References: <20170619154227.GA3045@scaer>
 <5949d4c290853_3c4af6e910447ac@ultri3.mail>
 <20170621052152.GA23076@scaer>
 <46aa3c8c-7085-b024-ea77-d610b8971780@mind.be>
Message-ID: <20170622191824.GA3054@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-06-21 23:44 +0200, Arnout Vandecappelle spake thusly:
> On 21-06-17 07:21, Yann E. MORIN wrote:
> > Ricardo, All,
> > 
> > On 2017-06-20 23:06 -0300, Ricardo Martincoski spake thusly:
> >> On Mon, Jun 19, 2017 at 12:42 PM, Yann E. MORIN wrote:
> >>> On 2017-06-18 22:11 -0300, Ricardo Martincoski spake thusly:
> >> [snip]
> >>>> BUT if it is called without a .config file, it hangs forever waiting for input,
> >>>> and the menuconfig is sent to the log file.
> >>>
> >>> Indeed, my use-case is to only use it in an already-configured tree.
> >>>
> >>>> Maybe we can bailout if no .config is present.
> >>>
> >>> Hmmm... It's not trivial do detect, because the .config file is not
> >>> necessarily in the current directory, for example:
> >>>
> >>>     brmake -C /pat/to/buil-dir
> >>>
> >>> and I don't want to write a make option interpeter either...
> >>
> >> Oh, I see now it is not trivial.
> 
>  How about instead make the script do
> 
> make -C ${0%/*}/.. O=${PWD} "${@}"

What if one calls it with:  brmake -C /path/to/my/O-dir

But as much as we try to 'fix' it, we always uncover corner cases,
becausze the above would consider ${PWD} to be the output dir if
/path/to/my/O-dir is not already configured... :-/

Corner cases after corner cases, I think I'd just try to catch the
obvious and trivial, and leave out the weird cases.

So, either there is a .config in the CWD, or we abort. Deal? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
