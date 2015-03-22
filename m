From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2015 18:31:32 +0100
Subject: [Buildroot] Proposed patch: allow setting an hashed root
	password
In-Reply-To: <550EEA7E.8000207@mind.be>
References: <550EDB2A.9030107@sancho.ccd.uniroma2.it>
 <20150322160022.GC4724@free.fr> <550EEA7E.8000207@mind.be>
Message-ID: <20150322173132.GA5387@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lorenzo, All,

On 2015-03-22 17:14 +0100, Arnout Vandecappelle spake thusly:
> On 22/03/15 17:00, Yann E. MORIN wrote:
> > Lorenzo, All,
> > 
> > On 2015-03-22 16:09 +0100, Lorenzo Catucci spake thusly:
> >> Please find enclosed my proposed patch. I've posted the patch to a GH fork of
> >> the main repository too: look at the ?hashed_root_pw? branch of
> >>
> >> 	https://github.com/lmctv/buildroot
> >>
> >> The reason I've enabled the new ?BR2_TARGET_GENERIC_ROOT_PASSWD_HASH?
> >> configuration option is being able to set a "*" password hash for the root
> >> user without being forced to put a static /etc/shadow inside BR2_ROOTFS_OVERLAY.
> >>
> >> Even if setting a "real" password, I think the option to put a sha256 or
> >> sha512 hash in the .config is a lot less scary than putting a plaintext
> >> password, especially in the case of sha512 .
> >>
> >> Thank you very much, yours
> >>
> >> 	lorenzo m catucci
> >>
> > 
> > NAK.
> 
>  What Yann wants to say is:
> 
>  Thank you, Lorenzo, for your patch. However, you have not followed the patch
> submission guidelines. Patches should be submitted in-line, preferably using git
> send-email. Any "personal" comments can be added below a --- line after your
> Signed-off-by.

He, yes! Thanks Arnout for expanding my thoughts! :-)

> > First, the commit log should only explain the technical reasons for the
> > change, and not contain "personal" messages:
> > 
> >     first line, short explanation
> > 
> >     One (or more) paragraph explainging the current situation and why
> >     you believe it is incorrect.
> > 
> >     One (or more) paragraph explaining what you changed.
> > 
> >     Signed-ogg-by: Your Real Name <your-email@somehwere.net>
> > 
> > Second, there's something odd: clearly the patch prefers the hashed
> > password over the clear-text one, but does not prevent the user to set
> > both.
> 
>  Therefore, perhaps a better approach is to detect the $-pattern of an
> already-encrypted password in package/mkpasswd/mkpasswd.c and skip the hashing
> in that case.

I wonder how much we can accept mkpasswd to diverge from the upstream
one we vampirised (from whois).

Actually, we currently have a whois package, so maybe we could drop our
mkpasswd package and switch to depending on host-whois instead, that
would just install mkpasswd into $(HOST_DIR). Thoughts?

Regards,
Yann E. MORIN.

> > Third, if you want to do tricky password handling like this, I think it
> > would be better if you passed a "user table" (BR2_ROOTFS_USERS_TABLES)
> > that defines the root user and its password, like documented in the
> > mkuser infra:
> >     http://buildroot.net/downloads/manual/manual.html#makeuser-syntax
> 
>  +1 to that.
> 
>  So perhaps a better idea is to add that to the help text of
> BR2_TARGET_GENERIC_ROOT_PASSWD.
> 
>  Regards,
>  Arnout
> 
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
