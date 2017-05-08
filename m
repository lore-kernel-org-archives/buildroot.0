From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 May 2017 22:46:05 +0200
Subject: [Buildroot] [PATCH] package/espeak: add comment to ignore
 'unmet dependencies'
In-Reply-To: <20170508214911.6c0abdb4@free-electrons.com>
References: <20170507203856.5328-1-yann.morin.1998@free.fr>
 <20170508214911.6c0abdb4@free-electrons.com>
Message-ID: <20170508204605.GA3544@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-05-08 21:49 +0200, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Sun,  7 May 2017 22:38:56 +0200, Yann E. MORIN wrote:
> > On master 86b4eeccc4, espeak can generate spurious 'unmet dependencies'
> > messages:
> > 
> >     $ make KCONFIG_SEED=0x7A85DEE0 randconfig
> >     warning: (BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA) selects
> >     BR2_PACKAGE_PORTAUDIO_CXX which has unmet directdependencies
> >     (BR2_PACKAGE_PORTAUDIO && BR2_INSTALL_LIBSTDCPP)
> > 
> > However, the dpendency chain *is* correct. There is something that
> > causes the kconfig parser to get really confused...
> > 
> > Add a comment statng the issue is spurious, so noone tries to fix it.
> 
> Indeed, I don't see anything wrong in this dependency chain.
> 
> >  config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
> >  	bool "alsa via portaudio"
> > +	# Selecting portaudio generates spurious "unmet dependencies"
> > +	# warnings. Unless you are changing the dependencies of espeak
> > +	# or portaudio, just ignore those spurious warnings.
> >  	select BR2_PACKAGE_PORTAUDIO
> >  	select BR2_PACKAGE_PORTAUDIO_CXX
> 
> Perhaps we could simply add a "depends on BR2_INSTALL_LIBSTDCPP" here,
> which most likely would silence the warning?

Nope, it does not work. The only thing that breaks the dependency chain
is that the select on portaudio be changed into a depends. I could well
provide a patch to that effect, but that not very user-firendly... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
