From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Dec 2017 14:54:43 +0100
Subject: [Buildroot] [PATCH 1/1] check-package: avoid false warning of
 useless flag
In-Reply-To: <20171202141059.391df6c0@windsurf.lan>
References: <d2844704851e4e8ff93c3007e9e67e2a339e11c7.1511996903.git.yann.morin.1998@free.fr>
 <1512188904-31366-1-git-send-email-ricardo.martincoski@datacom.ind.br>
 <20171202110320.GA2988@scaer>
 <20171202141059.391df6c0@windsurf.lan>
Message-ID: <20171202135443.GB2988@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-02 14:10 +0100, Thomas Petazzoni spake thusly:
> On Sat, 2 Dec 2017 12:03:20 +0100, Yann E. MORIN wrote:
> 
> > > Instead of increasing complexity of the script to fully detect this
> > > case, ignore the host flag set to its default value as it can be
> > > overriding a non-default value inherited from the equivalent target
> > > flag.  
> > 
> > But then we miss the cases where:
> >   - both are set to their default values,
> >   - the target one is not set and the host one is set to the default
> >     value.
> > 
> > But as you said, detecting the real false-positive would require
> > maintaining some state, which is currently not possible in the script.
> > 
> > Yet, htere is one issue I see: the script currently names issues mere
> > 'warnings' but exits with a non-zero error code as soon as at least one
> > such 'warning' is seen.
> > 
> > However, what we so far detected were really 'errors', not 'warnings',
> > while the case we are speaking about now really is a warning: it should
> > be reported, biut should not exit in error.
> 
> I'm not sure we want to go down this road, and distinguish warnings and
> errors. Either something is correct, or it's not. I prefer to have a
> clean and readable check-package output, with only things that really
> need to be fixed.

OK, but then with this change, we will now be missing actual errors,
e.g.:

    FOO_AUTORECONF = NO
    HOST_FOO_AUTORECONF = NO

Will not report the host vairant as bogus, even after the target variant
gets removed.

So we lose a false positive for a false negative.

I have to admit I am not sure which is worse/best...

Regards,
Yann E. MORIN.

> > Also I noticed that the comments do match the regexps:
> > 
> >     288: # We need HOST_ASTERISK_AUTORECONF = NO because the
> >     289: # target variant has _AUTORECONF = YES
> >     290: HOST_ASTERISK_AUTORECONF = NO
> > 
> > will report the issue twice (man URL removed):
> > 
> >     package/asterisk/asterisk.mk:288: useless default value [...]
> >     package/asterisk/asterisk.mk:290: useless default value [...]
> > 
> > Since this is the .mk parser, it could ignore the comments, I believe...
> 
> Agreed, but that's a separate issue :)
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
