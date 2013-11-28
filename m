From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 28 Nov 2013 21:04:04 +0100
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <20131128192018.61cf8fdb@skate>
References: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385591508-4174-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMKgWKz_p3ckA1999zxava2TG=SF5qLjqNh7mmygv36Zfg@mail.gmail.com>
 <20131128172357.1417a881@skate>
 <CAHXCMMJ9M2m_EU0uweQjoEba1JObQWB43NYM31SXTvMxtWQmKQ@mail.gmail.com>
 <20131128192018.61cf8fdb@skate>
Message-ID: <CAHXCMM+wT7=ieH3P-xP8DdJzKBXsmADO5KC1EJrwJQK99AP8sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

2013/11/28 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear Samuel Martin,
>
> On Thu, 28 Nov 2013 18:53:57 +0100, Samuel Martin wrote:
>
> > Well, right now, most of the packages I put in my BR2_EXTERNAL tree
> > are host tools to generate images.
> >
> > With the previous version of this serie, the new menu entry was added
> > at the top level
> > of menuconfig, in which I added 2 submenus: "Target packages" and
> > "Host packages".
> > It was rather clear that all "company" stuff goes into this menu.
> >
> > With the v2, I was a bit lost at first, the "company" menu got moved
>
> I guess you meant "v3" here, because the "v2" included
> $(BR2_EXTERNAL)/Config.in in the top-level menu of menuconfig.
>
Indeed. Sorry for the confusion.


>
> > under "Target packages". So, now I have a menu tree like this:
> >
> > ---
> > Main menu
> >   ...
> >   Target packages --->
> >     ...
> >     Company --->
> >       Target packages --->
> >       Host packages --->
> >   ...
> >   Host packages --->
> > ---
> >
> > It does not hurt that much, but it's not really nice IMHO.
>
> Then please talk to the people who asked for enforcing
> $(BR2_EXTERNAL)/package/Config.in usage during the Buildroot Developers
> Days in Edinburgh.

I thought the ml was the place for this...


> This decision/choice is written very clearly in
> http://elinux.org/Buildroot:DeveloperDaysELCE2013#BR2_EXTERNAL :
>
> """
> Regarding the directory hierarchy in the external tree, it was agreed
> that it is a good idea to force three subdirectories: package, board,
> configs. Buildroot's package/Config.in will source
> $BR2_EXTERNAL/package/Config.in.
> """
>
Doh! I don't mean this at all! Looks like I was not clear enough.

I'm not talking about the directory hierarchy, I do follow the Buildroot
hierarchy.
It does look like this:

BR2_EXTERNAL/
|`- board/
|    `- someboard/
|       |`- linux-myversion/
|       |    `- linux-0001-fix-something.patch
|       |`- busybox-1.21.1.config
|        `- post-build-script.sh
|`- configs/
|    `- someboard_defconfig
 `- package/
    |`- Config.in
    |`- Config.in.host
    |`- foo/
    |   |`- foo.mk
    |   |`- Config.in
    |    `- Config.in.host
    |`- bar/
    |   |`- bar.mk
    |    `- Config.in.host
     `- toto/
        |`- toto.mk
         `- Config.in

With BR2_EXTERNAL/package/Config.in sourcing all Config.in files from
BR2_EXTERNAL,
and BR2_EXTERNAL/package/Config.in.host sourcing all Config.in.host files
from BR2_EXTERNAL,

My point was only about sourcing BR2_EXTERNAL/package/Config.in.host under
the
"Host utilities" menu.

This is nothing more than consistency in the menuconfig rendering.
If no one thinks it's relevant, fair enough, I can live without it.


> (It's even in bold in the report).
>

> I believe the most vocal person in favor of this was Arnout, so I've
> added him in Cc.
>
> > BTW, to generate this/these Config.in{,host} files in the
> > BR2_EXTERNAL tree, I already have a script scanning the tree and
> > updating these files, it could be included as a support script as
> > well.
>
It only generate the BR2_EXTERNAL/package/Config.in{,.host} files because
I'm lazy.


> Why is this needed? Just write Config.in like we do in the main
> Buildroot tree. For example, people may want to have menus and submenus
> in their $(BR2_EXTERNAL)/package/Config.in. Therefore, I don't think
> providing more and more and more scripts that match a very specific use
> case is really going to help our users, probably going to confuse them.
>
Fair enough.

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131128/deee8554/attachment-0001.html>
