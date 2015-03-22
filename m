From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2015 12:45:07 +0100
Subject: [Buildroot] [RFC 01/11] common service startup files
In-Reply-To: <3116b4122f3e3ea776ce2739c11ee36ea967297f.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
 <3116b4122f3e3ea776ce2739c11ee36ea967297f.1426960081.git.alex.suykov@gmail.com>
Message-ID: <20150322114507.GB4724@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex, All,

On 2015-03-21 20:27 +0200, Alex Suykov spake thusly:
> This patch introduces support infrastructure for per-project .run files.
> 
> Any .run files in package directory are picked up by pkg-generic code,
> fed to support/init/install-run script which converts them into either
> sysv initscripts or systemd unit files and installs those into predefined
> locations. The package itself provides only the .run files, no code
> in package .mk file is necessary.
> 
> Packages that install some of their services conditionally may set
> $(PKG)_INIT = list of run files to install. As a side effect, this
> removes the need to handle S99foo S99bar vs foo.service bar.service
> with the package .mk file.

I think this shoule be always set in the .mk, even if not conditional,
and that pkg-generic only handles what's been explicitly declared by the
package.

> Packages that need to substititue some values within their service
> files may set $(PKG)_INIT = KEY:value KEY:value ..., which will be
> handled by install-run. The substitutions will be applied to sysv
> and systemd files.

What we previously discussed was something like the following (for
sysv-init):

    /etc/init.d/S??foo  <- startup script for package 'foo'

    /etc/defaults/foo   <- contains default configuration of package
                           'foo', as installed by Buildroot.

    /etc/config/foo     <- optional file, contains the user-supplied
                           override configuration for package 'foo'

Then, the "startup script" would read those files, starting with the one
in /etc/defaults/ and then, if present, the one in /etc/config/ . This
would allow /etc to be read-only, and /etc/config to be a read-write
mountpoint.

Those files would be provided by the packages, like is done for now.

And similarly for systemd, except a lot of packages are now providing
systemd unit files, and there is no reason we would provide our own
instead, since that would probably bit-rot in the long term, so we
probably would prefer to use whatever upstream provides.

So, what we really care about are sysv initscripts, since they are in a
very bad shape:
  - upstream-provided scripts are too ugly, and often tied to a
    particular distro;
  - our own scripts are mot very clean either, for some have been around
    for a looong time.

> In case particular init system needs hand-crafted startup files
> or cannot handle certain services at all, install-run may be told
> so using special lines in the .run file.

I'm afraid this would be abused in the long run, becasue .run syntax is
too specific to Buildroot.

> This patch does not remove existing BR2_INIT_{SYSV,SYSTEMD} hooks.
> Each package should either provide .run files or define hooks, but not both.

Right.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
