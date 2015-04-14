From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Apr 2015 19:54:43 +0200
Subject: [Buildroot] [PATCHv5] system: allow/disallow root login,
 accept encoded passwords
In-Reply-To: <552C484F.1070105@mind.be>
References: <1428702127-17152-1-git-send-email-yann.morin.1998@free.fr>
 <552C484F.1070105@mind.be>
Message-ID: <20150414175443.GA4053@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-14 00:50 +0200, Arnout Vandecappelle spake thusly:
> On 10/04/15 23:42, Yann E. MORIN wrote:
> > From: Lorenzo Catucci <lorenzo@sancho.ccd.uniroma2.it>
[--SNIP--]
> > diff --git a/system/Config.in b/system/Config.in
> > index 431524d..6ba34ba 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -177,26 +177,36 @@ endif
> >  
> >  if BR2_ROOTFS_SKELETON_DEFAULT
> >  
> > +config BR2_TARGET_ENABLE_ROOT_LOGIN
> > +	bool "Enable root login"
> > +	default "y"
> 
>  No quotes around bool values.

Dang. Indeed.

>  However, since the default is y while it is normally n, and since we have to do
> something special for the n case, wouldn't it make more sense to call it
> BR2_TARGET_DISABLE_ROOT_LOGIN?

Well, I do really prefer positive naming; and we tend to use such
positive logic about everywhere...

That the internals are "more complex" (and that still has to be proven)
is irrelevant to what we present to the user. At the extreme, we could
always have a hidden variable that just negates the visible one.

[--SNIP--]
> > +	  Note: "$" signs in the hashed password must be doubled. For example,
> > +	  if the hashed password is "$1$longsalt$v35DIIeMo4yUfI23yditq0", then
> > +	  you must enter it as "$$1$$longsalt$$v35DIIeMo4yUfI23yditq0".
> 
>  Perhaps explain why:
> 
> This is necessary because make will interpret the $ as variable expansion.

OK.

[--SNIP--]
> > +ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
> > +ifeq ($(TARGET_GENERIC_ROOT_PASSWD),)
> > +SYSTEM_ROOT_PASSWORD =
> > +else ifneq ($(or $(filter $$1$$%,$(TARGET_GENERIC_ROOT_PASSWD)),$(filter $$5$$%,$(TARGET_GENERIC_ROOT_PASSWD)),$(filter $$6$$%,$(TARGET_GENERIC_ROOT_PASSWD))),)
> 
>  filter allows multiple patterns, so:
> 
> else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(TARGET_GENERIC_ROOT_PASSWD)),)

Woot! :-) Thanks, will change.

> > +SYSTEM_ROOT_PASSWORD = $(TARGET_GENERIC_ROOT_PASSWD)
> > +else
> > +SYSTEM_ROOT_PASSWORD = $(shell $(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")
> > +endif
> > +else # !BR2_TARGET_ENABLE_ROOT_LOGIN
> > +SYSTEM_ROOT_PASSWORD = *
> 
>  Even though Peter prefers positive logic, I think in this case it is more
> important to keep the logic close to the condition, i.e.:
> 
> ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),)
> SYSTEM_ROOT_PASSWORD = *
> else ifeq ($(TARGET_GENERIC_ROOT_PASSWD),)
> ...

Well, that was what Thomas initially suggested. But like Peter, I do
really prefer positive logic, so I'm heavily tempted to keep what I
wrote, unless others speak up and shout (sooned rather than later!). ;-)

Thanks for the review! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
