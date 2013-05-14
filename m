From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 May 2013 00:06:23 +0200
Subject: [Buildroot] [PATCH] Standardisation of $(BUILD)/.root name
In-Reply-To: <5192B23A.1050508@mind.be>
References: <50FACA8F.1040503@mind.be>
 <1368541851-31089-1-git-send-email-jezz@sysmic.org>
 <20130514170721.622fc086@skate> <5192B23A.1050508@mind.be>
Message-ID: <20130514220623.GA3140@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-05-14 23:52 +0200, Arnout Vandecappelle spake thusly:
> On 14/05/13 17:07, Thomas Petazzoni wrote:
> >Dear J?r?me Pouiller,
> >
> >On Tue, 14 May 2013 16:30:50 +0200, J?r?me Pouiller wrote:
> >
> >>-$(BUILD_DIR)/.root:
> >>+$(STAMP_DIR)/skeleton-target-installed:
> >>  	mkdir -p $(TARGET_DIR)
> >>  	rsync -a \
> >>  		--exclude .empty --exclude .svn --exclude .git \
> >>  		--exclude .hg --exclude=CVS --exclude '*~' \
> >>  		$(TARGET_SKELETON)/ $(TARGET_DIR)/
> >>  	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
> >>+	mkdir -p $(STAMP_DIR)
> >>  	touch $@
> >
> >I'm generally ok with the idea, but I don't like this mkdir. There is
> >already a mkdir that creates the stamp file directory, in the main
> >Makefile.
> 
>  I don't have an issue with a few redundant mkdir -p calls.

I concur with Thomas: we should ensure the stamp-dir is already created
in a generic way, it's kind of an internal stuff, which should not be
visible to users (I mean: packages, and stuff like that, not actual
persons).

That we need to sprinkle the code with a few 'mkdir' here and ther "just
in case" is an indication we do not fully masterise the chain of events,
and is really not nice.

The fact that the 'mkdir' is needed in the first place is because of this
rulle in the top-level Makefile:

    dirs: [...] $(TARGET_DIR) [...] $(STAMP_DIR)

which will have 'make' run the $(TARGET_DIR) goal before the
$(STAMP_DIR) goal.

This can be solved in two ways: the nice one, and the not-so-nice one:
  - have an additional rule:
        $(TARGET_DIR): $(STAMP_DIR)                 <- the nice way
  - invert the order of goals in the 'dirs' rule    <- the not-so-nice way

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
