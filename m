From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2015 23:56:25 +0100
Subject: [Buildroot] Proposed patch: allow setting an hashed root
	password
In-Reply-To: <550F3EDE.8090106@ccd.uniroma2.it>
References: <550EDB2A.9030107@sancho.ccd.uniroma2.it>
 <20150322160022.GC4724@free.fr> <550EEA7E.8000207@mind.be>
 <20150322173132.GA5387@free.fr> <550F3EDE.8090106@ccd.uniroma2.it>
Message-ID: <20150322225625.GB26325@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lorenzo, All,

On 2015-03-22 23:14 +0100, Lorenzo M. Catucci spake thusly:
> >>  Thank you, Lorenzo, for your patch. However, you have not followed the patch
> >> submission guidelines. Patches should be submitted in-line, preferably using git
> >> send-email. Any "personal" comments can be added below a --- line after your
> >> Signed-off-by.
> > 
> > He, yes! Thanks Arnout for expanding my thoughts! :-)
> > 
> 
> I've attacched the results from a straight git format-patch to avoid MUA
> reformatting problems...

You should probably use 'git send-email' which will send a proper mail
with the patch unmangled in the body.

> Sorry for not understanding buildroot's policy about
> requiring the Signed-off-by: line even from original authors. If deemed
> useful, I'll amend the commit and resend.

Yes, we require the SoB line even when the submitter is the author.

> >>> Second, there's something odd: clearly the patch prefers the hashed
> >>> password over the clear-text one, but does not prevent the user to set
> >>> both.
> >>
> >>
> 
> OK, I don't think you can reset a string option based on the presence of
> another one in KConfig; instead, I think I could add a password format choice
> defaulting to plaintext.

We could do something like:

    config BR2_TARGET_GENERIC_ROOT_PASSWD_HASHED
        string "hashed root password"
        depends on BR2_TARGET_GENERIC_ROOT_PASSWD != ""

but still I think we should strive at having a single option.

> >>  Therefore, perhaps a better approach is to detect the $-pattern of an
> >> already-encrypted password in package/mkpasswd/mkpasswd.c and skip the hashing
> >> in that case.
> >>
> 
> While we could do a regex check for  '^[^./0-9A-Za-z]' to have "*" and "!"
> starting password interpreted as already hashed too, traditional unix DES
> encrypted password would be interpreted as plaintext ones, while "!expletive"
> would be interpreted as an invalid hashed password.

Yeah.. I've been thinking of a good heuristic to differentiate a hashed
password from a plain text one, and it's not easy...

> >  [snipped mkpasswd discussion, orthogonal to my proposed patch]
> > 
> >>> Third, if you want to do tricky password handling like this, I think it
> >>> would be better if you passed a "user table" (BR2_ROOTFS_USERS_TABLES)
> >>> that defines the root user and its password, like documented in the
> >>> mkuser infra:
> >>>     http://buildroot.net/downloads/manual/manual.html#makeuser-syntax
> >>>
> 
> I don't think setting an explicit hash for the root user can count as tricky
> password handling, especially since this would mitigate a couple of real risks:
> 
>  1. a sha-256 or sha-512 hashed password is a lot less vulnerable
>     than plaintext one

Hmm... I think there's some misunderstanding here (maybe on my side).
The root password *is* encrypted before being stored into /etc/passwd.
And it is encrypted with the algorithm you can choose in the same menu
(a little bit above), and we support encoding with:
  - des
  - md5 (the default)
  - sha-256
  - sha-512

The root password is in clear only in the .config file.

Or are you concerned about leaking the .config file and that the root
password would be visible?

>  2. in the default configuration, the root user can login with an empty
>     password

So, it looks like you'd want to be able to disallow root logins, from
inside the menuconfig. Then what about adding a new option:

    config BR2_TARGET_ALLOW_ROOT_LOGIN
        bool "Allow root login"
        default y
        help
          If set to 'y' (the default), then root will be allowed to
          login, from the console or from ssh (if you have an ssh
          server.

    config BR2_TARGET_GENERIC_ROOT_PASSWD
        bool "Root password"
        depends on BR2_TARGET_ALLOW_ROOT_LOGIN

And adapt the rest accordingly.

> As for the suggestion of putting the root's password in a "user table", the
> first two lines of the "Makeusers syntax documentation" chapter talk about
> adding/creating users,

Well, it is for adding users, right, but it can also be used to "update"
an existing user (as long as there is no conflict between login/UID and
group/GID, there can be more than one deifinition of a user).

> and some lines below there is an explicit "uid is the
> desired UID for the user. It must be unique, and not 0".

Indeed, and I should have known (I wrote that!). Thanks for pointing
that! :-)

Maybe we could relax the checks, so that the 'root' user is allowed, but
only to set the password... I'll see if that can make sense, and if that
would be easily doable.

Alternatively, you could also tweak the root password from a post-build
script, see BR2_ROOTFS_POST_BUILD_SCRIPT:
    http://buildroot.net/downloads/manual/manual.html#rootfs-custom

script which could look something like:

    #!/bin/sh
    PASSWD='your-encoded-password'
    sed -r -i -e "s/^root:[^:]+:/root:${PASSWD}:/" "${TARGET_DIR}/etc/passwd"

And in the end, I wonder if that would not be the best option...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
