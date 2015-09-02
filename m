From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2015 00:07:42 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <55E76348.3020509@mind.be>
References: <1441148113-4894-1-git-send-email-yann.morin.1998@free.fr>
 <55E76348.3020509@mind.be>
Message-ID: <20150902220742.GC7845@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-09-02 22:59 +0200, Arnout Vandecappelle spake thusly:
> On 02-09-15 00:55, Yann E. MORIN wrote:
> > systemd is incresaingly expected things to live in /usr/bin or
>  increasingly

Yup, as noted by Baruch.

> > /usr/sbin.
> > 
> > However, a lot of packages stil install stuff directly into /bin or
>  still

Yup.

> > /sbin.
> > 
> > Add an option so that /bin and /sbin be symlinks to /usr/bin and
>  be -> are

Nope, this is subjunctive. ;-)

    https://en.wikipedia.org/wiki/Subjunctive_mood

    Subjunctives occur most often, although not exclusively, in
    subordinate clauses, particularly that-clauses. Examples of subjunctive
    use can be found in the English sentences "I suggest that you be
    careful" [...]

> > /usr/sbin. Ditto for .lib for consistency.
>  .lib -> /lib

Yup.

>  In reality, this option is only tangentially related to systemd. Rather, it's a
> Fedora feature [1] that was taken over by Lennart P. and therefore by systemd
> [2]. A better name for the feature is "merged /usr".

ACK, thanks for the history lesson. :-)

/me has laways been pretty bad in history.
/me is ready to trade history lessons for grammatical lessons. But not
ortograph, as it seems, nor typing lessons. ;-)

[--SNIP--]
> > +ifeq ($(BR2_ROOTFS_USR_SYMLINKS),y)
> > +define SKELETON_USR_SYMLINKS
> > +	ln -snf usr/bin $(TARGET_DIR)/bin
> > +	ln -snf usr/sbin $(TARGET_DIR)/sbin
> > +	ln -snf usr/lib $(TARGET_DIR)/lib
> > +endef
> > +else
> > +define SKELETON_NO_USR_SYMLINKS
> 
>  I would define only a single variable: SKELETON_USR_SYMLINKS_OR_DIRECTORIES.

Yeah, I wandered between the two options: a single variable or two.
Since I could not find a good name for the single-variable solution, I
went for two variables.

I'll switch (and maybe rename the variable to SKELETON_USR_SYMLINKS_OR_DIRS.

[--SNIP--]
> > @@ -178,6 +179,18 @@ endif
> >  
> >  if BR2_ROOTFS_SKELETON_DEFAULT
> >  
> > +config BR2_ROOTFS_USR_SYMLINKS
> > +	bool "Use symlinks to /usr for /bin, /sbin and /lib"
> 
>  I like this summary!

Thanks! ;-)

> > +	help
> > +	  If you say 'n' here, then /bin /sbin and /lib and their
> > +	  counterparts in /usr will be separate directories. This
> > +	  is the traditional UNIX way. In this case, /usr can be a
> > +	  partition separate from / .
> > +
> > +	  If you say 'y' here, then /bin /sbin and /lib will be symlinks
> 
>  If you say 'y' here, then /bin, /sbin and /lib will be merged to their
> counterparts in /usr and replaced by symlinks.

It's not that they will be merged, since we do not install things in
/bin and /sbin, and them merge the two; they are one from the beginning.

So, I'm a bit uneasy at using 'merge' in this case.

> > +	  to their counterparts in /usr. This is the new systemd way. In
> 
>  There's not much point to refer to systemd here, since it is forcibly selected
> in the systemd case.

After reading what you said above: ACK.

> > +	  this case, /usr has to be on the / partition.
> 
>  /usr cannot be a separate filesystem.

ACK.

>  BTW I wouldn't mind if this option would default to y eventually. I've been
> doing this (using a custom skeleton) for quite a while now.

Well, I certainly know some caes where /usr is a separate partition, and
defaulting that option to 'y' would break the unsuspecting users.

I'd rather we keep it 'n' at least for the foreseeable future (1 year?)

> [1] https://fedoraproject.org/wiki/Features/UsrMove
> [2] http://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
