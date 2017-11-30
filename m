From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 13:50:04 +0100
Subject: [Buildroot] [PATCH 1/1] Add TCF Agent package
In-Reply-To: <CADYdroOSHBypUB1gDLZxDptrvmKG1QeqBRuQTFcg_ZwqJC9zhg@mail.gmail.com>
References: <20171114145442.16734-1-norbert.lange@andritz.com>
 <20171129224524.1f8022b4@windsurf.home>
 <CADYdroOSHBypUB1gDLZxDptrvmKG1QeqBRuQTFcg_ZwqJC9zhg@mail.gmail.com>
Message-ID: <20171130135004.54a455c9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

It would be nice if you could avoid top-posting. Replying below each
part of the e-mail you're answering is much more readable, and is the
common practice on the mailing lists of open-source projects.

On Thu, 30 Nov 2017 12:08:17 +0100, Norbert Lange wrote:
> Hi,
> 
> -   [ ! -r /etc/default/$DAEMON_NAME ] || . /etc/default/$DAEMON_NAME
> This scheme is used to be able to execute that script with 'sh -e'
> [ -r /etc/default/$DAEMON_NAME ] && . /etc/default/$DAEMON_NAME would
> fail if there is no such file (which is no error)
> 
> Please tell me if I should still use the later line.

Interesting reason. Please keep your original proposal then. The
ejabberd package is already using this construct. However, all other
packages are using the && construct.

Unless Yann has a better suggestion for this ?

> -   sysv init file
> I am using HUP because TERM does not end the process, and their own
> init script (agent/tcf/main/tcf-agent.init) uses HUP.

OK. A comment in the shell script about why you're sending the HUP
signal would be nice.

> Fetching the PID this way is also taken from that file, the daemon
> does do a fork. I tried running in foreground but that had some other
> issues which I dont recall right now (will test this some more).
> Would be cleanest to patch in creating a pid file I think.

Yes, if you could test some more running the daemon in the background,
it would be nice.

> -   systemd unit file
> Sorry, I really should've tested this, copied some boilerplate code
> with placeholders.

No problem :)

> -   GNUInstallDirs
> allows common variable overrides for installation dirs, which is often
> important for Windows/Mac to allow derivation from the unix-sheme
> 
> -   DBUILD_SHARED_LIBS=Off
> Without this, a seperate library will installed, which has no use
> other than the tcf-agent binary.
> This library is an example implementation, its unlikely you would use
> it unmodified, if it gets stable at some time I would create a
> separate package libtcfagent
> including the headers needed for development.
> (Its also what you get when you use the plain Makefile)

Please add a comment in the .mk file about this, like:

# tcf-agent builds a shared library, but it really isn't useful for
# anything but tcf-agent itself, so don't bother building it as a
# shared library

> -   drop CMake....
> I am considering dropping the use of CMake (there s alot deduced
> automatically, by changing the name you got to redo all of that
> manually)
> and using the plain Makefile, this seems like less hassle in the end,
> but that means some additional stuff will be installed.

Hum, I don't think I suggested dropping CMake. I'm all in favor of
using standardized build systems such as CMake. What about just
patching the CMakeLists.txt to build a binary named tcf-agent instead
of agent? With a proper explanation, this should be acceptable by the
upstream tcf-agent developers.

> It there any common way to do this install step in an temp dir and
> then (re)moving files before copying this into the final target fs?

Nope, we don't have such a possibility currently I'm afraid.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
