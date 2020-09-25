From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Sep 2020 10:14:15 +0200
Subject: [Buildroot] [PATCH 1/2] linux: show compression options only on
 some architectures
In-Reply-To: <20200925094546.064d9c09@windsurf.hq.k.grp>
References: <20200924122222.3449188-1-thomas.petazzoni@bootlin.com>
 <20200925073758.GD11621@scaer>
 <20200925094546.064d9c09@windsurf.hq.k.grp>
Message-ID: <20200925081415.GE11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-09-25 09:45 +0200, Thomas Petazzoni spake thusly:
> On Fri, 25 Sep 2020 09:37:58 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> >     $(SED) "/\\<)\\>/d" /some/.config-file
> >     echo '=y' >> /some/.config-file
> > And to be honest, I am not sure that last line would generate a fully
> > legit kconfig setting... ;-)
> > Of course, running 'make oldconfig' on that modified .config would drop
> > invalid lines, so you would not notivce the issue, but still this is not
> > correct...
> Thanks for spotting this, I'll fix in v2. That being said, one can
> notice that you're pointing out that this bogus =y line will be
> dropped... just as equally as the bogus CONFIG_KERNEL_GZIP=y that we
> have today gets dropped on arm64 and other architectures for which
> those CONFIG_KERNEL_{GZIP,LZMA,LZ4,...} options don't exist :-)

Yes, but an unknown symbol assignment is still valid syntax, and
silently discarded by kconfig, because that is the goal of running
oldconfig: assigning new symbols and dropping old ones.

But the '=y' is not even syntactically valid. kconfig is still lenient
about that, though (but it does warn, doesn't it?), but this is not a
reason to generate an invalid file.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
