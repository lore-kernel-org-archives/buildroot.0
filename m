From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jun 2018 09:31:23 +0200
Subject: [Buildroot] [PATCH] fs: allow extra arguments to common tarball
 extraction
In-Reply-To: <216846375.2026283.1528506402383.JavaMail.zimbra@datacom.com.br>
References: <20180603022145.14222-1-casantos@datacom.com.br>
 <20180605172345.GB29058@scaer>
 <625048322.1426556.1528289177741.JavaMail.zimbra@datacom.com.br>
 <20180606185136.GA2537@scaer>
 <81235112-f5f8-dbed-ac99-7942c003b898@mind.be>
 <1148643526.1795245.1528413126545.JavaMail.zimbra@datacom.com.br>
 <20180608172651.GD2090@scaer>
 <216846375.2026283.1528506402383.JavaMail.zimbra@datacom.com.br>
Message-ID: <20180609073123.GA2535@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2018-06-08 22:06 -0300, Carlos Santos spake thusly:
> > From: "Yann Morin" <yann.morin.1998@free.fr>
> > Why do you need to do so? You can use the 'rootfs' macro, as I already
> > explained, and for which I have already sent a patch to add it to the
> > manual:
> >    https://patchwork.ozlabs.org/patch/926425/
> I've seen your patch and will review it as soon as possible.

OK, great. Thanks! :-)

[--SNIP--]
> >> I understand that this trick avoids changing fs/*/*.mk replacing each
> >> reference to TARGET_DIR by a ROOTFS_<FOO>_TARGET_DIR but it reduces
> >> the readability a lot. I'm compelled to restore it to how it was prior
> >> to commit 7e9870ce32d.
> > 
> > But if you revert that, then TARGET_DIR points to the original target/
> > directory, which does *not* contain the completely-finalised content.
> 
> I pass TARGET_DIR=$(ROOTFS_COMMON_TARGET_DIR) in the environment to

No, don't point to the common one, because that is not parallel-safe!
The whole change was made so that two filesystems could be build in
parallel. Ad=nd since some filesystems want to muck with the layout
(e.g. iso9660), that is not compatible with two filesystems building
simultaneously from the same directory.

At the very least, make TARGET_DIR=$(ROOTFS_$(ROOTFS)_TARGET_DIR) as
Arnout hinted previously.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
