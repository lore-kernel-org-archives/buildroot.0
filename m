From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Aug 2017 17:40:56 +0200
Subject: [Buildroot] [PATCH] fs/squashfs: honour the number of parallel
 jobs
In-Reply-To: <20170803092556.752dfa19@windsurf.home>
References: <20170802212239.27167-1-yann.morin.1998@free.fr>
 <20170803092556.752dfa19@windsurf.home>
Message-ID: <20170806154056.GA2921@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-08-03 09:25 +0200, Thomas Petazzoni spake thusly:
> On Wed,  2 Aug 2017 23:22:39 +0200, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> 
> This would benefit from an extended commit log. Why do we do this? Is
> this fixing something? Is this reducing the duration of mksquashfs
> because it leverages multiple cores when doing the compression? In the
> latter case, a few numbers would be nice to have.

By default, mksquashfs uses all the CPUs available (e.g. like us with
BR2_JLEVEL=0).

However, a user may well set BR2_JLEVEL to a specific value, to
voluntarily limit the number of CPUs to use (e.g. like us on the
autobuilders).

So, this patch just propagates that BR2_JLEVEL setting to mksquashfs,
to use the same number of jobs as the rest of the build process.

So, there is not speed improvement to expect, quite the opposite in
fact. And this is why this patch can be seen as a mitigation (but not a
fix) for #10141, as it allows to reduce the parallelism on systems with
a huge number of CPUs, which is where #10141 occurs.

I'll add a bit more explanations to this patch and respin...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
