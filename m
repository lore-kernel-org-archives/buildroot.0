From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Nov 2012 12:48:44 +0100
Subject: [Buildroot] [PATCH] target: add option to set the root password
In-Reply-To: <509DA03F.1020501@mind.be>
References: <1352503739-20083-1-git-send-email-yann.morin.1998@free.fr>
 <509DA03F.1020501@mind.be>
Message-ID: <201211101248.44388.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Saturday 10 November 2012 Arnout Vandecappelle wrote:
> On 11/10/12 00:28, Yann E. MORIN wrote:
> > Add an option in the menuconfig to specify a root password.
> >
> > If set to empty, no root password is created; otherwise, the password is
> > encrypted using MD5 (MD5 is not the default for crypt(3), DES-56 is, but
> > MD5 is widely available, not-so-strong, but not-so-weak either).
> >
> > Add a check for 'mkpasswd' as a new dependency.
> 
> Is it necessary to put the plaintext password in the .config?

At least, that's what /I/ would expect.

> Why not put the output of mkpasswd in the config, and explain in the help
> text how to produce it?

I'm afraid relying on the user to enter the properly-formatted encrypted
password is doomed:
  - it means the user has to read the help text (and we know users do not
    not read help texts ;-) ), switch to another terminal, enter the command,
    copy the ouput, switch back to the terminal with the menu, paste the
    output;
  - user may decide to use another encryption scheme (eg. SHA256), when we
    can only guarantee that MD5 and DES-56 are available;
  - user input is unreliable, by definition. Even copy-paste is prone to
    errors (eg. missing few first or last chars). In case the user /forgets/
    his/her root pasword, he/she can recover the password by looking at the
    .config file afterward.

> Obviously, this will make the patch much simpler, as there won't be a need
> anymore to distinguish between no-root-passwd and root-passwd.

Well, the patch is not very complex in the state, either.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
