From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 00:32:59 +0200
Subject: [Buildroot] [PATCH 09/20] package/skeleton: drop dependency on
 host-mkpasswd
In-Reply-To: <99ce17ed-eac5-bef0-4ac4-c74753925163@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <c3f7830c690ab048cb400bce5133a1d378f8752f.1500398733.git.yann.morin.1998@free.fr>
 <99ce17ed-eac5-bef0-4ac4-c74753925163@mind.be>
Message-ID: <20170722223259.GJ9929@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-22 23:24 +0200, Arnout Vandecappelle spake thusly:
>  This makes no sense to me...
> 
> On 18-07-17 19:25, Yann E. MORIN wrote:
> > Setting the root pasword is done in a target-finalize hook, so we do not
> > need to enforce a dependency from the skeleton onto host-mkpasswd.
> > 
> > Dropping that dependency will simplify making skeleton a virtual
> > package (in up-coming changes).
> 
>  How so? What's wrong with
> 
> SKELETON_COMMON_DEPENDENCIES += host-mkpasswd
> 
> in exactly the same place?

Indeed, it does not simplify much. But at least, that was a little bit
less code I had to carry over to the new skeleton infra, see below [0].

And as you've seen, this series was no picnic...

>  You forgot to mention the other interesting bit: it is now selected, so we are
> still sure it will get built before target-finalize.



> > This however introduces a slight change in behaviour: previously,
> > host-mkpasswd would only be built if we needed to hash the root password
> > from its plain-text value. Now, host-mkpasswd is always built as soon as
> > the root password is non-empty, even if already pre-hashed.
> > 
> > Since host-mkpasswd is a really tiny weeny package bundled in Buidlroot,
>                                                                 Buildroot

I think I have unconciously associated Buildroot and Beetlejuice in my
head, as Buidlroot sounds too much like Beetlejuice, and I do this typo
all the time. Not that I never typoes anything else, for that matters...
;-]

> > with only two C files, built as a single unit with a single gcc call,
> > the overhead is really minimal. Compared to the simplifications this
> > will allow in the skeleton packages (plural: common, sysv, systemd,
> > custom) to come, this overhead is acceptable.
> > 
> > Yet another simplification, even if small, to ease providing multiple
> > skeletons.

[0[] here I said it was but a small simplification. ;-)

> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
>  Although I don't think it's really *necessary* to remove the dependency, it is
> certainly more correct. And we want to select host packages from Config.in
> anyway on the long run, so doing it only for not-yet-hashed passwords won't be
> possible anyway. Therefore:
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks! :-)

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > ---
> >  package/skeleton/skeleton.mk | 1 -
> >  system/Config.in             | 1 +
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> > index 4a66f6ceca..4ec1ecbb51 100644
> > --- a/package/skeleton/skeleton.mk
> > +++ b/package/skeleton/skeleton.mk
> > @@ -121,7 +121,6 @@ SKELETON_ROOT_PASSWORD =
> >  else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)),)
> >  SKELETON_ROOT_PASSWORD = '$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)'
> >  else
> > -SKELETON_DEPENDENCIES += host-mkpasswd
> >  # This variable will only be evaluated in the finalize stage, so we can
> >  # be sure that host-mkpasswd will have already been built by that time.
> >  SKELETON_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(SKELETON_TARGET_GENERIC_PASSWD_METHOD)" "$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)"`"
> > diff --git a/system/Config.in b/system/Config.in
> > index ed539dcbe0..5cb921f108 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -224,6 +224,7 @@ config BR2_ROOTFS_MERGED_USR
> >  config BR2_TARGET_ENABLE_ROOT_LOGIN
> >  	bool "Enable root login with password"
> >  	default y
> > +	select BR2_PACKAGE_HOST_MKPASSWD if BR2_TARGET_GENERIC_ROOT_PASSWD != ""
> >  	help
> >  	  Allow root to log in with a password.
> >  
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
