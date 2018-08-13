From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2018 23:28:59 +0200
Subject: [Buildroot] autobuilder flock hangs
In-Reply-To: <20180813231826.31d1d041@windsurf>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <1a4b53ec-1ed3-7770-3a65-8d4f4f596918@mentor.com>
 <20180813231826.31d1d041@windsurf>
Message-ID: <20180813212859.GH7915@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Hollis, All,

On 2018-08-13 23:18 +0200, Thomas Petazzoni spake thusly:
> Hello,
> 
> +Yann in Cc.
> 
> On Mon, 13 Aug 2018 11:18:10 -0700, Hollis Blanchard wrote:
> 
> > >>        x86_64 |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/43b9bccacd88397d732fda16d998fa7dc001f900 |  
> > > Hollis: your autobuilder times out when downloading this package, could
> > > you have a look ? See
> > > http://autobuild.buildroot.net/?reason=azure-iot-sdk-c%.  
> > 
> > 
> > >>        xtensa |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/34b8bb8824d369e5b53e2a4effd1a8d18df07aee |  
> > > Hollis, once again your autobuilder timing out when downloading stuff:
> > > http://autobuild.buildroot.net/?reason=linux-firmware%.  
> > flock was hanging. I don't know why; have you experienced anything like 
> > that?
> Not that I remember. Yann ?

Nope.

flock(1) is just a utility wrapper around flock(2), which is itself a
syscall to the kernel. The kernel frees a lock as soon as the process
that aqcquired it closes the filedescriptor(s) used to acquire that
lock, which also automatically occurs when the process dies (naturally
or forcibly).

So, barring a kernel bug, I'd say something else also had a lock...

You can get the list of process haviong locks with the lslocks command.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
