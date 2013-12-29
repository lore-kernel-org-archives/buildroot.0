From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2013 17:45:18 +0100
Subject: [Buildroot] [PATCH 8/9] fs/iso9660: add Grub splashscreen
	support
In-Reply-To: <20131229112444.1307a7db@skate>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388242600-2580-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131228210920.GL3373@free.fr> <20131229112444.1307a7db@skate>
Message-ID: <20131229164518.GB3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-29 11:24 +0100, Thomas Petazzoni spake thusly:
> On Sat, 28 Dec 2013 22:09:20 +0100, Yann E. MORIN wrote:
> 
> > > diff --git a/fs/iso9660/menu.lst b/fs/iso9660/menu.lst
> > > index ed7836a..b1ba3c9 100644
> > > --- a/fs/iso9660/menu.lst
> > > +++ b/fs/iso9660/menu.lst
> > > @@ -1,6 +1,9 @@
> > >  default		0
> > >  timeout		10
> > > -color cyan/blue white/blue
> > > +color 		cyan/blue white/blue
> > > +splashimage	/splash.xpm.gz
> > > +foreground 	000000
> > > +background 	cccccc
> > 
> > 'foreground' and 'background' do not seem to be valid grub-legacy or
> > grub-2 options, at least according to their respective documentations:
> >   - grub-legacy (aka grub-0.9x):
> >     http://www.gnu.org/software/grub/manual/legacy/grub.html#color
> >   - grub-2:
> >     http://www.gnu.org/software/grub/manual/grub.html#Theme-File-Manual
> 
> That's because the documentation is not up-to-date with the Debian
> patches additions. Those options are really handled, they really have an
> effect (I tested it). I learned about them while reading:
> 
>   http://www.katspace.org/computers/Grub_Splash/

Hey! Nice ressource! :-)

Maybe we could add a reference to it somewhere in our docs?

> This option is added by the Debian specific patch
> debian/patches/graphics.diff.

Ah right, because we're using a Debian snapshot, not an official
release.

> Here is the definition of the foreground
> option in Debian's patch:
> 
> +static struct builtin builtin_foreground =
> +{
> +  "foreground",
> +  foreground_func,
> +  BUILTIN_CMDLINE | BUILTIN_MENU | BUILTIN_HELP_LIST,
> +  "foreground RRGGBB",
> +  "Sets the foreground color when in graphics mode."
> +  "RR is red, GG is green, and BB blue. Numbers must be in hexadecimal."
> +};

But then, to be clean, maybe we'd want to also get rid of 'foreground'
and 'background' when there's no splashscreen. From the link you quoted:

    The "foreground" and "background" commands seem to only take effect
    when a splash image is used; otherwise grub uses the "color" command.

Granted, this does not seem to be strictly required, but I think it'be
better to just remove it, to avoid the user being puzzled that his
changing foregroud/background has no effect...

Or at least a comment that basically says:
    # {fore,back}ground have no effect without a splashscreen:
    foreground 000000
    background cccccc

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
