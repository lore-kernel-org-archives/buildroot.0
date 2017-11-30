From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Nov 2017 22:24:24 +0100
Subject: [Buildroot] [PATCH 1/1] Add TCF Agent package
In-Reply-To: <20171130135004.54a455c9@windsurf.home>
References: <20171114145442.16734-1-norbert.lange@andritz.com>
 <20171129224524.1f8022b4@windsurf.home>
 <CADYdroOSHBypUB1gDLZxDptrvmKG1QeqBRuQTFcg_ZwqJC9zhg@mail.gmail.com>
 <20171130135004.54a455c9@windsurf.home>
Message-ID: <20171130212424.GA2759@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, Thomas, All,

On 2017-11-30 13:50 +0100, Thomas Petazzoni spake thusly:
> On Thu, 30 Nov 2017 12:08:17 +0100, Norbert Lange wrote:
> > -   [ ! -r /etc/default/$DAEMON_NAME ] || . /etc/default/$DAEMON_NAME
> > This scheme is used to be able to execute that script with 'sh -e'
> > [ -r /etc/default/$DAEMON_NAME ] && . /etc/default/$DAEMON_NAME would
> > fail if there is no such file (which is no error)
> > 
> > Please tell me if I should still use the later line.
> 
> Interesting reason. Please keep your original proposal then. The
> ejabberd package is already using this construct. However, all other
> packages are using the && construct.
> 
> Unless Yann has a better suggestion for this ?

I think we should write down those rules about startup scripts and their
configuration files.

But back on topic for Norbert's use-case. I usually do like he did, but
I find it hackish nonetheless. I really prefer positive logic anyway,
like so:

    if [ -r /etc/default/foo.config ]; then
        . /etc/default/foo.config
    fi

Yes, that's three lines instead of one, but who cares, really?

However, Norbert's excuse only stands for script that are 'set -e' (i.e.
they exit as soon as a command exits with a non-zero return code.

But this is not the case of the startup script. So if we would really
want to make it a single line, then positive logic would still to be
preferred:

    [ -r /etc/default/foo.config ] && . /etc/default/foo.config

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
